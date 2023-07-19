extends Range
#brief Godot editor's control for editing numeric values.
#desc This [Control] node is used in the editor's Inspector dock to allow editing of numeric values. Can be used with [EditorInspectorPlugin] to recreate the same behavior.
class_name EditorSpinSlider

#desc Emitted when the spinner/slider is grabbed.
signal grabbed
#desc Emitted when the spinner/slider is ungrabbed.
signal ungrabbed
#desc Emitted when the value form gains focus.
signal value_focus_entered
#desc Emitted when the value form loses focus.
signal value_focus_exited

#desc If [code]true[/code], the slider will not draw background.
var flat: bool:
	get = is_flat, set = set_flat

var focus_mode: int:
	get = get_focus_mode, set = set_focus_mode

#desc If [code]true[/code], the slider is hidden.
var hide_slider: bool:
	get = is_hiding_slider, set = set_hide_slider

#desc The text that displays to the left of the value.
var label: String:
	get = get_label, set = set_label

#desc If [code]true[/code], the slider can't be interacted with.
var read_only: bool:
	get = is_read_only, set = set_read_only

var size_flags_vertical: int:
	get = get_v_size_flags, set = set_v_size_flags

var step: float:
	get = get_step, set = set_step

#desc The suffix to display after the value (in a faded color). This should generally be a plural word. You may have to use an abbreviation if the suffix is too long to be displayed.
var suffix: String:
	get = get_suffix, set = set_suffix




func is_flat() -> bool:
	return flat

func set_flat(value: bool) -> void:
	flat = value

func get_focus_mode() -> int:
	return focus_mode

func set_focus_mode(value: int) -> void:
	focus_mode = value

func is_hiding_slider() -> bool:
	return hide_slider

func set_hide_slider(value: bool) -> void:
	hide_slider = value

func get_label() -> String:
	return label

func set_label(value: String) -> void:
	label = value

func is_read_only() -> bool:
	return read_only

func set_read_only(value: bool) -> void:
	read_only = value

func get_v_size_flags() -> int:
	return size_flags_vertical

func set_v_size_flags(value: int) -> void:
	size_flags_vertical = value

func get_step() -> float:
	return step

func set_step(value: float) -> void:
	step = value

func get_suffix() -> String:
	return suffix

func set_suffix(value: String) -> void:
	suffix = value

