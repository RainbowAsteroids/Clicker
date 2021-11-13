extends Node2D

func _input(event):
	if event.is_action_pressed("pause"):
		var tree = get_tree()
		tree.paused = not tree.paused
		visible = not visible
		
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _on_Continue_pressed():
	var a = InputEventAction.new()
	a.action = "pause"
	a.pressed = true
	Input.parse_input_event(a)

