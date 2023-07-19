extends Texture2D
#brief A texture that shows a curve.
#desc Renders a given [Curve] provided to it. Simplifies the task of drawing curves and/or saving them as image files.
#desc If you need to store up to 3 curves within a single texture, use [CurveXYZTexture] instead. See also [GradientTexture1D] and [GradientTexture2D].
class_name CurveTexture

#desc Store the curve equally across the red, green and blue channels. This uses more video memory, but is more compatible with shaders that only read the green and blue values.
#desc Store the curve only in the red channel. This saves video memory, but some custom shaders may not be able to work with this.

#enum TextureMode
enum {
    TEXTURE_MODE_RGB = 0,
    TEXTURE_MODE_RED = 1,
}
#desc The [Curve] that is rendered onto the texture.
var curve: Curve:
	get = get_curve, set = set_curve

var resource_local_to_scene: bool:
	get = is_local_to_scene, set = set_local_to_scene

#desc The format the texture should be generated with. When passing a CurveTexture as an input to a [Shader], this may need to be adjusted.
var texture_mode: int:
	get = get_texture_mode, set = set_texture_mode

#desc The width of the texture (in pixels). Higher values make it possible to represent high-frequency data better (such as sudden direction changes), at the cost of increased generation time and memory usage.
var width: int:
	get = get_width, set = set_width




func get_curve() -> Curve:
	return curve

func set_curve(value: Curve) -> void:
	curve = value

func is_local_to_scene() -> bool:
	return resource_local_to_scene

func set_local_to_scene(value: bool) -> void:
	resource_local_to_scene = value

func get_texture_mode() -> int:
	return texture_mode

func set_texture_mode(value: int) -> void:
	texture_mode = value

func get_width() -> int:
	return width

func set_width(value: int) -> void:
	width = value

