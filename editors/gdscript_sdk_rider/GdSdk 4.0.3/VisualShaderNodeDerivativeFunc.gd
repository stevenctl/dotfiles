extends VisualShaderNode
#brief Calculates a derivative within the visual shader graph.
#desc This node is only available in [code]Fragment[/code] and [code]Light[/code] visual shaders.
class_name VisualShaderNodeDerivativeFunc

#desc A floating-point scalar.
#desc A 2D vector type.
#desc A 3D vector type.
#desc A 4D vector type.
#desc Represents the size of the [enum OpType] enum.
#desc Sum of absolute derivative in [code]x[/code] and [code]y[/code].
#desc Derivative in [code]x[/code] using local differencing.
#desc Derivative in [code]y[/code] using local differencing.
#desc Represents the size of the [enum Function] enum.
#desc No precision is specified, the GPU driver is allowed to use whatever level of precision it chooses. This is the default option and is equivalent to using [code]dFdx()[/code] or [code]dFdy()[/code] in text shaders.
#desc The derivative will be calculated using the current fragment's neighbors (which may not include the current fragment). This tends to be faster than using [constant PRECISION_FINE], but may not be suitable when more precision is needed. This is equivalent to using [code]dFdxCoarse()[/code] or [code]dFdyCoarse()[/code] in text shaders.
#desc The derivative will be calculated using the current fragment and its immediate neighbors. This tends to be slower than using [constant PRECISION_COARSE], but may be necessary when more precision is needed. This is equivalent to using [code]dFdxFine()[/code] or [code]dFdyFine()[/code] in text shaders.
#desc Represents the size of the [enum Precision] enum.

#enum OpType
enum {
    OP_TYPE_SCALAR = 0,
    OP_TYPE_VECTOR_2D = 1,
    OP_TYPE_VECTOR_3D = 2,
    OP_TYPE_VECTOR_4D = 3,
    OP_TYPE_MAX = 4,
}
#enum Function
enum {
    FUNC_SUM = 0,
    FUNC_X = 1,
    FUNC_Y = 2,
    FUNC_MAX = 3,
}
#enum Precision
enum {
    PRECISION_NONE = 0,
    PRECISION_COARSE = 1,
    PRECISION_FINE = 2,
    PRECISION_MAX = 3,
}
#desc A derivative function type. See [enum Function] for options.
var function: int:
	get = get_function, set = set_function

#desc A type of operands and returned value. See [enum OpType] for options.
var op_type: int:
	get = get_op_type, set = set_op_type

#desc Sets the level of precision to use for the derivative function. See [enum Precision] for options. When using the GL Compatibility renderer, this setting has no effect.
var precision: int:
	get = get_precision, set = set_precision




func get_function() -> int:
	return function

func set_function(value: int) -> void:
	function = value

func get_op_type() -> int:
	return op_type

func set_op_type(value: int) -> void:
	op_type = value

func get_precision() -> int:
	return precision

func set_precision(value: int) -> void:
	precision = value

