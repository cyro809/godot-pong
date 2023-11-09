extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("pressed", self, "quit_to_main_menu")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func quit_to_main_menu():
	get_tree().change_scene("res://MainMenu.tscn")
