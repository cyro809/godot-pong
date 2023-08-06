extends Node2D

var p1_score = 0
var p2_score = 0
var MAX_SCORE = 3
onready var ball = get_tree().current_scene.get_node("Ball")
onready var win_dialog = get_tree().current_scene.get_node("AcceptDialog")
signal game_over_signal(winner_player)

# Called when the node enters the scene tree for the first time.
func _ready():
	$Player1Score.text = String(p1_score)
	$Player2Score.text = String(p2_score)
	ball.connect("score_signal", self, "_add_score_player")
	Globals.score_node = self
	win_dialog.connect("confirmed", self, "_restart_game")
	

func _add_score_player(goal_name: String):
	if goal_name == "Player1Goal":
		p2_score += 1
		$Player2Score.text = String(p2_score)
	elif goal_name == "Player2Goal":
		p1_score += 1
		$Player1Score.text = String(p1_score)
	_is_game_over()


func _is_game_over():
	if p1_score >= MAX_SCORE:
		emit_signal("game_over_signal", "player1")
		get_tree().paused = true
		print("Player 1 WiN!")
	elif p2_score >= MAX_SCORE:
		emit_signal("game_over_signal", "player2")
		get_tree().paused = true
		print("Player 2 WiN!")
		
func _restart_game():
	get_tree().reload_current_scene()
	get_tree().paused = false
