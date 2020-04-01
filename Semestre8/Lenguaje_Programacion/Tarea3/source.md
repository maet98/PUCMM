La imagen de abajo muestra a la izquierda la situación previa al bloqueo de una intersección. A la derecha, se observa el estado del bloqueo.

![](/home/miguel/Repository/PUCMM/Semestre8/Lenguaje_Programacion/Tarea3/traffic.png)

1. Identifique los actores participantes en el bloqueo.

   Los vehículos

2. Identifique los elementos compartidos por los actores

La intersección.

3. Considerando los actores como procesos concurrentes, plantee un pseudocodigo capaz de evitar que se produzca el bloqueo.

Emplee el mecanismo de sincronizacion de su elección.

```pseudocode
For each vehicle:
	Ocupar_interseccion(interseccion)
	cruzar(vehiculo)
	Liberar_interseccion(interseccion)
```

Donde la intersección funciona como un mutex que al ser ocupado la intersección cuando otro vehículo intenta ocuparla no sera permitido hasta que la intersección sea liberada.