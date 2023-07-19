extends RefCounted
#brief Texture view (used by [RenderingDevice]).
#desc This object is used by [RenderingDevice].
class_name RDTextureView


#desc Optional override for the data format to return sampled values in. The default value of [constant RenderingDevice.DATA_FORMAT_MAX] does not override the format.
var format_override: int:
	get = get_format_override, set = set_format_override

#desc The channel to sample when sampling the alpha channel.
var swizzle_a: int:
	get = get_swizzle_a, set = set_swizzle_a

#desc The channel to sample when sampling the blue color channel.
var swizzle_b: int:
	get = get_swizzle_b, set = set_swizzle_b

#desc The channel to sample when sampling the green color channel.
var swizzle_g: int:
	get = get_swizzle_g, set = set_swizzle_g

#desc The channel to sample when sampling the red color channel.
var swizzle_r: int:
	get = get_swizzle_r, set = set_swizzle_r




func get_format_override() -> int:
	return format_override

func set_format_override(value: int) -> void:
	format_override = value

func get_swizzle_a() -> int:
	return swizzle_a

func set_swizzle_a(value: int) -> void:
	swizzle_a = value

func get_swizzle_b() -> int:
	return swizzle_b

func set_swizzle_b(value: int) -> void:
	swizzle_b = value

func get_swizzle_g() -> int:
	return swizzle_g

func set_swizzle_g(value: int) -> void:
	swizzle_g = value

func get_swizzle_r() -> int:
	return swizzle_r

func set_swizzle_r(value: int) -> void:
	swizzle_r = value

