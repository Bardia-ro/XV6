#include "types.h"
#include "stat.h"
#include "user.h"

int main(void) 
{
printf(1, "Note: Unix V6 was released in year %d\n", getyear());

char *start = sbrk(0);
*start=100;

printf(1, "Note: Unix V6 was released in year  %d\n", mprotect(start, 1));
    exit();
}