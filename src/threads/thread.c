#include "threads/thread.h"
#include <debug.h>
#include <stddef.h>
#include <random.h>
#include <stdio.h>
#include <string.h>
#include "threads/flags.h"
#include "threads/interrupt.h"
#include "threads/intr-stubs.h"
#include "threads/palloc.h"
#include "threads/switch.h"
#include "threads/synch.h"
#include "threads/vaddr.h"
#ifdef USERPROG
#include "userprog/process.h"
#endif

#include "fix-point.h"


#define THREAD_MAGIC 0xcd6abf4b

/** List of processes in THREAD_READY state, that is, processes
   that are ready to run but not actually running. */
static struct list ready_list;

/** List of all processes.  Processes are added to this list
   when they are first scheduled and removed when they exit. */
static struct list all_list;

/** Idle thread. */
static struct thread *idle_thread;

/** Initial thread, the thread running init.c:main(). */
static struct thread *initial_thread;

/** Lock used by allocate_tid(). */
static struct lock tid_lock;

/** Stack frame for kernel_thread(). */
struct kernel_thread_frame 
  {
    void *eip;                  /**< Return address. */
    thread_func *function;      /**< Function to call. */
    void *aux;                  /**< Auxiliary data for function. */
  };

/** Statistics. */
static long long idle_ticks;    /**< # of timer ticks spent idle. */
static long long kernel_ticks;  /**< # of timer ticks in kernel threads. */
static long long user_ticks;    /**< # of timer ticks in user programs. */

/** Scheduling. */
#define TIME_SLICE 4            /**< # of timer ticks to give each thread. */
static unsigned thread_ticks;   /**< # of timer ticks since last yield. */

/** If false (default), use round-robin scheduler.
   If true, use multi-level feedback queue scheduler.
   Controlled by kernel command-line option "-o mlfqs". */
bool thread_mlfqs;
int64_t load_avg;
int ready_threads;

static void kernel_thread (thread_func *, void *aux);

static void idle (void *aux UNUSED);
static struct thread *running_thread (void);
static struct thread *next_thread_to_run (void);
static void init_thread (struct thread *, const char *name, int priority);
static bool is_thread (struct thread *) UNUSED;
static void *alloc_frame (struct thread *, size_t size);
static void schedule (void);
void thread_schedule_tail (struct thread *prev);
static tid_t allocate_tid (void);

/** Initializes the threading system by transforming the code
   that's currently running into a thread.  This can't work in
   general and it is possible in this case only because loader.S
   was careful to put the bottom of the stack at a page boundary.

   Also initializes the run queue and the tid lock.

   After calling this function, be sure to initialize the page
   allocator before trying to create any threads with
   thread_create().

   It is not safe to call thread_current() until this function
   finishes. */
void
thread_init (void) {
  ASSERT (intr_get_level () == INTR_OFF);

  lock_init (&tid_lock);
  list_init (&ready_list);
  list_init (&all_list);

  /* Set up a thread structure for the running thread. */
  initial_thread = running_thread (); // 0xc000e000
  init_thread (initial_thread, "main", PRI_DEFAULT);
  initial_thread->status = THREAD_RUNNING;
  initial_thread->tid = allocate_tid ();
}

/** Starts preemptive thread scheduling by enabling interrupts.
   Also creates the idle thread. */
void
thread_start (void)  {
  /* Create the idle thread. */
  struct semaphore idle_started;
  sema_init (&idle_started, 0);
  thread_create ("idle", PRI_MIN, idle, &idle_started);

  /* Start preemptive thread scheduling. */
  intr_enable ();

  /* Wait for the idle thread to initialize idle_thread. */
  sema_down (&idle_started);
}

/** Called by the timer interrupt handler at each timer tick.
   Thus, this function runs in an external interrupt context. */
void
thread_tick (void) 
{
  struct thread *t = thread_current ();

  /* Update statistics. */
  if (t == idle_thread) {
    idle_ticks++;
  }
#ifdef USERPROG
  else if (t->pagedir != NULL)
    user_ticks++;
#endif
  else {
    kernel_ticks++;
  }
  

  /* Enforce preemption. */
  if (++thread_ticks >= TIME_SLICE) {
    intr_yield_on_return ();
  }
}

