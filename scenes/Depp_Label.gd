extends Label

var time_elapsed := 0.0

func _process(delta: float) -> void:
	time_elapsed += delta
	text = "Deep Meters: " + String(int(time_elapsed))
