#ifndef USERPROG_SYSCALL_H
#define USERPROG_SYSCALL_H

#define NELEM(x) (sizeof(x)/sizeof((x)[0]))

extern struct intr_frame;

void syscall_init (void);


/** Projects 2 and later. */

#endif /**< userprog/syscall.h */