/** Prints thread statistics. */
void
thread_print_stats (void) 
{
  printf ("Thread: %lld idle ticks, %lld kernel ticks, %lld user ticks\n",
          idle_ticks, kernel_ticks, user_ticks);
}

/** Creates a new kernel thread named NAME with the given initial
   PRIORITY, which executes FUNCTION passing AUX as the argument,
   and adds it to the ready queue.  Returns the thread identifier
   for the new thread, or TID_ERROR if creation fails.

   If thread_start() has been called, then the new thread may be
   scheduled before thread_create() returns.  It could even exit
   before thread_create() returns.  Contrariwise, the original
   thread may run for any amount of time before the new thread is
   scheduled.  Use a semaphore or some other form of
   synchronization if you need to ensure ordering.

   The code provided sets the new thread's `priority' member to
   PRIORITY, but no actual priority scheduling is implemented.
   Priority scheduling is the goal of Problem 1-3. */

tid_t
thread_create (const char  *name,
               int         priority,
               thread_func *function,
               void        *aux) {
  struct thread *t;
  struct kernel_thread_frame *kf;
  struct switch_entry_frame *ef;
  struct switch_threads_frame *sf;
  tid_t tid;

  ASSERT (function != NULL);

  /* Allocate thread. */
  t = palloc_get_page (PAL_ZERO);
  if (t == NULL)
    return TID_ERROR;

  /* Initialize thread. */
  init_thread (t, name, priority);
  t->nice = thread_current()->nice;
  tid = t->tid = allocate_tid ();

  /* Stack frame for kernel_thread(). */
  kf = alloc_frame (t, sizeof *kf);
  kf->eip = NULL;
  kf->function = function;
  kf->aux = aux;

  /* Stack frame for switch_entry(). */
  ef = alloc_frame (t, sizeof *ef);
  ef->eip = (void (*) (void)) kernel_thread;

  /* Stack frame for switch_threads(). */
  sf = alloc_frame (t, sizeof *sf);
  sf->eip = switch_entry;
  sf->ebp = 0;

  /* Add to run queue. */
  thread_unblock (t);
  return tid;
}


/**
 * @brief Puts the current thread to sleep.
 * 
 * @note It is usually a better idea to use one of the synchronization
 *       primitives in `synch.h`.
 * @note - Change current thread\'s `status` to `THREAD_BLOCKED`.
 * @note - Call `schedule()`.
 * 
 * @warning - the blocked thread will not be scheduled again until
 *            awoken by `thread_unblock()`.
 * @warning - This function must be called with interrupts turned off.
*/
void
thread_block (void) {
  ASSERT (!intr_context ());
  ASSERT (intr_get_level () == INTR_OFF);

  struct thread *t = thread_current();

  t->status = THREAD_BLOCKED;
  schedule ();
}

/** Transitions a blocked thread T to the ready-to-run state.
   This is an error if T is not blocked.  (Use thread_yield() to
   make the running thread ready.)

   This function does not preempt the running thread.  This can
   be important: if the caller had disabled interrupts itself,
   it may expect that it can atomically unblock a thread and
   update other data. */
void
thread_unblock (struct thread *t) {
  enum intr_level old_level;
  bool old_context = intr_context();

  ASSERT (is_thread (t));

  old_level = intr_disable ();
  ASSERT (t->status == THREAD_BLOCKED);
  list_insert_ordered (&ready_list, &t->elem, (list_less_func *) &thread_cmp_priority, NULL);  
  

  t->status = THREAD_READY;
  if(t->priority > thread_current()->priority) {
    if(old_context) {
      intr_yield_on_return();
    } else {
      if (thread_current()->tid != 2){
        thread_yield();
      }
    }
  }

  intr_set_level (old_level);
}

/** Returns the name of the running thread. */
const char *
thread_name (void) 
{
  return thread_current ()->name;
}

