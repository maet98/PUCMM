/**
 * @file rm.c
 * @brief Archivo de implementacion del comando rm
 * @author Miguel Estevez
 */

/**
 * @brief Imprime en pantalla informacion de ayuda para el uso del comando
 * @return N/A
 **/
void showRmHelp() {
	puts("Usage: rm [OPTION]... [FILE]...");
	puts("Remove (unlink) the FILE(s).");
	puts("	-f, --force			ignore nonexistent files and arguments, never prompt");
	puts("	-v, --verbose	  	explain what is being done");
	puts("		--help			display this help and exit");
	puts("		--version		output version information and exit");
}

/**
 * @brief	Imprime en pantalla informacion de la version
 * @return	N/A
 **/
void showRmVersion(){
	puts("rm (ISC 364 PDE3) 1.0");
	puts("This is free software: you are free to charge and redistribute it.");
	puts("Written by Miguel Estevez");
}

/**
 * @brief Ejecuta el comando rm con sus opciones incluida en 'cur'
 * @param cur Contiene el comando completo con sus opciones y nombres de archivos
 * @return N/A
 **/
void rmProc(char * cur){
	char* token;
	
	char* fileName[100];
	int numFiles = 0;

	int forceFlag = 0, verboseFlag = 0;

	while(token = strtok_r(cur," ",&cur)) {

		if(token[0] == '-'){
			if(!strcmp(token, "--version")){
				showRmVersion();
				return;
			}
			if(!strcmp(token,"--help")){
				showRmHelp();
				return;
			}
			if(!(strcmp(token,"--force") && strcmp(token,"--f"))) forceFlag = 1;
			else if( !(strcmp(token,"--verbose") && strcmp(token,"-v"))) verboseFlag = 1;
			else{
				printf("invalid option %s\n",token);
			}
		}
		else{
			fileName[numFiles++] = token;
		}
	}
	
	int i;
	for(i = 0;i < numFiles;i++){
		/*Se elimina el archivo*/
		if(filesys_remove(fileName[i])){
			/*Imprime informacion si el flag de verbose esta encendido*/
			if(verboseFlag)
				printf("removed '%s' \n ", fileName[i]);
		}
		else if(!forceFlag)
		{
			printf("rm: cannot remove '%s': No such file\n", fileName[i]);
		}
	}
}
