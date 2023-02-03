extends Area2D

var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = 512
	velocity.y = 1
	
func _process(delta):
	position.x += velocity.x
	position.y += velocity.y
