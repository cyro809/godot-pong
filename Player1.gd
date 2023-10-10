extends BasePlayer

class_name Player1

var my_position_x = null
onready var playerAnimation = $AnimationPlayer

func _ready():
	my_position_x = position.x



func _process(delta):
	human_control("p1_move_up", "p1_move_down", "p1_hit")
	
	move(delta)
