extends VisualShaderNode
#brief Calculates a SmoothStep function within the visual shader graph.
#desc Translates to [code]smoothstep(edge0, edge1, x)[/code] in the shader language.
#desc Returns [code]0.0[/code] if [code]x[/code] is smaller than [code]edge0[/code] and [code]1.0[/code] if [code]x[/code] is larger than [code]edge1[/code]. Otherwise, the return value is interpolated between [code]0.0[/code] and [code]1.0[/code] using Hermite polynomials.
class_name VisualShaderNodeSmoothStep

#desc A floating-point scalar type.
#desc A 2D vector type.
#desc The [code]x[/code] port uses a 2D vector type. The first two ports use a floating-point scalar type.
#desc A 3D vector type.
#desc The [code]x[/code] port uses a 3D vector type. The first two ports use a floating-point scalar type.
#desc A 4D vector type.
#desc The [code]a[/code] and [code]b[/code] ports use a 4D vector type. The [code]weight[/code] port uses a scalar type.
#desc Represents the size of the [enum OpType] enum.

#enum OpType
enum {
    OP_TYPE_SCALAR = 0,
    OP_TYPE_VECTOR_2D = 1,
    OP_TYPE_VECTOR_2D_SCALAR = 2,
    OP_TYPE_VECTOR_3D = 3,
    OP_TYPE_VECTOR_3D_SCALAR = 4,
    OP_TYPE_VECTOR_4D = 5,
    OP_TYPE_VECTOR_4D_SCALAR = 6,
    OP_TYPE_MAX = 7,
}
#desc A type of operands and returned value.
var op_type: int:
	get = get_op_type, set = set_op_type




func get_op_type() -> int:
	return op_type

func set_op_type(value: int) -> void:
	op_type = value