/** Returns the running thread.
   This is running_thread() plus a couple of sanity checks.
   See the big comment at the top of thread.h for details. */
struct thread *
thread_current (void) 
{
  struct thread *t = running_thread ();
  
  /* Make sure T is really a thread.
     If either of these assertions fire, then your thread may
     have overflowed its stack.  Each thread has less than 4 kB
     of stack, so a few big automatic arrays or moderate
     recursion can cause stack overflow. */
  ASSERT (is_thread (t));
  ASSERT (t->status == THREAD_RUNNING);

  return t;
}

/** Returns the running thread's tid. */
tid_t
thread_tid (void) 
{
  return thread_current ()->tid;
}

/** Deschedules the current thread and destroys it.  Never
   returns to the caller. */
void
thread_exit (void) 
{
  ASSERT (!intr_context ());

#ifdef USERPROG
  process_exit ();
#endif

  /* Remove thread from all threads list, set our status to dying,
     and schedule another process.  That process will destroy us
     when it calls thread_schedule_tail(). */
  intr_disable ();
  
  struct thread *t = thread_current();


  list_remove (&t->allelem);
  t->status = THREAD_DYING;
  schedule ();
  NOT_REACHED ();
}

/** Yields the CPU.  The current thread is not put to sleep and
   may be scheduled again immediately at the scheduler's whim. */
void
thread_yield (void) {
  struct thread *cur = thread_current ();
  enum intr_level old_level;
  
  ASSERT (!intr_context ());

  old_level = intr_disable ();
  
  if (cur != idle_thread) {
    list_insert_ordered (&ready_list, &cur->elem, (list_less_func *) &thread_cmp_priority, NULL);
  }

  cur->status = THREAD_READY;
  
  schedule ();
  
  intr_set_level (old_level);
}

/** Invoke function 'func' on all threads, passing along 'aux'.
   This function must be called with interrupts off. */
void
thread_foreach (thread_action_func *func, void *aux) {
  struct list_elem *e;

  ASSERT (intr_get_level () == INTR_OFF);

  for (e = list_begin (&all_list); e != list_end (&all_list); e = list_next (e)) {
    struct thread *t = list_entry (e, struct thread, allelem);
    func (t, aux);
  }
}

/** Sets the current thread's priority to NEW_PRIORITY. */
void
thread_set_priority (int new_priority) 
{
  struct thread *t = thread_current();

  if(!thread_mlfqs) {
    /** 处理捐赠优先级的中途 */
    if(t->donate_nums) {
      for(int i = 0; i < MAXLOCKS; i ++) {
        t->temp_priority[i] = (t->temp_priority[i] == -1) ? -1 : new_priority; 
        t->first_priority = new_priority;
      }
    } else {
      thread_current ()->priority = new_priority;
      /** 直到确认自己为最高优先级 */
      for(;;){
        struct list_elem* e = list_begin (&ready_list);
        struct thread *t = list_entry (e, struct thread, elem);
        if(new_priority < t->priority) {
          thread_yield();
        } else {
          break;
        }
      }
    }
  }
}

/** Returns the current thread's priority. */
int
thread_get_priority (void) {
  return thread_current ()->priority; 
}

/** Sets the current thread's nice value to NICE. */
void
thread_set_nice (int nice UNUSED) 
{

  thread_current ()->nice = nice;
  update_priority (thread_current(), NULL);
  thread_yield ();
}

/** Returns the current thread's nice value. */
int
thread_get_nice (void) 
{
  return thread_current ()->nice;
}

/** Returns 100 times the system load average. */
int
thread_get_load_avg (void) 
{
  int temp = MULTIPLY_X_BY_N(load_avg,100);
  return CONVERT_X_TO_INTEGER_NEAREST(temp);
}

/** Returns 100 times the current thread's recent_cpu value. */
int
thread_get_recent_cpu (void) 
{
  return CONVERT_X_TO_INTEGER_NEAREST(MULTIPLY_X_BY_N(thread_current()->recent_cpu,100));
}

