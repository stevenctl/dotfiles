extends VisualShaderNode
#brief Represents the input shader parameter within the visual shader graph.
#desc Gives access to input variables (built-ins) available for the shader. See the shading reference for the list of available built-ins for each shader type (check [code]Tutorials[/code] section for link).
#tutorial [Shading reference index] https://docs.godotengine.org/en/stable/tutorials/shaders/shader_reference/index.html
class_name VisualShaderNodeInput

#desc Emitted when input is changed via [member input_name].
signal input_type_changed

#desc One of the several input constants in lower-case style like: "vertex" ([code]VERTEX[/code]) or "point_size" ([code]POINT_SIZE[/code]).
var input_name: String:
	get = get_input_name, set = set_input_name



#desc Returns a translated name of the current constant in the Godot Shader Language. E.g. [code]"ALBEDO"[/code] if the [member input_name] equal to [code]"albedo"[/code].
func get_input_real_name() -> String:
	pass;


func get_input_name() -> String:
	return input_name

func set_input_name(value: String) -> void:
	input_name = value

