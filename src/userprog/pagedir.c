#include "userprog/pagedir.h"
#include <stdbool.h>
#include <stddef.h>
#include <string.h>
#include "threads/init.h"
#include "threads/pte.h"
#include "threads/palloc.h"

static uint32_t *active_pd (void);
static void invalidate_pagedir (uint32_t *);

/** Creates a new page directory that has mappings for kernel
   virtual addresses, but none for user virtual addresses.
   Returns the new page directory, or a null pointer if memory
   allocation fails. 
// `init_page_dir`在`paging_init()`中第一次出现
// 在那里修改过, 其PTEs具有内核虚拟地址的映射, 现
// 在将其复制给pd, 得到一个不包含用户虚拟地址映射
// 的页表
*/
uint32_t *
pagedir_create (void) 
{
  uint32_t *pd = palloc_get_page (0);
  if (pd != NULL)
    memcpy (pd, init_page_dir, PGSIZE);
  return pd;
}

/** Destroys page directory PD, freeing all the pages it
   references. */
void
pagedir_destroy (uint32_t *pd) 
{
  uint32_t *pde;

  if (pd == NULL)
    return;

  ASSERT (pd != init_page_dir);
  // pd_no (PHYS_BASE) = 0xc0000000>>22 = 0x300 = 768
  // 通过`pagedir_destroy(pd)`只能释放前768个pde管理的page
  // 详情缘由查看paging_init()中记录的映射
  for (pde = pd; pde < pd + pd_no (PHYS_BASE); pde++) { /**< 遍历页目录 */
    if (*pde & PTE_P)  {
        uint32_t *pt = pde_get_pt (*pde); // 得到pde指向的page table起始地址(虚拟地址)
        uint32_t *pte;
        for (pte = pt; pte < pt + PGSIZE / sizeof *pte; pte++) { /**< 遍历页表 */
          if (*pte & PTE_P) {
            palloc_free_page (pte_get_page (*pte)); /**< 释放page */
          }
        }
        palloc_free_page (pt); /**< 释放该页表 */
      }
  }
  palloc_free_page (pd); /**< 释放该页目录 */
}

/** Returns the address of the page table entry for virtual
   address VADDR in page directory PD.
   If PD does not have a page table for VADDR, behavior depends
   on CREATE.  If CREATE is true, then a new page table is
   created and a pointer into it is returned.  Otherwise, a null
   pointer is returned. */
static uint32_t *
lookup_page (uint32_t *pd, const void *vaddr, bool create)
{
  uint32_t *pt, *pde;

  ASSERT (pd != NULL);

  /* Shouldn't create new kernel virtual mappings. */
  ASSERT (!create || is_user_vaddr (vaddr));

  /* Check for a page table for VADDR.
     If one is missing, create one if requested. */
  pde = pd + pd_no (vaddr);
  if (*pde == 0) {
      if (create) {
          pt = palloc_get_page (PAL_ZERO);
          if (pt == NULL) { return NULL; }
          *pde = pde_create (pt);
        } else { return NULL; }
    }

  /* Return the page table entry. */
  pt = pde_get_pt (*pde);
  return &pt[pt_no (vaddr)];
}

/** Adds a mapping in page directory PD from user virtual page
   UPAGE to the physical frame identified by kernel virtual
   address KPAGE.
   @warning - `upage` must not already be mapped.
   @warning - `kpage` should probably be a page obtained from the user pool
              with `palloc_get_page(PAL_USER)`.
   @warning - If WRITABLE is true, the new page is read/write;
              otherwise it is read-only.
   @warning - Returns true if successful, false if memory allocation
              failed. 
// 往页目录`pd`中添加一个mapping: `upage->[kpage]`, 用户虚拟页upage
// 到内核虚拟页kpage标识的physical frame(物理page?)
// 这里不刷新TLB, 直到下一次访问该新添加表项, 才缓存到TLB中
*/
bool
pagedir_set_page (uint32_t *pd, void *upage, void *kpage, bool writable)
{
  uint32_t *pte;

  ASSERT (pg_ofs (upage) == 0);
  ASSERT (pg_ofs (kpage) == 0);
  ASSERT (is_user_vaddr (upage));
  ASSERT (vtop (kpage) >> PTSHIFT < init_ram_pages);
  ASSERT (pd != init_page_dir);

  pte = lookup_page (pd, upage, true);

  if (pte != NULL) {
      ASSERT ((*pte & PTE_P) == 0);
      *pte = pte_create_user (kpage, writable);
      return true;
    } else { return false; }
}

/** Looks up the physical address that corresponds to user virtual
   address UADDR in PD.  Returns the kernel virtual address
   corresponding to that physical address, or a null pointer if
   UADDR is unmapped. */
