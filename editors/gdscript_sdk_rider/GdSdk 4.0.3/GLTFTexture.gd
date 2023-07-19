extends Resource
class_name GLTFTexture


#desc ID of the texture sampler to use when sampling the image. If -1, then the default texture sampler is used (linear filtering, and repeat wrapping in both axes).
var sampler: int:
	get = get_sampler, set = set_sampler

var src_image: int:
	get = get_src_image, set = set_src_image




func get_sampler() -> int:
	return sampler

func set_sampler(value: int) -> void:
	sampler = value

func get_src_image() -> int:
	return src_image

func set_src_image(value: int) -> void:
	src_image = value

