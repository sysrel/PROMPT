
Example about Data models, about type embeddings

How to run:
$ ./run.sh foo.bc 2>&1 | tee o.txt

$ more run.sh
$PROMPT -prose-api-model=model.txt -write-kqueries $1

$ more model.txt
global settings:

data models:

  type A embeds type B;

function models:

lifecycle model:

  entry-point foo


Code
======
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
      ep->a = x; // no memory error
   else 
      ep->a = -x; // no memory error
   return ep->a;
}
