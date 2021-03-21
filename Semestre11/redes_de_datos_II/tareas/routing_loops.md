### Miguel Alejandro Estevez
### 2017-0200
1. **Que son los Routing Loops?**

Es una situacion donde los paquetes siguen rutados entre 2 o mas routers porque hay problemas en la tabla de enruntamiento. El cual es el problema principal del protocolos de enrutamiento de vectores de distancia(DVR).

2. **Cuales problemas nos podria ocacionar si la red tiene Routing Loops?**

* Podria completamente deshabilitar la red.
* Consumir el ancho de banda.

3. **Cuales metodos existen para contrarestar los Routing Loops?**

* Maximum hop count
* Split Horizon
* Route poisoning
* Hold-down Timers

4. **Explique en que Consiste el Conteo Hasta el Infinito y como funciona?**

Este mecanismo hace uso del TTL, una parte del header que lleva el conteo de cada salto que lleva hecho el paquete entonces se supone que si llega hasta cierta cantidad grande es improbable que este llegue a su destino entonces lo mata.

5. **Que son los Hold Down Timers y como funciona?**

Es un mecanismo usado para prevenir malas rutas de ser recuperadas y propagadas por error. Cuando una ruta es puesta en hold-down, los routers no anunciará la ruta ni aceptará anuncios sobre ella durante un intervalo específico llamado período de espera.

6. **Explique que es el Split Horizon y como funciona?**

Es una configuracion de enrutaineto que para una ruta de ser anunciada devuelta por la direccion de la que vino. Este mecanismo dice que si un router vecino envia de router a router, el router que revibe no propagara a este router devuelva por la misma interfaz.

7. **Explique que es Split horizon with poison reverse y como funciona?**

Cuando un router detecta que uno de sus routas ha fallado, el router envenerara la ruta asignandole una metrica infinita.

8. **Que es el campo de TTL y que funcion tiene?**

Forma parte del heade del datagram y significa Time-to-Live, tiene como funcion llevar el conteo de cada salto que halla hecho un paquete.
