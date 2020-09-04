#include <assert.h>
	
char *bar(int a, int b, int c, char **d);

void foo(int a, int b, int c) {
  c = 10;
  char *n, *m; 
  m = bar(a,b,c,&n);
  assert(n == m); 
  n[0] = 'A';
  n[1] = 'B';
}
