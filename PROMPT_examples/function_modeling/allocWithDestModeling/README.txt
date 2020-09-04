
Example about Function models, alloc with destination to store the address of the allocated memory

How to run:
$ ./run.sh foo.bc 2>&1 | tee o.txt

$ more run.sh
$PROMPT -prose-api-model=model.txt -write-kqueries $1

$ more model.txt
global settings:

data models:

function models:

 alloc bar initzero false symbolize false memreturn true destarg 3;

lifecycle model:

entry-point foo


Code
======
#include <assert.h>
	
char *bar(int a, int b, int c, char **d);

void foo(int a, int b, int c) {
  c = 10;
  char *n, *m; 
  m = bar(a,b,c,&n); // address of the allocated memory will be returned as well as stored in n  
  assert(n == m); // does not fail
  n[0] = 'A'; // no memory error
  n[1] = 'B'; // memory error
}
