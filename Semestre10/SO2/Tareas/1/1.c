#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>

int n = 5;

void soyyo(int pad, int hijo)  {
    printf(" Mi padre es %04d \n", pad);
    printf(" Y soy       %04d \n", hijo);
}

void main(int argc, char * argv[]){
    int id, i;
    for(i = 0; i < n ; i++)
        if ((id = fork()) == -1)
        {
            printf("error");
            break;
        }
    printf("1\n");
}
