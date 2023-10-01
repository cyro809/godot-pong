extends BasePlayer

class_name Player1
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var my_position_x = null
onready var playerAnimation = $AnimationPlayer



# Called when the node enters the scene tree for the first time.
func _ready():
	my_position_x = position.x


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	human_control("p1_move_up", "p1_move_down", "p1_hit")
	
	move(delta)