void *
pagedir_get_page (uint32_t *pd, const void *uaddr) 
{
  uint32_t *pte;

  ASSERT (is_user_vaddr (uaddr));
  
  pte = lookup_page (pd, uaddr, false);
  if (pte != NULL && (*pte & PTE_P) != 0) {
    return pte_get_page (*pte) + pg_ofs (uaddr);
  } else { return NULL; }
}

/** Marks user virtual page UPAGE "not present" in page
   directory PD.  Later accesses to the page will fault.  Other
   bits in the page table entry are preserved.
   UPAGE need not be mapped.
// 修改`pd`中指向`upage`的条目pde, 设置`PTE_P`标记为false
// 调用invalidate_pagedir(pd)检查是否flush TLB
*/
void
pagedir_clear_page (uint32_t *pd, void *upage) 
{
  uint32_t *pte;

  ASSERT (pg_ofs (upage) == 0);
  ASSERT (is_user_vaddr (upage));

  pte = lookup_page (pd, upage, false);
  if (pte != NULL && (*pte & PTE_P) != 0)
    {
      *pte &= ~PTE_P;
      invalidate_pagedir (pd);
    }
}

/** Returns true if the PTE for virtual page VPAGE in PD is dirty,
   that is, if the page has been modified since the PTE was
   installed.
   Returns false if PD contains no PTE for VPAGE. */
bool
pagedir_is_dirty (uint32_t *pd, const void *vpage) 
{
  uint32_t *pte = lookup_page (pd, vpage, false);
  return pte != NULL && (*pte & PTE_D) != 0;
}

/** Set the dirty bit to DIRTY in the PTE for virtual page VPAGE
   in PD.
// 需要考虑刷新TLB
*/
void
pagedir_set_dirty (uint32_t *pd, const void *vpage, bool dirty) 
{
  uint32_t *pte = lookup_page (pd, vpage, false);
  if (pte != NULL) 
    {
      if (dirty) {
        *pte |= PTE_D;
      } else {
          *pte &= ~(uint32_t) PTE_D;
          invalidate_pagedir (pd);
      }
    }
}

/** Returns true if the PTE for virtual page VPAGE in PD has been
   accessed recently, that is, between the time the PTE was
   installed and the last time it was cleared.  Returns false if
   PD contains no PTE for VPAGE. */
bool
pagedir_is_accessed (uint32_t *pd, const void *vpage) 
{
  uint32_t *pte = lookup_page (pd, vpage, false);
  return pte != NULL && (*pte & PTE_A) != 0;
}

/** Sets the accessed bit to ACCESSED in the PTE for virtual page
   VPAGE in PD. 
// 需要考虑刷新TLB
*/
void
pagedir_set_accessed (uint32_t *pd, const void *vpage, bool accessed) 
{
  uint32_t *pte = lookup_page (pd, vpage, false);
  if (pte != NULL) {
      if (accessed) {
        *pte |= PTE_A;
      } else {
          *pte &= ~(uint32_t) PTE_A; 
          invalidate_pagedir (pd);
      }
    }
}

/** Loads page directory PD into the CPU's page directory base
   register. 
// 修改 `cr3`(PD Base Register) = `pd`
*/
void
pagedir_activate (uint32_t *pd) 
{
  if (pd == NULL)
    pd = init_page_dir;

  /* Store the physical address of the page directory into CR3
     aka PDBR (page directory base register).  This activates our
     new page tables immediately.  See [IA32-v2a] "MOV--Move
     to/from Control Registers" and [IA32-v3a] 3.7.5 "Base
     Address of the Page Directory". */
  asm volatile ("movl %0, %%cr3" : : "r" (vtop (pd)) : "memory");
}

/** Returns the currently active page directory.
// 返回当前活动的页目录, 也就是寄存器%cr3中的
*/
static uint32_t *
active_pd (void) 
{
  /* Copy CR3, the page directory base register (PDBR), into
     `pd'.
     See [IA32-v2a] "MOV--Move to/from Control Registers" and
     [IA32-v3a] 3.7.5 "Base Address of the Page Directory". */
  uintptr_t pd;
  asm volatile ("movl %%cr3, %0" : "=r" (pd));
  return ptov (pd);
}

/** Seom page table changes can cause the CPU's translation
   lookaside buffer (TLB) to become out-of-sync with the page
   table.  When this happens, we have to "invalidate" the TLB by
   re-activating it.

   This function invalidates the TLB if PD is the active page
   directory.  (If PD is not active then its entries are not in
   the TLB, so there is no need to invalidate anything.) */
static void
invalidate_pagedir (uint32_t *pd) 
{
  if (active_pd () == pd) 
    {
      /* Re-activating PD clears the TLB.  See [IA32-v3a] 3.12
         "Translation Lookaside Buffers (TLBs)". */
      pagedir_activate (pd);
    } 
}
