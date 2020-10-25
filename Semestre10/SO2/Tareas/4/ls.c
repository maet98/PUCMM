#include<string.h>
#include<pwd.h>
#include<stdio.h>
#include<stdlib.h>
#include <time.h>
#include<dirent.h>
#include<sys/stat.h>
#include<sys/types.h>
#include<unistd.h>

void strmode(mode_t mode, char * buf) {
  const char chars[] = "rwxrwxrwx";
  for (size_t i = 0; i < 9; i++) {
    buf[i] = (mode & (1 << (8-i))) ? chars[i] : '-';
  }
  buf[9] = '\0';
}

char* timeTostring(time_t *time) {
    char buff[20];
    strftime(buff, 20, "%Y-%m-%d %H:%M:%S", localtime(time));
    return buff;
}

int main(int argc, char **argv) {
    struct dirent **namelist;
    int n;
    char dirname[100];
    if(argc <1) {
        exit(EXIT_FAILURE);
    }
    else if( argc == 1) {
        n = scandir(".", &namelist, NULL, alphasort);
        strcpy(dirname,".");
    } else{
        n = scandir(argv[1], &namelist, NULL, alphasort);
        strcpy(dirname,argv[1]);
    }
    if(n < 0) {
        perror("scandir");
        exit(EXIT_FAILURE);
    } else {
        while(n--) {
            printf("%s\n",namelist[n]->d_name);
            struct stat actual;
            char path[100];
            if(namelist[n]->d_name[0] != '.'){
                sprintf(path,"%s/%s",dirname,namelist[n]->d_name);
                stat(path,&actual);
                printf("%ld\n",actual.st_size);
                struct passwd *pws;
                pws = getpwuid(actual.st_uid);
                printf("%s\t", pws->pw_name);
                char buf2[10];
                strmode(actual.st_mode,buf2);
                printf("%s\t", buf2);
                char buff[3][20];
                strftime(buff[0], 20, "%Y-%m-%d %H:%M:%S", localtime(&actual.st_atim));
                strftime(buff[1], 20, "%Y-%m-%d %H:%M:%S", localtime(&actual.st_mtim));
                strftime(buff[2], 20, "%Y-%m-%d %H:%M:%S", localtime(&actual.st_ctim));
                int i;
                for(i = 0;i < 3;i++) {
                    printf("%s\t", buff[i]);
                }
            }
            free(namelist[n]);
        }
        free(namelist);
    }
    exit(EXIT_SUCCESS);
}
