#include "threads/synch.h"
#include <stdio.h>
#include <string.h>
#include "threads/interrupt.h"
#include "threads/thread.h"


/**
 * @brief Initializes `sema` as a new semaphore with the given initial `value`
 * 
 * @param[in] sema The variable to be initialized.
 * @param[in] value Used to initialize the `sema->value` 
 * 
 * @note - down or "P": wait for the value to become positive, then
 *         decrement it.
 * @note - up or "V": increment the value (and wake up one waiting
 *         thread, if any)
 * 
 * @warning A semaphore is a nonnegative integer along with two atomic operators
*/
void
sema_init (struct semaphore *sema,
           unsigned         value) {
  ASSERT (sema != NULL);

  sema->value = value;
  list_init (&sema->waiters);
}


/**
 * @brief Executes the "down" or "P" operation on `sema`. Waits for `sema`\'s
 *        value to become positive and then atomically decrements it.
 * 
 * @note - Use `intr_disable()` to disable the interrupts.
 * @note - Wait for the `sema->value > 0`.  That is: if `sema->value` is
 *         0 now, put current thread into `sema->waiters` and call
 *         `thread_block()` to sleep.
 * 
 * @warning - This function may sleep, so it must not be called in an
 *          interrupt handler.
 * @warning - This function must disable the interrupt to ensue atomicity.
 * @warning - This function may be called with interrupts disabled, but
 *          if it sleeps then the next scheduled thread will probably
 *          turn interrupts back on.
 * 
 * @todo why use `while(sema->value == 0){...}`, but not `if(sema->value == 0){...}`?
 *       ans: because the "Mesa" style Monitor
*/
void
sema_down (struct semaphore *sema) {
  enum intr_level old_level;

  ASSERT (sema != NULL);
  ASSERT (!intr_context ());

  old_level = intr_disable ();

  while (sema->value == 0) {
    list_push_back (&sema->waiters, &thread_current ()->elem);
    thread_block ();
  }
  sema->value--;
  intr_set_level (old_level);
}


/**
 * @brief Try to executes the "down" or "P" operation on `sema`, without 
 *        sleeping or waiting or blocking.
 * 
 * @note - Use `intr_disable()` to disable the interrupts.
 * @note - Try to executes "down" on semaphore `sema`.
 * 
 * @warning - This function wil not sleep, so it may be called from an interrupt handler.
 * @warning - This function must disable the interrupt to ensue atomicity.
 * @warning - Calling this function in a tight loop will waste CPU time, so use `sema_down()` 
 *            or find a different approach instead.
 * 
 * @return Returns true if `sema->value` was successfully decremented, 
 *         or false if it was already zero and thus could not be decremented
*/
bool
sema_try_down (struct semaphore *sema) {
  enum intr_level old_level;
  bool success;

  ASSERT (sema != NULL);

  old_level = intr_disable ();

  if (sema->value > 0) {
    sema->value--;
    success = true; 
  } else {
    success = false;
  }

  intr_set_level (old_level);

  return success;
}


/**
 * @brief Up or "V" operation on a semaphore `sema`. Increment `sema->value`
 *        and wake up one thread in `sema->waiters`, if any.
 * 
 * @note - Use `intr_disable()` to disable the interrupts.
 * @note - Find a thread in `sema->waiters`, and wake up it, if any.
 * @note - Increment the `sema->value`.
 * 
 * @warning - This function wil not sleep, so it may be called from an interrupt handler.
 * @warning - This function must disable the interrupt to ensue atomicity.
*/
void
sema_up (struct semaphore *sema) {
  enum intr_level old_level;

  ASSERT (sema != NULL);

  old_level = intr_disable ();

  sema->value++;

  if (!list_empty (&sema->waiters)) {
    /** choose higest priority thread to unblock */
    struct list_elem *e;
    struct thread *t, *ret_t = NULL;
    for (e = list_begin(&sema->waiters); e != list_end (&sema->waiters); e = list_next (e)) {
      t = list_entry(e, struct thread, elem);
      if(ret_t == NULL || ret_t->priority < t->priority){
        ret_t = t;
      }
    }
    list_remove(&ret_t->elem);
    thread_unblock(ret_t);
  }

  intr_set_level (old_level);
}


static void sema_test_helper (void *sema_);


/** 
 * @brief Self-test for semaphores that makes control "ping-pong"
 *  between a pair of threads.  Insert calls to printf() to see
 *  what's going on.
*/
void
sema_self_test (void) {
  struct semaphore sema[2];
  int i;

  printf ("Testing semaphores...");
  sema_init (&sema[0], 0);
  sema_init (&sema[1], 0);
  thread_create ("sema-test", PRI_DEFAULT, sema_test_helper, &sema);
  for (i = 0; i < 10; i++) 
    {
      sema_up (&sema[0]);
      sema_down (&sema[1]);
    }
  printf ("done.\n");
}


