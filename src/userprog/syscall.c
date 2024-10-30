#include "userprog/syscall.h"
#include "userprog/process.h"
#include <stdio.h>
#include <string.h>
#include <syscall-nr.h>
#include "threads/interrupt.h"
#include "threads/thread.h"
#include "threads/malloc.h"
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

/* fd->_file */
struct _file*
fd2file (int fd) {
  struct thread *t = thread_current();
  struct list_elem *e;
  struct _file *_f;

  if(fd <= 2 || fd > 1024 ) {
    return NULL;
  }

  for(e = list_begin(&t->file_list); e != list_end(&t->file_list); e = list_next(e)) {
    _f = list_entry (e, struct _file, file_elem);
    if(_f->fd == fd) {
      return _f;
    }
  }
  return NULL;
}

/*分配fd描述符*/
static int32_t
fd_alloc (const char *file_name)
{
  fslk_acquire();
  struct file *file_temp;
  struct thread *t = thread_current();
  struct list_elem *e;
  struct _file *_f;
  int fd = -1;

  /**< 检查是否该文件可打开 */
  file_temp = filesys_open(file_name);
  if(file_temp == NULL) {
    fslk_release();
    return fd;
  }

  if(list_empty(&t->file_list)) { /**< 初次分配 */
    _f = malloc(sizeof(struct _file));
    _f->fd = 3; // stderr + 1
    _f->file = NULL;
    list_push_front(&t->file_list, &_f->file_elem);
  } 

   /**< 尝试复用描述符 */
  for(e = list_begin(&t->file_list); e != list_end(&t->file_list); e = list_next(e)) {
    _f = list_entry (e, struct _file, file_elem);
    fd = (fd > _f->fd) ? fd : _f->fd;
    if(_f->file == NULL) {
      break;
    }
  }

  /**< 需要重新创建 */
  if(e == list_end(&t->file_list)) {
    _f = malloc(sizeof(struct _file));
    _f->fd = ++fd;
    list_push_back(&t->file_list, &_f->file_elem);
  }

  _f->file = file_temp;

  if(!strcmp(file_name, t->name)) {
    file_deny_write(file_temp);
  }

  fslk_release();
  return fd;
}

/*关闭fd描述符 @todo 复用fd  */
static void
fd_close (int fd) {
  struct thread *t = thread_current();
  struct list_elem *e;
  struct _file *_f = fd2file(fd);

  if(_f != NULL) {
    fslk_acquire();
    file_close (_f->file); /**< 关闭文件 */
    fslk_release();
    list_remove(&_f->file_elem);
    free(_f);
  }
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

// 也是很抽象, `filesys_create`也不是并发安全的
// 那我们需要添加一个全局的锁用来保护create和remove
static void SYS_create (struct intr_frame *f) {
  const char *file_name = (char *)check_ptr((void *)arg_int32(1, f));
  unsigned initial_size = (unsigned)arg_int32(2, f);
  fslk_acquire();
  f->eax = filesys_create(file_name, initial_size);
  fslk_release();
}

static void SYS_remove (struct intr_frame *f) {
  const char *file_name = (char *)check_ptr((void *)arg_int32(1, f));
  fslk_acquire();
  f->eax = filesys_remove(file_name);
  fslk_release();
}

static void
SYS_open(struct intr_frame *f) {
  const char *file_name = (char *)check_ptr((void *)arg_int32(1, f));
  f->eax = fd_alloc(file_name);
}

static void
SYS_close (struct intr_frame *f) {
  int fd = (int)arg_int32(1, f);
  fd_close(fd);
}

/*获取文件长度*/
static void SYS_filesize (struct intr_frame *f) {
  int fd = (int)arg_int32(1, f);
  struct _file *_f = fd2file(fd);
  if(_f != NULL) {
    fslk_acquire();
    f->eax = file_length(_f->file);
    fslk_release();
  } else { 
    f->eax = -1;
  }
}

static void
SYS_read (struct intr_frame *f) {
  int fd = (int)arg_int32(1, f);
  uint8_t *buffer = check_ptr((void *)arg_int32(2, f));
  off_t size = (off_t)arg_int32(3, f);

  if (fd == 0) { /**< stdin */
    for (int i = 0; i < size; i++) {
      buffer[i] = input_getc();
    }
    f->eax = size;
  } else {
    struct _file *_f = fd2file(fd);
    if(_f != NULL) {
      fslk_acquire();
      f->eax = file_read(_f->file, buffer, size);
      fslk_release();
    } else { 
      f->eax = -1;
    }
  }
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
    struct _file *_f = fd2file(fd);
    if(_f != NULL) {
      fslk_acquire();
      f->eax = file_write(_f->file, buffer, size);
      fslk_release();
    } else { 
      f->eax = 0;
    }
  }
}

static void SYS_seek (struct intr_frame *f) {
  int fd = (int)arg_int32(1, f);
  unsigned position = (unsigned)arg_int32(2, f);
  struct _file *_f = fd2file(fd);
  if(_f != NULL) {
    fslk_acquire();
    file_seek(_f->file, position);
    fslk_release();
  }

}

static void SYS_tell (struct intr_frame *f) {
  int fd = (int)arg_int32(1, f);
  struct _file *_f = fd2file(fd);
  if(_f != NULL) {
    fslk_acquire();
    f->eax = file_tell(_f->file);
    fslk_release();
  } else {
    f->eax = -1;
  }
  
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
