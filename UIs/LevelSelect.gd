extends Panel
class_name LevelSelect

export var level_button: PackedScene

func _ready():
	var file_inst = File.new()
	for i in range(LevelRouter.best_level + 1):
		if file_inst.file_exists("res://Levels/Level" + str(i) + ".tscn"):
			var btn = level_button.instance()
			btn.text = str(i)
			btn.connect("pressed", self, "_on_LevelButton_pressed", [i])
			$MarginContainer/VBoxContainer/Buttons.add_child(btn)
		else:
			break

func _on_LevelButton_pressed(level: int):
	LevelRouter.current_level = level
	get_tree().change_scene("res://Levels/Level" + str(level) + ".tscn")

func _on_Menu_pressed():
	get_tree().change_scene("res://UIs/MainMenu.tscn")
