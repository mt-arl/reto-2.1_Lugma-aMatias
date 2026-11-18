# Respuestas

## 1. Mantener D dos segundos y soltar

Sube más el contador de cuadros. Mientras D está pulsada, el juego consulta su estado en cada cuadro y suma uno. Por ejemplo, a 60 cuadros por segundo serían aproximadamente 120 cuadros en dos segundos; el número real depende de los FPS.

El contador de eventos suma **2** para una pulsación completa: uno al pulsar D y otro al soltarla. Las repeticiones automáticas del teclado (eco) se ignoran. Los contadores se acumulan desde que se ejecuta la escena; para comparar una sola prueba, vuelve a ejecutarla con F6 (Cmd + R en este Mac).

## 2. Mantener solamente A

`Input.get_axis("move_left", "move_right")` muestra **-1.00**.
`Input.get_action_strength("move_right")` muestra **0.00**.

El eje calcula derecha menos izquierda: 0 - 1 = -1. La fuerza de move_right solo pregunta por D; como D está suelta, vale 0. No se contradicen: el eje expresa dirección y la fuerza consulta una sola acción. Con A y D juntas, el eje vale 0.00 y la fuerza de derecha vale 1.00.

## 3. Girar la rueda del ratón

Aparece **InputEventMouseButton**. Godot representa la rueda mediante botones especiales, como `MOUSE_BUTTON_WHEEL_UP` y `MOUSE_BUTTON_WHEEL_DOWN`.

La condición de la rueda va antes que la condición general del clic porque ambas usan la misma clase. Si se comprueba primero cualquier InputEventMouseButton, también se captura la rueda y se etiqueta por error como clic.


