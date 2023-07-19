extends Range
#brief Base class for scroll bars.
#desc Scrollbars are a [Range]-based [Control], that display a draggable area (the size of the page). Horizontal ([HScrollBar]) and Vertical ([VScrollBar]) versions are available.
class_name ScrollBar

#desc Emitted when the scrollbar is being scrolled.
signal scrolling

#desc Overrides the step used when clicking increment and decrement buttons or when using arrow keys when the [ScrollBar] is focused.
var custom_step: float:
	get = get_custom_step, set = set_custom_step

var step: float:
	get = get_step, set = set_step




func get_custom_step() -> float:
	return custom_step

func set_custom_step(value: float) -> void:
	custom_step = value

func get_step() -> float:
	return step

func set_step(value: float) -> void:
	step = value

