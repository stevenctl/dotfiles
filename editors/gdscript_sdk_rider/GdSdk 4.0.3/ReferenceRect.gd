extends Control
#brief Reference frame for GUI.
#desc A rectangle box that displays only a [member border_color] border color around its rectangle. [ReferenceRect] has no fill [Color]. If you need to display a rectangle filled with a solid color, consider using [ColorRect] instead.
class_name ReferenceRect


#desc Sets the border [Color] of the [ReferenceRect].
var border_color: Color:
	get = get_border_color, set = set_border_color

#desc Sets the border width of the [ReferenceRect]. The border grows both inwards and outwards with respect to the rectangle box.
var border_width: float:
	get = get_border_width, set = set_border_width

#desc If [code]true[/code], the [ReferenceRect] will only be visible while in editor. Otherwise, [ReferenceRect] will be visible in the running project.
var editor_only: bool:
	get = get_editor_only, set = set_editor_only




func get_border_color() -> Color:
	return border_color

func set_border_color(value: Color) -> void:
	border_color = value

func get_border_width() -> float:
	return border_width

func set_border_width(value: float) -> void:
	border_width = value

func get_editor_only() -> bool:
	return editor_only

func set_editor_only(value: bool) -> void:
	editor_only = value

