#include <stdio.h>
#include <stdlib.h>
#define A   34
#define B   10
#define FT(x)int main(){\
    char *c="#include <stdio.h>%1$c#include<stdlib.h>%1$c#define A 34%1$c#define FT(x)int main(){\\%1$c    char *c=%2$c%3$s%2$c;\\%1$cFILE *ptr;\\%1$c if (!(ptr = fopen("Grace_kid.c","w+")))exit(0);\\%1$cfprintf(ptr, B, A, c);}%1$cFT()"\
    FILE *ptr;\
    if (!(ptr = fopen("Grace_kid.c","w+")))exit(0);\
    fprintf(ptr, B, A, c);}
FT(x)
/*
    blabla
*/