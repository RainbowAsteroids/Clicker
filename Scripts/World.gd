extends Node
class_name Level

var player_dead = false

func _on_ready_to_fire(enemy: Enemy):
	if not player_dead:
		enemy.fire($Player.position, self)

# TODO: Make "You died!" screen

func _on_Player_damage(health):
	$HealthBar.adjust(health)

func _on_Player_death():
	player_dead = true
	DeathScreenArgs.return_scene = load("res://Levels/Level" + str(LevelRouter.current_level) + ".tscn")
	
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_tree().change_scene("res://UIs/DeathScreen.tscn")

func _input(event):
	if event.is_action("click"):
		yield(get_tree(), "physics_frame")
		var areas = $Player.get_overlapping_areas()
		if not areas.empty():
			for area in areas:
				if is_instance_valid(area) and area is Enemy:
					area.queue_free()
				
				# Check if there are any more enemies left
				yield(get_tree(), "idle_frame")
				var no_enemies = true
				for child in get_children():
					if child is Enemy:
						no_enemies = false
				
				if no_enemies:
					Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
					WinScreenArgs.next_scene = load("res://Levels/Level" + str(LevelRouter.current_level + 1) + ".tscn")
					WinScreenArgs.replay_scene = load("res://Levels/Level" + str(LevelRouter.current_level) + ".tscn")
					LevelRouter.best_level = LevelRouter.current_level + 1
					get_tree().change_scene("res://UIs/YouWinScreen.tscn")

func _ready():
	# Hide the mouse
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	# Connect "ready_to_fire" event on all enemies
	for child in get_children():
		if child is Enemy:
			child.connect("ready_to_fire", self, "_on_ready_to_fire")

