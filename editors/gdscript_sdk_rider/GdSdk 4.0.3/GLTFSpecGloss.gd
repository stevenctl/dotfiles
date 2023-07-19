extends Resource
#brief Archived GLTF extension for specular/glossy materials.
#desc KHR_materials_pbrSpecularGlossiness is an archived GLTF extension. This means that it is deprecated and not recommended for new files. However, it is still supported for loading old files.
#tutorial [KHR_materials_pbrSpecularGlossiness GLTF extension spec] https://github.com/KhronosGroup/glTF/blob/main/extensions/2.0/Archived/KHR_materials_pbrSpecularGlossiness
class_name GLTFSpecGloss


#desc The reflected diffuse factor of the material.
var diffuse_factor: Color:
	get = get_diffuse_factor, set = set_diffuse_factor

#desc The diffuse texture.
var diffuse_img: Image:
	get = get_diffuse_img, set = set_diffuse_img

#desc The glossiness or smoothness of the material.
var gloss_factor: float:
	get = get_gloss_factor, set = set_gloss_factor

#desc The specular-glossiness texture.
var spec_gloss_img: Image:
	get = get_spec_gloss_img, set = set_spec_gloss_img

#desc The specular RGB color of the material. The alpha channel is unused.
var specular_factor: Color:
	get = get_specular_factor, set = set_specular_factor




func get_diffuse_factor() -> Color:
	return diffuse_factor

func set_diffuse_factor(value: Color) -> void:
	diffuse_factor = value

func get_diffuse_img() -> Image:
	return diffuse_img

func set_diffuse_img(value: Image) -> void:
	diffuse_img = value

func get_gloss_factor() -> float:
	return gloss_factor

func set_gloss_factor(value: float) -> void:
	gloss_factor = value

func get_spec_gloss_img() -> Image:
	return spec_gloss_img

func set_spec_gloss_img(value: Image) -> void:
	spec_gloss_img = value

func get_specular_factor() -> Color:
	return specular_factor

func set_specular_factor(value: Color) -> void:
	specular_factor = value

