extends KinematicBody2D

class_name BasePlayer
var IDLE_STATE = 0
var X1_HIT_STATE = 1
var X2_HIT_STATE = 2
var X1_MINUS_HIT_STATE = 3

var current_state = IDLE_STATE
var speed = Vector2(0, 0)
var speed_force = 500

onready var animation = $AnimationPlayer
onready var sprite = $Sprite

func move(delta):
	var collision = move_and_collide(speed * delta)
	if collision != null:
		if collision.collider.name == "Ball":
			
			Globals.ball_node.velocity.x = 180
	handle_state()

func human_control(up_key, down_key, hit_key):
	if Input.is_action_pressed(down_key):
		speed.y = speed_force
	elif Input.is_action_pressed(up_key):
		speed.y = -speed_force
	else:
		speed.y = 0
	
	handle_hit(hit_key)
	

func handle_hit(hit_key):
	if Input.is_action_pressed(hit_key):
		animation.play("hit")
	else:
		if not animation.is_playing():
			animation.play("idle")
			
func handle_state():
	match(sprite.get_frame()):
		0:
			current_state = IDLE_STATE
		1:
			current_state = X1_HIT_STATE
		2:
			current_state = X2_HIT_STATE
			
