extends KinematicBody2D

class_name BasePlayer

var speed = Vector2(0, 0)
var speed_force = 500


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func move(delta):
	var collision = move_and_collide(speed * delta)
	if collision != null:
		if collision.collider.name == "Ball":
			Globals.ball_node.velocity.x = 180

func human_control(up_key, down_key):
	if Input.is_action_pressed(down_key):
		speed.y = speed_force
	elif Input.is_action_pressed(up_key):
		speed.y = -speed_force
	else:
		speed.y = 0
