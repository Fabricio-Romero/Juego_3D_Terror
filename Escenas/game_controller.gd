class_name gameController

extends Node

var menu_pausa = preload("res://Escenas/menu_pausa.tscn")

@export var pausa_activa = false
var instancia_pausa

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Pausa"):
		if pausa_activa == false:
			instancia_pausa = menu_pausa.instantiate()
			add_child(instancia_pausa)
			Input.mouse_mode = Input.MOUSE_MODE_CONFINED
			pausa_activa = true
		else:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
			instancia_pausa.queue_free()
			pausa_activa = false
