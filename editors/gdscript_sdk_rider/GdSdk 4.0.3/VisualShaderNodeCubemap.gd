extends VisualShaderNode
#brief A [Cubemap] sampling node to be used within the visual shader graph.
#desc Translated to [code]texture(cubemap, vec3)[/code] in the shader language. Returns a color vector and alpha channel as scalar.
class_name VisualShaderNodeCubemap

#desc Use the [Cubemap] set via [member cube_map]. If this is set to [member source], the [code]samplerCube[/code] port is ignored.
#desc Use the [Cubemap] sampler reference passed via the [code]samplerCube[/code] port. If this is set to [member source], the [member cube_map] texture is ignored.
#desc Represents the size of the [enum Source] enum.
#desc No hints are added to the uniform declaration.
#desc Adds [code]hint_albedo[/code] as hint to the uniform declaration for proper sRGB to linear conversion.
#desc Adds [code]hint_normal[/code] as hint to the uniform declaration, which internally converts the texture for proper usage as normal map.
#desc Represents the size of the [enum TextureType] enum.

#enum Source
enum {
    SOURCE_TEXTURE = 0,
    SOURCE_PORT = 1,
    SOURCE_MAX = 2,
}
#enum TextureType
enum {
    TYPE_DATA = 0,
    TYPE_COLOR = 1,
    TYPE_NORMAL_MAP = 2,
    TYPE_MAX = 3,
}
#desc The [Cubemap] texture to sample when using [constant SOURCE_TEXTURE] as [member source].
var cube_map: Cubemap:
	get = get_cube_map, set = set_cube_map

#desc Defines which source should be used for the sampling. See [enum Source] for options.
var source: int:
	get = get_source, set = set_source

#desc Defines the type of data provided by the source texture. See [enum TextureType] for options.
var texture_type: int:
	get = get_texture_type, set = set_texture_type




func get_cube_map() -> Cubemap:
	return cube_map

func set_cube_map(value: Cubemap) -> void:
	cube_map = value

func get_source() -> int:
	return source

func set_source(value: int) -> void:
	source = value

func get_texture_type() -> int:
	return texture_type

func set_texture_type(value: int) -> void:
	texture_type = value

