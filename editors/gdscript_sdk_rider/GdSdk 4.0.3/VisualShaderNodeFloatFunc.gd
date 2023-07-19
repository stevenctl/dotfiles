extends VisualShaderNode
#brief A scalar floating-point function to be used within the visual shader graph.
#desc Accept a floating-point scalar ([code]x[/code]) to the input port and transform it according to [member function].
class_name VisualShaderNodeFloatFunc

#desc Returns the sine of the parameter. Translates to [code]sin(x)[/code] in the Godot Shader Language.
#desc Returns the cosine of the parameter. Translates to [code]cos(x)[/code] in the Godot Shader Language.
#desc Returns the tangent of the parameter. Translates to [code]tan(x)[/code] in the Godot Shader Language.
#desc Returns the arc-sine of the parameter. Translates to [code]asin(x)[/code] in the Godot Shader Language.
#desc Returns the arc-cosine of the parameter. Translates to [code]acos(x)[/code] in the Godot Shader Language.
#desc Returns the arc-tangent of the parameter. Translates to [code]atan(x)[/code] in the Godot Shader Language.
#desc Returns the hyperbolic sine of the parameter. Translates to [code]sinh(x)[/code] in the Godot Shader Language.
#desc Returns the hyperbolic cosine of the parameter. Translates to [code]cosh(x)[/code] in the Godot Shader Language.
#desc Returns the hyperbolic tangent of the parameter. Translates to [code]tanh(x)[/code] in the Godot Shader Language.
#desc Returns the natural logarithm of the parameter. Translates to [code]log(x)[/code] in the Godot Shader Language.
#desc Returns the natural exponentiation of the parameter. Translates to [code]exp(x)[/code] in the Godot Shader Language.
#desc Returns the square root of the parameter. Translates to [code]sqrt(x)[/code] in the Godot Shader Language.
#desc Returns the absolute value of the parameter. Translates to [code]abs(x)[/code] in the Godot Shader Language.
#desc Extracts the sign of the parameter. Translates to [code]sign(x)[/code] in the Godot Shader Language.
#desc Finds the nearest integer less than or equal to the parameter. Translates to [code]floor(x)[/code] in the Godot Shader Language.
#desc Finds the nearest integer to the parameter. Translates to [code]round(x)[/code] in the Godot Shader Language.
#desc Finds the nearest integer that is greater than or equal to the parameter. Translates to [code]ceil(x)[/code] in the Godot Shader Language.
#desc Computes the fractional part of the argument. Translates to [code]fract(x)[/code] in the Godot Shader Language.
#desc Clamps the value between [code]0.0[/code] and [code]1.0[/code] using [code]min(max(x, 0.0), 1.0)[/code].
#desc Negates the [code]x[/code] using [code]-(x)[/code].
#desc Returns the arc-hyperbolic-cosine of the parameter. Translates to [code]acosh(x)[/code] in the Godot Shader Language.
#desc Returns the arc-hyperbolic-sine of the parameter. Translates to [code]asinh(x)[/code] in the Godot Shader Language.
#desc Returns the arc-hyperbolic-tangent of the parameter. Translates to [code]atanh(x)[/code] in the Godot Shader Language.
#desc Convert a quantity in radians to degrees. Translates to [code]degrees(x)[/code] in the Godot Shader Language.
#desc Returns 2 raised by the power of the parameter. Translates to [code]exp2(x)[/code] in the Godot Shader Language.
#desc Returns the inverse of the square root of the parameter. Translates to [code]inversesqrt(x)[/code] in the Godot Shader Language.
#desc Returns the base 2 logarithm of the parameter. Translates to [code]log2(x)[/code] in the Godot Shader Language.
#desc Convert a quantity in degrees to radians. Translates to [code]radians(x)[/code] in the Godot Shader Language.
#desc Finds reciprocal value of dividing 1 by [code]x[/code] (i.e. [code]1 / x[/code]).
#desc Finds the nearest even integer to the parameter. Translates to [code]roundEven(x)[/code] in the Godot Shader Language.
#desc Returns a value equal to the nearest integer to [code]x[/code] whose absolute value is not larger than the absolute value of [code]x[/code]. Translates to [code]trunc(x)[/code] in the Godot Shader Language.
#desc Subtracts scalar [code]x[/code] from 1 (i.e. [code]1 - x[/code]).
#desc Represents the size of the [enum Function] enum.

#enum Function
enum {
    FUNC_SIN = 0,
    FUNC_COS = 1,
    FUNC_TAN = 2,
    FUNC_ASIN = 3,
    FUNC_ACOS = 4,
    FUNC_ATAN = 5,
    FUNC_SINH = 6,
    FUNC_COSH = 7,
    FUNC_TANH = 8,
    FUNC_LOG = 9,
    FUNC_EXP = 10,
    FUNC_SQRT = 11,
    FUNC_ABS = 12,
    FUNC_SIGN = 13,
    FUNC_FLOOR = 14,
    FUNC_ROUND = 15,
    FUNC_CEIL = 16,
    FUNC_FRACT = 17,
    FUNC_SATURATE = 18,
    FUNC_NEGATE = 19,
    FUNC_ACOSH = 20,
    FUNC_ASINH = 21,
    FUNC_ATANH = 22,
    FUNC_DEGREES = 23,
    FUNC_EXP2 = 24,
    FUNC_INVERSE_SQRT = 25,
    FUNC_LOG2 = 26,
    FUNC_RADIANS = 27,
    FUNC_RECIPROCAL = 28,
    FUNC_ROUNDEVEN = 29,
    FUNC_TRUNC = 30,
    FUNC_ONEMINUS = 31,
    FUNC_MAX = 32,
}
#desc A function to be applied to the scalar. See [enum Function] for options.
var function: int:
	get = get_function, set = set_function




func get_function() -> int:
	return function

func set_function(value: int) -> void:
	function = value

