extends Node3D

var prendida = false

@onready var spot_light_3d: SpotLight3D = $linterna/SpotLight3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if event is InputEvent:
		if event.is_action_pressed("turn_light"):
			if prendida == false:
				print("Linterna Prendida")
				spot_light_3d.visible = true
				prendida = true
			else:
				print("Linterna Apagada")
				spot_light_3d.visible = false
				prendida = false
