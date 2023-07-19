extends StyleBox
#brief [StyleBox] that displays a single line.
#desc [StyleBox] that displays a single line of a given color and thickness. It can be used to draw things like separators.
class_name StyleBoxLine


#desc The line's color.
var color: Color:
	get = get_color, set = set_color

#desc The number of pixels the line will extend before the [StyleBoxLine]'s bounds. If set to a negative value, the line will begin inside the [StyleBoxLine]'s bounds.
var grow_begin: float:
	get = get_grow_begin, set = set_grow_begin

#desc The number of pixels the line will extend past the [StyleBoxLine]'s bounds. If set to a negative value, the line will end inside the [StyleBoxLine]'s bounds.
var grow_end: float:
	get = get_grow_end, set = set_grow_end

#desc The line's thickness in pixels.
var thickness: int:
	get = get_thickness, set = set_thickness

#desc If [code]true[/code], the line will be vertical. If [code]false[/code], the line will be horizontal.
var vertical: bool:
	get = is_vertical, set = set_vertical




func get_color() -> Color:
	return color

func set_color(value: Color) -> void:
	color = value

func get_grow_begin() -> float:
	return grow_begin

func set_grow_begin(value: float) -> void:
	grow_begin = value

func get_grow_end() -> float:
	return grow_end

func set_grow_end(value: float) -> void:
	grow_end = value

func get_thickness() -> int:
	return thickness

func set_thickness(value: int) -> void:
	thickness = value

func is_vertical() -> bool:
	return vertical

func set_vertical(value: bool) -> void:
	vertical = value