/** Idle thread.  Executes when no other thread is ready to run.

   The idle thread is initially put on the ready list by
   thread_start().  It will be scheduled once initially, at which
   point it initializes idle_thread, "up"s the semaphore passed
   to it to enable thread_start() to continue, and immediately
   blocks.  After that, the idle thread never appears in the
   ready list.  It is returned by next_thread_to_run() as a
   special case when the ready list is empty. */
static void
idle (void *idle_started_ UNUSED) 
{
  struct semaphore *idle_started = idle_started_;
  idle_thread = thread_current ();
  sema_up (idle_started);

  for (;;) 
    {
      /* Let someone else run. */
      intr_disable ();
      thread_block ();

      /* Re-enable interrupts and wait for the next one.

         The `sti' instruction disables interrupts until the
         completion of the next instruction, so these two
         instructions are executed atomically.  This atomicity is
         important; otherwise, an interrupt could be handled
         between re-enabling interrupts and waiting for the next
         one to occur, wasting as much as one clock tick worth of
         time.

         See [IA32-v2a] "HLT", [IA32-v2b] "STI", and [IA32-v3a]
         7.11.1 "HLT Instruction". */
      asm volatile ("sti; hlt" : : : "memory");
    }
}

/** Function used as the basis for a kernel thread. */
static void
kernel_thread (thread_func *function, void *aux) 
{
  ASSERT (function != NULL);

  intr_enable ();       /**< The scheduler runs with interrupts off. */
  function (aux);       /**< Execute the thread function. */
  thread_exit ();       /**< If function() returns, kill the thread. */
}


/**
 * @brief Query the running thread
 * 
 * @note  Copy the CPU\'s stack pointer into `esp`, and then round that
 *        down to the start of a page.  Because `struct thread` is
 *        always at the beginning of a page and the stack pointer is
 *        somewhere in the middle, this locates the curent thread.
 * 
 * @return The metadata handle of the running thread
 * 
 * @retval A TCB point : point to the start of a page which store the
 *         TCB.
*/
struct thread *
running_thread (void)  {
  uint32_t *esp;
  asm ("mov %%esp, %0" : "=g" (esp));
  return pg_round_down (esp);
}


/** Returns true if T appears to point to a valid thread. */
static bool
is_thread (struct thread *t)
{
  return t != NULL && t->magic == THREAD_MAGIC;
}

/** Does basic initialization of T as a blocked thread named
   NAME. */


/**
 * @brief init thread's name,priority,magic and set thread's status to block.join the thread to all list 

 */
static void
init_thread (struct thread *t, const char *name, int priority)
{
  enum intr_level old_level;

  ASSERT (t != NULL);
  ASSERT (PRI_MIN <= priority && priority <= PRI_MAX);
  ASSERT (name != NULL);

  memset (t, 0, sizeof *t);
  t->status = THREAD_BLOCKED;
  strlcpy (t->name, name, sizeof t->name);
  t->stack = (uint8_t *) t + PGSIZE;
  if(!thread_mlfqs) {
    t->priority = priority;
  }
  t->magic = THREAD_MAGIC;

  old_level = intr_disable ();

  /* initilize param used to sleep */
  t->sleep_intervals_ = -1;
  t->sleep_time_ = -1;

  /** initilize param used to priority-donate */
  t->k = -1;
  t->first_priority = -1;
  for(int i = 0; i < MAXLOCKS; i ++){
    t->temp_priority[i] = -1;
  }
  t->donate_nums = 0;
  t->recent_cpu = CONVERT_N_TO_FIXED_POINT(0);

  /** initilize param used to BSD */
  t->nice = 0;

  list_insert_ordered (&all_list, &t->allelem, (list_less_func *) &thread_cmp_priority, NULL);
  intr_set_level (old_level);
}

/** Allocates a SIZE-byte frame at the top of thread T's stack and
   returns a pointer to the frame's base. */
static void *
alloc_frame (struct thread *t, size_t size) 
{
  /* Stack data is always allocated in word-size units. */
  ASSERT (is_thread (t));
  ASSERT (size % sizeof (uint32_t) == 0);

  t->stack -= size;
  return t->stack;
}


