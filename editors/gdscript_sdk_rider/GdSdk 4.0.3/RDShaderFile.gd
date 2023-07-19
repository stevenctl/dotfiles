extends Resource
#brief Compiled shader file in SPIR-V form (used by [RenderingDevice]). Not to be confused with Godot's own [Shader].
#desc Compiled shader file in SPIR-V form.
#desc See also [RDShaderSource]. [RDShaderFile] is only meant to be used with the [RenderingDevice] API. It should not be confused with Godot's own [Shader] resource, which is what Godot's various nodes use for high-level shader programming.
class_name RDShaderFile


#desc The base compilation error message, which indicates errors not related to a specific shader stage if non-empty. If empty, shader compilation is not necessarily successful (check [RDShaderSPIRV]'s error message members).
var base_error: String:
	get = get_base_error, set = set_base_error



#desc Returns the SPIR-V intermediate representation for the specified shader [param version].
func get_spirv(version: StringName = &"") -> RDShaderSPIRV:
	pass;

#desc Returns the list of compiled versions for this shader.
func get_version_list() -> PackedStringArray:
	pass;

#desc Sets the SPIR-V [param bytecode] that will be compiled for the specified [param version].
func set_bytecode(bytecode: RDShaderSPIRV, version: StringName = &"") -> void:
	pass;


func get_base_error() -> String:
	return base_error

func set_base_error(value: String) -> void:
	base_error = value

