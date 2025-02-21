extends Node
class_name Messages

#factory to create a signal
static func make_signal(p_obj, p_signal_name: StringName) -> Signal:
	p_obj.add_user_signal(p_signal_name)
	return Signal(p_obj, p_signal_name)

static var set_scene_as_current: Signal = make_signal(Messages, "set_scene_as_current")
static var go_to_scene: Signal = make_signal(Messages, "go_to_scene")
static var scene_transition_complete: Signal = make_signal(Messages, "scene_transition_complete")


static var audio : AudioMessages = AudioMessages.new()
