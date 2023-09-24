extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("pressed", self, "_restart_game")

func _restart_game():
	print("Restart")
	get_tree().reload_current_scene()
	get_tree().paused = false
