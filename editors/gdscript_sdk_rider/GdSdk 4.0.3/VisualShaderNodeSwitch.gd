extends VisualShaderNode
#brief A selector function for use within the visual shader graph.
#desc Returns an associated value of the [code]op_type[/code] type if the provided boolean value is [code]true[/code] or [code]false[/code].
class_name VisualShaderNodeSwitch

#desc A floating-point scalar.
#desc An integer scalar.
#desc An unsigned integer scalar.
#desc A 2D vector type.
#desc A 3D vector type.
#desc A 4D vector type.
#desc A boolean type.
#desc A transform type.
#desc Represents the size of the [enum OpType] enum.

#enum OpType
enum {
    OP_TYPE_FLOAT = 0,
    OP_TYPE_INT = 1,
    OP_TYPE_UINT = 2,
    OP_TYPE_VECTOR_2D = 3,
    OP_TYPE_VECTOR_3D = 4,
    OP_TYPE_VECTOR_4D = 5,
    OP_TYPE_BOOLEAN = 6,
    OP_TYPE_TRANSFORM = 7,
    OP_TYPE_MAX = 8,
}
#desc A type of operands and returned value.
var op_type: int:
	get = get_op_type, set = set_op_type




func get_op_type() -> int:
	return op_type

func set_op_type(value: int) -> void:
	op_type = value

