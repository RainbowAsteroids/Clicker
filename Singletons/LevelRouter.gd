extends Node

var current_level := 0
var best_level: int = 0 setget set_best_level
var file := File.new()

func _ready():
	if file.file_exists("user://save.json"):
		file.open("user://save.json", File.READ_WRITE)
	else:
		file.open("user://save.json", File.WRITE_READ)
	
	load_save()

func save():
	file.store_var({"best_level": best_level})
	file.seek(0)

func load_save():
	var contents = file.get_var()
	
	# Check if the file is valid
	if typeof(contents) != TYPE_DICTIONARY:
		clear()
		return
	
	# Check if the types are valid
	if typeof(contents["best_level"]) == TYPE_INT:
		best_level = contents["best_level"]
	else:
		clear()
		return
	
	file.seek(0)

func clear():
	best_level = 0
	save()

func set_best_level(level: int):
	if level > best_level:
		best_level = level
		save()
