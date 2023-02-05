extends ParallaxBackground

var speed_coefficient = 1.0
const SPEED_INCRESE_COEFFICENT = 0.5

func _process(delta):
	scroll_offset.y -= 400 * delta * speed_coefficient

func _on_IncreaseSpeedTimer_timeout():
	speed_coefficient+= SPEED_INCRESE_COEFFICENT
