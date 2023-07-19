extends VisualShaderNodeParameter
#brief A visual shader node for shader parameter (uniform) of type [int].
#desc A [VisualShaderNodeParameter] of type [int]. Offers additional customization for range of accepted values.
class_name VisualShaderNodeIntParameter

#desc The parameter will not constrain its value.
#desc The parameter's value must be within the specified [member min]/[member max] range.
#desc The parameter's value must be within the specified range, with the given [member step] between values.
#desc Represents the size of the [enum Hint] enum.

#enum Hint
enum {
    HINT_NONE = 0,
    HINT_RANGE = 1,
    HINT_RANGE_STEP = 2,
    HINT_MAX = 3,
}
#desc Default value of this parameter, which will be used if not set externally. [member default_value_enabled] must be enabled; defaults to [code]0[/code] otherwise.
var default_value: int:
	get = get_default_value, set = set_default_value

#desc If [code]true[/code], the node will have a custom default value.
var default_value_enabled: bool:
	get = is_default_value_enabled, set = set_default_value_enabled

#desc Range hint of this node. Use it to customize valid parameter range.
var hint: int:
	get = get_hint, set = set_hint

#desc The maximum value this parameter can take. [member hint] must be either [constant HINT_RANGE] or [constant HINT_RANGE_STEP] for this to take effect.
var max: int:
	get = get_max, set = set_max

#desc The minimum value this parameter can take. [member hint] must be either [constant HINT_RANGE] or [constant HINT_RANGE_STEP] for this to take effect.
var min: int:
	get = get_min, set = set_min

#desc The step between parameter's values. Forces the parameter to be a multiple of the given value. [member hint] must be [constant HINT_RANGE_STEP] for this to take effect.
var step: int:
	get = get_step, set = set_step




func get_default_value() -> int:
	return default_value

func set_default_value(value: int) -> void:
	default_value = value

func is_default_value_enabled() -> bool:
	return default_value_enabled

func set_default_value_enabled(value: bool) -> void:
	default_value_enabled = value

func get_hint() -> int:
	return hint

func set_hint(value: int) -> void:
	hint = value

func get_max() -> int:
	return max

func set_max(value: int) -> void:
	max = value

func get_min() -> int:
	return min

func set_min(value: int) -> void:
	min = value

func get_step() -> int:
	return step

func set_step(value: int) -> void:
	step = value

