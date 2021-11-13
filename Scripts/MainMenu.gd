extends Panel
class_name MainMenu

func _on_Play_pressed():
	get_tree().change_scene("res://UIs/LevelSelect.tscn")

func _on_Clear_pressed():
	$ConfirmationDialog.visible = true

func _on_Quit_pressed():
	get_tree().quit()


func _on_ConfirmationDialog_confirmed():
	LevelRouter.clear()
