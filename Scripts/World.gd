extends Node

export var bullet: PackedScene

func _on_ready_to_fire(enemy: Enemy):
	enemy.fire($Player.position, self)

# TODO: Make "You died!" screen
# TODO: Make "You win!" screen

func _on_Player_damage(health):
	$HealthBar.adjust(health)

func _input(event):
	if event.is_action("click"):
		yield(get_tree(), "physics_frame")
		var areas = $Player.get_overlapping_areas()
		if not areas.empty():
			for area in areas:
				if area is Enemy:
					area.queue_free()
				
				# Check if there are any more enemies left
				yield(get_tree(), "idle_frame")
				var no_enemies = true
				for child in get_children():
					if child is Enemy:
						no_enemies = false
				
				if no_enemies:
					Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
					get_tree().change_scene("res://UIs/Error.tscn")

func _ready():
	# Hide the mouse
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	# Connect "ready_to_fire" event on all enemies
	for child in get_children():
		if child is Enemy:
			child.connect("ready_to_fire", self, "_on_ready_to_fire")
