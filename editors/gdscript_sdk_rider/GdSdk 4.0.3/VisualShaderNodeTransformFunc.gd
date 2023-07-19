extends VisualShaderNode
#brief Computes a [Transform3D] function within the visual shader graph.
#desc Computes an inverse or transpose function on the provided [Transform3D].
class_name VisualShaderNodeTransformFunc

#desc Perform the inverse operation on the [Transform3D] matrix.
#desc Perform the transpose operation on the [Transform3D] matrix.
#desc Represents the size of the [enum Function] enum.

#enum Function
enum {
    FUNC_INVERSE = 0,
    FUNC_TRANSPOSE = 1,
    FUNC_MAX = 2,
}
#desc The function to be computed. See [enum Function] for options.
var function: int:
	get = get_function, set = set_function




func get_function() -> int:
	return function

func set_function(value: int) -> void:
	function = value

