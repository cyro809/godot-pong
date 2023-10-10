extends AcceptDialog

onready var score = get_tree().current_scene.get_node("Score")

# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.win_dialog = self


func _show_winner_popup(winner_player: String):
	if winner_player == "player1":
		self.dialog_text = "Player 1 Wins!"
	elif winner_player == "player2":
		self.dialog_text = "Player 2 Wins!"
	self.popup()
