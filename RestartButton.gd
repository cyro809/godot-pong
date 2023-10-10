extends Button

func _ready():
	connect("pressed", self, "_restart_game")

func _restart_game():
	print("Restart")
	get_tree().reload_current_scene()
	get_tree().paused = false
