extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var my_position_x = null
var speed = Vector2(0, 0)
var speed_force = 200


# Called when the node enters the scene tree for the first time.
func _ready():
	my_position_x = position.x


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("p1_move_down"):
		speed.y = speed_force
	elif Input.is_action_pressed("p1_move_up"):
		speed.y = -speed_force
	else:
		speed.y = 0

	var collision = move_and_collide(speed * delta)
	if collision != null:
		if collision.collider.name == "Ball":
			Globals.ball_node.velocity.x = 180
