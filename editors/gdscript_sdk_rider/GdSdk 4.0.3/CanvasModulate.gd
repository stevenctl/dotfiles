extends Node2D
#brief Tint the entire canvas.
#desc [CanvasModulate] tints the canvas elements using its assigned [member color].
class_name CanvasModulate


#desc The tint color to apply.
var color: Color:
	get = get_color, set = set_color




func get_color() -> Color:
	return color

func set_color(value: Color) -> void:
	color = value

