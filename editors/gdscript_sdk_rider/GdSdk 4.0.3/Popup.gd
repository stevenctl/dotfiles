extends Window
#brief Popup is a base window container for popup-like subwindows.
#desc Popup is a base window container for popup-like subwindows. It's a modal by default (see [member Window.popup_window]) and has helpers for custom popup behavior.
class_name Popup

#desc Emitted when the popup is hidden.
signal popup_hide

var borderless: bool:
	get = get_flag, set = set_flag

var popup_window: bool:
	get = get_flag, set = set_flag

var transient: bool:
	get = is_transient, set = set_transient

var unresizable: bool:
	get = get_flag, set = set_flag

var visible: bool:
	get = is_visible, set = set_visible

var wrap_controls: bool:
	get = is_wrapping_controls, set = set_wrap_controls




func get_flag() -> bool:
	return borderless

func set_flag(value: bool) -> void:
	borderless = value

func get_flag() -> bool:
	return popup_window

func set_flag(value: bool) -> void:
	popup_window = value

func is_transient() -> bool:
	return transient

func set_transient(value: bool) -> void:
	transient = value

func get_flag() -> bool:
	return unresizable

func set_flag(value: bool) -> void:
	unresizable = value

func is_visible() -> bool:
	return visible

func set_visible(value: bool) -> void:
	visible = value

func is_wrapping_controls() -> bool:
	return wrap_controls

func set_wrap_controls(value: bool) -> void:
	wrap_controls = value

