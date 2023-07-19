extends VisualShaderNodeConstant
#brief A boolean constant to be used within the visual shader graph.
#desc Has only one output port and no inputs.
#desc Translated to [code]bool[/code] in the shader language.
class_name VisualShaderNodeBooleanConstant


#desc A boolean constant which represents a state of this node.
var constant: bool:
	get = get_constant, set = set_constant




func get_constant() -> bool:
	return constant

func set_constant(value: bool) -> void:
	constant = value

