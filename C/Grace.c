#include <stdio.h>
#include <stdlib.h>
#define A 34
#define B 10
#define FT() int main(){\
    char *c="#include <stdio.h>%1$c#include <stdlib.h>%1$c#define A 34%1$c#define B 10%1$c#define FT() int main(){%4$c%1$c    char *c=%2$c%3$s%2$c;%4$c%1$c    FILE *ptr;%4$c%1$c    if (!(ptr = fopen(%2$cGrace_kid.c%2$c,%2$cw+%2$c)))exit(0);%4$c%1$c    fprintf(ptr, c, B, A, c, 92);}%1$cFT()%1$c/*%1$c    blabla%1$c*/";\
    FILE *ptr;\
    if (!(ptr = fopen("Grace_kid.c","w+")))exit(0);\
    fprintf(ptr, c, B, A, c, 92);}
FT()
/*
    blabla
*/