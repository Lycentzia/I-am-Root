extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	text = "Meters: -" + String(int(Highscore.time_elapsed))

