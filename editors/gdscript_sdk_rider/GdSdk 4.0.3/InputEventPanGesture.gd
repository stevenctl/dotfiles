extends InputEventGesture
#brief [InputEvent] that represents a panning touch gesture.
#desc Pan gesture is performed when the user swipes the touch screen with two fingers. It's typically used for panning/scrolling.
class_name InputEventPanGesture


#desc Panning amount since last pan event.
var delta: Vector2:
	get = get_delta, set = set_delta




func get_delta() -> Vector2:
	return delta

func set_delta(value: Vector2) -> void:
	delta = value

