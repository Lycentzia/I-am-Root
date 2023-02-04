extends Label

export var time_elapsed := 0.0

func _process(delta: float) -> void:
	time_elapsed += delta
	text = "Meters: -" + String(int(time_elapsed))
