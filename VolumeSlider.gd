extends HSlider


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if self.name == "MusicVolumeSlider":
		connect("value_changed", self, "change_music_volume")
	elif self.name == "SfxVolumeSlider":
		connect("value_changed", self, "change_sfx_volume")


func change_music_volume(value):
	GameState.music_volume = value
	

func change_sfx_volume(value):
	GameState.sfx_volume = value
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
