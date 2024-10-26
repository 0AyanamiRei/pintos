#include <syscall.h>

int main (int, char *[]);
void _start (int argc, char *argv[]);

// main实际是套了一层_start()
void
_start (int argc, char *argv[]) 
{
  exit (main (argc, argv));
}
