# Ficha del dispositivo: teclado

- **Tecnología de captura:** en un teclado común, las teclas forman una matriz de filas y columnas. Al pulsar una tecla se cierra un contacto. El controlador revisa la matriz y comunica qué tecla se ha pulsado o soltado. El sistema operativo entrega esa información al juego.
- **Tipo de señal:** digital. Para este proyecto, una tecla tiene dos estados: pulsada o suelta; no indica qué tan fuerte la presiono. En Godot su fuerza vale 1.00 o 0.00.
- **Ventaja:** permite asignar acciones a teclas fáciles de recordar, como A y D para mover el personaje.
- **Limitación:** no permite regular la velocidad según la presión de la tecla, como sí puede hacerse con la inclinación de un stick analógico.
- **Juego de ejemplo:** este proyecto, Panel de controles: A mueve a la izquierda, D a la derecha y Espacio salta.
- **Fuente sobre la captura:** [QMK: How a Keyboard Matrix Works](https://docs.qmk.fm/how_a_matrix_works).
- **Fuente sobre los eventos:** [Godot: InputEventKey](https://docs.godotengine.org/en/stable/classes/class_inputeventkey.html).

La ficha describe un teclado convencional usado como entrada digital. Por eso el HUD muestra **Teclado | Digital** al recibir sus eventos.
