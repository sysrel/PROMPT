#include <assert.h>

struct B {
  int b1;
  int b2;
  void (*f)(void);
};

void bar() {
  assert(0);
}

void foo(int a, struct B *b) {
  if (a < 0)
     assert(0);
  b->f();
}
