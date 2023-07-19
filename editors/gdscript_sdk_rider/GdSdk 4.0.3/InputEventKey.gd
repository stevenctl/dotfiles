extends InputEventWithModifiers
#brief Input event type for keyboard events.
#desc Stores key presses on the keyboard. Supports key presses, key releases and [member echo] events.
#desc [b]Note:[/b] Events received from the keyboard usually have all properties set. Event mappings should have only one of the [member keycode], [member physical_keycode] or [member unicode] set.
#desc When events are compared, properties are checked in the following priority - [member keycode], [member physical_keycode] and [member unicode], events with the first matching value will be considered equal.
#tutorial [InputEvent] https://docs.godotengine.org/en/stable/tutorials/inputs/inputevent.html
class_name InputEventKey


#desc If [code]true[/code], the key was already pressed before this event. It means the user is holding the key down.
var echo: bool:
	get = is_echo, set = set_echo

#desc Represents the localized label printed on the key in the current keyboard layout, which corresponds to one of the [enum Key] constants or any valid Unicode character.
#desc For keyboard layouts with a single label on the key, it is equivalent to [member keycode].
#desc To get a human-readable representation of the [InputEventKey], use [code]OS.get_keycode_string(event.key_label)[/code] where [code]event[/code] is the [InputEventKey].
#desc [codeblock]
#desc +-----+ +-----+
#desc | Q   | | Q   | - "Q" - keycode
#desc |   Й | |  ض | - "Й" and "ض" - key_label
#desc +-----+ +-----+
#desc [/codeblock]
var key_label: int:
	get = get_key_label, set = set_key_label

#desc Latin label printed on the key in the current keyboard layout, which corresponds to one of the [enum Key] constants.
#desc To get a human-readable representation of the [InputEventKey], use [code]OS.get_keycode_string(event.keycode)[/code] where [code]event[/code] is the [InputEventKey].
#desc [codeblock]
#desc +-----+ +-----+
#desc | Q   | | Q   | - "Q" - keycode
#desc |   Й | |  ض | - "Й" and "ض" - key_label
#desc +-----+ +-----+
#desc [/codeblock]
var keycode: int:
	get = get_keycode, set = set_keycode

#desc Represents the physical location of a key on the 101/102-key US QWERTY keyboard, which corresponds to one of the [enum Key] constants.
#desc To get a human-readable representation of the [InputEventKey], use [code]OS.get_keycode_string(event.keycode)[/code] where [code]event[/code] is the [InputEventKey].
var physical_keycode: int:
	get = get_physical_keycode, set = set_physical_keycode

#desc If [code]true[/code], the key's state is pressed. If [code]false[/code], the key's state is released.
var pressed: bool:
	get = is_pressed, set = set_pressed

#desc The key Unicode character code (when relevant), shifted by modifier keys. Unicode character codes for composite characters and complex scripts may not be available unless IME input mode is active. See [method Window.set_ime_active] for more information.
var unicode: int:
	get = get_unicode, set = set_unicode



#desc Returns a [String] representation of the event's [member key_label] and modifiers.
func as_text_key_label() -> String:
	pass;

#desc Returns a [String] representation of the event's [member keycode] and modifiers.
func as_text_keycode() -> String:
	pass;

#desc Returns a [String] representation of the event's [member physical_keycode] and modifiers.
func as_text_physical_keycode() -> String:
	pass;

#desc Returns the localized key label combined with modifier keys such as [kbd]Shift[/kbd] or [kbd]Alt[/kbd]. See also [InputEventWithModifiers].
#desc To get a human-readable representation of the [InputEventKey] with modifiers, use [code]OS.get_keycode_string(event.get_key_label_with_modifiers())[/code] where [code]event[/code] is the [InputEventKey].
func get_key_label_with_modifiers() -> int:
	pass;

#desc Returns the Latin keycode combined with modifier keys such as [kbd]Shift[/kbd] or [kbd]Alt[/kbd]. See also [InputEventWithModifiers].
#desc To get a human-readable representation of the [InputEventKey] with modifiers, use [code]OS.get_keycode_string(event.get_keycode_with_modifiers())[/code] where [code]event[/code] is the [InputEventKey].
func get_keycode_with_modifiers() -> int:
	pass;

#desc Returns the physical keycode combined with modifier keys such as [kbd]Shift[/kbd] or [kbd]Alt[/kbd]. See also [InputEventWithModifiers].
#desc To get a human-readable representation of the [InputEventKey] with modifiers, use [code]OS.get_keycode_string(event.get_physical_keycode_with_modifiers())[/code] where [code]event[/code] is the [InputEventKey].
func get_physical_keycode_with_modifiers() -> int:
	pass;


func is_echo() -> bool:
	return echo

func set_echo(value: bool) -> void:
	echo = value

func get_key_label() -> int:
	return key_label

func set_key_label(value: int) -> void:
	key_label = value

func get_keycode() -> int:
	return keycode

func set_keycode(value: int) -> void:
	keycode = value

func get_physical_keycode() -> int:
	return physical_keycode

func set_physical_keycode(value: int) -> void:
	physical_keycode = value

func is_pressed() -> bool:
	return pressed

func set_pressed(value: bool) -> void:
	pressed = value

func get_unicode() -> int:
	return unicode

func set_unicode(value: int) -> void:
	unicode = value

