
Example about Function models, returnonly f2

How to run:
$ ./run.sh foo.bc 2>&1 | tee o.txt

$ more run.sh
$PROMPT -prose-api-model=model.txt -write-kqueries $1

$ more model.txt
global settings:

data models:

function models:

returnonly bar;

lifecycle model:

entry-point foo


Code
======
#include <assert.h>

int bar(int *a) {
  *a = 5; // not executed
  return 0; // not executed
}

void foo(int *a) {
  int y = bar(a); // models by symbolizing the return value only, does not havoc a
  if (*a != 5)
     assert(0); // reached
  if (y)
     assert(0); // reached
}
