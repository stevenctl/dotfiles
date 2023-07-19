extends VisualShaderNodeConstant
#brief A [Vector3] constant to be used within the visual shader graph.
#desc A constant [Vector3], which can be used as an input node.
class_name VisualShaderNodeVec3Constant


#desc A [Vector3] constant which represents the state of this node.
var constant: Vector3:
	get = get_constant, set = set_constant




func get_constant() -> Vector3:
	return constant

func set_constant(value: Vector3) -> void:
	constant = value

