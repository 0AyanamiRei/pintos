#include <stdio.h>
#include <string.h>
#include <assert.h>

// 定义 ASSERT 宏
#define ASSERT assert

char *strtok_r(char *s, const char *delimiters, char **save_ptr) 
{
  char *token;
  
  ASSERT(delimiters != NULL);
  ASSERT(save_ptr != NULL);

  /* If S is nonnull, start from it.
     If S is null, start from saved position. */
  if (s == NULL)
    s = *save_ptr;
  ASSERT(s != NULL);

  /* Skip any DELIMITERS at our current position. */
  while (strchr(delimiters, *s) != NULL) 
  {
    /* strchr() will always return nonnull if we're searching
       for a null byte, because every string contains a null
       byte (at the end). */
    if (*s == '\0')
    {
      *save_ptr = s;
      return NULL;
    }

    s++;
  }

  /* Skip any non-DELIMITERS up to the end of the string. */
  token = s;
  while (*s != '\0' && strchr(delimiters, *s) == NULL)
    s++;

  /* Terminate TOKEN if not at end of string. */
  if (*s != '\0')
  {
    *s = '\0';
    *save_ptr = s + 1;
  }
  else
    *save_ptr = s;

  return token;
}

int main() {
  char s[] = "  String to  tokenize. ";
  char *save_ptr;
  char *token = strtok_r(s, " ", &save_ptr);
  int argc = 0;
  char *argv[10];

  while (token != NULL) {
    argv[argc++] = token;
    token = strtok_r(NULL, " ", &save_ptr);
  }

  for (int i = 0; i < argc; i++) {
    printf("argv[%d] = %s\n", i, argv[i]);
  }

  return 0;
}