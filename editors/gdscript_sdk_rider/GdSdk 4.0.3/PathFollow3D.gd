extends Node3D
#brief Point sampler for a [Path3D].
#desc This node takes its parent [Path3D], and returns the coordinates of a point within it, given a distance from the first vertex.
#desc It is useful for making other nodes follow a path, without coding the movement pattern. For that, the nodes must be children of this node. The descendant nodes will then move accordingly when setting the [member progress] in this node.
class_name PathFollow3D

#desc Forbids the PathFollow3D to rotate.
#desc Allows the PathFollow3D to rotate in the Y axis only.
#desc Allows the PathFollow3D to rotate in both the X, and Y axes.
#desc Allows the PathFollow3D to rotate in any axis.
#desc Uses the up vector information in a [Curve3D] to enforce orientation. This rotation mode requires the [Path3D]'s [member Curve3D.up_vector_enabled] property to be set to [code]true[/code].

#enum RotationMode
enum {
    ROTATION_NONE = 0,
    ROTATION_Y = 1,
    ROTATION_XY = 2,
    ROTATION_XYZ = 3,
    ROTATION_ORIENTED = 4,
}
#desc If [code]true[/code], the position between two cached points is interpolated cubically, and linearly otherwise.
#desc The points along the [Curve3D] of the [Path3D] are precomputed before use, for faster calculations. The point at the requested offset is then calculated interpolating between two adjacent cached points. This may present a problem if the curve makes sharp turns, as the cached points may not follow the curve closely enough.
#desc There are two answers to this problem: either increase the number of cached points and increase memory consumption, or make a cubic interpolation between two points at the cost of (slightly) slower calculations.
var cubic_interp: bool:
	get = get_cubic_interpolation, set = set_cubic_interpolation

#desc The node's offset along the curve.
var h_offset: float:
	get = get_h_offset, set = set_h_offset

#desc If [code]true[/code], any offset outside the path's length will wrap around, instead of stopping at the ends. Use it for cyclic paths.
var loop: bool:
	get = has_loop, set = set_loop

#desc The distance from the first vertex, measured in 3D units along the path. Changing this value sets this node's position to a point within the path.
var progress: float:
	get = get_progress, set = set_progress

#desc The distance from the first vertex, considering 0.0 as the first vertex and 1.0 as the last. This is just another way of expressing the progress within the path, as the progress supplied is multiplied internally by the path's length.
var progress_ratio: float:
	get = get_progress_ratio, set = set_progress_ratio

#desc Allows or forbids rotation on one or more axes, depending on the [enum RotationMode] constants being used.
var rotation_mode: int:
	get = get_rotation_mode, set = set_rotation_mode

#desc If [code]true[/code], the tilt property of [Curve3D] takes effect.
var tilt_enabled: bool:
	get = is_tilt_enabled, set = set_tilt_enabled

#desc The node's offset perpendicular to the curve.
var v_offset: float:
	get = get_v_offset, set = set_v_offset



#desc Correct the [code]transform[/code]. [code]rotation_mode[/code] implicitly specifies how posture (forward, up and sideway direction) is calculated.
static func correct_posture(transform: Transform3D, rotation_mode: int) -> Transform3D:
	pass;


func get_cubic_interpolation() -> bool:
	return cubic_interp

func set_cubic_interpolation(value: bool) -> void:
	cubic_interp = value

func get_h_offset() -> float:
	return h_offset

func set_h_offset(value: float) -> void:
	h_offset = value

func has_loop() -> bool:
	return loop

func set_loop(value: bool) -> void:
	loop = value

func get_progress() -> float:
	return progress

func set_progress(value: float) -> void:
	progress = value

func get_progress_ratio() -> float:
	return progress_ratio

func set_progress_ratio(value: float) -> void:
	progress_ratio = value

func get_rotation_mode() -> int:
	return rotation_mode

func set_rotation_mode(value: int) -> void:
	rotation_mode = value

func is_tilt_enabled() -> bool:
	return tilt_enabled

func set_tilt_enabled(value: bool) -> void:
	tilt_enabled = value

func get_v_offset() -> float:
	return v_offset

func set_v_offset(value: float) -> void:
	v_offset = value

