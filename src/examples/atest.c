#include <stdio.h>
#include <syscall.h>
#include <limits.h>

typedef int (* volatile functionptr)(void);

void
write_bad_fd(void){
  char buf = 123;
  write (0x01012342, &buf, 1);
  write (7, &buf, 1);
  write (2546, &buf, 1);
  write (-5, &buf, 1);
  write (-8192, &buf, 1);
  write (INT_MIN + 1, &buf, 1);
  write (INT_MAX - 1, &buf, 1);
}

void
write_bad_ptr (void) 
{
  write (1, (char *) 0x10123420, 123);
}


int
main (int argc, char **argv)
{

  functionptr fp = NULL;
  // int a = fp(); // 将是一个来自user的page fault, vec_no = 14
  // printf("%d", fp()); // bad-jump 同上, 先执行fp()触发page_fault
  // printf("%d", ((int (*)(void))0xC0000000)()); // bad-jump2 同上
  // printf("%d",  *(volatile int *) NULL); // bad-read 同上
  // printf("%d", *(int *)0xC0000000); // bad-read2 同上
  // *(int *)0xC0000000 = 42; // bad-write 同上
  // *(volatile int *)NULL = 42; // bad-write2 同上
  /*****************均是来自user导致的page fault,  vec_no = 14, 直接杀死用户线程即可 */

  write_bad_ptr();
  write_bad_fd();
  printf("Kumiko Hello");
  exit(1);
}
