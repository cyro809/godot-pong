extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var my_position_x = null
var speed = Vector2(0, 0)
onready var ball = get_tree().current_scene.get_node("Ball")
var ai_control = false

# Called when the node enters the scene tree for the first time.
func _ready():
	my_position_x = position.x


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("toggle_p2"):
		ai_control = not ai_control
		
	if ai_control:
		self._cpu_control()
	else:
		self._human_control()

	var collision = move_and_collide(speed * delta)
	if collision != null:
		if collision.collider.name == "Ball":
			Globals.ball_node.velocity.x = 180

func _human_control():
	if Input.is_action_pressed("p2_move_down"):
			speed.y = 100
	elif Input.is_action_pressed("p2_move_up"):
		speed.y = -100
	else:
		speed.y = 0

func _cpu_control():
	speed.y = self._ai_speed_on_ball_position()
	
func _ai_speed_on_ball_position():
	var ball_position = ball.global_position.y
	var ball_height = ball.get_node("Sprite").texture.get_height()
	
	if ball_position + ball_height/2 > global_position.y + get_node("AnimatedSprite").frames.get_frame("default", 0).get_height()/2:
		return 100
	elif ball_position + ball_height/2 < global_position.y + get_node("AnimatedSprite").frames.get_frame("default", 0).get_height()/2:
		return -100
