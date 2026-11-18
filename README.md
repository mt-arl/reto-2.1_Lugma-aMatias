# Reto 2.1: panel de controles

Proyecto básico para **Godot 4.7.2**, con teclado y un personaje descargado de internet. No necesita complementos.

## Archivos principales

- `main.tscn`: Main (Node2D), Hud (Label) en (40, 40) y Player en (576, 500); también contiene el panel visual, el suelo y las instrucciones.
- `main.gd`: consulta las acciones en cada cuadro y clasifica los eventos en `_input`.
- `player_base.tscn`: escena reutilizable del personaje con imagen y colisión.
- `player.gd`: movimiento, gravedad y salto; `@export` expone la velocidad.
- `project.godot`: acciones **jump = Espacio**, **move_left = A**, **move_right = D**, configuradas con teclas físicas en Input Map.
- `ficha.md`: ficha del teclado y fuentes.
- `respuestas.md`: respuestas a las tres preguntas.


