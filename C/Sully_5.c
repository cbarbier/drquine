#include <stdio.h>
#include <stdlib.h>
#define EXE(i) sprintf(exe, "Sully_109828736", i)
#define SRC(i) sprintf(src, "Sully_109828736.c", i)
#define CMD(i) sprintf(cmd, "gcc -Wall -Wextra -Werror #include <stdio.h>%1$c#include <stdlib.h>%1$c#define EXE(i) sprintf(exe, %2$cSully_%d%2$c, i)%1$c#define SRC(i) sprintf(src, %2$cSully_%d.c%2$c, i)%1$c#define CMD(i) sprintf(cmd, %2$cgcc -Wall -Wextra -Werror %s -o %1$s && ./%2$s%2$c, SRC(i), EXE(i))%1$c#define FT() int main(){%4$c%1$c    int i = %5$d;%4$c%1$c    char *c=%2$c%3$s%2$c;%4$c%1$c    FILE *ptr;%4$c%1$c    char src[1024];%4$c%1$c    char exe[1024];%4$c%1$c    char cmd[4096];%4$c%1$c    if (!(ptr = fopen(SRC(i),%2$cw+%2$c)))exit(0);%4$c%1$c    fprintf(ptr, c, B, A, c, 92, i - 1);%4$c%1$cif (!i)exit(0);%4$c%1$csystem(CMD(i));}%1$cFT()