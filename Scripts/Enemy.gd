extends Area2D
class_name Enemy

signal death
signal ready_to_fire(enemy)

export var fire_delay := 0.25

func _ready():
	$Timer.wait_time = fire_delay
	$Timer.start()

func fire(player_position: Vector2, parent: Node):
	pass

func _on_Timer_timeout():
	emit_signal("ready_to_fire", self)
