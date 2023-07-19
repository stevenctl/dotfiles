extends VisualShaderNodeParameter
#brief A scalar float parameter to be used within the visual shader graph.
#desc Translated to [code]uniform float[/code] in the shader language.
class_name VisualShaderNodeFloatParameter

#desc No hint used.
#desc A range hint for scalar value, which limits possible input values between [member min] and [member max]. Translated to [code]hint_range(min, max)[/code] in shader code.
#desc A range hint for scalar value with step, which limits possible input values between [member min] and [member max], with a step (increment) of [member step]). Translated to [code]hint_range(min, max, step)[/code] in shader code.
#desc Represents the size of the [enum Hint] enum.

#enum Hint
enum {
    HINT_NONE = 0,
    HINT_RANGE = 1,
    HINT_RANGE_STEP = 2,
    HINT_MAX = 3,
}
#desc A default value to be assigned within the shader.
var default_value: float:
	get = get_default_value, set = set_default_value

#desc Enables usage of the [member default_value].
var default_value_enabled: bool:
	get = is_default_value_enabled, set = set_default_value_enabled

#desc A hint applied to the uniform, which controls the values it can take when set through the Inspector.
var hint: int:
	get = get_hint, set = set_hint

#desc Minimum value for range hints. Used if [member hint] is set to [constant HINT_RANGE] or [constant HINT_RANGE_STEP].
var max: float:
	get = get_max, set = set_max

#desc Maximum value for range hints. Used if [member hint] is set to [constant HINT_RANGE] or [constant HINT_RANGE_STEP].
var min: float:
	get = get_min, set = set_min

#desc Step (increment) value for the range hint with step. Used if [member hint] is set to [constant HINT_RANGE_STEP].
var step: float:
	get = get_step, set = set_step




func get_default_value() -> float:
	return default_value

func set_default_value(value: float) -> void:
	default_value = value

func is_default_value_enabled() -> bool:
	return default_value_enabled

func set_default_value_enabled(value: bool) -> void:
	default_value_enabled = value

func get_hint() -> int:
	return hint

func set_hint(value: int) -> void:
	hint = value

func get_max() -> float:
	return max

func set_max(value: float) -> void:
	max = value

func get_min() -> float:
	return min

func set_min(value: float) -> void:
	min = value

func get_step() -> float:
	return step

func set_step(value: float) -> void:
	step = value

