extends Texture2D
#brief Gradient-filled 2D texture.
#desc The texture uses a [Gradient] to fill the texture data in 2D space. The gradient is filled according to the specified [member fill] and [member repeat] types using colors obtained from the gradient. The texture does not necessarily represent an exact copy of the gradient, but instead an interpolation of samples obtained from the gradient at fixed steps (see [member width] and [member height]). See also [GradientTexture1D], [CurveTexture] and [CurveXYZTexture].
class_name GradientTexture2D

#desc The colors are linearly interpolated in a straight line.
#desc The colors are linearly interpolated in a circular pattern.
#desc The gradient fill is restricted to the range defined by [member fill_from] to [member fill_to] offsets.
#desc The texture is filled starting from [member fill_from] to [member fill_to] offsets, repeating the same pattern in both directions.
#desc The texture is filled starting from [member fill_from] to [member fill_to] offsets, mirroring the pattern in both directions.

#enum Fill
enum {
    FILL_LINEAR = 0,
    FILL_RADIAL = 1,
}
#enum Repeat
enum {
    REPEAT_NONE = 0,
    REPEAT = 1,
    REPEAT_MIRROR = 2,
}
#desc The gradient fill type, one of the [enum Fill] values. The texture is filled by interpolating colors starting from [member fill_from] to [member fill_to] offsets.
var fill: int:
	get = get_fill, set = set_fill

#desc The initial offset used to fill the texture specified in UV coordinates.
var fill_from: Vector2:
	get = get_fill_from, set = set_fill_from

#desc The final offset used to fill the texture specified in UV coordinates.
var fill_to: Vector2:
	get = get_fill_to, set = set_fill_to

#desc The [Gradient] used to fill the texture.
var gradient: Gradient:
	get = get_gradient, set = set_gradient

#desc The number of vertical color samples that will be obtained from the [Gradient], which also represents the texture's height.
var height: int:
	get = get_height, set = set_height

#desc The gradient repeat type, one of the [enum Repeat] values. The texture is filled starting from [member fill_from] to [member fill_to] offsets by default, but the gradient fill can be repeated to cover the entire texture.
var repeat: int:
	get = get_repeat, set = set_repeat

var resource_local_to_scene: bool:
	get = is_local_to_scene, set = set_local_to_scene

#desc If [code]true[/code], the generated texture will support high dynamic range ([constant Image.FORMAT_RGBAF] format). This allows for glow effects to work if [member Environment.glow_enabled] is [code]true[/code]. If [code]false[/code], the generated texture will use low dynamic range; overbright colors will be clamped ([constant Image.FORMAT_RGBA8] format).
var use_hdr: bool:
	get = is_using_hdr, set = set_use_hdr

#desc The number of horizontal color samples that will be obtained from the [Gradient], which also represents the texture's width.
var width: int:
	get = get_width, set = set_width




func get_fill() -> int:
	return fill

func set_fill(value: int) -> void:
	fill = value

func get_fill_from() -> Vector2:
	return fill_from

func set_fill_from(value: Vector2) -> void:
	fill_from = value

func get_fill_to() -> Vector2:
	return fill_to

func set_fill_to(value: Vector2) -> void:
	fill_to = value

func get_gradient() -> Gradient:
	return gradient

func set_gradient(value: Gradient) -> void:
	gradient = value

func get_height() -> int:
	return height

func set_height(value: int) -> void:
	height = value

func get_repeat() -> int:
	return repeat

func set_repeat(value: int) -> void:
	repeat = value

func is_local_to_scene() -> bool:
	return resource_local_to_scene

func set_local_to_scene(value: bool) -> void:
	resource_local_to_scene = value

func is_using_hdr() -> bool:
	return use_hdr

func set_use_hdr(value: bool) -> void:
	use_hdr = value

func get_width() -> int:
	return width

func set_width(value: int) -> void:
	width = value

