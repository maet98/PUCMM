# a. Ejecutar una aplicacion/mandato en una maquina remota.

# b. Convertir maquina atacada en accesible por un puerto dado

# c. Enviar archivo de una maquina a otra.

#Receptor
nc -l 1499 > salida.out

#Enviador
nc 127.0.0.1 1499 < entrada

# d. "Escanear" puertos de maquina atacada.
nc -z -v -n 127.0.0.1 1-9000

# e. Crear cliente y servidor.

# f. Comunicarse con un servidor: bajar una pagina web
