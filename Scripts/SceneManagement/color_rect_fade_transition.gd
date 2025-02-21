extends Transition
class_name ColorRectFadeTransition

@export var color_rect : ColorRect
@export var fade_color : Color
@export var hide_speed : float = 1.0
@export var show_speed : float = 1.0

var progress : float = 0

func _ready():
	color_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fade_color.a = 0
	color_rect.color = fade_color

func hide_scene(delta : float):
	progress += delta * (1/hide_speed)
	fade_color.a = progress
	color_rect.color = fade_color
	print("Hiding Scene: ", progress)
	if progress >= 1.0:
		return true
	return false
	
func show_scene(delta : float):
	progress -= delta * (1/show_speed)
	fade_color.a = progress
	color_rect.color = fade_color
	print("Showing Scene: ", progress)
	if progress <= 0.0:
		return true
	return false
