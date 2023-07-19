extends VisualShaderNode
#brief A base type for the nodes that perform vector operations within the visual shader graph.
#desc This is an abstract class. See the derived types for descriptions of the possible operations.
class_name VisualShaderNodeVectorBase

#desc A 2D vector type.
#desc A 3D vector type.
#desc A 4D vector type.
#desc Represents the size of the [enum OpType] enum.

#enum OpType
enum {
    OP_TYPE_VECTOR_2D = 0,
    OP_TYPE_VECTOR_3D = 1,
    OP_TYPE_VECTOR_4D = 2,
    OP_TYPE_MAX = 3,
}
#desc A vector type that this operation is performed on.
var op_type: int:
	get = get_op_type, set = set_op_type




func get_op_type() -> int:
	return op_type

func set_op_type(value: int) -> void:
	op_type = value

