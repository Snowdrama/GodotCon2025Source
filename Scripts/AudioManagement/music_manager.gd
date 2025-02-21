extends AudioStreamPlayer
class_name MusicManager

var audio_stream : AudioStreamInteractive

func _ready():
	if self.stream is AudioStreamInteractive:
		audio_stream = self.stream
	else:
		printerr("Music Manager requires using an interactive stream")

func _enter_tree():
	Messages.audio.request_song.connect(request_song)
	
func _exit_tree():
	Messages.audio.request_song.disconnect(request_song)
	
func request_song(song_name:String):
	print("Requesting Song Name: ", song_name)
	self.set("parameters/switch_to_clip", song_name)
	pass
