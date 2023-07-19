extends VisualShaderNode
#brief A base type for the parameters within the visual shader graph.
#desc A parameter represents a variable in the shader which is set externally, i.e. from the [ShaderMaterial]. Parameters are exposed as properties in the [ShaderMaterial] and can be assigned from the Inspector or from a script.
class_name VisualShaderNodeParameter

#desc The parameter will be tied to the [ShaderMaterial] using this shader.
#desc The parameter will use a global value, defined in Project Settings.
#desc The parameter will be tied to the node with attached [ShaderMaterial] using this shader.
#desc Represents the size of the [enum Qualifier] enum.

#enum Qualifier
enum {
    QUAL_NONE = 0,
    QUAL_GLOBAL = 1,
    QUAL_INSTANCE = 2,
    QUAL_MAX = 3,
}
#desc Name of the parameter, by which it can be accessed through the [ShaderMaterial] properties.
var parameter_name: String:
	get = get_parameter_name, set = set_parameter_name

#desc Defines the scope of the parameter.
var qualifier: int:
	get = get_qualifier, set = set_qualifier




func get_parameter_name() -> String:
	return parameter_name

func set_parameter_name(value: String) -> void:
	parameter_name = value

func get_qualifier() -> int:
	return qualifier

func set_qualifier(value: int) -> void:
	qualifier = value

