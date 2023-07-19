extends Range
#brief Base class for GUI sliders.
#desc Base class for GUI sliders.
#desc [b]Note:[/b] The [signal Range.changed] and [signal Range.value_changed] signals are part of the [Range] class which this class inherits from.
class_name Slider

#desc Emitted when dragging stops. If [param value_changed] is true, [member Range.value] is different from the value when you started the dragging.
signal drag_ended(value_changed: bool)
#desc Emitted when dragging is started.
signal drag_started

#desc If [code]true[/code], the slider can be interacted with. If [code]false[/code], the value can be changed only by code.
var editable: bool:
	get = is_editable, set = set_editable

var focus_mode: int:
	get = get_focus_mode, set = set_focus_mode

#desc If [code]true[/code], the value can be changed using the mouse wheel.
var scrollable: bool:
	get = is_scrollable, set = set_scrollable

var step: float:
	get = get_step, set = set_step

#desc Number of ticks displayed on the slider, including border ticks. Ticks are uniformly-distributed value markers.
var tick_count: int:
	get = get_ticks, set = set_ticks

#desc If [code]true[/code], the slider will display ticks for minimum and maximum values.
var ticks_on_borders: bool:
	get = get_ticks_on_borders, set = set_ticks_on_borders




func is_editable() -> bool:
	return editable

func set_editable(value: bool) -> void:
	editable = value

func get_focus_mode() -> int:
	return focus_mode

func set_focus_mode(value: int) -> void:
	focus_mode = value

func is_scrollable() -> bool:
	return scrollable

func set_scrollable(value: bool) -> void:
	scrollable = value

func get_step() -> float:
	return step

func set_step(value: float) -> void:
	step = value

func get_ticks() -> int:
	return tick_count

func set_ticks(value: int) -> void:
	tick_count = value

func get_ticks_on_borders() -> bool:
	return ticks_on_borders

func set_ticks_on_borders(value: bool) -> void:
	ticks_on_borders = value

