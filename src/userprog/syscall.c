#include "userprog/syscall.h"
#include <stdio.h>
#include <syscall-nr.h>
#include "threads/interrupt.h"
#include "threads/thread.h"
#include "filesys/filesys.h"
#include "filesys/file.h"

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
static uint32_t
parm_get(int n,struct intr_frame *f)
{
  
  switch (n) {
  case 0:
    return *((uint32_t *)f->esp);
  case 1:
    return *((uint32_t *)f->esp + 1);
  case 2:
    return *((uint32_t *)f->esp + 2);
  case 3:
    return *((uint32_t *)f->esp + 3);
  }
}

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

/*分配fd描述符*/
static uint32_t
fdalloc(struct file *f)
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
fd2file(int fd,struct file *f)
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
  printf("P2:[SYS_halt]\n");
  shutdown_power_off();
}
static void
SYS_open(struct intr_frame *f) {
  const char* name = parm_get(1,f);
  struct file * f_op;
  f_op = filesys_open(name);
  f->eax = fdalloc(f_op);
}
static void
SYS_read (struct intr_frame *f) {
  struct file * file_;
  int fd = parm_get(1,f);
  void* buffer = parm_get(2,f);
  int32_t len = parm_get(3,f);
  fd2file(fd,file_);
  f->eax = file_read(file_,buffer,len);
}
static void
SYS_write (struct intr_frame *f) {
  struct file * file_;
  int fd = parm_get(1,f);
  const void* buffer = parm_get(2,f);
  int32_t len = parm_get(3,f);
  fd2file(fd,file_);
  f->eax = file_write(file_,buffer,len);
}
static void
SYS_close (struct intr_frame *f) {
  struct file * file_;
  int fd = parm_get(1,f);
  fd2file(fd,file_);
  file_close(file_);
  delete_fd(fd);
}