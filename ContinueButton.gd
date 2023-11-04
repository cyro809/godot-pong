extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("pressed", self, "_resume_game")

func _resume_game():
	get_tree().paused = false
	self.visible = false
	get_parent().visible = false
