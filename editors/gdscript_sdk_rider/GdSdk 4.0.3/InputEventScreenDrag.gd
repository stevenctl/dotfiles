extends InputEventFromWindow
#brief Input event type for screen drag events. Only available on mobile devices.
#desc Contains screen drag information. See [method Node._input].
#tutorial [InputEvent] https://docs.godotengine.org/en/stable/tutorials/inputs/inputevent.html
class_name InputEventScreenDrag


#desc The drag event index in the case of a multi-drag event.
var index: int:
	get = get_index, set = set_index

#desc Returns [code]true[/code] when using the eraser end of a stylus pen.
var pen_inverted: bool:
	get = get_pen_inverted, set = set_pen_inverted

#desc The drag position.
var position: Vector2:
	get = get_position, set = set_position

#desc Represents the pressure the user puts on the pen. Ranges from [code]0.0[/code] to [code]1.0[/code].
var pressure: float:
	get = get_pressure, set = set_pressure

#desc The drag position relative to the previous position (position at the last frame).
var relative: Vector2:
	get = get_relative, set = set_relative

#desc Represents the angles of tilt of the pen. Positive X-coordinate value indicates a tilt to the right. Positive Y-coordinate value indicates a tilt toward the user. Ranges from [code]-1.0[/code] to [code]1.0[/code] for both axes.
var tilt: Vector2:
	get = get_tilt, set = set_tilt

#desc The drag velocity.
var velocity: Vector2:
	get = get_velocity, set = set_velocity




func get_index() -> int:
	return index

func set_index(value: int) -> void:
	index = value

func get_pen_inverted() -> bool:
	return pen_inverted

func set_pen_inverted(value: bool) -> void:
	pen_inverted = value

func get_position() -> Vector2:
	return position

func set_position(value: Vector2) -> void:
	position = value

func get_pressure() -> float:
	return pressure

func set_pressure(value: float) -> void:
	pressure = value

func get_relative() -> Vector2:
	return relative

func set_relative(value: Vector2) -> void:
	relative = value

func get_tilt() -> Vector2:
	return tilt

func set_tilt(value: Vector2) -> void:
	tilt = value

func get_velocity() -> Vector2:
	return velocity

func set_velocity(value: Vector2) -> void:
	velocity = value

