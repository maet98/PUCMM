**Miguel Estevez**

**20170200**



### Ejercicio 1

Utilice _gdb_ para darle seguimiento al BIOS de QEMU para entender como una computadora IA-32 carga. Responda las siguientes preguntas:

1. Cual es la primera instrucción en ejecutar?

   $ljmp\;	\$0x3630,\; \$0xf000e05b$

2. En que dirección física se encuentra esa instrucción?

   $0xffff0$

3. Cual es el propósito de la primera instrucción? Por que fue situada?

   Este comando en ensamblador tiene la función de saltar a la posición de memoria donde se encuentra el bootloader, fue situada para así hacer que este tenga el control.

4. Cuales son las próximas tres instrucciones?
   $$
   cmpw\; \$0xffc8, \%cs:(\%esi)\\
   jne\; 0x241d416\\
   xor\ \%edx,\%edx
   $$
   



### Ejercicio 2

En este ejercicio se dará seguimiento al cargador de Pintos. Coloque un punto de ruptura en la dirección 0x7c00, que es la dirección donde se carga el sector de carga. Continué la ejecución hasta llegar a ese punto de ruptura. Lea el codigo en threads/build/loader.S, utilizando el código fuente y el archivo de des-ensamble en threads/build/loader.asm para dar seguimiento a donde se encuentra. También, utilice gdb para des-ensamblar secuencias de instrucciones en el cargador, y comparar el código fuente original del bootloader tanto con la versión des-ensamblada en threads/build/loader.asm y gdb.

Responda las siguientes preguntas:

1. Como el cargador lee sectores de disco? En particular, que interrupción de BIOS es utilizada?

Se toma un numero de unidad en el registro **DL** (0x80 = disco duro, 0x81 = disco duro 1, etc) y un numero de sector en el registro **EBX** y se lee el sector especificado en la memoria en ES:0000.

	2. Como el cargador decide si encuentra el núcleo de Pintos?

Leyendo la tabla de particiones de cada disco duro del sistema y comparando para ver si es del tipo 0x20, que es el tipo que usa el núcleo de Pintos.

```assembly
#Is it a Pintos kernel partition?
cmpb $0x20, %es:4(%si)
jne next_partition
```



	3. Que sucede cuando el cargador no puede encontrar el núcleo de Pintos?

Se ejecuta la siguiente porción del código:

```asse
no_such_drive:
no_boot_partition:
	#Didn't find a Pintos kernel partition anywhere, give up.
	call puts
	.string "\rNot found\r"
	
	#Notify BIOS that boot failed. See[IntrList].
	int $0x18
```

Esto imprime "Not found" y notifica al BIOS con el código de error $0x18$.

​	4. En que punto el cargador le transfiere control al núcleo de Pintos?

Luego de que el bootloader consigue cargar el núcleo de pintos, este hace una conversión, del inicio de la dirección de la cabecera del $ELF$ y convierte la dirección del 32-bit lineal a un segmento $16:16$ offset address "modo real". Y salta a la dirección convertida.



### Ejercicio 3

Se desarrollo el archivo "$shell.c$" con el fin de desarrollar el prompt solicitado, este se encuentra  ubicado en el path: $src/threads$.

Ademas se modifico el archivo "_unit.c_", para poder invocar al prompt, este también se encuentra en el mismo path: $src/threads$.