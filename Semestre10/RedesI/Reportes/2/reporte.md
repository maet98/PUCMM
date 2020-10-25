# Pontifica Universidad Catolica Madre Y Maestra

![Recursos Logosímbolo](https://www.pucmm.edu.do/recursos/PublishingImages/Paginas/logos/Logo%20PUCMM%20%28Color%29.png)



## Realizado por :

Miguel Alejandro Estevez

2017-0200

### Profesor: 

Pablo Rodriguez

## Materia:

Laboratorio de Redes de Datos I



### Practica

Exposicion de puerto



### 11 de octubre del 2020









**Objetivos: **

1. Abrir puerto en un router
2. Exponer un servidor web a la red exterior



Este Reporte sera hecho en un router **Hauwei HG8245H5**:

Lo primero que se tiene que hacer es buscar la ip para entrar a las configuraciones del router. En un ambiente linux seria:

```
ip route
```

![](/home/miguelarch/Repository/pucmm/Semetre10/RedesI/Reportes/1/Screenshot from 2020-10-11 19-45-44.png)

En mi caso seria el **10.0.0.1**. Luego de ponerlo en un navegador web, deberia salir algo asi:

![](/home/miguelarch/Repository/pucmm/Semetre10/RedesI/Reportes/1/Screenshot from 2020-10-11 19-46-52.png)

El Account y el Password sera el S/N del router, el cual se encuentra en la parte de abajo del router. Al poner los mismo en ambos deberia dejarlo pasar a las configuraciones del router. Donde iriamos al Forward Rules y luego en la parte izquierda a Port Mapping Configuration.



![image-20201011195013874](/home/miguelarch/.config/Typora/typora-user-images/image-20201011195013874.png)

Aqui le damos a New, como es una servidor web en tipo ponemos aplication y en aplication **Web Server (http)**. En mapping name pueden poner el nombre que desean, yo le pondre webserver. En wan name se deja en el primero. Entonces en Internal Host seria la ip de la computadora que estara corriendo el servidor. Al lado estara un dropdown y eligen su computadora. En el caso de que ninguno se le haga familiar, lo que puede hacer es:

```bash
ip addr | grep inet
```

![image-20201011195603854](/home/miguelarch/.config/Typora/typora-user-images/image-20201011195603854.png)

en mi caso es el tercero "wlp3s0" y mi ip seria lo que esta despues de inet "10.0.0.10". El External Source Ip Address lo dejan vacio. Entonces le debiera quedar asi.

![image-20201011200024587](/home/miguelarch/.config/Typora/typora-user-images/image-20201011200024587.png)

Le dan a apply y se supone que el puerto estara abierto. Deben cerciorarse que su servidor este corriendo. En este momento ya se cumple el primer objetivo.



Para poder acceder a su servidor de afuera tienen que buscar la ip de su router, simplemente van a una pagina como [esta](https://whatismyipaddress.com/)

![image-20201011200255835](/home/miguelarch/.config/Typora/typora-user-images/image-20201011200255835.png)

Seria la IPv4, entonces si la escriben en el navegador debiera llevarlos a su servidor web. En mi caso es este y aqui se cumple el segundo objetivo

![image-20201011200408642](/home/miguelarch/.config/Typora/typora-user-images/image-20201011200408642.png)