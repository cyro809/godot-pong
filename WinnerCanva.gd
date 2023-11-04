extends ColorRect


onready var score = get_tree().current_scene.get_node("Score")

# Called when the node enters the scene tree for the first time.
func _ready():
	score.connect("game_over_signal", self, "_show_winner_popup")
	Globals.winner_canvas = self

func _show_winner_popup(winner_player: String):
	if winner_player == "player1":
		self.get_node("CanvaText").bbcode_text = "[center]%s[/center]" % "Player 1\nWins!"
	elif winner_player == "player2":
		self.get_node("CanvaText").bbcode_text = "[center]%s[/center]" % "Player 2\nWins!"
	self.visible = true
	
func _show_pause_menu():
	self.get_node("CanvaText").bbcode_text = "[center]%s[/center]" % "Paused"
	self.get_node("ContinueButton").visible = true
	self.visible = true
	get_tree().paused = true

func _process(delta):
	if Input.is_action_pressed("pause"):
		self._show_pause_menu()
