extends InputEventFromWindow
#brief Base class for keys events with modifiers.
#desc Contains keys events information with modifiers support like [kbd]Shift[/kbd] or [kbd]Alt[/kbd]. See [method Node._input].
#tutorial [InputEvent] https://docs.godotengine.org/en/stable/tutorials/inputs/inputevent.html
class_name InputEventWithModifiers


#desc State of the [kbd]Alt[/kbd] modifier.
var alt_pressed: bool:
	get = is_alt_pressed, set = set_alt_pressed

#desc Automatically use [kbd]Meta[/kbd] ([kbd]Command[/kbd]) on macOS and [kbd]Ctrl[/kbd] on other platforms. If [code]true[/code], [member ctrl_pressed] and [member meta_pressed] cannot be set.
var command_or_control_autoremap: bool:
	get = is_command_or_control_autoremap, set = set_command_or_control_autoremap

#desc State of the [kbd]Ctrl[/kbd] modifier.
var ctrl_pressed: bool:
	get = is_ctrl_pressed, set = set_ctrl_pressed

#desc State of the [kbd]Meta[/kbd] modifier. On Windows and Linux, this represents the Windows key (sometimes called "meta" or "super" on Linux). On macOS, this represents the Command key.
var meta_pressed: bool:
	get = is_meta_pressed, set = set_meta_pressed

#desc State of the [kbd]Shift[/kbd] modifier.
var shift_pressed: bool:
	get = is_shift_pressed, set = set_shift_pressed



#desc Returns the keycode combination of modifier keys.
func get_modifiers_mask() -> int:
	pass;

#desc On macOS, returns [code]true[/code] if [kbd]Meta[/kbd] ([kbd]Command[/kbd]) is pressed.
#desc On other platforms, returns [code]true[/code] if [kbd]Ctrl[/kbd] is pressed.
func is_command_or_control_pressed() -> bool:
	pass;


func is_alt_pressed() -> bool:
	return alt_pressed

func set_alt_pressed(value: bool) -> void:
	alt_pressed = value

func is_command_or_control_autoremap() -> bool:
	return command_or_control_autoremap

func set_command_or_control_autoremap(value: bool) -> void:
	command_or_control_autoremap = value

func is_ctrl_pressed() -> bool:
	return ctrl_pressed

func set_ctrl_pressed(value: bool) -> void:
	ctrl_pressed = value

func is_meta_pressed() -> bool:
	return meta_pressed

func set_meta_pressed(value: bool) -> void:
	meta_pressed = value

func is_shift_pressed() -> bool:
	return shift_pressed

func set_shift_pressed(value: bool) -> void:
	shift_pressed = value

