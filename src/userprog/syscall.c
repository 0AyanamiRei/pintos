#include "userprog/syscall.h"
#include "userprog/process.h"
#include <stdio.h>
#include <syscall-nr.h>
#include "threads/interrupt.h"
#include "threads/thread.h"
#include "filesys/filesys.h"
#include "filesys/file.h"
#include "threads/vaddr.h"

static void syscall_handler (struct intr_frame *);
static int arg_int32 (int n, struct intr_frame *f);
static int get_user (const uint8_t *uaddr);
static bool put_user (uint8_t *udst, uint8_t byte);
static void* check_ptr (const void * vaddr); 
static void error_exit (void);


static void SYS_halt (struct intr_frame *f);
static void SYS_exit (struct intr_frame *f);
static void SYS_exec (struct intr_frame *f);
static void SYS_wait (struct intr_frame *f);
static void SYS_create (struct intr_frame *f);
static void SYS_remove (struct intr_frame *f);
static void SYS_open (struct intr_frame *f);
static void SYS_filesize (struct intr_frame *f);
static void SYS_read (struct intr_frame *f);
static void SYS_write (struct intr_frame *f);
static void SYS_seek (struct intr_frame *f);
static void SYS_tell (struct intr_frame *f);
static void SYS_close (struct intr_frame *f);

/** 根据系统调用编号来执行对应的syscall */
static void (*syscalls[])(struct intr_frame *f) = {
  [SYS_HALT]    SYS_halt,
  [SYS_EXIT]    SYS_exit,
  [SYS_EXEC]    SYS_exec,
  [SYS_WAIT]    SYS_wait,
  [SYS_CREATE]  SYS_create,
  [SYS_REMOVE]  SYS_remove,
  [SYS_OPEN]    SYS_open,
  [SYS_FILESIZE] SYS_filesize,
  [SYS_READ]    SYS_read,
  [SYS_WRITE]   SYS_write,
  [SYS_SEEK]    SYS_seek,
  [SYS_TELL]    SYS_tell,
  [SYS_CLOSE]   SYS_close
};

void
syscall_init (void) 
{
  intr_register_int (0x30, 3, INTR_ON, syscall_handler, "syscall");
}

static void
syscall_handler (struct intr_frame *f)
{
  check_ptr((void *)(f->esp));
  uint32_t sys_num = *(uint32_t *)(f->esp); /**< 系统调用编号 */
  // printf("sys_num = %d\n", sys_num);
  syscalls[sys_num](f);
}

/*分配fd描述符*/
static uint32_t
fdalloc (struct file *f)
{
  int fd;
  struct thread * tcb = thread_current();
  for(fd = 0; fd < NOFILE; fd++){
    if(tcb->ofile[fd] == 0){
      tcb->ofile[fd] = f;
      return fd;
    }
  }
  return -1;
}
static int
fd2file (int fd,struct file *f)
{
  struct thread * tcb = thread_current();
  if (fd > -1 && fd < NOFILE && tcb->ofile[fd] != 0) {
    f = tcb->ofile[fd];
    return 0;
  }
  return -1;
}
static int
delete_fd (int fd) {
  struct thread * tcb = thread_current();
  if (fd > -1 && fd < NOFILE && tcb->ofile[fd] != 0) {
    tcb->ofile[fd] = 0;
    return 0;
  }
  return -1;
}

/****系统调用实现****/
static void
SYS_halt (struct intr_frame *f) {
  shutdown_power_off();
}

// 假设只有user进程退出才会打印信息
static void
SYS_exit (struct intr_frame *f) {
  struct thread *t = thread_current();
  t->exit_status = t->self->exit_status = (int)arg_int32(1, f);
  thread_exit();
}

// 创建子进程并返回其tid_t
// 使用条件变量控制, 直到子线程加载完毕才返回tid给父线程
static void
SYS_exec (struct intr_frame *f) {
  const char *file = (char *)check_ptr((void *)arg_int32(1, f));
  f->eax = process_execute(file);
}

static void
SYS_wait (struct intr_frame *f) {
  int32_t p_id = arg_int32(1, f);
  f->eax = process_wait(p_id);
}


static void SYS_create (struct intr_frame *f) {
  error_exit();
}

static void SYS_remove (struct intr_frame *f) {
  error_exit();
}

static void
SYS_open(struct intr_frame *f) {
  error_exit();
}


static void SYS_filesize (struct intr_frame *f) {
  error_exit();
}

static void
SYS_read (struct intr_frame *f) {
  error_exit();
}

static void
SYS_write (struct intr_frame *f) {
  // 获取参数并检查
  int fd = (int)arg_int32(1, f);
  const void* buffer = check_ptr((void *)arg_int32(2, f));
  off_t size = (off_t)arg_int32(3, f);
  
  if(fd == 1) { /**< 向控制台输出 */
    putbuf(buffer, size);
    f->eax = size;
    return;
  } else {
    error_exit();
  }
}

static void SYS_seek (struct intr_frame *f) {
  error_exit();
}

static void SYS_tell (struct intr_frame *f) {
  error_exit();
}

static void
SYS_close (struct intr_frame *f) {
  error_exit();
}


// Helper function

// 获取第n个参数, 以int32_t类型返回, n=1,2,3
static int32_t
arg_int32 (int n, struct intr_frame *f) {
  if(n < 0 || n > 3) PANIC("error n");
  int32_t *addr = (int32_t *)(f->esp + n * sizeof(int32_t));
  check_ptr((void *)addr);
  return *addr;
}

/* Reads a byte at user virtual address UADDR.
   UADDR must be below PHYS_BASE.
   Returns the byte value if successful, -1 if a segfault
   occurred. */
static int
get_user (const uint8_t *uaddr)
{
  int result;
  asm ("movl $1f, %0; movzbl %1, %0; 1:"
       : "=&a" (result) : "m" (*uaddr));
  return result;
}

/* Writes BYTE to user address UDST.
   UDST must be below PHYS_BASE.
   Returns true if successful, false if a segfault occurred. */
static bool
put_user (uint8_t *udst, uint8_t byte)
{
  int error_code;
  asm ("movl $1f, %0; movb %b2, %1; 1:"
       : "=&a" (error_code), "=m" (*udst) : "q" (byte));
  return error_code != -1;
}

// 检查用户传入的地址是否有效
static void*
check_ptr (const void * vaddr) {
  if(!is_user_vaddr(vaddr)) {
    goto BAD;
  }

  uint8_t *byte_ptr = (uint8_t *)vaddr;
  for(uint8_t i = 0; i < 4; i ++) {
    if(get_user(byte_ptr + i) == -1) {
      goto BAD;
    }
  }

  return vaddr;
  BAD:
    error_exit();
}

// 错误处理
static void
error_exit (void) {
  thread_current()->exit_status = -1;
  thread_exit();
  NOT_REACHED();
}
