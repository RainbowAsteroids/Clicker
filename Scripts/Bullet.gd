extends Area2D
class_name Bullet

export var damage = 10.0
export var speed = 0

func _physics_process(delta):
	position += (Vector2(speed, 0).rotated(rotation) * delta)
	
	if position.x < -30 or position.x > (1024 + 30):
		queue_free()
	elif position.y < -7 or position.y > (600 + 7):
		queue_free()
