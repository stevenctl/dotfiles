extends RefCounted
#brief Texture format (used by [RenderingDevice]).
#desc This object is used by [RenderingDevice].
class_name RDTextureFormat


#desc The number of layers in the texture. Only relevant for 2D texture arrays.
var array_layers: int:
	get = get_array_layers, set = set_array_layers

#desc The texture's depth (in pixels). This is always [code]1[/code] for 2D textures.
var depth: int:
	get = get_depth, set = set_depth

#desc The texture's pixel data format.
var format: int:
	get = get_format, set = set_format

#desc The texture's height (in pixels).
var height: int:
	get = get_height, set = set_height

#desc The number of mipmaps available in the texture.
var mipmaps: int:
	get = get_mipmaps, set = set_mipmaps

#desc The number of samples used when sampling the texture.
var samples: int:
	get = get_samples, set = set_samples

#desc The texture type.
var texture_type: int:
	get = get_texture_type, set = set_texture_type

#desc The texture's usage bits, which determine what can be done using the texture.
var usage_bits: int:
	get = get_usage_bits, set = set_usage_bits

#desc The texture's width (in pixels).
var width: int:
	get = get_width, set = set_width



func add_shareable_format(format: int) -> void:
	pass;

func remove_shareable_format(format: int) -> void:
	pass;


func get_array_layers() -> int:
	return array_layers

func set_array_layers(value: int) -> void:
	array_layers = value

func get_depth() -> int:
	return depth

func set_depth(value: int) -> void:
	depth = value

func get_format() -> int:
	return format

func set_format(value: int) -> void:
	format = value

func get_height() -> int:
	return height

func set_height(value: int) -> void:
	height = value

func get_mipmaps() -> int:
	return mipmaps

func set_mipmaps(value: int) -> void:
	mipmaps = value

func get_samples() -> int:
	return samples

func set_samples(value: int) -> void:
	samples = value

func get_texture_type() -> int:
	return texture_type

func set_texture_type(value: int) -> void:
	texture_type = value

func get_usage_bits() -> int:
	return usage_bits

func set_usage_bits(value: int) -> void:
	usage_bits = value

func get_width() -> int:
	return width

func set_width(value: int) -> void:
	width = value

