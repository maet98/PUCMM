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

typedef struct {
    short all;
    short allInfo;
} Flag;

Flag init() {
    Flag flag;
    flag.all = 0;
    flag.allInfo = 0;
    return flag;
}

short validateFlags(char **arr, int n, Flag* flags, char* dir) {
    int i;
    short file = 0;
    for(int i = 1;i < n;i++) {
        if(arr[i][0] == '-'){
            if(arr[i][1] == 'a') {
                flags->all = 1;
            } else if(arr[i][1] == 'l'){
                flags->allInfo = 1;
            } else {
                printf("%s este flag no esta definido\n",arr[i]);
                return 0;
            }
        } else {
            if(!file) {
                strcpy(dir,arr[i]);
                file = 1;
            } else {
                printf("Solo un directorio\n");
                return 0;
            }
        }
    }
    return 1;
}

void ls(Flag flags,char* dirname) {
    struct dirent **namelist;

    int n = scandir(dirname, &namelist, NULL, alphasort);

    if(n < 0) {
        perror("scandir");
        exit(EXIT_FAILURE);
    } else {
        while(n--) {
            if(namelist[n]->d_name[0] == '.' && !flags.all) continue;
            if(flags.allInfo) {
                struct stat actual;
                char path[100];
                sprintf(path,"%s/%s",dirname,namelist[n]->d_name);
                stat(path,&actual);
                char buf2[10];
                strmode(actual.st_mode,buf2);
                printf("%s ", buf2);
                struct passwd *pws;
                pws = getpwuid(actual.st_uid);
                printf("%s ", pws->pw_name);
                printf("%s ", pws->pw_name);
                char buff[3][20];
                printf("%ld ",actual.st_size);
                strftime(buff[2], 20, "%Y-%m-%d %H:%M:%S", localtime(&actual.st_ctim));
                int i;
                for(i = 0;i < 3;i++) {
                    printf("%s ", buff[i]);
                }
            }
            printf("%s\n",namelist[n]->d_name);
            free(namelist[n]);
        }
        free(namelist);
    }
    exit(EXIT_SUCCESS);
}

int main(int argc, char **argv) {
    Flag flags = init();
    int n;
    char dirname[100];
    strcpy(dirname,".");
    if(argc < 1) {
        exit(EXIT_FAILURE);
    }

    if(validateFlags(argv,argc,&flags,dirname)) {
        ls(flags,dirname);
    } else {
        exit(EXIT_FAILURE);
    }
}
