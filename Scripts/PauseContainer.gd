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

func _on_Restart_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Levels/Level" + str(LevelRouter.current_level) + ".tscn")

func _on_Level_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://UIs/LevelSelect.tscn")

func _on_Menu_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://UIs/MainMenu.tscn")
