extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var my_position_x = null
var speed = Vector2(0, 0)


# Called when the node enters the scene tree for the first time.
func _ready():
	my_position_x = position.x
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("p2_move_down"):
		speed.y = 100
	elif Input.is_action_pressed("p2_move_up"):
		speed.y = -100
	else:
		speed.y = 0
#	position.x = my_position_x
	var collision = move_and_collide(speed * delta)
	if collision != null:
		if collision.collider.name == "Ball":
			Globals.ball_node.velocity.x = 180
			print(collision.collider.name)
