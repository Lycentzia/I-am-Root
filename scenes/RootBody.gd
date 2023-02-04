extends RigidBody2D

func _ready():
	$AnimatedSprite.playing = true
	var types = $AnimatedSprite.frames.get_animation_names()
	$AnimatedSprite.animation = types[randi() % types.size()]

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
