extends VisualShaderNodeParameter
#brief Performs a uniform texture lookup within the visual shader graph.
#desc Performs a lookup operation on the texture provided as a uniform for the shader.
class_name VisualShaderNodeTextureParameter

#desc No hints are added to the uniform declaration.
#desc Adds [code]source_color[/code] as hint to the uniform declaration for proper sRGB to linear conversion.
#desc Adds [code]hint_normal[/code] as hint to the uniform declaration, which internally converts the texture for proper usage as normal map.
#desc Adds [code]hint_anisotropy[/code] as hint to the uniform declaration to use for a flowmap.
#desc Represents the size of the [enum TextureType] enum.
#desc Defaults to fully opaque white color.
#desc Defaults to fully opaque black color.
#desc Defaults to fully transparent black color.
#desc Represents the size of the [enum ColorDefault] enum.
#desc Sample the texture using the filter determined by the node this shader is attached to.
#desc The texture filter reads from the nearest pixel only. The simplest and fastest method of filtering, but the texture will look pixelized.
#desc The texture filter blends between the nearest four pixels. Use this for most cases where you want to avoid a pixelated style.
#desc The texture filter reads from the nearest pixel in the nearest mipmap. This is the fastest way to read from textures with mipmaps.
#desc The texture filter blends between the nearest 4 pixels and between the nearest 2 mipmaps. Use this for non-pixel art textures that may be viewed at a low scale (e.g. due to [Camera2D] zoom), as mipmaps are important to smooth out pixels that are smaller than on-screen pixels.
#desc The texture filter reads from the nearest pixel, but selects a mipmap based on the angle between the surface and the camera view. This reduces artifacts on surfaces that are almost in line with the camera. The anisotropic filtering level can be changed by adjusting [member ProjectSettings.rendering/textures/default_filters/anisotropic_filtering_level].
#desc [b]Note:[/b] This texture filter is rarely useful in 2D projects. [constant FILTER_LINEAR_MIPMAP] is usually more appropriate.
#desc The texture filter blends between the nearest 4 pixels and selects a mipmap based on the angle between the surface and the camera view. This reduces artifacts on surfaces that are almost in line with the camera. This is the slowest of the filtering options, but results in the highest quality texturing. The anisotropic filtering level can be changed by adjusting [member ProjectSettings.rendering/textures/default_filters/anisotropic_filtering_level].
#desc [b]Note:[/b] This texture filter is rarely useful in 2D projects. [constant FILTER_LINEAR_MIPMAP] is usually more appropriate.
#desc Represents the size of the [enum TextureFilter] enum.
#desc Sample the texture using the repeat mode determined by the node this shader is attached to.
#desc Texture will repeat normally.
#desc Texture will not repeat.
#desc Represents the size of the [enum TextureRepeat] enum.
#desc The texture source is not specified in the shader.
#desc The texture source is the screen texture which captures all opaque objects drawn this frame.
#desc The texture source is the depth texture from the depth prepass.
#desc The texture source is the normal-roughness buffer from the depth prepass.
#desc Represents the size of the [enum TextureSource] enum.

#enum TextureType
enum {
    TYPE_DATA = 0,
    TYPE_COLOR = 1,
    TYPE_NORMAL_MAP = 2,
    TYPE_ANISOTROPY = 3,
    TYPE_MAX = 4,
}
#enum ColorDefault
enum {
    COLOR_DEFAULT_WHITE = 0,
    COLOR_DEFAULT_BLACK = 1,
    COLOR_DEFAULT_TRANSPARENT = 2,
    COLOR_DEFAULT_MAX = 3,
}
#enum TextureFilter
enum {
    FILTER_DEFAULT = 0,
    FILTER_NEAREST = 1,
    FILTER_LINEAR = 2,
    FILTER_NEAREST_MIPMAP = 3,
    FILTER_LINEAR_MIPMAP = 4,
    FILTER_NEAREST_MIPMAP_ANISOTROPIC = 5,
    FILTER_LINEAR_MIPMAP_ANISOTROPIC = 6,
    FILTER_MAX = 7,
}
#enum TextureRepeat
enum {
    REPEAT_DEFAULT = 0,
    REPEAT_ENABLED = 1,
    REPEAT_DISABLED = 2,
    REPEAT_MAX = 3,
}
#enum TextureSource
enum {
    SOURCE_NONE = 0,
    SOURCE_SCREEN = 1,
    SOURCE_DEPTH = 2,
    SOURCE_NORMAL_ROUGHNESS = 3,
    SOURCE_MAX = 4,
}
#desc Sets the default color if no texture is assigned to the uniform.
var color_default: int:
	get = get_color_default, set = set_color_default

#desc Sets the texture filtering mode. See [enum TextureFilter] for options.
var texture_filter: int:
	get = get_texture_filter, set = set_texture_filter

#desc Sets the texture repeating mode. See [enum TextureRepeat] for options.
var texture_repeat: int:
	get = get_texture_repeat, set = set_texture_repeat

#desc Sets the texture source mode. Used for reading from the screen, depth, or normal_roughness texture. See [enum TextureSource] for options.
var texture_source: int:
	get = get_texture_source, set = set_texture_source

#desc Defines the type of data provided by the source texture. See [enum TextureType] for options.
var texture_type: int:
	get = get_texture_type, set = set_texture_type




func get_color_default() -> int:
	return color_default

func set_color_default(value: int) -> void:
	color_default = value

func get_texture_filter() -> int:
	return texture_filter

func set_texture_filter(value: int) -> void:
	texture_filter = value

func get_texture_repeat() -> int:
	return texture_repeat

func set_texture_repeat(value: int) -> void:
	texture_repeat = value

func get_texture_source() -> int:
	return texture_source

func set_texture_source(value: int) -> void:
	texture_source = value

func get_texture_type() -> int:
	return texture_type

func set_texture_type(value: int) -> void:
	texture_type = value

