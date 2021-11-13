extends Panel
class_name Error

onready var message = ErrorArgs.message

func _ready():
	if message == "":
		$MarginContainer/VBoxContainer/Label.text = "An error has occured, but no message was supplied."
	else:
		$MarginContainer/VBoxContainer/Label.text = message

func _on_Quit_pressed():
	get_tree().quit()
