extends Node

func _process(delta: float) -> void:
	if Input.is_action_pressed('ui_select'):
		print('button pressed')
