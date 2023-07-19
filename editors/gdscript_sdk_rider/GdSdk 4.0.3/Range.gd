extends Control
#brief Abstract base class for range-based controls.
#desc Range is a base class for [Control] nodes that change a floating-point [member value] between a [member min_value] and [member max_value], using a configured [member step] and [member page] size. See e.g. [ScrollBar] and [Slider] for examples of higher level nodes using Range.
class_name Range

#desc Emitted when [member min_value], [member max_value], [member page], or [member step] change.
signal changed
#desc Emitted when [member value] changes. When used on a [Slider], this is called continuously while dragging (potentially every frame). If you are performing an expensive operation in a function connected to [signal value_changed], consider using a [i]debouncing[/i] [Timer] to call the function less often.
#desc [b]Note:[/b] Unlike signals such as [signal LineEdit.text_changed], [signal value_changed] is also emitted when [param value] is set directly via code.
signal value_changed(value: float)

#desc If [code]true[/code], [member value] may be greater than [member max_value].
var allow_greater: bool:
	get = is_greater_allowed, set = set_allow_greater

#desc If [code]true[/code], [member value] may be less than [member min_value].
var allow_lesser: bool:
	get = is_lesser_allowed, set = set_allow_lesser

#desc If [code]true[/code], and [code]min_value[/code] is greater than 0, [code]value[/code] will be represented exponentially rather than linearly.
var exp_edit: bool:
	get = is_ratio_exp, set = set_exp_ratio

#desc Maximum value. Range is clamped if [code]value[/code] is greater than [code]max_value[/code].
var max_value: float:
	get = get_max, set = set_max

#desc Minimum value. Range is clamped if [code]value[/code] is less than [code]min_value[/code].
var min_value: float:
	get = get_min, set = set_min

#desc Page size. Used mainly for [ScrollBar]. ScrollBar's length is its size multiplied by [code]page[/code] over the difference between [code]min_value[/code] and [code]max_value[/code].
var page: float:
	get = get_page, set = set_page

#desc The value mapped between 0 and 1.
var ratio: float:
	get = get_as_ratio, set = set_as_ratio

#desc If [code]true[/code], [code]value[/code] will always be rounded to the nearest integer.
var rounded: bool:
	get = is_using_rounded_values, set = set_use_rounded_values

var size_flags_vertical: int:
	get = get_v_size_flags, set = set_v_size_flags

#desc If greater than 0, [code]value[/code] will always be rounded to a multiple of [code]step[/code]. If [code]rounded[/code] is also [code]true[/code], [code]value[/code] will first be rounded to a multiple of [code]step[/code] then rounded to the nearest integer.
var step: float:
	get = get_step, set = set_step

#desc Range's current value. Changing this property (even via code) will trigger [signal value_changed] signal. Use [method set_value_no_signal] if you want to avoid it.
var value: float:
	get = get_value, set = set_value



#desc Called when the [Range]'s value is changed (following the same conditions as [signal value_changed]).
func _value_changed(new_value: float) -> void:
	pass;

#desc Sets the [Range]'s current value to the specified [param value], without emitting the [signal value_changed] signal.
func set_value_no_signal(value: float) -> void:
	pass;

#desc Binds two [Range]s together along with any ranges previously grouped with either of them. When any of range's member variables change, it will share the new value with all other ranges in its group.
func share(with: Node) -> void:
	pass;

#desc Stops the [Range] from sharing its member variables with any other.
func unshare() -> void:
	pass;


func is_greater_allowed() -> bool:
	return allow_greater

func set_allow_greater(value: bool) -> void:
	allow_greater = value

func is_lesser_allowed() -> bool:
	return allow_lesser

func set_allow_lesser(value: bool) -> void:
	allow_lesser = value

func is_ratio_exp() -> bool:
	return exp_edit

func set_exp_ratio(value: bool) -> void:
	exp_edit = value

func get_max() -> float:
	return max_value

func set_max(value: float) -> void:
	max_value = value

func get_min() -> float:
	return min_value

func set_min(value: float) -> void:
	min_value = value

func get_page() -> float:
	return page

func set_page(value: float) -> void:
	page = value

func get_as_ratio() -> float:
	return ratio

func set_as_ratio(value: float) -> void:
	ratio = value

func is_using_rounded_values() -> bool:
	return rounded

func set_use_rounded_values(value: bool) -> void:
	rounded = value

func get_v_size_flags() -> int:
	return size_flags_vertical

func set_v_size_flags(value: int) -> void:
	size_flags_vertical = value

func get_step() -> float:
	return step

func set_step(value: float) -> void:
	step = value

func get_value() -> float:
	return value

func set_value(value: float) -> void:
	value = value

