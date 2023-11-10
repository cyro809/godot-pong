extends HSlider


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("drag_ended", self, "handle_volume")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func handle_volume(value_changed):
	if value_changed:
		if self.get_name() == "SfxVolumeSlider":
			GameState.sfx_volume = self.value
		elif self.get_name() == "MusicVolumeSlider":
			GameState.music_volume = self.value
	print(self.value)
