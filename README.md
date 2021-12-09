# Entregable 1 PSM

## Desplazamiento frecuencial de señales de audio

### Requisitos del enunciado

- Grabar una pista voz de varios segundos.
- Filtrar la pista para eliminar frecuencias superiores a 6kHz, mostrando su DFT. Esta se considerará la señal original.
- Realizar un desplazamiento frecuencial a la señal resultante del filtrado para transmitirla a frecuencias mayores.
- Reproducir la nueva señal tras el desplazamiento frecuencial, mostrando su DFT.
- A partir de la señal desplazada en frecuencia, reconstruir la señal original.

### Instrucciones para la ejecución de la resolución

Esta resolución utiliza para su ejecución GNU Octave versión 6.3.0

El programa está pensado para ser ejecutado de dos formas diferentes: automáticamente, a través de la consola de comandos de Octave o paso a paso, ejecutando parcialmente los scripts del archivo `main.m`.

#### Ejecución automática

En la consola de Octave, desde el directorio del repositorio, ejecutar el script principal con el siguiente comando:

```
>> main
```

El programa comenzará su ejecución: reproducirá la pista de audio original grabada con un dispositivo móvil, reproducirá la señal filtrada con filtro paso baja 6kHz, a continuación reproduce la señal desplazada en frecuencia y por último la "semi-reconstrucción" de la señal original. Esta última señal es la que se puede pulir a continuación.

En este punto, y para mejorar la última señal que escuchamos, la ejecución se detiene y en consola se solicita al usuario que introduzca una frecuencia de corte para un filtrado paso baja. Tras introducir un valor de 0 a 0.5, se vuelve a reproducir la señal filtrada.*

Tras esto, el usuario vuelve a ser requerido en la consola, respondiendo 1 si desea finalizar el programa o pulsando ENTER directamente si quiere volver a elegir una frecuencia y de corte para filtrar la señal "semi-reconstruida" y mejorarla para que sea lo más parecida a la señal original.

#### Ejecución paso a paso

Este es el modo de ejecución recomendable para ir poco a poco, observando las gráficas y los cambios en la señal.

El usuario debe abrir en el editor de texto de Octave el fichero `main.m`.

A continuación deberá ir seleccionado y ejecutando de forma secuencial los diferentes scripts correspondientes a cada "step".

Debe seleccionar cada step al completo y ejecutarlo mediante el menú Ejecutar > Ejecutar selección, o pulsando la tecla F9.

(*) En el último step, se lanza el procedimiento por el que se solicita una frecuencia de corte al usuario para pulir la señal reconstruida.
