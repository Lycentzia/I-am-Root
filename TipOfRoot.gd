extends Area2D

export var speed = 150 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.
var velocity = Vector2.ZERO
var music_speed_base = 0.75
var music_speed_increment_by = 0.05
var music_speed_increment_every = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	# initial position: centered on top border
	position.x = screen_size.x / 2
	# initial velocity/direction: 1 downward
	velocity.y = 1
	$Music.set_pitch_scale(music_speed_base)
	$Music.play()
	
func _process(delta):
	# increase music speed as the game progresses
	$Music.set_pitch_scale(music_speed_base + (int(Highscore.time_elapsed) / music_speed_increment_every) * music_speed_increment_by)
	
	# root only grows downwards, only left or right controls
	if Input.is_action_pressed("move_right") || Input.is_action_pressed("ui_right"):
		velocity.x += 4
		rotation_degrees = -90
	if Input.is_action_pressed("move_left") || Input.is_action_pressed("ui_left"):
		velocity.x -= 4
		rotation_degrees = 45
	if Input.is_action_just_released("move_left") || Input.is_action_just_released("move_right") || Input.is_action_just_released("ui_left") || Input.is_action_just_released("ui_right"):
		velocity.x = 0
		rotation_degrees = 0
	# stop downwards animation at some point (TODO animate background upwards)
	if position.y >= (screen_size.y / 4):
		velocity.y = 0
		
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed

	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	

func _on_TipOfRoot_body_entered(body):
	$Music.stop()
	get_tree().change_scene("res://scenes/menue.tscn")
