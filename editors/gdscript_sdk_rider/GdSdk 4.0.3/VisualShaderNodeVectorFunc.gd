extends VisualShaderNodeVectorBase
#brief A vector function to be used within the visual shader graph.
#desc A visual shader node able to perform different functions using vectors.
class_name VisualShaderNodeVectorFunc

#desc Normalizes the vector so that it has a length of [code]1[/code] but points in the same direction.
#desc Clamps the value between [code]0.0[/code] and [code]1.0[/code].
#desc Returns the opposite value of the parameter.
#desc Returns [code]1/vector[/code].
#desc Returns the absolute value of the parameter.
#desc Returns the arc-cosine of the parameter.
#desc Returns the inverse hyperbolic cosine of the parameter.
#desc Returns the arc-sine of the parameter.
#desc Returns the inverse hyperbolic sine of the parameter.
#desc Returns the arc-tangent of the parameter.
#desc Returns the inverse hyperbolic tangent of the parameter.
#desc Finds the nearest integer that is greater than or equal to the parameter.
#desc Returns the cosine of the parameter.
#desc Returns the hyperbolic cosine of the parameter.
#desc Converts a quantity in radians to degrees.
#desc Base-e Exponential.
#desc Base-2 Exponential.
#desc Finds the nearest integer less than or equal to the parameter.
#desc Computes the fractional part of the argument.
#desc Returns the inverse of the square root of the parameter.
#desc Natural logarithm.
#desc Base-2 logarithm.
#desc Converts a quantity in degrees to radians.
#desc Finds the nearest integer to the parameter.
#desc Finds the nearest even integer to the parameter.
#desc Extracts the sign of the parameter, i.e. returns [code]-1[/code] if the parameter is negative, [code]1[/code] if it's positive and [code]0[/code] otherwise.
#desc Returns the sine of the parameter.
#desc Returns the hyperbolic sine of the parameter.
#desc Returns the square root of the parameter.
#desc Returns the tangent of the parameter.
#desc Returns the hyperbolic tangent of the parameter.
#desc Returns a value equal to the nearest integer to the parameter whose absolute value is not larger than the absolute value of the parameter.
#desc Returns [code]1.0 - vector[/code].
#desc Represents the size of the [enum Function] enum.

#enum Function
enum {
    FUNC_NORMALIZE = 0,
    FUNC_SATURATE = 1,
    FUNC_NEGATE = 2,
    FUNC_RECIPROCAL = 3,
    FUNC_ABS = 4,
    FUNC_ACOS = 5,
    FUNC_ACOSH = 6,
    FUNC_ASIN = 7,
    FUNC_ASINH = 8,
    FUNC_ATAN = 9,
    FUNC_ATANH = 10,
    FUNC_CEIL = 11,
    FUNC_COS = 12,
    FUNC_COSH = 13,
    FUNC_DEGREES = 14,
    FUNC_EXP = 15,
    FUNC_EXP2 = 16,
    FUNC_FLOOR = 17,
    FUNC_FRACT = 18,
    FUNC_INVERSE_SQRT = 19,
    FUNC_LOG = 20,
    FUNC_LOG2 = 21,
    FUNC_RADIANS = 22,
    FUNC_ROUND = 23,
    FUNC_ROUNDEVEN = 24,
    FUNC_SIGN = 25,
    FUNC_SIN = 26,
    FUNC_SINH = 27,
    FUNC_SQRT = 28,
    FUNC_TAN = 29,
    FUNC_TANH = 30,
    FUNC_TRUNC = 31,
    FUNC_ONEMINUS = 32,
    FUNC_MAX = 33,
}
#desc The function to be performed. See [enum Function] for options.
var function: int:
	get = get_function, set = set_function




func get_function() -> int:
	return function

func set_function(value: int) -> void:
	function = value