/**
 * @brief Find the next thread to be scheduled.
 * 
 * @note  Should return a thread from the run queue, unless the run
 *        queue is (If the running thread can continue running, then it
 *        will be in the run queue.)  If the run queue is empty, return
 *        `idle_thread`.
 * 
 * @return The TCB(Thread Control Block) handle of the found thread, 
 *         If `ready_list` is empty return the `idle_thread`.
 * 
 * @retval A TCB point : point to the start of a page which store the
 *         TCB.
*/
static struct thread *
next_thread_to_run (void) {
  struct list_elem *e;
  struct thread *t_ret = NULL; 

  if (list_empty (&ready_list)){
    return idle_thread;
  } else {
    return list_entry (list_pop_front (&ready_list), struct thread, elem);
  }
}

/**
 * @brief Completes a thread switch
 * 
 * @note This function is normally invoked by
 *       thread_schedule() as its final action before returning, but
 *       the first time a thread is scheduled it is called by
 *       switch_entry() (see switch.S). 
 *       After this function and its caller returns, the thread switch
 *       is complete. Here are what the func do:
 * @note - Set the new thread\'s status to `THREAD_RUNNING`
 * @note - Reset the `thread_ticks` to zero.
 * @note - If the previous thread is THREAD_DYING, call `palloc_free_page()`
 *       destroying it. This must happen late so that `thread_exit()` doesn't
 *       pull out the rug under itself.
 * 
 * @param[in] prev We switched from thread prev to cur
 * 
 * @warning 1. Interrupts must still be disabled. 
 * @warning 2. We can\'t destroying the `initial_thread`, because its
 *          memory was not obtained via `palloc()`.
 * @warning 3. It's not safe to call `printf()`,
 *          In practice that means that `printf()s` should be
 *          added at the end of the function.
 * 
 * @todo Answer why destroy the prev must happen late.
*/
void
thread_schedule_tail (struct thread *prev) {
  struct thread *cur = running_thread ();
  
  ASSERT (intr_get_level () == INTR_OFF); 

  cur->status = THREAD_RUNNING;
  thread_ticks = 0;

#ifdef USERPROG
  /* Activate the new address space. */
  process_activate ();
#endif

  if(prev != NULL && prev->status == THREAD_DYING && prev != initial_thread) {
    ASSERT (prev != cur);
    palloc_free_page (prev);
  }
}

/**
 * @brief Thread Switching, Schedules a new thread.
 * 
 * @note - Record the current thread in local variable `cur`.
 * @note - Use `next_thread_to_run()` to find the next thread to run, record it in
 *         local variable `next`.
 * @note - Call `switch_threads()` to do the actual thread switch.
 * @note - Finally call `thread_schedule_tail()` to completed this switch.
 * 
 * @warning - It's not safe to call printf() until thread_schedule_tail()
 *            has completed.
 * @warning - At entry, interrupts must be off.
 * @warning - the running thread's state must have been changed from
 *            running to some other state.
*/
static void
schedule (void) {
  struct thread *cur = running_thread ();
  struct thread *next = next_thread_to_run ();
  struct thread *prev = NULL;

  ASSERT (intr_get_level () == INTR_OFF);
  ASSERT (cur->status != THREAD_RUNNING);
  ASSERT (is_thread (next));

  /** @attention
   * The first trick happend here: we moved all the return val of call 
   * `running_thread ()` or `next_thread_to_run ()`, even `NULL` into 
   * stack for further used---We used `cur` and `next` in the stack at 
   * assembly code `switch_threads` next step. (in the file `switch.S` )
  */

  /** @todo think over why we need the local variable `prev` */
  if (cur != next) { 
    prev = switch_threads(cur, next);
  }

  /** @attention
   * The other trick happend here, in fact, this trick used twice in the
   * file `switch.S`, if you take care the changes in $esp values, when
   * you are reading code in `switch.S`, (make sure that you know what
   * `thread_create()` done, and the stack's change in `switch_threads()`)
   * and is familiar with the procedure-calling in `X86`, (you can stduy in
   * CSAPP chapter-3) you will find that the control transfer here like this:
   * call `schedule()` --> call `switch_threads()` --> return to `switch_entry()`
   * --> call `thread_schedule_tail()` --> return to `kernel_thread()`
   * 
   * This trick is made possible by the fact that we need to write assembly code
   * by hand.
  */

  thread_schedule_tail (prev);
}

