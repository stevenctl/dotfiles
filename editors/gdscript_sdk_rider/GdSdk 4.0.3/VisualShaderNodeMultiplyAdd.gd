extends VisualShaderNode
#brief Performs a fused multiply-add operation within the visual shader graph.
#desc Uses three operands to compute [code](a * b + c)[/code] expression.
class_name VisualShaderNodeMultiplyAdd

#desc A floating-point scalar type.
#desc A 2D vector type.
#desc A 3D vector type.
#desc A 4D vector type.
#desc Represents the size of the [enum OpType] enum.

#enum OpType
enum {
    OP_TYPE_SCALAR = 0,
    OP_TYPE_VECTOR_2D = 1,
    OP_TYPE_VECTOR_3D = 2,
    OP_TYPE_VECTOR_4D = 3,
    OP_TYPE_MAX = 4,
}
#desc A type of operands and returned value.
var op_type: int:
	get = get_op_type, set = set_op_type




func get_op_type() -> int:
	return op_type

func set_op_type(value: int) -> void:
	op_type = value

