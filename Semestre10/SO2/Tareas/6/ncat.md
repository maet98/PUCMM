## Miguel Estevez
### 2017-0200


<div align="center" style="font-size:40px">Ncat</div>

### a. Ejecutar una aplicacion/mandato en una maquina remota.

```bash
ncat -l 6666 -e /bin/ls
```

### b. Convertir maquina atacada en accesible por un puerto dado

```bash
ncat -l 6666 -e /bin/sh
```

### c. Enviar archivo de una maquina a otra.

**Receptor**

```bash
nc -l 1499 > salida.out
```

**Enviador**
```bash
nc 127.0.0.1 1499 < entrada
```

### d. "Escanear" puertos de maquina atacada.

```bash
ncat -z -v -n localhost 1-9000
```

### e. Crear cliente y servidor.

### f. Comunicarse con un servidor: bajar una pagina web

```bash
printf 'GET / HTTP/1.1\r\nHost: github.com\r\n\r\n' | ncat --ssl github.com 443
```
