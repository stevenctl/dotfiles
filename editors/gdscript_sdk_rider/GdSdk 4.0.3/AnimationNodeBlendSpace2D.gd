extends AnimationRootNode
#brief Blends linearly between three [AnimationNode] of any type placed in a 2D space.
#desc A resource to add to an [AnimationNodeBlendTree].
#desc This node allows you to blend linearly between three animations using a [Vector2] weight.
#desc You can add vertices to the blend space with [method add_blend_point] and automatically triangulate it by setting [member auto_triangles] to [code]true[/code]. Otherwise, use [method add_triangle] and [method remove_triangle] to create up the blend space by hand.
#tutorial [AnimationTree] https://docs.godotengine.org/en/stable/tutorials/animation/animation_tree.html
#tutorial [Third Person Shooter Demo] https://godotengine.org/asset-library/asset/678
class_name AnimationNodeBlendSpace2D

#desc Emitted every time the blend space's triangles are created, removed, or when one of their vertices changes position.
signal triangles_updated
#desc The interpolation between animations is linear.
#desc The blend space plays the animation of the node the blending position is closest to. Useful for frame-by-frame 2D animations.
#desc Similar to [constant BLEND_MODE_DISCRETE], but starts the new animation at the last animation's playback position.

#enum BlendMode
enum {
    BLEND_MODE_INTERPOLATED = 0,
    BLEND_MODE_DISCRETE = 1,
    BLEND_MODE_DISCRETE_CARRY = 2,
}
#desc If [code]true[/code], the blend space is triangulated automatically. The mesh updates every time you add or remove points with [method add_blend_point] and [method remove_blend_point].
var auto_triangles: bool:
	get = get_auto_triangles, set = set_auto_triangles

#desc Controls the interpolation between animations. See [enum BlendMode] constants.
var blend_mode: int:
	get = get_blend_mode, set = set_blend_mode

#desc The blend space's X and Y axes' upper limit for the points' position. See [method add_blend_point].
var max_space: Vector2:
	get = get_max_space, set = set_max_space

#desc The blend space's X and Y axes' lower limit for the points' position. See [method add_blend_point].
var min_space: Vector2:
	get = get_min_space, set = set_min_space

#desc Position increment to snap to when moving a point.
var snap: Vector2:
	get = get_snap, set = set_snap

#desc If [code]false[/code], the blended animations' frame are stopped when the blend value is [code]0[/code].
#desc If [code]true[/code], forcing the blended animations to advance frame.
var sync: bool:
	get = is_using_sync, set = set_use_sync

#desc Name of the blend space's X axis.
var x_label: String:
	get = get_x_label, set = set_x_label

#desc Name of the blend space's Y axis.
var y_label: String:
	get = get_y_label, set = set_y_label



#desc Adds a new point that represents a [param node] at the position set by [param pos]. You can insert it at a specific index using the [param at_index] argument. If you use the default value for [param at_index], the point is inserted at the end of the blend points array.
func add_blend_point(node: AnimationRootNode, pos: Vector2, at_index: int = -1) -> void:
	pass;

#desc Creates a new triangle using three points [param x], [param y], and [param z]. Triangles can overlap. You can insert the triangle at a specific index using the [param at_index] argument. If you use the default value for [param at_index], the point is inserted at the end of the blend points array.
func add_triangle(x: int, y: int, z: int, at_index: int = -1) -> void:
	pass;

#desc Returns the number of points in the blend space.
func get_blend_point_count() -> int:
	pass;

#desc Returns the [AnimationRootNode] referenced by the point at index [param point].
func get_blend_point_node(point: int) -> AnimationRootNode:
	pass;

#desc Returns the position of the point at index [param point].
func get_blend_point_position(point: int) -> Vector2:
	pass;

#desc Returns the number of triangles in the blend space.
func get_triangle_count() -> int:
	pass;

#desc Returns the position of the point at index [param point] in the triangle of index [param triangle].
func get_triangle_point(triangle: int, point: int) -> int:
	pass;

#desc Removes the point at index [param point] from the blend space.
func remove_blend_point(point: int) -> void:
	pass;

#desc Removes the triangle at index [param triangle] from the blend space.
func remove_triangle(triangle: int) -> void:
	pass;

#desc Changes the [AnimationNode] referenced by the point at index [param point].
func set_blend_point_node(point: int, node: AnimationRootNode) -> void:
	pass;

#desc Updates the position of the point at index [param point] on the blend axis.
func set_blend_point_position(point: int, pos: Vector2) -> void:
	pass;


func get_auto_triangles() -> bool:
	return auto_triangles

func set_auto_triangles(value: bool) -> void:
	auto_triangles = value

func get_blend_mode() -> int:
	return blend_mode

func set_blend_mode(value: int) -> void:
	blend_mode = value

func get_max_space() -> Vector2:
	return max_space

func set_max_space(value: Vector2) -> void:
	max_space = value

func get_min_space() -> Vector2:
	return min_space

func set_min_space(value: Vector2) -> void:
	min_space = value

func get_snap() -> Vector2:
	return snap

func set_snap(value: Vector2) -> void:
	snap = value

func is_using_sync() -> bool:
	return sync

func set_use_sync(value: bool) -> void:
	sync = value

func get_x_label() -> String:
	return x_label

func set_x_label(value: String) -> void:
	x_label = value

func get_y_label() -> String:
	return y_label

func set_y_label(value: String) -> void:
	y_label = value