/**
 * @brief Thread function used by sema_self_test().
*/
static void
sema_test_helper (void *sema_) 
{
  struct semaphore *sema = sema_;
  int i;

  for (i = 0; i < 10; i++) 
    {
      sema_down (&sema[0]);
      sema_up (&sema[1]);
    }
}



/**
 * @brief Initialize `lock`.
 * 
 * @note - Set the `lock->holder` to be NULL
 * @note - Lock implementations in PintOS can be considered as
 *         binary semaphores, so we used `sema_init` to set
 *         `lock->semaphore` to be 1.
 * 
 * @warning PintOS\'s lock is not "recursive".
*/
void
lock_init (struct lock *lock) {
  ASSERT (lock != NULL);

  lock->holder = NULL;
  lock->index = -1;
  sema_init(&lock->semaphore, 1);
}

/**
 * @brief Donate current thread's priority, if to's priority
 *        less than current's.
 * 
 * @note If needed, we donate the `from`'s priority to `to`
*/
void
donate_priority (struct lock *lock) {
  enum intr_level old_level;
  old_level = intr_disable();

  struct thread* to = lock->holder;
  struct thread* from = thread_current();

  /** @todo store the max priority in lock's wait list */
  
  if(from->priority > to->priority) {
    if(lock->index == -1){
      lock->index = ++to->k;
      to->temp_priority[lock->index] = to->priority;
      to->donate_nums ++;
    }

    if(to->first_priority == -1) {
      to->first_priority = to->priority;
    }

    to->priority = from->priority;
  }

  intr_set_level(old_level);
}

/**
 * @brief Acquires lock for the current thread, first waiting for
 *        any current owner to release it if necessary.
 * 
 * @note - Call `sema_down()`.
 * @note - Set `lock->holder` to simulate the lock being acquired by
 *         the current thread.
 * 
 * @warning This function may sleep, so it must not be called in an
 *          interrupt handler.
 * @warning This function may be called with interrupts disabled, but
 *          interrupts will be turned back on if we need to sleep.
 * @warning The lock here is not "recursive", so current thread can not
 *          acquire it twice.
 * 
 * @todo Whether or not the interrupt handler can hold the lock is TBD.
*/
void
lock_acquire (struct lock *lock) {
  ASSERT (lock != NULL);
  ASSERT (!intr_context ());
  ASSERT (!lock_held_by_current_thread (lock));

  if(lock->holder != NULL)  {
    donate_priority(lock);
  }

  sema_down (&lock->semaphore);
  lock->holder = thread_current ();
}



/**
 * @brief Tries to acquire lock for use by the current thread, without waiting.
 * 
 * @note - Call `sema_try_down()`.
 * @note - If the `lock` is free, set `lock->holder` to simulate the lock being
 *         acquired by the current thread.
 * 
 * @warning - This function won't sleep, it may be called within an interrupt handler.
 * @warning - The lock here is not "recursive", so current thread can not
 *            acquire it twice.
 * @warning - Calling this function in a tight loop will waste CPU time, so use
 *            `lock_acquire()` or find a different approach instead.
 * 
 * @return Returns true if successful, false if the `lock` is already owned.
 * 
 * @todo Whether or not the interrupt handler can hold the lock is TBD.
*/
bool
lock_try_acquire (struct lock *lock) {
  bool success;

  ASSERT (lock != NULL);
  ASSERT (!lock_held_by_current_thread (lock));

  success = sema_try_down (&lock->semaphore);
  if (success) {
    lock->holder = thread_current ();
  }
  return success;
}


/**
 * @brief Releases lock, which the current thread must own.
 * 
 * @note - It must check current thread hold the lock.
 * @note - Set `lock->holder` to be NULL, and call `sema_up()`.
 * 
 * @warning - Call this function in interrupt handler is UB.
 * 
 * @todo Whether or not the interrupt handler can hold the lock is TBD.
*/
void
lock_release (struct lock *lock) {
  ASSERT (lock != NULL);
  ASSERT (lock_held_by_current_thread (lock));
  
  struct thread* t = lock->holder;

  /** 无捐赠优先级*/
  if(!t->donate_nums) {
    ;
  } else { /** 处理捐赠记录 */
    int max_index = 0; /** 捐赠记录最大值下标 */
    for(int i = 0; i < MAXLOCKS; i ++){
      if(t->temp_priority[max_index] < t->temp_priority[i]){
        max_index = i;
      }
    }

    if(lock->index != -1) {
      if(--(t->donate_nums) == 0){ /** 释放最后一个带捐赠的锁 */
        t->priority = t->first_priority;
        t->first_priority = -1;
      } else { /** 不是最后一个带捐赠记录的锁 */
      /** 如果当前锁记录的捐赠优先级是最高的那么就需要复原
       *  否则不复原持锁线程优先级, 而是把等待队列中的线程加入ready_list
      */
        if(max_index == lock->index) {
          t->priority = t->temp_priority[lock->index];
        } else {
          struct list_elem* e;
          struct thread* t;
          struct list* l = &lock->semaphore.waiters;
          for(e = list_head(l); e != list_head(l); e = e->next) {
            t = list_entry(e, struct thread, elem);
            thread_unblock(t);
            list_remove(e);
          }
        }
      }
      /** 不管如何都要清空这把锁的记录 */
      t->temp_priority[lock->index] = -1;
      lock->index = -1;
    }
  }


  lock->holder = NULL;

  sema_up (&lock->semaphore);
}


