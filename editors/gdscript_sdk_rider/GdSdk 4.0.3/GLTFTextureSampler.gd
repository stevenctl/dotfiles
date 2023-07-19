extends Resource
#brief Represents a GLTF texture sampler
#desc Represents a texture sampler as defined by the base GLTF spec. Texture samplers in GLTF specify how to sample data from the texture's base image, when rendering the texture on an object.
class_name GLTFTextureSampler


#desc Texture's magnification filter, used when texture appears larger on screen than the source image.
var mag_filter: int:
	get = get_mag_filter, set = set_mag_filter

#desc Texture's minification filter, used when the texture appears smaller on screen than the source image.
var min_filter: int:
	get = get_min_filter, set = set_min_filter

#desc Wrapping mode to use for S-axis (horizontal) texture coordinates.
var wrap_s: int:
	get = get_wrap_s, set = set_wrap_s

#desc Wrapping mode to use for T-axis (vertical) texture coordinates.
var wrap_t: int:
	get = get_wrap_t, set = set_wrap_t




func get_mag_filter() -> int:
	return mag_filter

func set_mag_filter(value: int) -> void:
	mag_filter = value

func get_min_filter() -> int:
	return min_filter

func set_min_filter(value: int) -> void:
	min_filter = value

func get_wrap_s() -> int:
	return wrap_s

func set_wrap_s(value: int) -> void:
	wrap_s = value

func get_wrap_t() -> int:
	return wrap_t

func set_wrap_t(value: int) -> void:
	wrap_t = value

