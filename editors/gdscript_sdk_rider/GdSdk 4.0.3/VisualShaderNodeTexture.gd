extends VisualShaderNode
#brief Performs a 2D texture lookup within the visual shader graph.
#desc Performs a lookup operation on the provided texture, with support for multiple texture sources to choose from.
class_name VisualShaderNodeTexture

#desc Use the texture given as an argument for this function.
#desc Use the current viewport's texture as the source.
#desc Use the texture from this shader's texture built-in (e.g. a texture of a [Sprite2D]).
#desc Use the texture from this shader's normal map built-in.
#desc Use the depth texture captured during the depth prepass. Only available when the depth prepass is used (i.e. in spatial shaders and in the forward_plus or gl_compatibility renderers).
#desc Use the texture provided in the input port for this function.
#desc Use the normal buffer captured during the depth prepass. Only available when the normal-roughness buffer is available (i.e. in spatial shaders and in the forward_plus renderer).
#desc Use the roughness buffer captured during the depth prepass. Only available when the normal-roughness buffer is available (i.e. in spatial shaders and in the forward_plus renderer).
#desc Represents the size of the [enum Source] enum.
#desc No hints are added to the uniform declaration.
#desc Adds [code]hint_albedo[/code] as hint to the uniform declaration for proper sRGB to linear conversion.
#desc Adds [code]hint_normal[/code] as hint to the uniform declaration, which internally converts the texture for proper usage as normal map.
#desc Represents the size of the [enum TextureType] enum.

#enum Source
enum {
    SOURCE_TEXTURE = 0,
    SOURCE_SCREEN = 1,
    SOURCE_2D_TEXTURE = 2,
    SOURCE_2D_NORMAL = 3,
    SOURCE_DEPTH = 4,
    SOURCE_PORT = 5,
    SOURCE_3D_NORMAL = 6,
    SOURCE_ROUGHNESS = 7,
    SOURCE_MAX = 8,
}
#enum TextureType
enum {
    TYPE_DATA = 0,
    TYPE_COLOR = 1,
    TYPE_NORMAL_MAP = 2,
    TYPE_MAX = 3,
}
#desc Determines the source for the lookup. See [enum Source] for options.
var source: int:
	get = get_source, set = set_source

#desc The source texture, if needed for the selected [member source].
var texture: Texture2D:
	get = get_texture, set = set_texture

#desc Specifies the type of the texture if [member source] is set to [constant SOURCE_TEXTURE]. See [enum TextureType] for options.
var texture_type: int:
	get = get_texture_type, set = set_texture_type




func get_source() -> int:
	return source

func set_source(value: int) -> void:
	source = value

func get_texture() -> Texture2D:
	return texture

func set_texture(value: Texture2D) -> void:
	texture = value

func get_texture_type() -> int:
	return texture_type

func set_texture_type(value: int) -> void:
	texture_type = value

