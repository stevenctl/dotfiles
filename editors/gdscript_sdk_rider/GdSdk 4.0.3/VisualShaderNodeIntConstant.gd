extends VisualShaderNodeConstant
#brief A scalar integer constant to be used within the visual shader graph.
#desc Translated to [code]int[/code] in the shader language.
class_name VisualShaderNodeIntConstant


#desc An integer constant which represents a state of this node.
var constant: int:
	get = get_constant, set = set_constant




func get_constant() -> int:
	return constant

func set_constant(value: int) -> void:
	constant = value

