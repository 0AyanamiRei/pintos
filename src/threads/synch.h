#ifndef THREADS_SYNCH_H
#define THREADS_SYNCH_H

#include <list.h>
#include <stdbool.h>


/** @struct semaphore
 * @brief info A counting semaphore, represents a semaphore.
 * 
 * @note - `unsigned value` : Current value.
 * @note - `struct list waiters` : List of waiting threads.
*/
struct semaphore {
  unsigned value;
  struct list waiters;
};

void sema_init (struct semaphore *, unsigned value);
void sema_down (struct semaphore *);
bool sema_try_down (struct semaphore *);
void sema_up (struct semaphore *);
void sema_self_test (void);


/** @struct lock
 * @brief Represents a lock.
 * 
 * @note - `struct thread *holder` Thread holding lock (only for debugging).
 * @note - `struct semaphore semaphore` Binary semaphore controlling access.
*/
struct lock {
  struct thread *holder;
  struct semaphore semaphore;
  struct list_elem elem;
  int max_priority;
};

void lock_init (struct lock *);
void lock_acquire (struct lock *);
bool lock_try_acquire (struct lock *);
void lock_release (struct lock *);
bool lock_held_by_current_thread (const struct lock *);


/** @struct condition
 * @brief Represents a Condition variable.
 * 
 * @note - `struct list waiters` List of waiting threads.
*/
struct condition {
  struct list waiters;
};

void cond_init (struct condition *);
void cond_wait (struct condition *, struct lock *);
void cond_signal (struct condition *, struct lock *);
void cond_broadcast (struct condition *, struct lock *);

bool compare_locks_by_priority (const struct list_elem *,
                                const struct list_elem *,
                                void *);
								
bool compare_semaphore_elem_by_priority (const struct list_elem *,
                                         const struct list_elem *,
									     void *);
/** Optimization barrier.

   The compiler will not reorder operations across an
   optimization barrier.  See "Optimization Barriers" in the
   reference guide for more information.*/
#define barrier() asm volatile ("" : : : "memory")

#endif /**< threads/synch.h */
