extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#var direction = Vector2(-1.0, 0.0)
var speed = 80
var velocity = Vector2()


# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.ball_node = self
	velocity = Vector2(speed, 0)
	pass # Replace with function body.


func _physics_process(delta):
	
	var collision = move_and_collide(velocity * delta)
	if collision:
		_handle_direction(collision)

func _handle_direction(collision: KinematicCollision2D):
	velocity = velocity.bounce(collision.normal)
	velocity.x = velocity.x - 100 if velocity.x < 0 else velocity.x + 100
