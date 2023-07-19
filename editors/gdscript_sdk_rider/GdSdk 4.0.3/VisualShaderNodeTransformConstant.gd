extends VisualShaderNodeConstant
#brief A [Transform3D] constant for use within the visual shader graph.
#desc A constant [Transform3D], which can be used as an input node.
class_name VisualShaderNodeTransformConstant


#desc A [Transform3D] constant which represents the state of this node.
var constant: Transform3D:
	get = get_constant, set = set_constant




func get_constant() -> Transform3D:
	return constant

func set_constant(value: Transform3D) -> void:
	constant = value

