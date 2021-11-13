extends Area2D
class_name Player

signal death
signal damage(health)

export var god_mode := false

var health := 100.0

func damage(amount: float):
	if not god_mode:
		health -= amount
		if health <= 0:
			emit_signal("death")
			queue_free()
		else:
			emit_signal("damage", health)

func _input(event):
	if event is InputEventMouseMotion:
		# Because Godot doesn't let us hide the mouse and lock it inside the
		# window at the same time, we have to make the illusion that it is 
		# happening.
		position += event.relative
		# Ensure we don't fly off the screen
		position = Vector2(max(position.x, 0), max(position.y, 0))
		position = Vector2(min(position.x, 1024), min(position.y, 600))

func _on_Player_area_entered(bullet: Bullet):
	if bullet:
		for area in bullet.get_overlapping_areas():
			if area is Enemy:
				return
		
		damage(bullet.damage)
		bullet.queue_free()

func _ready():
	position = Vector2(1024/2, 600/2)
