/**
*  @file shell.c
*  @brief Archivo de implementacion de un shell para Pintos
*  @author Miguel Estevez
*/

#include "lib/stdio.h"
#include "lib/string.h"
#include "lib/stdbool.h"
#include "lib/user/syscall.h"
#include "kernel/console.h"
#include "devices/input.h"

/*Se inculyen los archivos que contienen la implementación de los comandos 'mv' y 'rm'*/
#include "rm.c"
#include "mv.c"


/**
* @brief Elimina el último carácter de 'line'
* @param pos como un puntero a puntero de carácter
* @param line como la línea que se requeiere eliminar
* @return Retorna true si se logro eliminar el carácter, false si no se hizo nada.
*
*/
bool backspace(char **pos, char line[]) {
	if (*pos > line) {
		printf("\b \b");
		(*pos)--;
		return true;
	} else return false;
}


/**
* @brief Lee una línea de la consola, acepta backspace.
* @param line arreglo de carácteres donde cargará la línea leída
* @param size máximo número de carácteres que soportará una línea
* @return N/A
*
*/
void read_line(char line[], size_t size) {
	char *pos = line;
	while (1) {
		char c = input_getc();

		switch (c) {
			/*Nueva línea*/
			case '\r':
				*pos = '\0';
				putchar('\n');
				return;
			/*Backspace*/
			case '\b':
				backspace(&pos, line);
				break;

			default:
				/* Agrega el caracter a la línea */
				if (pos < line + size - 1) {
					putchar(c);
					*pos++ = c;
				}
		}
	}
}


/**
* @brief Carga un shell en Pintos, puede ejecutar 4 comandos:
* whoami	=> imprimirá "Miguel"
* rm		=> ejecutará el comando 'rm'
* mv		=> ejecutará el comando 'mv'
* exit		=> terminará el shell
* Si no es ninguno de estos imprimirá 'comando desconocido'
* @return N/A
*
*/
void shell(void) {
	while(1) {
		char command[100];

		printf("Shell ISC364> ");
		/* Lee el comando */
		read_line(command, sizeof command);

		char *cur = command, *token;
		/*Se extrae el primer token correspondiente al comando a ejecutar*/
		token = strtok_r(cur, " ", &cur);

		/*Se ejecuta el comando correspondiente*/
		if (!strcmp(token, "exit"))
			break;
		else if (!strcmp(token, "whoami"))
			puts("Miguel");
		else if (!strcmp(token, "rm"))
			rmProc(cur);
		else if (!strcmp(token,"mv"))
			mvProc(cur);
		else
			puts("Comando desconocido");
	}

	printf("Shell exiting.");
	return;
}