/** Returns a tid to use for a new thread. */
static tid_t
allocate_tid (void) 
{
  static tid_t next_tid = 1;
  tid_t tid;

  lock_acquire (&tid_lock);
  tid = next_tid++;
  lock_release (&tid_lock);

  return tid;
}

/** Offset of `stack' member within `struct thread'.
   Used by switch.S, which can't figure it out on its own. */
uint32_t thread_stack_ofs = offsetof (struct thread, stack);

bool
thread_cmp_priority (const struct list_elem *a, const struct list_elem *b, void *aux UNUSED)
{
  return list_entry(a, struct thread, elem)->priority > list_entry(b, struct thread, elem)->priority;
}

void wake_up_(void) {
  struct list_elem *e;
  struct thread *t;
  struct thread *t_numpy[128];
  int k = -1;

  ASSERT (intr_get_level () == INTR_OFF);

  /** find the sleep thread with higest priority */
  for (e = list_begin(&all_list); e != list_end (&all_list); e = list_next (e)) {
    t = list_entry (e, struct thread, allelem);
    if(t->status != THREAD_BLOCKED || t->sleep_intervals_ == -1 || t->sleep_time_ == -1) {
      continue;
    }

    t->sleep_time_ ++;

    if(t->sleep_time_ >= t->sleep_intervals_) {
      if(k == -1 || t_numpy[k]->priority < t->priority){
        k = 0;
        t_numpy[k] = t;
      } else if(t_numpy[k]->priority == t->priority) {
        t_numpy[++k] = t;
      }
    }
  }
  
  /** wake up it */
  if(k != -1){
    for(int i = 0; i <= k; ++i) {
      t = t_numpy[i];
      t->sleep_intervals_ = -1;
      t->sleep_time_ = -1;

      thread_unblock(t);
    }
  }

}


void
increase_recent_cpu(struct thread *t) {
  if(t!=idle_thread) {
    t->recent_cpu = ADD_X_AND_N(thread_current()->recent_cpu,1);
  }
}

void
update_load_avg(){
  ready_threads = list_size(&ready_list);
  ready_threads += (thread_current() != idle_thread ? 1 : 0);
  int64_t fa = MULTIPLY_X_BY_N(load_avg,59);
  int add1 = DIVIDE_X_BY_N(fa,60);
  int add2 = DIVIDE_X_BY_N(CONVERT_N_TO_FIXED_POINT(ready_threads),60);
  load_avg = ADD_X_AND_Y(add1,add2);
}


void
update_recent_cpu(struct thread *t,void *aux UNUSED) {
  if(t == idle_thread) return;
  int64_t fa = MULTIPLY_X_BY_N(load_avg,2);
  int64_t fb = MULTIPLY_X_BY_N(load_avg,2)+CONVERT_N_TO_FIXED_POINT(1);
  t->recent_cpu = MULTIPLY_X_BY_Y(DIVIDE_X_BY_Y(fa,fb),t->recent_cpu)+
  CONVERT_N_TO_FIXED_POINT(t->nice);
}

void
update_priority(struct thread *t,void *aux UNUSED) {
  if(t == idle) return;
  //priority = PRI_MAX - (recent_cpu / 4) - (nice * 2)
  t->priority = CONVERT_X_TO_INTEGER_NEAREST(CONVERT_N_TO_FIXED_POINT(PRI_MAX)-
  t->recent_cpu/4-CONVERT_N_TO_FIXED_POINT(2*t->nice));
  if (t->priority < PRI_MIN)
    t->priority = PRI_MIN;
  if (t->priority > PRI_MAX)
    t->priority = PRI_MAX;
}

