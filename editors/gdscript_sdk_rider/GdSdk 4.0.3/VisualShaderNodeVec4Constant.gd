extends VisualShaderNodeConstant
#brief A 4D vector constant to be used within the visual shader graph.
#desc A constant 4D vector, which can be used as an input node.
class_name VisualShaderNodeVec4Constant


#desc A 4D vector (represented as a [Quaternion]) constant which represents the state of this node.
var constant: Quaternion:
	get = get_constant, set = set_constant




func get_constant() -> Quaternion:
	return constant

func set_constant(value: Quaternion) -> void:
	constant = value

