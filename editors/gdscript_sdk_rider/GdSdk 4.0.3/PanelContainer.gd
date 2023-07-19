extends Container
#brief Panel container type.
#desc Panel container type. This container fits controls inside of the delimited area of a stylebox. It's useful for giving controls an outline.
#tutorial [GUI containers] https://docs.godotengine.org/en/stable/tutorials/ui/gui_containers.html
#tutorial [2D Role Playing Game Demo] https://godotengine.org/asset-library/asset/520
class_name PanelContainer


var mouse_filter: int:
	get = get_mouse_filter, set = set_mouse_filter




func get_mouse_filter() -> int:
	return mouse_filter

func set_mouse_filter(value: int) -> void:
	mouse_filter = value

