extends Node
class_name SceneManager

@export var transition_manager : TransitionManager
@export var scene_list : Dictionary[String, PackedScene]
var current_scene : Node

var next_scene_target : String

func set_scene_as_current(set_current_scene : Node):
	current_scene = set_current_scene
	
func _enter_tree():
	Messages.go_to_scene.connect(go_to_scene)
	Messages.set_scene_as_current.connect(set_scene_as_current)
	transition_manager.scene_hidden_signal.connect(scene_hidden)
	pass
	
func _exit_tree():
	Messages.go_to_scene.disconnect(go_to_scene)
	Messages.set_scene_as_current.disconnect(set_scene_as_current)
	pass
	
#this is called when the transition is hidden
func scene_hidden():
	#Do we have a scene with that name?
	if scene_list.has(next_scene_target):
		# Clear the current scene and spawn a copy of the new scene
		if current_scene != null:
			current_scene.queue_free()
		var loaded_scene = scene_list[next_scene_target].instantiate()
		get_tree().root.add_child(loaded_scene)
		current_scene = loaded_scene
		transition_manager.start_showing_screen()
	else:
		#we skipped the transition let's just show again...
		printerr("scene_list does not contain: ", next_scene_target)
		transition_manager.start_showing_screen()

func go_to_scene(new_scene_name : String):
	if scene_list.has(new_scene_name):
		next_scene_target = new_scene_name
		transition_manager.start_hiding_screen()
	pass
