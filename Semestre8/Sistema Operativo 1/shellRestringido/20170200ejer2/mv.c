/**
 * @file mv.c
 * @brief Archivo de implementacion del comando mv
 * @author Miguel Estevez
 **/

/**
 * @brief Imprime en pantalla la infomacion de ayuda para el uso del comando
 * @return N/A
 **/
void showMvHelp() {
    puts("mv --help\n"
        "Usage: mv [OPTION]... [-T] SOURCE DEST\n"
        "   -T, --no-target-directory   treat DEST as a normal file\n"
        "   -n, --no-clobber            do not overwrite an existing file\n"
        "   -v, --verbose               explain what is being done\n"
        "       --help                  display this help and exit\n"
        "       --version               output version information and exit\n"
    );
}

/**
 * @brief Imprime en pantalla informacion de la version
 * @return N/A
 **/
void showMvVersion(){
    put("mv (ISC 364 PDE3) 1.0\n"
        "This is free software: you are fre to charge and redistribute it.\n"
        "Written by Miguel Estevez"
    );
}

/**
 * @brief Ejecuta el comando mv con sus opciones incluidas en 'cur'
 * @param cur Contiene el comando completo con sus opciones y nombre de archivos
 * @return N/A
 **/
void mvProc(char* cur) {
    char* token;
    char* fileName[100];
    int numFiles = 0;

    /*Banderas de opciones*/
    int TFlag, nFlag, verboseFlag;
    TFlag = nFlag = verboseFlag = 0;

    while(token = strtok_r(cur," ",&cur)) {
        /*Casos de opciones*/
        if(token[0] == '-'){
            if(!strcmp(token,"--help")){
                showMvHelp();
                return;
            }
            if(!strcmp(token,"--version")){
                showMvVersion();
                return;
            }
            if(!(strcmp(token,"--no-target-directory") && strcmp(token,"-T"))) TFlag = 1;
            else if(!(strcmp(token,"--no-clobber") && strcmp(token,"-n"))) nFlag = 1;
            else if(! (strcmp(token,"--verbose") && strcmp(token,"--v"))) verboseFlag = 1;
            else{
                printf("Invalid option %s\n Try 'mv --help' for more information.\n",token);
                return;
            }
        }
        else{
            fileName[numFiles++] = token;
        }
    }

    if (numFiles < 2) {
        puts("mv: missing operands\n"
            "Try 'mv --help' for more information."
        );
        return;
    }
    if (numFiles > 2) {
        printf("mv: extra operand '%s' \n", fileName[2]);
        puts("Try 'mv --help' for more information.");
        return;
    }

    struct file*src, *dst;
    int sizeSrcF;
    void *buffer;

    /*Abrir archivo de origen*/
    src = filesys_open(fileName[0]);
    if (src == NULL) {
        printf("mv: cannot stat '%s' : No such file or directory\n",fileName[0]);
        return;
    }
    sizeSrcF = file_length(src);

    /*Despejar y crear el archivo destino*/
    dst = filesys_open(fileName[2]);
    if( dst != NULL){
        file_close(dst);
        /*Retornar si la bandera de --no-clobber esta prendida*/
        if(nFlag) {
            file_close(src);
            return;
        }
        filesys_remove(fileName[1]);
    }
    filesys_create(fileName[1], sizeSrcF);

    //mover data si la hay
    if(sizeSrcF != 0){
        buffer = malloc(sizeSrcF);
        if (buffer == NULL) {
            puts("couldn't allocate buffer");
            return;
        }
        file_read(src, buffer, sizeSrcF);
        file_close(src);
        dst = filesys_open(fileName[1]);
        file_write(dst, buffer, sizeSrcF);
        file_close(dst);
        free(buffer);
    }

    /*Eliminar archivo de origen*/
    filesys_remove(fileName[0]);

    if(verboseFlag)
        printf("'%s' -> '%s' \n",fileName[0],fileName[1]);
}