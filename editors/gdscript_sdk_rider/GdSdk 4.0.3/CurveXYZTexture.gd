extends Texture2D
#brief A texture that shows 3 different curves (stored on the red, green and blue color channels).
#desc Renders 3 given [Curve]s provided to it, on the red, green and blue channels respectively. Compared to using separate [CurveTexture]s, this further simplifies the task of drawing curves and/or saving them as image files.
#desc If you only need to store one curve within a single texture, use [CurveTexture] instead. See also [GradientTexture1D] and [GradientTexture2D].
class_name CurveXYZTexture


#desc The [Curve] that is rendered onto the texture's red channel.
var curve_x: Curve:
	get = get_curve_x, set = set_curve_x

#desc The [Curve] that is rendered onto the texture's green channel.
var curve_y: Curve:
	get = get_curve_y, set = set_curve_y

#desc The [Curve] that is rendered onto the texture's blue channel.
var curve_z: Curve:
	get = get_curve_z, set = set_curve_z

var resource_local_to_scene: bool:
	get = is_local_to_scene, set = set_local_to_scene

#desc The width of the texture (in pixels). Higher values make it possible to represent high-frequency data better (such as sudden direction changes), at the cost of increased generation time and memory usage.
var width: int:
	get = get_width, set = set_width




func get_curve_x() -> Curve:
	return curve_x

func set_curve_x(value: Curve) -> void:
	curve_x = value

func get_curve_y() -> Curve:
	return curve_y

func set_curve_y(value: Curve) -> void:
	curve_y = value

func get_curve_z() -> Curve:
	return curve_z

func set_curve_z(value: Curve) -> void:
	curve_z = value

func is_local_to_scene() -> bool:
	return resource_local_to_scene

func set_local_to_scene(value: bool) -> void:
	resource_local_to_scene = value

func get_width() -> int:
	return width

func set_width(value: int) -> void:
	width = value

