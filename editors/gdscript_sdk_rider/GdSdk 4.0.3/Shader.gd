extends Resource
#brief A custom shader program.
#desc This class allows you to define a custom shader program that can be used by a [ShaderMaterial]. Shaders allow you to write your own custom behavior for rendering objects or updating particle information. For a detailed explanation and usage, please see the tutorials linked below.
#tutorial [Shaders documentation index] https://docs.godotengine.org/en/stable/tutorials/shaders/index.html
class_name Shader

#desc Mode used to draw all 3D objects.
#desc Mode used to draw all 2D objects.
#desc Mode used to calculate particle information on a per-particle basis. Not used for drawing.
#desc Mode used for drawing skies. Only works with shaders attached to [Sky] objects.
#desc Mode used for setting the color and density of volumetric fog effect.

#enum Mode
enum {
    MODE_SPATIAL = 0,
    MODE_CANVAS_ITEM = 1,
    MODE_PARTICLES = 2,
    MODE_SKY = 3,
    MODE_FOG = 4,
}
#desc Returns the shader's code as the user has written it, not the full generated code used internally.
var code: String:
	get = get_code, set = set_code



#desc Returns the texture that is set as default for the specified parameter.
#desc [b]Note:[/b] [param name] must match the name of the uniform in the code exactly.
#desc [b]Note:[/b] If the sampler array is used use [param index] to access the specified texture.
func get_default_texture_parameter(name: StringName, index: int = 0) -> Texture2D:
	pass;

#desc Returns the shader mode for the shader, either [constant MODE_CANVAS_ITEM], [constant MODE_SPATIAL] or [constant MODE_PARTICLES].
func get_mode() -> int:
	pass;

#desc Get the list of shader uniforms that can be assigned to a [ShaderMaterial], for use with [method ShaderMaterial.set_shader_parameter] and [method ShaderMaterial.get_shader_parameter]. The parameters returned are contained in dictionaries in a similar format to the ones returned by [method Object.get_property_list].
#desc If argument [param get_groups] is true, parameter grouping hints will be provided.
func get_shader_uniform_list(get_groups: bool = false) -> Array:
	pass;

#desc Sets the default texture to be used with a texture uniform. The default is used if a texture is not set in the [ShaderMaterial].
#desc [b]Note:[/b] [param name] must match the name of the uniform in the code exactly.
#desc [b]Note:[/b] If the sampler array is used use [param index] to access the specified texture.
func set_default_texture_parameter(name: StringName, texture: Texture2D, index: int = 0) -> void:
	pass;


func get_code() -> String:
	return code

func set_code(value: String) -> void:
	code = value

