extends VisualShaderNode
#brief A comparison function for common types within the visual shader graph.
#desc Compares [code]a[/code] and [code]b[/code] of [member type] by [member function]. Returns a boolean scalar. Translates to [code]if[/code] instruction in shader code.
class_name VisualShaderNodeCompare

#desc A floating-point scalar.
#desc An integer scalar.
#desc An unsigned integer scalar.
#desc A 2D vector type.
#desc A 3D vector type.
#desc A 4D vector type.
#desc A boolean type.
#desc A transform ([code]mat4[/code]) type.
#desc Represents the size of the [enum ComparisonType] enum.
#desc Comparison for equality ([code]a == b[/code]).
#desc Comparison for inequality ([code]a != b[/code]).
#desc Comparison for greater than ([code]a > b[/code]). Cannot be used if [member type] set to [constant CTYPE_BOOLEAN] or [constant CTYPE_TRANSFORM].
#desc Comparison for greater than or equal ([code]a >= b[/code]). Cannot be used if [member type] set to [constant CTYPE_BOOLEAN] or [constant CTYPE_TRANSFORM].
#desc Comparison for less than ([code]a < b[/code]). Cannot be used if [member type] set to [constant CTYPE_BOOLEAN] or [constant CTYPE_TRANSFORM].
#desc Comparison for less than or equal ([code]a <= b[/code]). Cannot be used if [member type] set to [constant CTYPE_BOOLEAN] or [constant CTYPE_TRANSFORM].
#desc Represents the size of the [enum Function] enum.
#desc The result will be true if all of component in vector satisfy the comparison condition.
#desc The result will be true if any of component in vector satisfy the comparison condition.
#desc Represents the size of the [enum Condition] enum.

#enum ComparisonType
enum {
    CTYPE_SCALAR = 0,
    CTYPE_SCALAR_INT = 1,
    CTYPE_SCALAR_UINT = 2,
    CTYPE_VECTOR_2D = 3,
    CTYPE_VECTOR_3D = 4,
    CTYPE_VECTOR_4D = 5,
    CTYPE_BOOLEAN = 6,
    CTYPE_TRANSFORM = 7,
    CTYPE_MAX = 8,
}
#enum Function
enum {
    FUNC_EQUAL = 0,
    FUNC_NOT_EQUAL = 1,
    FUNC_GREATER_THAN = 2,
    FUNC_GREATER_THAN_EQUAL = 3,
    FUNC_LESS_THAN = 4,
    FUNC_LESS_THAN_EQUAL = 5,
    FUNC_MAX = 6,
}
#enum Condition
enum {
    COND_ALL = 0,
    COND_ANY = 1,
    COND_MAX = 2,
}
#desc Extra condition which is applied if [member type] is set to [constant CTYPE_VECTOR_3D].
var condition: int:
	get = get_condition, set = set_condition

#desc A comparison function. See [enum Function] for options.
var function: int:
	get = get_function, set = set_function

#desc The type to be used in the comparison. See [enum ComparisonType] for options.
var type: int:
	get = get_comparison_type, set = set_comparison_type




func get_condition() -> int:
	return condition

func set_condition(value: int) -> void:
	condition = value

func get_function() -> int:
	return function

func set_function(value: int) -> void:
	function = value

func get_comparison_type() -> int:
	return type

func set_comparison_type(value: int) -> void:
	type = value

