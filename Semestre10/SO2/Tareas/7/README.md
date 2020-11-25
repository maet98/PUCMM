#  A Construir un Mini-Shell para Linux

##  1.- Introducción

Esta practica se diseña para proporcionar los conocimientos y la comprensión de cómo crear y utilizar procesos en el sistema operativo Linux. Usted también aprenderá cómo encontrar, leer, y utilizar documentación técnica a través de  de páginas de manual. 

Dado que muchos sistemas operativos han tomado prestado muchas  ideas de LINUX en el conocimiento que se adquiere en esta práctica nos sirve para comprender mejor otros sistemas.

Preparación: 
Antes de comenzar el laboratorio debes examinar los ejemplos que se senalan, y resolver preguntan se proporcionan con los ejemplos. Tenga en cuenta que es importante  estudiar  las páginas de los manuales utilizando el comando man.

1.1 La tarea
La tarea consiste en escribir un programa que actúa como un intérprete de comandos simple (shell) para Linux. El programa permitirá al usuario introducir comandos hasta que se decida a salir con el comando "exit". El "shell" creado permitirá que los comandos  sean ejecutados en segundo plano ( "background"). El shell podra 
imprimir información  de los procesos en backgorund, como processid, y si el comando se ejecuta en primer plano, despues de su ejecucion se imprime estadísticas para el tiempo que el comando se llevó para completar (es decir, no es necesario medir tiempo de ejecucion para procesos en segundo plano).

La mayoría de los comandos deben ser ejecutados en un proceso independiente de la aplicación, o mini-shell, es decir en un proceso creado para  cada comando. Sin embargo, el programa tiene dos comandos integrados: • cd dir  ==> Que cambia directorio de trabajo a dir. Si dir no existe o no es una ruta válida tu programa lo detecterá y puede cambiar al directorio hogar del usuario, tal como esta definido por por la variable de ambiente HOME.

• exit ==>  para salir del programa.

Tu programa debe haber incorporado la comprobación de errores para los valores de retorno de las llamadas al sistema. Si este descubre un error  algún  mensaje razonable de error es impresos para el usuario.

El "shell", por supuesto, no dejara procesos zombies detrás! 

Tampoco  terminar el shell  si un proceso en primer plano o de fondo terminó con <Ctrl-c>.

Para procesos en primer plano, se debe dar  información sobre el processid tan pronto termina. Para los procesos de fondo, información sobre la creación y terminación se imprime por el shell  despues que el proceso termina.

El programa pondrá en marcha dos métodos para la detección de procesos en segundo plano finalizados:

• Mediante la lectura de un cambio de información sobre el estado que guarda OS de los procesos hijos  a través de "sondeo" con la llamada al sistema correspondiente (wait () / waitpid ())
• Mediante el uso de un manejador de señal.

El método utilizado se puede seleccionar en tiempo de compilación por una macro SIGNAL DETECTION definida para compilar el programa para que el "shell" detecte   a través del manejador de señales los datos del 
