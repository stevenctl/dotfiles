extends InputEventMouse
#brief Input event type for mouse button events.
#desc Contains mouse click information. See [method Node._input].
#tutorial [Mouse and input coordinates] https://docs.godotengine.org/en/stable/tutorials/inputs/mouse_and_input_coordinates.html
class_name InputEventMouseButton


#desc The mouse button identifier, one of the [enum MouseButton] button or button wheel constants.
var button_index: int:
	get = get_button_index, set = set_button_index

#desc If [code]true[/code], the mouse button's state is a double-click.
var double_click: bool:
	get = is_double_click, set = set_double_click

#desc The amount (or delta) of the event. When used for high-precision scroll events, this indicates the scroll amount (vertical or horizontal). This is only supported on some platforms; the reported sensitivity varies depending on the platform. May be [code]0[/code] if not supported.
var factor: float:
	get = get_factor, set = set_factor

#desc If [code]true[/code], the mouse button's state is pressed. If [code]false[/code], the mouse button's state is released.
var pressed: bool:
	get = is_pressed, set = set_pressed




func get_button_index() -> int:
	return button_index

func set_button_index(value: int) -> void:
	button_index = value

func is_double_click() -> bool:
	return double_click

func set_double_click(value: bool) -> void:
	double_click = value

func get_factor() -> float:
	return factor

func set_factor(value: float) -> void:
	factor = value

func is_pressed() -> bool:
	return pressed

func set_pressed(value: bool) -> void:
	pressed = value

