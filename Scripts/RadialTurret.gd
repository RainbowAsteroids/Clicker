extends Enemy
class_name RadialTurret

export(PackedScene) var bullet
export var bullet_speed := 250.0
export var bullet_damage := 10.0
export var starting_angle := -90.0
export var angle_variation := 7.5

onready var current_angle := starting_angle

func fire(_player_position: Vector2, parent: Node):
	var b = bullet.instance()
	
	b.position = position
	b.rotation_degrees = current_angle
	current_angle += angle_variation
	b.damage = bullet_damage
	b.speed = bullet_speed
	
	parent.add_child(b)
