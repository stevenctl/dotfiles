extends VisualShaderNode
#brief A scalar integer function to be used within the visual shader graph.
#desc Accept an integer scalar ([code]x[/code]) to the input port and transform it according to [member function].
class_name VisualShaderNodeIntFunc

#desc Returns the absolute value of the parameter. Translates to [code]abs(x)[/code] in the Godot Shader Language.
#desc Negates the [code]x[/code] using [code]-(x)[/code].
#desc Extracts the sign of the parameter. Translates to [code]sign(x)[/code] in the Godot Shader Language.
#desc Returns the result of bitwise [code]NOT[/code] operation on the integer. Translates to [code]~a[/code] in the Godot Shader Language.
#desc Represents the size of the [enum Function] enum.

#enum Function
enum {
    FUNC_ABS = 0,
    FUNC_NEGATE = 1,
    FUNC_SIGN = 2,
    FUNC_BITWISE_NOT = 3,
    FUNC_MAX = 4,
}
#desc A function to be applied to the scalar. See [enum Function] for options.
var function: int:
	get = get_function, set = set_function




func get_function() -> int:
	return function

func set_function(value: int) -> void:
	function = value

