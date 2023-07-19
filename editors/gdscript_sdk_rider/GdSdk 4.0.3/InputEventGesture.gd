extends InputEventWithModifiers
#brief Base class for touch control gestures.
#desc InputEventGesture is sent when a user performs a supported gesture on a touch screen. Gestures can't be emulated using mouse, because they typically require multi-touch.
class_name InputEventGesture


#desc The local gesture position relative to the [Viewport]. If used in [method Control._gui_input], the position is relative to the current [Control] that received this gesture.
var position: Vector2:
	get = get_position, set = set_position




func get_position() -> Vector2:
	return position

func set_position(value: Vector2) -> void:
	position = value

