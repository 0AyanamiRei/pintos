#include "userprog/syscall.h"
#include <stdio.h>
#include <syscall-nr.h>
#include "threads/interrupt.h"
#include "threads/thread.h"

static void syscall_handler (struct intr_frame *);

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
  uint32_t sys_num = *(uint32_t *)(f->esp); /**< 系统调用编号 */
  printf("sys_num = %d\n", sys_num);
  syscalls[sys_num](f);
  thread_exit ();
}

/****系统调用实现****/


static void
SYS_halt (struct intr_frame *f) {
  printf("P2:[SYS_halt]\n");
  shutdown_power_off();
}

