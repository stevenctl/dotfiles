extends VisualShaderNode
#brief Clamps a value within the visual shader graph.
#desc Constrains a value to lie between [code]min[/code] and [code]max[/code] values.
class_name VisualShaderNodeClamp

#desc A floating-point scalar.
#desc An integer scalar.
#desc An unsigned integer scalar.
#desc A 2D vector type.
#desc A 3D vector type.
#desc A 4D vector type.
#desc Represents the size of the [enum OpType] enum.

#enum OpType
enum {
    OP_TYPE_FLOAT = 0,
    OP_TYPE_INT = 1,
    OP_TYPE_UINT = 2,
    OP_TYPE_VECTOR_2D = 3,
    OP_TYPE_VECTOR_3D = 4,
    OP_TYPE_VECTOR_4D = 5,
    OP_TYPE_MAX = 6,
}
#desc A type of operands and returned value.
var op_type: int:
	get = get_op_type, set = set_op_type




func get_op_type() -> int:
	return op_type

func set_op_type(value: int) -> void:
	op_type = value

