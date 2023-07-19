extends Resource
#brief A mathematic curve.
#desc A curve that can be saved and re-used for other objects. By default, it ranges between [code]0[/code] and [code]1[/code] on the Y axis and positions points relative to the [code]0.5[/code] Y position.
#desc See also [Gradient] which is designed for color interpolation. See also [Curve2D] and [Curve3D].
class_name Curve

#desc Emitted when [member max_value] or [member min_value] is changed.
signal range_changed
#desc The tangent on this side of the point is user-defined.
#desc The curve calculates the tangent on this side of the point as the slope halfway towards the adjacent point.
#desc The total number of available tangent modes.

#enum TangentMode
enum {
    TANGENT_FREE = 0,
    TANGENT_LINEAR = 1,
    TANGENT_MODE_COUNT = 2,
}
#desc The number of points to include in the baked (i.e. cached) curve data.
var bake_resolution: int:
	get = get_bake_resolution, set = set_bake_resolution

#desc The maximum value the curve can reach.
var max_value: float:
	get = get_max_value, set = set_max_value

#desc The minimum value the curve can reach.
var min_value: float:
	get = get_min_value, set = set_min_value

#desc The number of points describing the curve.
var point_count: int:
	get = get_point_count, set = set_point_count



#desc Adds a point to the curve. For each side, if the [code]*_mode[/code] is [constant TANGENT_LINEAR], the [code]*_tangent[/code] angle (in degrees) uses the slope of the curve halfway to the adjacent point. Allows custom assignments to the [code]*_tangent[/code] angle if [code]*_mode[/code] is set to [constant TANGENT_FREE].
func add_point(position: Vector2, left_tangent: float = 0, right_tangent: float = 0, left_mode: int = 0, right_mode: int = 0) -> int:
	pass;

#desc Recomputes the baked cache of points for the curve.
func bake() -> void:
	pass;

#desc Removes duplicate points, i.e. points that are less than 0.00001 units (engine epsilon value) away from their neighbor on the curve.
func clean_dupes() -> void:
	pass;

#desc Removes all points from the curve.
func clear_points() -> void:
	pass;

#desc Returns the left [enum TangentMode] for the point at [param index].
func get_point_left_mode(index: int) -> int:
	pass;

#desc Returns the left tangent angle (in degrees) for the point at [param index].
func get_point_left_tangent(index: int) -> float:
	pass;

#desc Returns the curve coordinates for the point at [param index].
func get_point_position(index: int) -> Vector2:
	pass;

#desc Returns the right [enum TangentMode] for the point at [param index].
func get_point_right_mode(index: int) -> int:
	pass;

#desc Returns the right tangent angle (in degrees) for the point at [param index].
func get_point_right_tangent(index: int) -> float:
	pass;

#desc Removes the point at [code]index[/code] from the curve.
func remove_point(index: int) -> void:
	pass;

#desc Returns the Y value for the point that would exist at the X position [param offset] along the curve.
func sample(offset: float) -> float:
	pass;

#desc Returns the Y value for the point that would exist at the X position [param offset] along the curve using the baked cache. Bakes the curve's points if not already baked.
func sample_baked(offset: float) -> float:
	pass;

#desc Sets the left [enum TangentMode] for the point at [param index] to [param mode].
func set_point_left_mode(index: int, mode: int) -> void:
	pass;

#desc Sets the left tangent angle for the point at [param index] to [param tangent].
func set_point_left_tangent(index: int, tangent: float) -> void:
	pass;

#desc Sets the offset from [code]0.5[/code].
func set_point_offset(index: int, offset: float) -> int:
	pass;

#desc Sets the right [enum TangentMode] for the point at [param index] to [param mode].
func set_point_right_mode(index: int, mode: int) -> void:
	pass;

#desc Sets the right tangent angle for the point at [param index] to [param tangent].
func set_point_right_tangent(index: int, tangent: float) -> void:
	pass;

#desc Assigns the vertical position [param y] to the point at [param index].
func set_point_value(index: int, y: float) -> void:
	pass;


func get_bake_resolution() -> int:
	return bake_resolution

func set_bake_resolution(value: int) -> void:
	bake_resolution = value

func get_max_value() -> float:
	return max_value

func set_max_value(value: float) -> void:
	max_value = value

func get_min_value() -> float:
	return min_value

func set_min_value(value: float) -> void:
	min_value = value

func get_point_count() -> int:
	return point_count

func set_point_count(value: int) -> void:
	point_count = value

