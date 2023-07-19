extends VisualShaderNode
#brief An unsigned integer scalar operator to be used within the visual shader graph.
#desc Applies [member operator] to two unsigned integer inputs: [code]a[/code] and [code]b[/code].
class_name VisualShaderNodeUIntOp

#desc Sums two numbers using [code]a + b[/code].
#desc Subtracts two numbers using [code]a - b[/code].
#desc Multiplies two numbers using [code]a * b[/code].
#desc Divides two numbers using [code]a / b[/code].
#desc Calculates the remainder of two numbers using [code]a % b[/code].
#desc Returns the greater of two numbers. Translates to [code]max(a, b)[/code] in the Godot Shader Language.
#desc Returns the lesser of two numbers. Translates to [code]max(a, b)[/code] in the Godot Shader Language.
#desc Returns the result of bitwise [code]AND[/code] operation on the integer. Translates to [code]a & b[/code] in the Godot Shader Language.
#desc Returns the result of bitwise [code]OR[/code] operation for two integers. Translates to [code]a | b[/code] in the Godot Shader Language.
#desc Returns the result of bitwise [code]XOR[/code] operation for two integers. Translates to [code]a ^ b[/code] in the Godot Shader Language.
#desc Returns the result of bitwise left shift operation on the integer. Translates to [code]a << b[/code] in the Godot Shader Language.
#desc Returns the result of bitwise right shift operation on the integer. Translates to [code]a >> b[/code] in the Godot Shader Language.
#desc Represents the size of the [enum Operator] enum.

#enum Operator
enum {
    OP_ADD = 0,
    OP_SUB = 1,
    OP_MUL = 2,
    OP_DIV = 3,
    OP_MOD = 4,
    OP_MAX = 5,
    OP_MIN = 6,
    OP_BITWISE_AND = 7,
    OP_BITWISE_OR = 8,
    OP_BITWISE_XOR = 9,
    OP_BITWISE_LEFT_SHIFT = 10,
    OP_BITWISE_RIGHT_SHIFT = 11,
    OP_ENUM_SIZE = 12,
}
#desc An operator to be applied to the inputs. See [enum Operator] for options.
var operator: int:
	get = get_operator, set = set_operator




func get_operator() -> int:
	return operator

func set_operator(value: int) -> void:
	operator = value

