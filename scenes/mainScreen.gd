extends Node2D

export(PackedScene) var root_body_scene

func _ready():
	get_tree().call_group("root_body", "queue_free")

func _on_RootBodyTimer_timeout():
	var tipPosition = get_node("TipOfRoot").position
	
	var bodyPart = root_body_scene.instance()
	bodyPart.position = tipPosition + Vector2(0,-48)

	# adjust spawn position while left/right movement
	if Input.is_action_pressed("move_right") || Input.is_action_pressed("ui_right"):
		bodyPart.rotation_degrees = -45
		bodyPart.position += Vector2(-24,24)
	if Input.is_action_pressed("move_left") || Input.is_action_pressed("ui_left"):
		bodyPart.rotation_degrees = 45
		bodyPart.position += Vector2(24,24)
	# XXX linear_velocity does not work properly,
	# animation is created with negative gravity on the body parts
	bodyPart.linear_velocity = Vector2(0.0,-100.0)
	
	add_child(bodyPart)
