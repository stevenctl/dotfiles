extends VisualShaderNodeConstant
#brief A [Color] constant to be used within the visual shader graph.
#desc Has two output ports representing RGB and alpha channels of [Color].
#desc Translated to [code]vec3 rgb[/code] and [code]float alpha[/code] in the shader language.
class_name VisualShaderNodeColorConstant


#desc A [Color] constant which represents a state of this node.
var constant: Color:
	get = get_constant, set = set_constant




func get_constant() -> Color:
	return constant

func set_constant(value: Color) -> void:
	constant = value

