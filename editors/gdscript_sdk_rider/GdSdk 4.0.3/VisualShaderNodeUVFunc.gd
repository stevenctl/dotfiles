extends VisualShaderNode
#brief Contains functions to modify texture coordinates ([code]uv[/code]) to be used within the visual shader graph.
#desc UV functions are similar to [Vector2] functions, but the input port of this node uses the shader's UV value by default.
class_name VisualShaderNodeUVFunc

#desc Translates [code]uv[/code] by using [code]scale[/code] and [code]offset[/code] values using the following formula: [code]uv = uv + offset * scale[/code]. [code]uv[/code] port is connected to [code]UV[/code] built-in by default.
#desc Scales [code]uv[/code] by using [code]scale[/code] and [code]pivot[/code] values using the following formula: [code]uv = (uv - pivot) * scale + pivot[/code]. [code]uv[/code] port is connected to [code]UV[/code] built-in by default.
#desc Represents the size of the [enum Function] enum.

#enum Function
enum {
    FUNC_PANNING = 0,
    FUNC_SCALING = 1,
    FUNC_MAX = 2,
}
#desc A function to be applied to the texture coordinates. See [enum Function] for options.
var function: int:
	get = get_function, set = set_function




func get_function() -> int:
	return function

func set_function(value: int) -> void:
	function = value

