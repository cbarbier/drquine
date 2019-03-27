#include <unistd.h>
#include <stdio.h>
#include <fcntl.h>

int main()
{
    unsigned int i = O_RDWR | O_CREAT;
    FILE * ret = fopen("Grace_kid.s", "w+");
    fprintf(ret, "ret open = %lu\n", sizeof(ret));
    fclose(ret);
    return (0);
}