class_name menu_pausa_class
extends Control

func _on_btn_salir_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.


func _on_btn_volver_pressed() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	GameController.pausa_activa = false
	queue_free()
	pass # Replace with function body.
