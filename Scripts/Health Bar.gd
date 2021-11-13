extends MarginContainer
class_name HealthBar

var max_health = 100.0

func adjust(new_health):
	$Health.rect_scale.x = new_health / max_health
