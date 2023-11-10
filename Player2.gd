extends BasePlayer

class_name Player2

var my_position_x = null
onready var ball = get_tree().current_scene.get_node("Ball")
var ai_control = false

# Called when the node enters the scene tree for the first time.
func _ready():
	my_position_x = position.x
	if GameState.is_player2_cpu:
		toggle_cpu_control()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("toggle_p2"):
		ai_control = not ai_control
		
	if ai_control:
		self._cpu_control()
	else:
		human_control("p2_move_up", "p2_move_down", "p2_hit")

	move(delta)

func _cpu_control():
	speed.y = self._ai_speed_on_ball_position()
	
func _ai_speed_on_ball_position():
	var ball_position = ball.global_position.y
	var ball_height = ball.get_node("Sprite").texture.get_height()
	
	if ball_position + ball_height/2 > global_position.y + get_node("Sprite").texture.get_height()/4:
		return speed_force
	elif ball_position + ball_height/2 < global_position.y + get_node("Sprite").texture.get_height()/4:
		return -speed_force

func toggle_cpu_control():
	ai_control = true
