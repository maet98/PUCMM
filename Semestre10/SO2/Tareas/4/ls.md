# Miguel Estevez
## 2017-0200

<div align="center" style="font-size:40px">Ls</div>

Para la implemetacion de este comando se utilizo la estructura dirent de c:

struct dirent:
- char d_name[]: nombre del archivo
- char d_fileno: numero serial del archivo
- char d_namlen: largo del nombre del archivo
- char d_type: tipo del archivo

Tambien de la estructura stat

```c
struct stat {
	dev_t st_dev;
	ino_t st_ino;
	mode_t st_mode;
	nlink_t st_nlink;
	uid_t st_uid;
	gid_t st_gid;
	dev_t st_rdev;
	off_t st_size;
	time_t st_atime;
	time_t st_mtime;
	time_t st_ctime;
	blksize_t st_blksize;
	blkcnt_t st_blocks;
	mode_t st_attr;
}; 
```

De aqui se pudo conseguir informacion de los archivos como: los permisos, la ultima fecha de modificacion, el tamaño y el dueño del archivo.

Estructura implemetada para los flags.
```c
typedef struct {
    short all;
    short allInfo;
} Flag;
```

### Flags implemetados:
1. **-a** para mostrar los archivos ocultos.
2. **-h** para mostrar los flags y que hace el comando.
3. **-l** para mostrar mas informacion sobre los archivos.

## validateFlags
```c
short validateFlags(char **arr, int n, Flag* flags, char* dir) {
    int i;
    short file = 0;
    for(int i = 1;i < n;i++) {
        if(arr[i][0] == '-'){
            if(arr[i][1] == 'a') {
                flags->all = 1;
            } else if(arr[i][1] == 'l'){
                flags->allInfo = 1;
            } else if(arr[i][1]) {
                printf("ls: listar todo los archivos y directorio en el directorio especificado\n");
                printf("Por defecto es el directorio actual.\n");
                printf("-h\t Para mostar esta informacion.\n");
                printf("-a\t Muestra todos hasta los ocultos.\n");
                printf("-l\t Muestra mas informacion sobre los archivos y directorios.\n");
                exit(EXIT_SUCCESS);
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
```

## ls
```c
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
                char path[1000];
                sprintf(path,"%s/%s",dirname,namelist[n]->d_name);
                stat(path,&actual);
                char buf2[20];
                strmode(actual.st_mode,buf2);
                printf("%s ", buf2);
                struct passwd *pws;
                pws = getpwuid(actual.st_uid);
                printf("%s ", pws->pw_name);
                printf("%s ", pws->pw_name);
                char buff[30];
                printf("%ld ",actual.st_size);
                strftime(buff, 30, "%b %d %H:%M", localtime(&actual.st_ctim));
                printf("%s ", buff);
            }
            printf("%s\n",namelist[n]->d_name);
            free(namelist[n]);
        }
        free(namelist);
    }
    exit(EXIT_SUCCESS);
}
```

### Corrida

**ls**

![](./img/1.png)

**ls -h**

![](./img/2.png)

**ls -a**

![](./img/3.png)


**ls -l**

![](./img/4.png)


**ls -l -a**

![](./img/6.png)
