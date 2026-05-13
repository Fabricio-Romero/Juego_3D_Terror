class_name Player
extends CharacterBody3D

# La velocidad a la que se mueve el personaje
@export var velocidad = 5
# La gravedad que afecta al personaje
@export var gravedad = 75

@export var sensibilidad = 0.002

@onready var camera = $CameraPivot/Camera3D

@onready var animation = $AnimationPlayer

var topeCam = 0.0

# La velocidad a la que se va a mover el personaje
var velocidad_objetivo = Vector3.ZERO

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.relative.x * sensibilidad)
		topeCam = clamp(topeCam - event.relative.y * sensibilidad, deg_to_rad(-89), deg_to_rad(90))
		camera.rotation.x = topeCam

func _physics_process(delta: float) -> void:
	# La direccion en la que se mueve el personaje
	var direccion = Vector3.ZERO
	
	# Si el jugador presiona la accion asignada a move_right
	if Input.is_action_pressed("move_right"):
		# La direccion en x se resta en 1
		direccion -= transform.basis.x
		animation.play("Caminar")
	# Si el jugador presiona la accion asignada a move_left
	if Input.is_action_pressed("move_left"):
		# La direccion en x se suma en 1
		direccion += transform.basis.x
		animation.play("Caminar")
	# Si el jugador presiona la accion asignada a move_back
	if Input.is_action_pressed("move_back"):
		# La direccion en z se resta en 1
		direccion -= transform.basis.z
		animation.play("Caminar")
	# Si el jugador presiona la accion asignada a move_forward
	if Input.is_action_pressed("move_forward"):
		# La direccion en z se suma en 1
		direccion += transform.basis.z
		animation.play("Caminar")
	# Si el jugador presiona la accion asignada a jump
	if Input.is_action_pressed("jump"):
		# La direccion en y se suma en 1
		direccion += transform.basis.y
	
	# La velocidad objetivo en el eje x es igual a la direccion en el eje x por la velocidad
	velocidad_objetivo.x = direccion.x * velocidad
	# La velocidad objetivo en el eje z es igual a la direccion en el eje z por la velocidad
	velocidad_objetivo.z = direccion.z * velocidad
	
	if is_on_floor():
		# La velocidad objetivo en el eje y es igual a la direccion en el eje y por la velocidad
		velocidad_objetivo.y = direccion.y * velocidad

	# si no esta en el suelo
	if not is_on_floor():
		# La velocidad objetivo en el eje y es igual a la velocidad objetivo en el eje y menos la gravedad por delta
		velocidad_objetivo.y = velocidad_objetivo.y - (gravedad * delta)
	
	# La velocidad es igual a la velocidad objetivo
	velocity = velocidad_objetivo
	# Metodo para que se ejecute el movimiento
	move_and_slide()
