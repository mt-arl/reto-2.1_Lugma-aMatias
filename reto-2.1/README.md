# Reto 2.1: panel de controles

Proyecto básico para **Godot 4.7.2**, con teclado y un personaje descargado de internet. No necesita complementos.

## Abrir y probar

1. Importa `project.godot` desde el gestor de Godot.
2. Abre `main.tscn` y ejecuta la escena actual con **F6**. En este Mac comprobé que funciona **Cmd + R**, el atajo de Godot para ejecutar la escena actual en macOS.
3. Haz clic dentro del juego para darle el foco.
4. Usa **A**, **D** y **Espacio**. El panel muestra el estado de salto, el eje, la fuerza, los contadores y el último evento.
5. Mantén D unos dos segundos y suelta: los cuadros aumentan continuamente; los eventos suman uno al pulsar y otro al soltar, sin eco. Vuelve a ejecutar la escena para reiniciar los contadores.
6. Mantén solamente A: eje -1.00 y fuerza de derecha 0.00.
7. Gira la rueda de un ratón sin moverlo después: aparece InputEventMouseButton y el dispositivo dice Ratón: rueda. Un clic dice Ratón: clic.

## Cambiar la velocidad

Selecciona **Player** en el árbol de `main.tscn`. En el Inspector cambia **Velocidad**, cuyo valor inicial es 240 píxeles por segundo. Guarda y vuelve a ejecutar.

## Archivos principales

- `main.tscn`: Main (Node2D), Hud (Label) en (40, 40) y Player en (576, 500); también contiene el panel visual, el suelo y las instrucciones.
- `main.gd`: consulta las acciones en cada cuadro y clasifica los eventos en `_input`.
- `player_base.tscn`: escena reutilizable del personaje con imagen y colisión.
- `player.gd`: movimiento, gravedad y salto; `@export` expone la velocidad.
- `project.godot`: acciones **jump = Espacio**, **move_left = A**, **move_right = D**, configuradas con teclas físicas en Input Map.
- `ficha.md`: ficha del teclado y fuentes.
- `respuestas.md`: respuestas a las tres preguntas.
- `assets/FUENTE.md`: procedencia y licencia de la imagen.

El sondeo consulta un estado continuamente; un evento avisa de un cambio. Esa es la diferencia que muestran los contadores. Aunque Godot devuelve números decimales, las teclas de este proyecto siguen siendo digitales.

## Entrega manual en GitHub

Sube esta carpeta completa con el nombre **reto-2.1**, incluyendo los scripts, las escenas, los archivos Markdown, `project.godot`, los `.uid` generados y `assets`. No subas `.godot`, que es la caché local del editor.

Mensaje de commit sugerido: **Completa reto 2.1: panel de entradas, movimiento con teclado y documentación**.
