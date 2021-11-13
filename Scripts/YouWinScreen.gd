extends Panel
class_name YouWinScreen

onready var next_scene := WinScreenArgs.next_scene
onready var replay_scene := WinScreenArgs.replay_scene

func _ready():
	if next_scene == null:
		ErrorArgs.message = "No next scene specified."
		get_tree().change_scene("res://UIs/Error.tscn")
	
	if replay_scene == null:
		ErrorArgs.message = "No replay scene specified."
		get_tree().change_scene("res://UIs/Error.tscn")
	
	# Clean up args
	WinScreenArgs.next_scene = null
	WinScreenArgs.replay_scene = null

func _on_Next_pressed():
	get_tree().change_scene_to(next_scene)

func _on_Replay_pressed():
	get_tree().change_scene_to(replay_scene)

func _on_Select_pressed():
	get_tree().change_scene("res://UIs/LevelSelect.tscn")

func _on_Menu_pressed():
	get_tree().change_scene("res://UIs/MainMenu.tscn")
