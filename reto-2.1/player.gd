extends CharacterBody2D

# @export permite cambiar la velocidad seleccionando Player en el Inspector.
@export var velocidad: float = 240.0

var gravedad: float = 980.0
var fuerza_salto: float = -420.0


func _physics_process(delta: float) -> void:
	var direccion: float = Input.get_axis("move_left", "move_right")
	velocity.x = direccion * velocidad

	if not is_on_floor():
		velocity.y += gravedad * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = fuerza_salto

	move_and_slide()
	# Evita que el personaje salga por los lados de la pantalla.
	position.x = clampf(position.x, 36.0, 1116.0)
