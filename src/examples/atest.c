#include <stdio.h>
#include <syscall.h>

typedef int (* volatile functionptr)(void);

int
main (int argc, char **argv)
{
  //printf("%d\n", *(volatile int *) NULL);
  printf("%d\n", *(int *)0xC0000000); // user=true
  *(int *)0xC0000000 = 42;
  write (1, (char *) 0x10123420, 123); // user = false, vec_no = 14 死循环
  *(volatile int *)NULL = 42;
  printf("Kumiko Hello");
  exit(1);
}
