<center>
 					<strong>Pontifica Universidad Catolica Madre y Maestra</strong> 




![Quiénes Somos Conoce la PUCMM](https://www.pucmm.edu.do/somos/PublishingImages/conoce-pucmm/logo.jpg)

<center>
    <strong>Realizador por:</strong>
    <p>
        Miguel Estevez
    </p>
    <p>
        2017-0200
    </p>
    <strong>Profesor:</strong>
    <p>
        Pablo Rodriguez
    </p>
    <strong>Materia:</strong>
    <p>
        Lab. de Redes I
    </p>
</center>





















**Notas:**

Este reporte esta hecho para usuario de Arch linux.

### Servidor FTP

Un servidor FTP nos permite usar el protocolo de transferencia de archivos para la carga y descarga de todo tipo de datos, estos datos se encuentran en el servidor, al que se conectan los distintos usuarios, a los cuales se les asignan o niegan ciertos permisos para su uso (cargar datos al servidor, descargarlos, borrarlos o modificarlos)



Primero se tiene que instalar vsftpd.

```bash
sudo pacman -S vsftpd
```



El archivo de configuracion se encontrara en /etc/vsftpd.conf, el cual tendra unos comentario para la documentacion del mismo. 

Primero se tiene que activar "write_enable" para que se pueda realizar cambios al filesystem:

```bash
write_enable=YES
```



Luego para habilitar que usuario de tu maquinas se puedan conectar se tiene que activar "local_enable"

```bash
local_enable=YES
```

En el caso que se quiera que se conecten usuarios anonimos 

```bash
# Allow anonymous login
anonymous_enable=YES
# No password is required for an anonymous login (Optional)
no_anon_password=YES
# Maximum transfer rate for an anonymous client in Bytes/second (Optional)
anon_max_rate=30000
# Directory to be used for an anonymous login (Optional)
anon_root=/example/directory/
```



Al final se tiene que reiniciar el servidor para que los cambios se efectuen

```bash
sudo systemctl restart vsftpd
```



### Cliente

En mi caso se utilizo el cliente "Filezilla" el cual se puede instalar facilmente con

```bash
sudo pacman -S filezilla
```

Si lo abren le saldra algo asi

![](/home/miguelarch/Repository/pucmm/Semetre10/RedesI/Reportes/1/Filezilla1.png)

la configuracion seria:

```
Host: localhost
username: [algun usuario local]
password: [la contraseña del usuario]
```

el puerto hay que dejarlo vacio y luego un click en quickconnect. Entonces el lado derecho sera el que estas conectado. Con solo arrastras del lado derecho al izquierda descargar un directorio/archivo del servidor y del izquierdo al derecho subes al servidor.

![](/home/miguelarch/Repository/pucmm/Semetre10/RedesI/Reportes/1/Screenshot from 2020-10-01 11-34-12.png)



## Servidor Web

Para el servidor web se usara apache

```bash
sudo pacman -S apache
```

Si se quiere que empieze luego que prenda la computadora

```bash
sudo systemctl enable --now httpd
```

Por defecto, la pagina debe esta en "/srv/http"

**index.html**

```html
<html>
    <head>
        <title>Portofolio</title>
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

    </head>
    <body>
        <div class="text-center"
            <h1>
                Miguel Estevez
            </h1>
            <p>
                2017-0200
            </p>
            <h3>
                Edad: 21
            </h3>
            <h3>
                Email: maletaveras@gmail.com
            </h3>
            <h3>
                ISC
            </h3>
            <h3>
                30/09/2020
            </h3>
    	</div>
    </body>
</html>
```

Entonces luego de efectuar el cambio 

```bash
sudo systemctl restart --now httpd
```

En el navegador busca "localhost" y deberia aparecer esto

![](/home/miguelarch/Repository/pucmm/Semetre10/RedesI/Reportes/1/Screenshot from 2020-10-05 15-42-37.png)