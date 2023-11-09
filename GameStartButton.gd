extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal start_cpu_game



# Called when the node enters the scene tree for the first time.
func _ready():
	if self.name == "P1vP2Button":
		connect("pressed", self, "_game_start_2_players")
	elif self.get_name() == "P1vCPUButton":
		print(self.get_name())
		connect("pressed", self, "_game_start_cpu_player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _game_start_2_players():
	GameState.is_player2_cpu = false
	get_tree().change_scene("res://Principal.tscn")
	
func _game_start_cpu_player():
	GameState.is_player2_cpu = true
	get_tree().change_scene("res://Principal.tscn")
