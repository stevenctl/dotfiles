extends Slider
#brief Vertical slider.
#desc Vertical slider. See [Slider]. This one goes from bottom (min) to top (max).
#desc [b]Note:[/b] The [signal Range.changed] and [signal Range.value_changed] signals are part of the [Range] class which this class inherits from.
class_name VSlider


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

