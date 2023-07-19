extends InputEventGesture
#brief [InputEvent] that represents a magnifying touch gesture.
#desc Magnify gesture is performed when the user pinches the touch screen. It's typically used for zooming.
class_name InputEventMagnifyGesture


#desc The amount (or delta) of the event. This value is higher the faster the gesture is performed.
var factor: float:
	get = get_factor, set = set_factor




func get_factor() -> float:
	return factor

func set_factor(value: float) -> void:
	factor = value

