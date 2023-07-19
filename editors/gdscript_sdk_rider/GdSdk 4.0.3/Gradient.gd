extends Resource
#brief A color interpolator resource which can be used to generate colors between user-defined color points.
#desc Given a set of colors, this resource will interpolate them in order. This means that if you have color 1, color 2 and color 3, the gradient will interpolate from color 1 to color 2 and from color 2 to color 3. The gradient will initially have 2 colors (black and white), one (black) at gradient lower offset 0 and the other (white) at the gradient higher offset 1.
#desc See also [Curve] which supports more complex easing methods, but does not support colors.
class_name Gradient

#desc Linear interpolation.
#desc Constant interpolation, color changes abruptly at each point and stays uniform between. This might cause visible aliasing when used for a gradient texture in some cases.
#desc Cubic interpolation.

#enum InterpolationMode
enum {
    GRADIENT_INTERPOLATE_LINEAR = 0,
    GRADIENT_INTERPOLATE_CONSTANT = 1,
    GRADIENT_INTERPOLATE_CUBIC = 2,
}
#desc Gradient's colors returned as a [PackedColorArray].
var colors: PackedColorArray:
	get = get_colors, set = set_colors

#desc Defines how the colors between points of the gradient are interpolated. See [enum InterpolationMode] for available modes.
var interpolation_mode: int:
	get = get_interpolation_mode, set = set_interpolation_mode

#desc Gradient's offsets returned as a [PackedFloat32Array].
var offsets: PackedFloat32Array:
	get = get_offsets, set = set_offsets



#desc Adds the specified color to the end of the gradient, with the specified offset.
func add_point(offset: float, color: Color) -> void:
	pass;

#desc Returns the color of the gradient color at index [param point].
func get_color(point: int) -> Color:
	pass;

#desc Returns the offset of the gradient color at index [param point].
func get_offset(point: int) -> float:
	pass;

#desc Returns the number of colors in the gradient.
func get_point_count() -> int:
	pass;

#desc Removes the color at the index [param point].
func remove_point(point: int) -> void:
	pass;

#desc Reverses/mirrors the gradient.
#desc [b]Note:[/b] This method mirrors all points around the middle of the gradient, which may produce unexpected results when [member interpolation_mode] is set to [constant GRADIENT_INTERPOLATE_CONSTANT].
func reverse() -> void:
	pass;

#desc Returns the interpolated color specified by [param offset].
func sample(offset: float) -> Color:
	pass;

#desc Sets the color of the gradient color at index [param point].
func set_color(point: int, color: Color) -> void:
	pass;

#desc Sets the offset for the gradient color at index [param point].
func set_offset(point: int, offset: float) -> void:
	pass;


func get_colors() -> PackedColorArray:
	return colors

func set_colors(value: PackedColorArray) -> void:
	colors = value

func get_interpolation_mode() -> int:
	return interpolation_mode

func set_interpolation_mode(value: int) -> void:
	interpolation_mode = value

func get_offsets() -> PackedFloat32Array:
	return offsets

func set_offsets(value: PackedFloat32Array) -> void:
	offsets = value

