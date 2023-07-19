extends AnimationRootNode
#brief Blends linearly between two of any number of [AnimationNode] of any type placed on a virtual axis.
#desc A resource to add to an [AnimationNodeBlendTree].
#desc This is a virtual axis on which you can add any type of [AnimationNode] using [method add_blend_point].
#desc Outputs the linear blend of the two [AnimationNode]s closest to the node's current value.
#desc You can set the extents of the axis using the [member min_space] and [member max_space].
#tutorial [AnimationTree] https://docs.godotengine.org/en/stable/tutorials/animation/animation_tree.html
class_name AnimationNodeBlendSpace1D

#desc The interpolation between animations is linear.
#desc The blend space plays the animation of the node the blending position is closest to. Useful for frame-by-frame 2D animations.
#desc Similar to [constant BLEND_MODE_DISCRETE], but starts the new animation at the last animation's playback position.

#enum BlendMode
enum {
    BLEND_MODE_INTERPOLATED = 0,
    BLEND_MODE_DISCRETE = 1,
    BLEND_MODE_DISCRETE_CARRY = 2,
}
#desc Controls the interpolation between animations. See [enum BlendMode] constants.
var blend_mode: int:
	get = get_blend_mode, set = set_blend_mode

#desc The blend space's axis's upper limit for the points' position. See [method add_blend_point].
var max_space: float:
	get = get_max_space, set = set_max_space

#desc The blend space's axis's lower limit for the points' position. See [method add_blend_point].
var min_space: float:
	get = get_min_space, set = set_min_space

#desc Position increment to snap to when moving a point on the axis.
var snap: float:
	get = get_snap, set = set_snap

#desc If [code]false[/code], the blended animations' frame are stopped when the blend value is [code]0[/code].
#desc If [code]true[/code], forcing the blended animations to advance frame.
var sync: bool:
	get = is_using_sync, set = set_use_sync

#desc Label of the virtual axis of the blend space.
var value_label: String:
	get = get_value_label, set = set_value_label



#desc Adds a new point that represents a [param node] on the virtual axis at a given position set by [param pos]. You can insert it at a specific index using the [param at_index] argument. If you use the default value for [param at_index], the point is inserted at the end of the blend points array.
func add_blend_point(node: AnimationRootNode, pos: float, at_index: int = -1) -> void:
	pass;

#desc Returns the number of points on the blend axis.
func get_blend_point_count() -> int:
	pass;

#desc Returns the [AnimationNode] referenced by the point at index [param point].
func get_blend_point_node(point: int) -> AnimationRootNode:
	pass;

#desc Returns the position of the point at index [param point].
func get_blend_point_position(point: int) -> float:
	pass;

#desc Removes the point at index [param point] from the blend axis.
func remove_blend_point(point: int) -> void:
	pass;

#desc Changes the [AnimationNode] referenced by the point at index [param point].
func set_blend_point_node(point: int, node: AnimationRootNode) -> void:
	pass;

#desc Updates the position of the point at index [param point] on the blend axis.
func set_blend_point_position(point: int, pos: float) -> void:
	pass;


func get_blend_mode() -> int:
	return blend_mode

func set_blend_mode(value: int) -> void:
	blend_mode = value

func get_max_space() -> float:
	return max_space

func set_max_space(value: float) -> void:
	max_space = value

func get_min_space() -> float:
	return min_space

func set_min_space(value: float) -> void:
	min_space = value

func get_snap() -> float:
	return snap

func set_snap(value: float) -> void:
	snap = value

func is_using_sync() -> bool:
	return sync

func set_use_sync(value: bool) -> void:
	sync = value

func get_value_label() -> String:
	return value_label

func set_value_label(value: String) -> void:
	value_label = value

