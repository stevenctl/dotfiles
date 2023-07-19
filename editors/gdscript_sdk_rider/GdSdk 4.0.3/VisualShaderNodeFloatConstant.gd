extends VisualShaderNodeConstant
#brief A scalar floating-point constant to be used within the visual shader graph.
#desc Translated to [code]float[/code] in the shader language.
class_name VisualShaderNodeFloatConstant


#desc A floating-point constant which represents a state of this node.
var constant: float:
	get = get_constant, set = set_constant




func get_constant() -> float:
	return constant

func set_constant(value: float) -> void:
	constant = value

