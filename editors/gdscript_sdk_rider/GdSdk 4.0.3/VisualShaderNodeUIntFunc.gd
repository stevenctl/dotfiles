extends VisualShaderNode
#brief An unsigned scalar integer function to be used within the visual shader graph.
#desc Accept an unsigned integer scalar ([code]x[/code]) to the input port and transform it according to [member function].
class_name VisualShaderNodeUIntFunc

#desc Negates the [code]x[/code] using [code]-(x)[/code].
#desc Returns the result of bitwise [code]NOT[/code] operation on the integer. Translates to [code]~a[/code] in the Godot Shader Language.
#desc Represents the size of the [enum Function] enum.

#enum Function
enum {
    FUNC_NEGATE = 0,
    FUNC_BITWISE_NOT = 1,
    FUNC_MAX = 2,
}
#desc A function to be applied to the scalar. See [enum Function] for options.
var function: int:
	get = get_function, set = set_function




func get_function() -> int:
	return function

func set_function(value: int) -> void:
	function = value

