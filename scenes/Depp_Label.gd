extends Label

func _process(delta: float) -> void:
	Highscore.time_elapsed += delta
	text = "Meters: -" + String(int(Highscore.time_elapsed))
