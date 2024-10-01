/*
测试开始时，它会让当前线程忙等，直到负载平均数(load_avg)超过0.5，或者已经过去了45秒。
如果负载平均数超过1，或者在45秒内没有超过0.5，测试就会失败。

接着，测试会让当前线程睡眠10秒，然后检查负载平均数(load_avg)是否已经降到0.5以下。
如果负载平均数低于0，或者仍然高于0.5，测试就会失败。
*/

/** @note 没有通过的可能原因
 * 1. 负载平均数计算错误
 * 2. 定时器中断处理程序运行时间过长
 * 3. 线程调度策略错误
 * 4. 线程状态管理错误
*/


/** Verifies that a single busy thread raises the load average to
   0.5 in 38 to 45 seconds.  The expected time is 42 seconds, as
   you can verify:
   perl -e '$i++,$a=(59*$a+1)/60while$a<=.5;print "$i\n"'

   Then, verifies that 10 seconds of inactivity drop the load
   average back below 0.5 again. */

#include <stdio.h>
#include "tests/threads/tests.h"
#include "threads/init.h"
#include "threads/malloc.h"
#include "threads/synch.h"
#include "threads/thread.h"
#include "devices/timer.h"

void
test_mlfqs_load_1 (void) 
{
  int64_t start_time;
  int elapsed;
  int load_avg;
  
  ASSERT (thread_mlfqs);

  msg ("spinning for up to 45 seconds, please wait...");

  start_time = timer_ticks ();
  for (;;) 
    {
      load_avg = thread_get_load_avg ();
      ASSERT (load_avg >= 0);
      elapsed = timer_elapsed (start_time) / TIMER_FREQ;
      if (load_avg > 100)
        fail ("load average is %d.%02d " "but should be between 0 and 1 (after %d seconds)",
              load_avg / 100, load_avg % 100, elapsed);
      else if (load_avg > 50)
        break;
      else if (elapsed > 45)
        fail ("load average stayed below 0.5 for more than 45 seconds");
    }

  printf("***************************%d\n", elapsed);
  if (elapsed < 38)
    fail ("load average took only %d seconds to rise above 0.5", elapsed);
  msg ("load average rose to 0.5 after %d seconds", elapsed);

  msg ("sleeping for another 10 seconds, please wait...");
  timer_sleep (TIMER_FREQ * 10);

  load_avg = thread_get_load_avg ();
  if (load_avg < 0)
    fail ("load average fell below 0");
  if (load_avg > 50)
    fail ("load average stayed above 0.5 for more than 10 seconds");
  msg ("load average fell back below 0.5 (to %d.%02d)",
       load_avg / 100, load_avg % 100);

  pass ();
}