/**
 * @brief Check current thread hold the `lock` or not.
 * 
 * @warning Note that testing whether some other thread holds a lock would be racy.
 *  
 * @return Returns true if the running thread owns lock, false otherwise.
*/
bool
lock_held_by_current_thread (const struct lock *lock) {
  ASSERT (lock != NULL);

  return lock->holder == thread_current ();
}



/** @struct semaphore_elem
 * @brief One semaphore in a list.
 * 
 * @note - `struct list_elem elem` : List element.
 * @note - `struct semaphore semaphore` : This semaphore.
*/
struct semaphore_elem {
  struct list_elem elem;
  struct semaphore semaphore;
};



/**
 * @brief Initialize condition variable COND.
 * 
 * @details A condition variable allows one piece of code to signal
 *          a condition and cooperating code to receive the signal
 *          and act upon it.
 * 
 * @note Just call `list_init()` to initialize the `cond->waiters`.
*/
void
cond_init (struct condition *cond) {
  ASSERT (cond != NULL);

  list_init(&cond->waiters);
}


/** Atomically releases LOCK and waits for COND to be signaled by
   some other piece of code.  After COND is signaled, LOCK is
   reacquired before returning.  LOCK must be held before calling
   this function.

   The monitor implemented by this function is "Mesa" style, not
   "Hoare" style, that is, sending and receiving a signal are not
   an atomic operation.  Thus, typically the caller must recheck
   the condition after the wait completes and, if necessary, wait
   again. -- This Mesa feature is embodied in the sema_down() 

   A given condition variable is associated with only a single
   lock, but one lock may be associated with any number of
   condition variables.  That is, there is a one-to-many mapping
   from locks to condition variables.
 */

/** @todo The "Mesa" style and "Hoare" style 
*/


/**
 * @brief Atomically releases `lock` and waits for `cond` to be 
 *        signaled by some other piece of code.
 * 
 * @param[in] *cond An abstract of something need to wait for to
 *             caller thread.
 * @param[temp] waiter Represent the caller thread, will run after
 *             something done.
 * 
 * @note - Create a local variable `waiter`, and initilize its member
 *         `waiter.semaphore` with value 0.
 * @note - Call `list_push_back` push the `waiter` into the wait list
 *         and release the `lock`. (waiter.elem represents the waiter itself
 *         see "list_entry" or "container_of" technique)
 * @note - Then just call `sema_down` to sleep, waits for `cond` to be
 *         signaled by some other piece of code.
 * 
 * @warning - The `lock` must be held before calling this function.
 * @warning - This function may sleep, so it must not be called within an
 *            interrupt handler.
 * @warning - This function may be called with interrupts disabled, but 
 *            interrupts will be turned back on if we need to sleep.
*/
void
cond_wait (struct condition *cond,
           struct lock      *lock) {
  struct semaphore_elem waiter;

  ASSERT (cond != NULL);
  ASSERT (lock != NULL);
  ASSERT (!intr_context ());
  ASSERT (lock_held_by_current_thread (lock));
  
  sema_init (&waiter.semaphore, 0);
  list_push_back (&cond->waiters, &waiter.elem);
  lock_release (lock);
  sema_down (&waiter.semaphore);
  lock_acquire (lock);
}


/**
 * @brief
 * 
 * @note - Remove waiter from the wait list, and call `sema_up()`
 *         to wake up the waiter thread.
 * 
 * @warning - `lock` must be held before calling this function.
 * @warning - An interrupt handler cannot acquire a lock, so it does not
 *            make sense to signal a condition variable in it.
*/        
void
cond_signal (struct condition *cond,
             struct lock      *lock UNUSED) {
  ASSERT (cond != NULL);
  ASSERT (lock != NULL);
  ASSERT (!intr_context ());
  ASSERT (lock_held_by_current_thread (lock));

  if (!list_empty (&cond->waiters)) {
    sema_up (&list_entry(list_pop_front(&cond->waiters), struct semaphore_elem, elem)->semaphore);
  }

  /** @details
   * The expression `list_entry(LIST_ELEM*, STRUCT, MEMBER)` used to get a pointer,
   * refer to the outside struct `semaphore_elem`
  */
}


/**
 * @brief The "broadcast" version of `cond_signal`.
*/
void
cond_broadcast (struct condition *cond,
                struct lock      *lock) 
{
  ASSERT (cond != NULL);
  ASSERT (lock != NULL);

  while (!list_empty (&cond->waiters))
    cond_signal (cond, lock);
}