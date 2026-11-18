extends Node2D

@onready var hud: Label = $Hud

var cuadros_derecha: int = 0
var eventos_derecha: int = 0
var ultima_clase: String = "Sin eventos"
var dispositivo: String = "Teclado (seleccionado)"
var tipo_senal: String = "Digital"
var detalle: String = "Pulsa A, D o Espacio para empezar."


func _process(_delta: float) -> void:
	# Sondeo: se consulta el estado de D en cada cuadro del juego.
	if Input.is_action_pressed("move_right"):
		cuadros_derecha += 1

	var salto: String = "falso"
	if Input.is_action_pressed("jump"):
		salto = "verdadero"

	var eje: float = Input.get_axis("move_left", "move_right")
	var fuerza: float = Input.get_action_strength("move_right")

	hud.text = "CENTRO DE CONTROL DE ENTRADAS\n"
	hud.text += "Dispositivo elegido: Teclado | Señal: Digital\n\n"
	hud.text += "jump (Espacio): %s\n" % salto
	hud.text += "get_axis(izquierda, derecha): %.2f\n" % eje
	hud.text += "get_action_strength(\"move_right\"): %.2f\n\n" % fuerza
	hud.text += "Cuadros con move_right pulsada: %d\n" % cuadros_derecha
	hud.text += "Eventos move_right (pulsar + soltar, sin eco): %d\n\n" % eventos_derecha
	hud.text += "Último evento: %s\n" % ultima_clase
	hud.text += "Dispositivo del evento: %s | Señal: %s\n" % [dispositivo, tipo_senal]
	hud.text += "Detalle: %s" % detalle


func _input(event: InputEvent) -> void:
	# El sistema repite teclas mantenidas: esas repeticiones no cuentan.
	if event is InputEventKey and event.echo:
		return

	# Eventos: solo sumamos cuando llega una pulsación o una liberación.
	if event.is_action("move_right"):
		eventos_derecha += 1

	ultima_clase = event.get_class()
	dispositivo = "Otro dispositivo (id %d)" % event.device
	tipo_senal = "Sin clasificar"
	detalle = event.as_text()

	if event is InputEventKey:
		dispositivo = "Teclado (id %d)" % event.device
		tipo_senal = "Digital"
		var estado: String = "soltada"
		if event.pressed:
			estado = "pulsada"
		detalle = "Tecla %s %s" % [event.as_text_physical_keycode(), estado]
	# La rueda también es InputEventMouseButton: se comprueba antes del clic.
	elif event is InputEventMouseButton and event.button_index in [MOUSE_BUTTON_WHEEL_UP, MOUSE_BUTTON_WHEEL_DOWN, MOUSE_BUTTON_WHEEL_LEFT, MOUSE_BUTTON_WHEEL_RIGHT]:
		dispositivo = "Ratón: rueda (id %d)" % event.device
		tipo_senal = "Digital (pulsos)"
		detalle = "Rueda, botón %d | factor: %.2f" % [event.button_index, event.factor]
	elif event is InputEventMouseButton:
		dispositivo = "Ratón: clic (id %d)" % event.device
		tipo_senal = "Digital"
		detalle = "Botón %d | pulsado: %s" % [event.button_index, str(event.pressed)]
	elif event is InputEventMouseMotion:
		dispositivo = "Ratón: movimiento (id %d)" % event.device
		tipo_senal = "Posición"
		detalle = "x: %.0f | y: %.0f" % [event.position.x, event.position.y]
	elif event is InputEventPanGesture:
		dispositivo = "Panel táctil (id %d)" % event.device
		tipo_senal = "Posición (desplazamiento)"
	elif event is InputEventJoypadMotion:
		dispositivo = "Mando: eje (id %d)" % event.device
		tipo_senal = "Analógica"
	elif event is InputEventJoypadButton:
		dispositivo = "Mando: botón (id %d)" % event.device
		tipo_senal = "Digital"
