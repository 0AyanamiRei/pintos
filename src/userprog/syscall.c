#include "userprog/syscall.h"
#include <stdio.h>
#include <syscall-nr.h>
#include "threads/interrupt.h"
#include "threads/thread.h"

static void syscall_handler (struct intr_frame *);

void
syscall_init (void) 
{
  intr_register_int (0x30, 3, INTR_ON, syscall_handler, "syscall");
}

static void
syscall_handler (struct intr_frame *f UNUSED)
{
  uint32_t syscall_num1 = *(uint32_t *)(f->esp);
  uint32_t syscall_num2 = *(uint32_t *)(f->esp - sizeof(uint32_t));
  printf ("system call!\n");
  thread_exit ();
}
