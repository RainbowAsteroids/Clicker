extends Enemy
class_name Turret

export(PackedScene) var bullet
export var bullet_speed := 250.0
export var bullet_damage := 10.0

func fire(player_position: Vector2, parent: Node):
	var b = bullet.instance()
	
	b.position = self.position
	b.look_at(player_position)
	b.speed = bullet_speed
	b.damage = bullet_damage
	
	parent.add_child(b)
