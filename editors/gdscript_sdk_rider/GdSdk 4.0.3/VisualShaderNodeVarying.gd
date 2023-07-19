extends VisualShaderNode
#brief A visual shader node that represents a "varying" shader value.
#desc Varying values are shader variables that can be passed between shader functions, e.g. from Vertex shader to Fragment shader.
class_name VisualShaderNodeVarying


#desc Name of the variable. Must be unique.
var varying_name: String:
	get = get_varying_name, set = set_varying_name

#desc Type of the variable. Determines where the variable can be accessed.
var varying_type: int:
	get = get_varying_type, set = set_varying_type




func get_varying_name() -> String:
	return varying_name

func set_varying_name(value: String) -> void:
	varying_name = value

func get_varying_type() -> int:
	return varying_type

func set_varying_type(value: int) -> void:
	varying_type = value

