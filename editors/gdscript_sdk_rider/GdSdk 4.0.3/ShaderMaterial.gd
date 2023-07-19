extends Material
#brief A material that uses a custom [Shader] program.
#desc A material that uses a custom [Shader] program to render either items to screen or process particles. You can create multiple materials for the same shader but configure different values for the uniforms defined in the shader.
#tutorial [Shaders documentation index] https://docs.godotengine.org/en/stable/tutorials/shaders/index.html
class_name ShaderMaterial


#desc The [Shader] program used to render this material.
var shader: Shader:
	get = get_shader, set = set_shader



#desc Returns the current value set for this material of a uniform in the shader.
func get_shader_parameter(param: StringName) -> Variant:
	pass;

#desc Changes the value set for this material of a uniform in the shader.
#desc [b]Note:[/b] [param param] is case-sensitive and must match the name of the uniform in the code exactly (not the capitalized name in the inspector).
#desc [b]Note:[/b] Changes to the shader uniform will be effective on all instances using this [ShaderMaterial]. To prevent this, use per-instance uniforms with [method GeometryInstance3D.set_instance_shader_parameter] or duplicate the [ShaderMaterial] resource using [method Resource.duplicate]. Per-instance uniforms allow for better shader reuse and are therefore faster, so they should be preferred over duplicating the [ShaderMaterial] when possible.
func set_shader_parameter(param: StringName, value: Variant) -> void:
	pass;


func get_shader() -> Shader:
	return shader

func set_shader(value: Shader) -> void:
	shader = value

