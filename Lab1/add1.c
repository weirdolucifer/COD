#include "hey.h"
#include <stdio.h>
#define z int 
int main()
{
  z x = 10, y = 20;
  printf("\n%d + %d = %d", x, y, add(x, y)); //addition
  printf("\n%d + %d = %d", x, y, sub(x, y));
  return 0;
}
