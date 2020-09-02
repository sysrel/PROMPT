
Example about Data models, function pointer initialization constraint

How to run:
$ ./run.sh foo.bc 2>&1 | tee o.txt

$ more run.sh
$PROMPT -prose-api-model=model.txt -write-kqueries $1

$ more model.txt
global settings:

data models:

 (bar = x) where bar is function, x is B field 2;

 (x > 0) where x is foo arg 0;

function models:

lifecycle model:

entry-point foo


Code
======
#include <assert.h>

struct B {
  int b1;
  int b2;
  void (*f)(void);
};

void bar() {
  assert(0); // reached
}

void foo(int a, struct B *b) {
  if (a < 0)
     assert(0); // not reached
  b->f(); // calls bar
}
