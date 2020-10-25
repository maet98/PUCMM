#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <unistd.h>
#include <wait.h>
#include <sys/types.h>
#define EXIT_FAILURE 1
/* 
 *   Se crea un proceso de un mandato - una palabra que se recibe
 *   con gets:   pwd date  
 *    Y se ejecuta como un proceso hijo
 */
int     main    (void)
{
        char    line [BUFSIZ];
        int     process;

        for ( ; ; ) {
            (void) fprintf (stderr, "cmd: ");
            if (gets (line) == (char *) NULL)
                     exit (EXIT_FAILURE);
            if ((process = fork ()) > 0)
                        (void) wait ((int *) NULL);
            else if (process == 0) {       
                        (void) execlp (line, line, NULL);
                        (void) fprintf (stderr, "no se puedo ejecutar %s\n", line);
                        exit (errno);
           } else if (process == -1) { 
                        (void) fprintf (stderr, "Problemas con fork\n");
                      exit (errno);
           }
      }
}
