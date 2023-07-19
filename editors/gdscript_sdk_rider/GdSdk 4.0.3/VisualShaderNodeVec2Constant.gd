extends VisualShaderNodeConstant
#brief A [Vector2] constant to be used within the visual shader graph.
#desc A constant [Vector2], which can be used as an input node.
class_name VisualShaderNodeVec2Constant


#desc A [Vector2] constant which represents the state of this node.
var constant: Vector2:
	get = get_constant, set = set_constant




func get_constant() -> Vector2:
	return constant

func set_constant(value: Vector2) -> void:
	constant = value

