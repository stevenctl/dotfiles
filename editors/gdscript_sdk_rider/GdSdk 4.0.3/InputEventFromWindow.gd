extends InputEvent
#brief Base class for [Viewport]-based input events.
#desc InputEventFromWindow represents events specifically received by windows. This includes mouse events, keyboard events in focused windows or touch screen actions.
class_name InputEventFromWindow


#desc The ID of a [Window] that received this event.
var window_id: int:
	get = get_window_id, set = set_window_id




func get_window_id() -> int:
	return window_id

func set_window_id(value: int) -> void:
	window_id = value

