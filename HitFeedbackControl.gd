extends Node2D


var hit_feedbak_0 = preload("res://hit_ball_feedback0.png")
var hit_feedbak_1 = preload("res://hit_ball_feedback1.png")
var hit_feedbak_2 = preload("res://hit_ball_feedback2.png")

onready var ball = get_tree().current_scene.get_node("Ball")


# Called when the node enters the scene tree for the first time.
func _ready():
	ball.connect("feedback_hit_signal", self, "_handle_feedback_texture")

func _handle_feedback_texture(player: String, frame: int):
	match(frame):
		1:
			get_node("HitFeedback%s" % player).set_texture(hit_feedbak_1)
		2:
			get_node("HitFeedback%s" % player).set_texture(hit_feedbak_0)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
