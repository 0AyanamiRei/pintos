#ifndef THREADS_THREAD_H
#define THREADS_THREAD_H

#include <debug.h>
#include <list.h>
#include <stdint.h>
#include "fix-point.h"
#include "threads/synch.h"

/** States in a thread's life cycle. */
enum thread_status
  {
    THREAD_RUNNING,     /**< Running thread. */
    THREAD_READY,       /**< Not running but ready to run. */
    THREAD_BLOCKED,     /**< Waiting for an event to trigger. */
    THREAD_DYING        /**< About to be destroyed. */
  };

/** Thread identifier type.
   You can redefine this to whatever type you like. */
typedef int tid_t;
#define TID_ERROR ((tid_t) -1)          /**< Error value for tid_t. */

/** Thread priorities. */
#define PRI_MIN 0                       /**< Lowest priority. */
#define PRI_DEFAULT 31                  /**< Default priority. */
#define PRI_MAX 63                      /**< Highest priority. */

/** A kernel thread or user process.
        4 kB +---------------------------------+
             |          kernel stack           | kernel stacks must not be allowed to grow too large.
             |                |                | should not allocate large structures or arrays
             |                |                | as non-static local variables. Use dynamic allocation
             |                V                | with malloc() or palloc_get_page() instead.
             |         grows downward          |
             |                                 |
             |                                 |
             |                                 |
             |                                 |
             |                                 |
             |                                 |
             |                                 |
             |                                 |
             +---------------------------------+ sizeof (struct thread)
             |           THREAD_MAGIC          | size of "struct thread" should stay under 1KB
             |                :                |
             |                :                |
             |               name              |
             |              status             |
        0 kB +---------------------------------+ 

   magic = THREAD_MAGIC(0xcd6abf4b) used to detect stack overflow.

   The `elem' member has a dual purpose.  
   
   It can either be an element in the run queue (thread.c) (in ready state)
   or be an element in a semaphore wait list (synch.c).    (in blocked state)
   
   (they are mutually exclusive) */

// 很神秘,  文件系统提供的接口不是并发安全的
struct _file {
  struct list_elem file_elem;
  struct file *file;
  int fd;
  struct lock lk UNUSED; /**< 暂时不理解锁资源在父子进程间处理 */
  int pin_cnt UNUSED; /**< 暂时无并发访问文件 */
};


// 由于Pintos中, 子线程的资源并不是由父线程释放
// 所以当子线程死亡后, 父线程就不能访问其TCB了
struct child {
  struct list_elem child_elem;
  tid_t tid;
  int exit_status;
  struct semaphore sema;
};

struct thread {
  /* Owned by thread.c. */
  tid_t tid;                          /**< Thread identifier. */
  enum thread_status status;          /**< Thread state. */
  char name[16];                      /**< Name (for debugging purposes). */
  uint8_t *stack;                     /**< Saved stack pointer. */
  int priority;                       /**< Priority.
                                            used to implement priority scheduling in proj-1 */
  struct list_elem allelem;           /**< List element for all threads list. */

  /* Shared between thread.c and synch.c. */
  struct list_elem elem;              /**< List element. */
  #ifdef USERPROG
  /* Owned by userprog/process.c. */
  uint32_t *pagedir;                /**< Page directory. */
  #endif
  /** @todo self的资源释放问题, 因为父线程有可能比子线程先终止
   * 策略: 如果子线程发现父线程死亡, 那么交给子线程free(self) 
   * 父线程在thread_exit() 中设置 `self->tid=-1` 来标识 */
  int exit_status;
  struct list child_list; /**< 追踪子线程 */
  struct child *self;  /**< 与父线程通信 */

  struct list file_list; /**< 管理持有的文件 */
  
  int nice;                   /**< 多级反馈队列 */
  int64_t recent_cpu;
  
	int real_priority;                 
	struct list locks_held;             
	struct lock *current_lock;          
  
  struct list_elem sleepelem;       /**< 追踪睡眠队列 */
  int64_t sleep_time;               /**< 用于记录睡眠所需时长 */

  /* Owned by thread.c. */
  unsigned magic;                     /**< Detects stack overflow.
                                            always set to "THREAD_MAGIC" and  set to struct thread's end*/
  };

/** If false (default), use round-robin scheduler.
   If true, use multi-level feedback queue scheduler.
   Controlled by kernel command-line option "-o mlfqs". */
extern bool thread_mlfqs;

void thread_init (void);
void thread_start (void);

void thread_tick (void);
void thread_print_stats (void);

typedef void thread_func (void *aux);
tid_t thread_create (const char *name, int priority, thread_func *, void *);

void thread_block (void);
void thread_unblock (struct thread *);

struct thread *thread_current (void);
tid_t thread_tid (void);
const char *thread_name (void);

void thread_exit (void) NO_RETURN;
void thread_yield (void);

/** Performs some operation on thread t, given auxiliary data AUX. */
typedef void thread_action_func (struct thread *t, void *aux);
void thread_foreach (thread_action_func *, void *);

int thread_get_priority (void);
void thread_set_priority (int);

int thread_get_nice (void);
void thread_set_nice (int);
int thread_get_recent_cpu (void);
int thread_get_load_avg (void);

/** Alarm Clock */
void thread_sleep (int64_t sleep_time);

bool thread_cmp_priority (const struct list_elem *a, const struct list_elem *b, void *aux UNUSED);
void try_yield(void);
void thread_update_priority (struct thread *);

void thread_ready_rearrange (struct thread *);

/** BSD */
void thread_update_priority (struct thread *);
void thread_ready_rearrange (struct thread *);
void thread_tick_one_second (void);

/** FSsys*/
void fslk_acquire();
void fslk_release();

#endif /**< threads/thread.h */
