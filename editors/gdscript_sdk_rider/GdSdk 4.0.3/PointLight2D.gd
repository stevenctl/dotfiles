extends Light2D
#brief Positional 2D light source.
#desc Casts light in a 2D environment. This light's shape is defined by a (usually grayscale) texture.
#tutorial [2D lights and shadows] https://docs.godotengine.org/en/stable/tutorials/2d/2d_lights_and_shadows.html
class_name PointLight2D


#desc The height of the light. Used with 2D normal mapping. The units are in pixels, e.g. if the height is 100, then it will illuminate an object 100 pixels away at a 45° angle to the plane.
var height: float:
	get = get_height, set = set_height

#desc The offset of the light's [member texture].
var offset: Vector2:
	get = get_texture_offset, set = set_texture_offset

#desc [Texture2D] used for the light's appearance.
var texture: Texture2D:
	get = get_texture, set = set_texture

#desc The [member texture]'s scale factor.
var texture_scale: float:
	get = get_texture_scale, set = set_texture_scale




func get_height() -> float:
	return height

func set_height(value: float) -> void:
	height = value

func get_texture_offset() -> Vector2:
	return offset

func set_texture_offset(value: Vector2) -> void:
	offset = value

func get_texture() -> Texture2D:
	return texture

func set_texture(value: Texture2D) -> void:
	texture = value

func get_texture_scale() -> float:
	return texture_scale

func set_texture_scale(value: float) -> void:
	texture_scale = value

