extends VisualShaderNode
#brief A boolean comparison operator to be used within the visual shader graph.
#desc Returns the boolean result of the comparison between [code]INF[/code] or [code]NaN[/code] and a scalar parameter.
class_name VisualShaderNodeIs

#desc Comparison with [code]INF[/code] (Infinity).
#desc Comparison with [code]NaN[/code] (Not a Number; denotes invalid numeric results, e.g. division by zero).
#desc Represents the size of the [enum Function] enum.

#enum Function
enum {
    FUNC_IS_INF = 0,
    FUNC_IS_NAN = 1,
    FUNC_MAX = 2,
}
#desc The comparison function. See [enum Function] for options.
var function: int:
	get = get_function, set = set_function




func get_function() -> int:
	return function

func set_function(value: int) -> void:
	function = value

