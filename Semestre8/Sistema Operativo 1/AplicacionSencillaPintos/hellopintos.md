### Aplicación sencilla en pintos

El siguiente proyecto consiste en desarrollar una aplicación en pintos que imprime: _Hello, pintos_ en consola. A continuación se presenta una tabla con las componentes relevantes para el proyecto:

| Componente                     | Descripción                                                  |
| ------------------------------ | ------------------------------------------------------------ |
| src/threads/init.c             | Componente que sirve para la inicializacion de alto nivel del kernel, contiene la función main() que consiste principalmente en llamadas a funciones de inicializacion de otros módulos Pintos. |
| src/test/threads/test.h        | Declaración de las funciones disponibles en src/test/threads |
| src/test/threads/test.c        | Componente cuya funcionalidad es ejecutar el test que se escoge ademas de definir un struct para su uso externo. |
| src/test/threads/hellopintos.c | Archivo .c que contiene la función implementada que imprime 'Hello pintos'. |
| src/threads/thread.c           | Implementa varias funciones publicas para el soporte de threads. |
| src/test/threads/make.tests    | Archivo Make que sirve para compilar los test de ese mismo directorio. |

En el siguiente grafo se puede observar las dependencias de la componentes relevantes para el desarrollo de la aplicación

![](/home/miguel/Repository/PUCMM/Semestre8/Sistema Operativo 1/AplicacionSencillaPintos/dependencias.svg)



#### Locus para el desarrollo de la aplicación solicitada

Para el desarrollo de la aplicación se uso el siguiente Locus:

<center>($HOME)/PINTOS-Ubuntu/pintos/src/tests/threads/</center>

Se uso este locus ya que aquí se encuentran varios archivos de test lo cuales se pueden correr con pintos al especificar el alias que se le ha sido asignado, a la hora de ejecutar pintos.



#### Producción de ejecutable y documentación

Para producir el ejecutable de la aplicación se necesita situar en el directorio _src/threads/_ una vez localizados en este directorio basta con escribir en la consola:

<center>make clean; make all</center>

Lo cual invocara al makefile y tendrá listo pintos para su ejecución, y para ejecutar la aplicación en el mismo directorios se escribe en la consola:

```shell
	pintos -- run hello-pintos
```

Para producir la documentación debemos usar el archivo _Doxypintos.doxyfile_ y localizarlo en el mismo directorio en que se encuentra _/src_ (_/pintos_) y con el generador doxygen simplemente se escribe:

```shell
	doxygen Doxypintos.doxyfile
```

Esto creara un directorio _doc_, donde se encontrara toda la documentación del proyecto pintos con la aplicación hello-pintos.



Por ultimo, aquí esta la captura de pantalla del programa en ejecución.

![](/home/miguel/Pictures/pintos-hello.png)