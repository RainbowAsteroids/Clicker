extends Panel
class_name DeathScreen

onready var return_scene := DeathScreenArgs.return_scene

func _ready():
	if return_scene == null:
		ErrorArgs.message = "Return scene not set."
		get_tree().change_scene("res://UIs/Error.tscn")

func _on_Retry_pressed():
	get_tree().change_scene_to(return_scene)

func _on_Level_pressed():
	get_tree().change_scene("res://UIs/LevelSelect.tscn")

func _on_Menu_pressed():
	get_tree().change_scene("res://UIs/MainMenu.tscn")
