extends VisualShaderNode
#brief Multiplies a [Transform3D] and a [Vector3] within the visual shader graph.
#desc A multiplication operation on a transform (4x4 matrix) and a vector, with support for different multiplication operators.
class_name VisualShaderNodeTransformVecMult

#desc Multiplies transform [code]a[/code] by the vector [code]b[/code].
#desc Multiplies vector [code]b[/code] by the transform [code]a[/code].
#desc Multiplies transform [code]a[/code] by the vector [code]b[/code], skipping the last row and column of the transform.
#desc Multiplies vector [code]b[/code] by the transform [code]a[/code], skipping the last row and column of the transform.
#desc Represents the size of the [enum Operator] enum.

#enum Operator
enum {
    OP_AxB = 0,
    OP_BxA = 1,
    OP_3x3_AxB = 2,
    OP_3x3_BxA = 3,
    OP_MAX = 4,
}
#desc The multiplication type to be performed. See [enum Operator] for options.
var operator: int:
	get = get_operator, set = set_operator




func get_operator() -> int:
	return operator

func set_operator(value: int) -> void:
	operator = value

