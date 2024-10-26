#ifndef USERPROG_SYSCALL_H
#define USERPROG_SYSCALL_H

#define NELEM(x) (sizeof(x)/sizeof((x)[0]))

extern struct intr_frame;

void syscall_init (void);
int arg_int32(int n, struct intr_frame *f);


/** Projects 2 and later. */

#endif /**< userprog/syscall.h */
