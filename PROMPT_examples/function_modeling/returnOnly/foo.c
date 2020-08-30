#include <assert.h>



int bar(int *a) {
  *a = 5;
  return 0;
}

void foo(int *a) {
  int y = bar(a);
  if (*a != 5)
     assert(0);
  if (y)
     assert(0);
}
