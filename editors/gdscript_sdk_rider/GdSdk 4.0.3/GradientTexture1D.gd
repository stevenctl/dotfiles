extends Texture2D
#brief Gradient-filled texture.
#desc GradientTexture1D uses a [Gradient] to fill the texture data. The gradient will be filled from left to right using colors obtained from the gradient. This means the texture does not necessarily represent an exact copy of the gradient, but instead an interpolation of samples obtained from the gradient at fixed steps (see [member width]). See also [GradientTexture2D], [CurveTexture] and [CurveXYZTexture].
class_name GradientTexture1D


#desc The [Gradient] that will be used to fill the texture.
var gradient: Gradient:
	get = get_gradient, set = set_gradient

var resource_local_to_scene: bool:
	get = is_local_to_scene, set = set_local_to_scene

#desc If [code]true[/code], the generated texture will support high dynamic range ([constant Image.FORMAT_RGBAF] format). This allows for glow effects to work if [member Environment.glow_enabled] is [code]true[/code]. If [code]false[/code], the generated texture will use low dynamic range; overbright colors will be clamped ([constant Image.FORMAT_RGBA8] format).
var use_hdr: bool:
	get = is_using_hdr, set = set_use_hdr

#desc The number of color samples that will be obtained from the [Gradient].
var width: int:
	get = get_width, set = set_width




func get_gradient() -> Gradient:
	return gradient

func set_gradient(value: Gradient) -> void:
	gradient = value

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

