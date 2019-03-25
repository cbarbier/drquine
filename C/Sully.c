#include <stdio.h>
#include <stdlib.h>
#define NB 5
#define EXE sprintf(exe, "Sully_%d", i)
#define SRC sprintf(src, "Sully_%d.c", i)
#define CMD sprintf(cmd, "gcc -Wall -Wextra -Werror %1$s -o %2$s && ./%2$s", src, exe)
#define FT() int main(){\
    int i = 5;\
    char *c="#include <stdio.h>%1$c#include <stdlib.h>%1$c#define NB 5%1$c#define EXE sprintf(exe, %2$cSully_%%d%2$c, i)%1$c#define SRC sprintf(src, %2$cSully_%%d.c%2$c, i)%1$c#define CMD sprintf(cmd, %2$cgcc -Wall -Wextra -Werror %%1$s -o %%2$s && ./%%2$s%2$c, src, exe)%1$c#define FT() int main(){%4$c%1$c    int i = %5$d;%4$c%1$c    char *c=%2$c%3$s%2$c;%4$c%1$c    FILE *ptr;%4$c%1$c    char src[1024];SRC;%4$c%1$c    char exe[1024];EXE;%4$c%1$c    char cmd[4096];CMD;%4$c%1$c    if (i<0 || !(ptr = fopen(src,%2$cw+%2$c)))exit(0);%4$c%1$c    fprintf(ptr, c, 10, 34, c, 92, i - 1);%4$c%1$c    fclose(ptr);%4$c%1$c    if (!i)exit(0);%4$c%1$c    system(cmd);}%1$cFT()";\
    FILE *ptr;\
    char src[1024];SRC;\
    char exe[1024];EXE;\
    char cmd[4096];CMD;\
    if (i<0 || !(ptr = fopen(src,"w+")))exit(0);\
    fprintf(ptr, c, 10, 34, c, 92, i - 1);\
    fclose(ptr);\
    if (!i)exit(0);\
    system(cmd);}

FT()