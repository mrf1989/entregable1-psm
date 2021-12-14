# Entregable 1 PSM

## Desplazamiento frecuencial de señales de audio

En este ejercicio se representa e introduce el proceso de modulación AM.

### Requisitos del enunciado

- Grabar una pista de voz de varios segundos.
- Filtrar la pista para eliminar frecuencias superiores a 6kHz, mostrando su DFT. Esta se considerará la señal original.
- Realizar un desplazamiento frecuencial a la señal resultante del filtrado para transmitirla a frecuencias mayores (modulación AM).
- Reproducir la nueva señal tras el desplazamiento frecuencial, mostrando su DFT.
- A partir de la señal desplazada en frecuencia, reconstruir la señal original (demodulación AM).

### Instrucciones para la ejecución de la resolución

Esta resolución utiliza para su ejecución GNU Octave versión 6.3.0

El programa está pensado para ser ejecutado de dos maneras posibles: automáticamente, a través de la consola de comandos de Octave, o paso a paso, ejecutando parcialmente los scripts del archivo `main.m`.

#### Ejecución automática

En la consola de Octave, desde el directorio del repositorio, ejecutar el script principal con el siguiente comando:

```
>> main
```

El programa comenzará su ejecución y reproducirá la pista de audio original grabada con un dispositivo móvil, mostrando los gráficos de la señal y su DFT.

A continuación, en consola se pedirá al usuario que introduzca varios parámetros:

```
Seleccione la frecuencia de corte en Hz para el filtro paso baja (ENTER, por defecto 6000 Hz):
```

```
Seleccione el orden impar del filtro (ENTER, por defecto 51):
```
El orden debe ser un número impar. En caso de que el usuario introduzca un valor par, el programa toma el siguiente entero mayor a éste.

```
Seleccione la ventana de filtrado (Hann [1], Hamming [2] o Blackman [3]):
```

Para seleccionar la ventana se debe introducir el número asociado que se indica en cada caso. De no seleccionar ninguno de esos valores, la ventana por defecto será la rectangular.

Después de esto se reproducirá la señal filtrada, mostrando los gráficos de la misma y su DFT.

Paso seguido, en consola se pedirá al usuario que especifique la frecuencia de la señal moduladora en hercios.

```
Seleccione la frecuencia en Hz de la señal moduladora (ENTER, por defecto 80000):
```

A continuación, se reproduce la señal desplazada en frecuencia, mostrando los gráficos de la señal resultante y su DFT.

En este punto se ejecuta la demodulación de la señal anterior en la misma frecuencia seleccionada, se escucha la señal demodulada y se muestran los gráficos de la misma y su DFT.

Para mejorar la última señal que escuchamos, en consola se pedirá al usuario que introduzca una frecuencia de corte para un filtrado paso baja. Tras introducir un valor de 0 a 0.5, se vuelve a reproducir la nueva señal filtrada.

```
Seleccione la frecuencia de corte para el filtrado paso baja (entre 0 y 0.5):
```

Tras esto, el usuario vuelve a ser requerido en la consola, respondiendo 1 si desea finalizar el programa o pulsando ENTER directamente si quiere volver a elegir una frecuencia y de corte y repetir el paso anterior, filtrando la señal demodulada.

```
Para confirmar audio, pulse 1 y después ENTER. Pulse ENTER para ajustar la frecuencia:
```

Antes de finalizar se puede introducir un factor de ganancia para aumentar los decibelios (dB) de la señal reconstruida, ya que tras el filtrado puede perder intensidad.

```
Si lo desea, introduzca un factor de ganancia (dB):
```

Por lo general, y partiendo de los valores por defecto para la resolución del problema, en este último paso, un valor de 2 suele aproximar con bastante precisión el nivel de volumen de la señal original.

Finalmente, se reproduce la señal reconstruida y se muestra su gráfica y su DFT.

#### Ejecución paso a paso

Este es el modo de ejecución recomendable para ir poco a poco, observando las gráficas y los cambios en la señal.

El usuario debe abrir en el editor de texto de Octave el fichero `main.m`.

A continuación deberá ir seleccionado y ejecutando de forma secuencial los diferentes scripts correspondientes a cada "step".

Debe seleccionar cada step al completo y ejecutarlo mediante el menú Ejecutar > Ejecutar selección, o pulsando la tecla F9.
