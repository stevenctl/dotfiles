extends InputEventFromWindow
#brief Input event type for screen touch events.
#brief (only available on mobile devices)
#desc Stores multi-touch press/release information. Supports touch press, touch release and [member index] for multi-touch count and order.
#tutorial [InputEvent] https://docs.godotengine.org/en/stable/tutorials/inputs/inputevent.html
class_name InputEventScreenTouch


#desc If [code]true[/code], the touch's state is a double tap.
var double_tap: bool:
	get = is_double_tap, set = set_double_tap

#desc The touch index in the case of a multi-touch event. One index = one finger.
var index: int:
	get = get_index, set = set_index

#desc The touch position, in screen (global) coordinates.
var position: Vector2:
	get = get_position, set = set_position

#desc If [code]true[/code], the touch's state is pressed. If [code]false[/code], the touch's state is released.
var pressed: bool:
	get = is_pressed, set = set_pressed




func is_double_tap() -> bool:
	return double_tap

func set_double_tap(value: bool) -> void:
	double_tap = value

func get_index() -> int:
	return index

func set_index(value: int) -> void:
	index = value

func get_position() -> Vector2:
	return position

func set_position(value: Vector2) -> void:
	position = value

func is_pressed() -> bool:
	return pressed

func set_pressed(value: bool) -> void:
	pressed = value

