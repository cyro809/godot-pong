extends Node2D

var p1_score = 0
var p2_score = 0
onready var ball = get_tree().current_scene.get_node("Ball")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Player1Score.text = String(p1_score)
	$Player2Score.text = String(p2_score)
	ball.connect("score_signal", self, "_add_score_player")

func _add_score_player(goal_name: String):
	if goal_name == "Player1Goal":
		p2_score += 1
		$Player2Score.text = String(p2_score)
	elif goal_name == "Player2Goal":
		p1_score += 1
		$Player1Score.text = String(p1_score)

