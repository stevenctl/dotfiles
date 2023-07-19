extends VisualShaderNodeVectorBase
#brief A vector operator to be used within the visual shader graph.
#desc A visual shader node for use of vector operators. Operates on vector [code]a[/code] and vector [code]b[/code].
class_name VisualShaderNodeVectorOp

#desc Adds two vectors.
#desc Subtracts a vector from a vector.
#desc Multiplies two vectors.
#desc Divides vector by vector.
#desc Returns the remainder of the two vectors.
#desc Returns the value of the first parameter raised to the power of the second, for each component of the vectors.
#desc Returns the greater of two values, for each component of the vectors.
#desc Returns the lesser of two values, for each component of the vectors.
#desc Calculates the cross product of two vectors.
#desc Returns the arc-tangent of the parameters.
#desc Returns the vector that points in the direction of reflection. [code]a[/code] is incident vector and [code]b[/code] is the normal vector.
#desc Vector step operator. Returns [code]0.0[/code] if [code]a[/code] is smaller than [code]b[/code] and [code]1.0[/code] otherwise.
#desc Represents the size of the [enum Operator] enum.

#enum Operator
enum {
    OP_ADD = 0,
    OP_SUB = 1,
    OP_MUL = 2,
    OP_DIV = 3,
    OP_MOD = 4,
    OP_POW = 5,
    OP_MAX = 6,
    OP_MIN = 7,
    OP_CROSS = 8,
    OP_ATAN2 = 9,
    OP_REFLECT = 10,
    OP_STEP = 11,
    OP_ENUM_SIZE = 12,
}
#desc The operator to be used. See [enum Operator] for options.
var operator: int:
	get = get_operator, set = set_operator




func get_operator() -> int:
	return operator

func set_operator(value: int) -> void:
	operator = value

