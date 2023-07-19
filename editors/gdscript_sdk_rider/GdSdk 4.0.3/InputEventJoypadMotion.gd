extends InputEvent
#brief Input event type for gamepad joysticks and other motions. For buttons, see [code]InputEventJoypadButton[/code].
#desc Stores information about joystick motions. One [InputEventJoypadMotion] represents one axis at a time.
#tutorial [InputEvent] https://docs.godotengine.org/en/stable/tutorials/inputs/inputevent.html
class_name InputEventJoypadMotion


#desc Axis identifier. Use one of the [enum JoyAxis] axis constants.
var axis: int:
	get = get_axis, set = set_axis

#desc Current position of the joystick on the given axis. The value ranges from [code]-1.0[/code] to [code]1.0[/code]. A value of [code]0[/code] means the axis is in its resting position.
var axis_value: float:
	get = get_axis_value, set = set_axis_value




func get_axis() -> int:
	return axis

func set_axis(value: int) -> void:
	axis = value

func get_axis_value() -> float:
	return axis_value

func set_axis_value(value: float) -> void:
	axis_value = value

