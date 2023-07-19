extends InputEvent
#brief Input event for gamepad buttons.
#desc Input event type for gamepad buttons. For gamepad analog sticks and joysticks, see [InputEventJoypadMotion].
#tutorial [InputEvent] https://docs.godotengine.org/en/stable/tutorials/inputs/inputevent.html
class_name InputEventJoypadButton


#desc Button identifier. One of the [enum JoyButton] button constants.
var button_index: int:
	get = get_button_index, set = set_button_index

#desc If [code]true[/code], the button's state is pressed. If [code]false[/code], the button's state is released.
var pressed: bool:
	get = is_pressed, set = set_pressed

#desc Represents the pressure the user puts on the button with their finger, if the controller supports it. Ranges from [code]0[/code] to [code]1[/code].
var pressure: float:
	get = get_pressure, set = set_pressure




func get_button_index() -> int:
	return button_index

func set_button_index(value: int) -> void:
	button_index = value

func is_pressed() -> bool:
	return pressed

func set_pressed(value: bool) -> void:
	pressed = value

func get_pressure() -> float:
	return pressure

func set_pressure(value: float) -> void:
	pressure = value

