extends Button

@export var target_scene_name : String

func _ready():
	self.pressed.connect(go_to_scene)
	
func go_to_scene():
	Messages.go_to_scene.emit(target_scene_name)
	pass
