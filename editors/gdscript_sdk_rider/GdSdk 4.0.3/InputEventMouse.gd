extends InputEventWithModifiers
#brief Base input event type for mouse events.
#desc Stores general mouse events information.
#tutorial [InputEvent] https://docs.godotengine.org/en/stable/tutorials/inputs/inputevent.html
class_name InputEventMouse


#desc The mouse button mask identifier, one of or a bitwise combination of the [enum MouseButton] button masks.
var button_mask: int:
	get = get_button_mask, set = set_button_mask

#desc When received in [method Node._input] or [method Node._unhandled_input], returns the mouse's position in the root [Viewport] using the coordinate system of the root [Viewport].
#desc When received in [method Control._gui_input], returns the mouse's position in the [CanvasLayer] that the [Control] is in using the coordinate system of the [CanvasLayer].
var global_position: Vector2:
	get = get_global_position, set = set_global_position

#desc When received in [method Node._input] or [method Node._unhandled_input], returns the mouse's position in the [Viewport] this [Node] is in using the coordinate system of this [Viewport].
#desc When received in [method Control._gui_input], returns the mouse's position in the [Control] using the local coordinate system of the [Control].
var position: Vector2:
	get = get_position, set = set_position




func get_button_mask() -> int:
	return button_mask

func set_button_mask(value: int) -> void:
	button_mask = value

func get_global_position() -> Vector2:
	return global_position

func set_global_position(value: Vector2) -> void:
	global_position = value

func get_position() -> Vector2:
	return position

func set_position(value: Vector2) -> void:
	position = value

