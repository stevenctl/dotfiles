extends VisualShaderNode
#brief A reference to an existing [VisualShaderNodeParameter].
#desc Creating a reference to a [VisualShaderNodeParameter] allows you to reuse this parameter in different shaders or shader stages easily.
class_name VisualShaderNodeParameterRef


#desc The name of the parameter which this reference points to.
var parameter_name: String:
	get = get_parameter_name, set = set_parameter_name




func get_parameter_name() -> String:
	return parameter_name

func set_parameter_name(value: String) -> void:
	parameter_name = value

