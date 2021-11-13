extends Enemy
class_name ShotgunTurret

export(PackedScene) var bullet
export var bullet_speed := 250.0
export var bullet_damage := 5.0

func fire(player_position: Vector2, parent: Node):
	for angle in [-15, 0, 15]:
		var b = bullet.instance()
		
		b.position = self.position
		b.look_at(player_position)
		b.rotation_degrees += angle
		b.speed = bullet_speed
		b.damage = bullet_damage
		
		parent.add_child(b)
