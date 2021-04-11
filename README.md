# Reproductor de una canción

Este proyecto tiene como objetivo desarrollar una aplicación que se encargue de reproducir una canción

## Características

- Reproducir canción 
    - Se puede ajustar la velocidad de reproducción
- Cambiar instrumentos
    - Se podrá cambiar entre 10

## Decisiones
###### Bolas
- Cada bola representa una nota diferente.
    - Esta nota afecta a la posición que empieza la bola.
- La bola reproducirá un sonido cuando llegue al fondo de la pantalla.
- La transparencia de la bola ira disminuyendo con el paso del tiempo.

###### Instrumentos
0) El original
1) Acoustic Grand Piano
2) Harmonica
3) Electric Jazz Guitar
4) Violin
5) Tuba
6) Whistle
7) Crystal Effect
8) Goblins Effect   
9) Tinkle Bell

###### Procesamiento de la canción
- Para leer el fichero midi y volcarlo al fichero .csv se utiliza la libreria pretty_midi de python.
    - Se encuentran dos ficheros iguales (uno con extensión .py y otro .ipynb) con el código usado. 
- Con processing se lee el fichero y se reproduce cada nota.
- En todo momento se trabaja con una única nota reproduciendose.


###### Input
- Utilizamos r/R para resetear
- Utilizamos ↑/↓ para cambiar la velocidad
- Se utilizan las teclas numéricas para definir los siguientes instrumentos:


## Herramientas utilizadas
- [Processing](https://processing.org/)
- [Canciones Midi](http://www4.osk.3web.ne.jp/~kasumitu/eng.htm)
- [Editor python](https://colab.research.google.com/)

Realizado por [José Juan Reyes Cabrera](https://github.com/JoseJuanRC)
