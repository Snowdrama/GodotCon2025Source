extends Node

@export var mixer : AudioBusLayout

func _enter_tree():
	Messages.audio.set_mixer_value.connect(set_mixer_value)
	
func _exit_tree():
	Messages.audio.set_mixer_value.disconnect(set_mixer_value)
	
func set_mixer_value(mixer_channel:String, value : float):
	var index = AudioServer.get_bus_index(mixer_channel)
	var value_in_db = linear_to_db(value)
	AudioServer.set_bus_volume_db(index, value_in_db)
	pass
	
