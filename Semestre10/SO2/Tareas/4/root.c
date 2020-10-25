#include<string.h>
#include <ncurses.h>
#include<pwd.h>
#include<stdio.h>
#include<stdlib.h>
#include <time.h>
#include<dirent.h>
#include<sys/stat.h>
#include<sys/types.h>
#include<unistd.h>

#define FOLDER_COLOR 4
#define FILE_COLOR 8
#define SLINK_COLOR 10

void strmode(mode_t mode, char * buf) {
  const char chars[] = "rwxrwxrwx";
  for (size_t i = 1; i < 9; i++) {
    buf[i] = (mode & (1 << (8-i))) ? chars[i] : '-';
  }
  buf[9] = '\0';
}

char* timeTostring(time_t *time) {
    char buff[20];
    strftime(buff, 20, "%Y-%m-%d %H:%M:%S", localtime(time));
    return buff;
}

struct MyStruct_s{
    int allFile;
    int allInfo;
    char dirname[30];
} Mystruct_default = {0,0,"."};

typedef struct MyStruct_s ls;

ls parse(int n, char** values) {
    int dir = 0;
    int i;
    ls answer = Mystruct_default;
    for(i = 1;i < n;i++) {
        if(values[i][0] == '-') {
            switch(values[i][1]) {
                case 'a':
                    answer.allFile = 1;
                    break;
                case 'l':
                    answer.allInfo = 1;
                    break;
                default:
                    printw("BAD flags name");
                    endwin();
                    exit(EXIT_FAILURE);
                    break;
            }

        } else{
            if(!dir) {
                strcpy(answer.dirname,values[i]);
                dir = 1;
            } else {
                printw("Just one directory");
                endwin();
                exit(EXIT_FAILURE);
            }
        }
    }
    return answer;
}

int main(int argc, char **argv) {
    initscr();
    if(has_colors() == FALSE) {
        endwin();
        puts("Your terminal doesn't support colors. Use another terminal");
        getch();
        puts("Press any key to continue...");
        return -1;
    }
    start_color();
    init_pair(FOLDER_COLOR, COLOR_YELLOW, COLOR_BLACK); // Color for folder
    init_pair(FILE_COLOR, COLOR_CYAN, COLOR_BLACK); // Color for normal files
    init_pair(SLINK_COLOR, COLOR_GREEN, COLOR_BLACK); // Color for soft links

    ls ls = parse(argc, argv);
    
    struct dirent **namelist;
    int n;
    char dirname[100];
    if(argc <1) {
        endwin();
        puts("Your terminal doesn't support colors. Use another terminal");
        getch();
        puts("Press any key to continue...");
        endwin();
        exit(EXIT_FAILURE);
    }
    n = scandir(ls.dirname, &namelist, NULL, alphasort);
    if(n < 0) {
        endwin();
        puts("Your terminal doesn't support colors. Use another terminal");
        getch();
        puts("Press any key to continue...");
        endwin();
        exit(EXIT_FAILURE);
    } else {
        while(n--) {
            struct stat actual;
            char path[100];
            if(namelist[n]->d_name[0] == '.' && !ls.allFile){
                continue;
            }
            if(ls.allInfo) {
                sprintf(path,"%s/%s",ls.dirname,namelist[n]->d_name);
                stat(path,&actual);
                struct passwd *pws;
                pws = getpwuid(actual.st_uid);
                char buf2[10];

                strmode(actual.st_mode,buf2);
                char buff[20];

                printw("%s\t", buf2);

                printw("%s\t", pws->pw_name);
                printw("%s\t", pws->pw_name);

                printw("%ld\t",actual.st_size);

                strftime(buff, 20, "%Y-%m-%d %H:%M:%S", localtime(&actual.st_atim));

                printw("%s\t", buff);
            }

            attron(COLOR_PAIR((int)namelist[n]->d_type));
            printw("%s\n",namelist[n]->d_name);
            attroff(COLOR_PAIR((int)namelist[n]->d_type)); 
            refresh(); 
            free(namelist[n]);
        }
        free(namelist);
    }
    getch();
    endwin();
    exit(EXIT_SUCCESS);
}
