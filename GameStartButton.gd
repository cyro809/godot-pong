extends Button

# Called when the node enters the scene tree for the first time.
func _ready():
	if self.name == "P1vP2Button":
		connect("pressed", self, "_game_start_2_players")
	elif self.get_name() == "P1vCPUButton":
		connect("pressed", self, "_game_start_cpu_player")
	get_tree().paused = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _game_start_2_players():
	GameState.is_player2_cpu = false
	get_tree().change_scene("res://Principal.tscn")
	
func _game_start_cpu_player():
	GameState.is_player2_cpu = true
	get_tree().change_scene("res://Principal.tscn")
