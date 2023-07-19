extends ScrollBar
#brief Vertical scroll bar.
#desc Vertical version of [ScrollBar], which goes from top (min) to bottom (max).
class_name VScrollBar


var size_flags_horizontal: int:
	get = get_h_size_flags, set = set_h_size_flags

var size_flags_vertical: int:
	get = get_v_size_flags, set = set_v_size_flags




func get_h_size_flags() -> int:
	return size_flags_horizontal

func set_h_size_flags(value: int) -> void:
	size_flags_horizontal = value

func get_v_size_flags() -> int:
	return size_flags_vertical

func set_v_size_flags(value: int) -> void:
	size_flags_vertical = value

