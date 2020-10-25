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
    
    struct dirent **namelist;
    int n;
    char dirname[100];
    if(argc <1) {
        endwin();
        puts("Your terminal doesn't support colors. Use another terminal");
        getch();
        puts("Press any key to continue...");
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
        endwin();
        puts("Your terminal doesn't support colors. Use another terminal");
        getch();
        puts("Press any key to continue...");
        exit(EXIT_FAILURE);
    } else {
        while(n--) {
            attron(COLOR_PAIR((int)namelist[n]->d_type));
    	    attroff(COLOR_PAIR((int)namelist[n]->d_type)); 
            struct stat actual;
            char path[100];
            if(namelist[n]->d_name[0] != '.'){
                sprintf(path,"%s/%s",dirname,namelist[n]->d_name);
                stat(path,&actual);
                struct passwd *pws;
                pws = getpwuid(actual.st_uid);
                char buf2[10];

                strmode(actual.st_mode,buf2);
                printw("%s\t", buf2);
                char buff[20];

                printw("%s\t", pws->pw_name);
                printw("%s\t", pws->pw_name);

                printw("%ld\n",actual.st_size);

                strftime(buff, 20, "%Y-%m-%d %H:%M:%S", localtime(&actual.st_atim));

                printw("%s\t", buff);
                printw("%s\n",namelist[n]->d_name);
                refresh(); 
            }
            free(namelist[n]);
        }
        free(namelist);
    }
    getch();
    endwin();
    exit(EXIT_SUCCESS);
}
