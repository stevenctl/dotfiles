extends RefCounted
#brief Pipeline specialization constant (used by [RenderingDevice]).
#desc A [i]specialization constant[/i] is a way to create additional variants of shaders without actually increasing the number of shader versions that are compiled. This allows improving performance by reducing the number of shader versions and reducing [code]if[/code] branching, while still allowing shaders to be flexible for different use cases.
#desc This object is used by [RenderingDevice].
class_name RDPipelineSpecializationConstant


#desc The identifier of the specialization constant. This is a value starting from [code]0[/code] and that increments for every different specialization constant for a given shader.
var constant_id: int:
	get = get_constant_id, set = set_constant_id

#desc The specialization constant's value. Only [bool], [int] and [float] types are valid for specialization constants.
var value: Variant:
	get = get_value, set = set_value




func get_constant_id() -> int:
	return constant_id

func set_constant_id(value: int) -> void:
	constant_id = value

func get_value() -> Variant:
	return value

func set_value(value: Variant) -> void:
	value = value

