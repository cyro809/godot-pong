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
	human_control("p1_move_up", "p1_move_down")
	if Input.is_action_pressed("p1_hit"):
		playerAnimation.play("hit")
		yield(playerAnimation, "animation_finished")
	else:
		playerAnimation.play("idle")
	move(delta)
