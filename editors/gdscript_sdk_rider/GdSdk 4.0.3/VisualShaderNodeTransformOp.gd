extends VisualShaderNode
#brief A [Transform3D] operator to be used within the visual shader graph.
#desc Applies [member operator] to two transform (4x4 matrices) inputs.
class_name VisualShaderNodeTransformOp

#desc Multiplies transform [code]a[/code] by the transform [code]b[/code].
#desc Multiplies transform [code]b[/code] by the transform [code]a[/code].
#desc Performs a component-wise multiplication of transform [code]a[/code] by the transform [code]b[/code].
#desc Performs a component-wise multiplication of transform [code]b[/code] by the transform [code]a[/code].
#desc Adds two transforms.
#desc Subtracts the transform [code]a[/code] from the transform [code]b[/code].
#desc Subtracts the transform [code]b[/code] from the transform [code]a[/code].
#desc Divides the transform [code]a[/code] by the transform [code]b[/code].
#desc Divides the transform [code]b[/code] by the transform [code]a[/code].
#desc Represents the size of the [enum Operator] enum.

#enum Operator
enum {
    OP_AxB = 0,
    OP_BxA = 1,
    OP_AxB_COMP = 2,
    OP_BxA_COMP = 3,
    OP_ADD = 4,
    OP_A_MINUS_B = 5,
    OP_B_MINUS_A = 6,
    OP_A_DIV_B = 7,
    OP_B_DIV_A = 8,
    OP_MAX = 9,
}
#desc The type of the operation to be performed on the transforms. See [enum Operator] for options.
var operator: int:
	get = get_operator, set = set_operator




func get_operator() -> int:
	return operator

func set_operator(value: int) -> void:
	operator = value

