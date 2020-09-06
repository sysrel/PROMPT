#include <assert.h>
#include <stddef.h>

#define container_of(ptr, type, member) ({				\
	void *__mptr = (void *)(ptr);					\
	((type *)(__mptr - offsetof(type, member))); })

struct B {
  int b1;
  char b2;
};

struct A {
  int a;
  struct B b;
  char c;
};

int foo(int x, struct B *b) {
   struct A *ep = container_of(b, struct A, b);
   if (x > 0)
      ep->a = x;
   else 
      ep->a = -x;
   return ep->a;
}
