extends Container
#brief Keeps children controls centered.
#desc CenterContainer keeps children controls centered. This container keeps all children to their minimum size, in the center.
#tutorial [GUI containers] https://docs.godotengine.org/en/stable/tutorials/ui/gui_containers.html
class_name CenterContainer


#desc If [code]true[/code], centers children relative to the [CenterContainer]'s top left corner.
var use_top_left: bool:
	get = is_using_top_left, set = set_use_top_left




func is_using_top_left() -> bool:
	return use_top_left

func set_use_top_left(value: bool) -> void:
	use_top_left = value

