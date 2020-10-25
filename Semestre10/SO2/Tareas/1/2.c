#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>

void main(void) {
    int fd[2];
    pid_t childpid;
    pipe(fd);
    if((childpid = fork()) == 0) {
        dup2(fd[1], STDOUT_FILENO);
        close(fd[0]);
        close(fd[1]);
        execl("/bin/ls", "ls", "-l", NULL);
        perror("exec de ls fallo");
    } else {
        dup2(fd[0], STDIN_FILENO);
        close(fd[0]);
        close(fd[1]);
        execl("/bin/sort", "sort", "-n", "+4", NULL);
        perror("exec de ls fallo");
    }
    exit(0);
}
