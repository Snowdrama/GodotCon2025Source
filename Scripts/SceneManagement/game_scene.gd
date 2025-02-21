extends Node

func _ready():
	Messages.set_scene_as_current.emit(self)
