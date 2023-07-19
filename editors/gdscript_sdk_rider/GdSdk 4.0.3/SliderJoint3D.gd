extends Joint3D
#brief Slider between two PhysicsBodies in 3D.
#desc Slides across the X axis of the pivot object. See also [Generic6DOFJoint3D].
class_name SliderJoint3D

#desc The maximum difference between the pivot points on their X axis before damping happens.
#desc The minimum difference between the pivot points on their X axis before damping happens.
#desc A factor applied to the movement across the slider axis once the limits get surpassed. The lower, the slower the movement.
#desc The amount of restitution once the limits are surpassed. The lower, the more velocityenergy gets lost.
#desc The amount of damping once the slider limits are surpassed.
#desc A factor applied to the movement across the slider axis as long as the slider is in the limits. The lower, the slower the movement.
#desc The amount of restitution inside the slider limits.
#desc The amount of damping inside the slider limits.
#desc A factor applied to the movement across axes orthogonal to the slider.
#desc The amount of restitution when movement is across axes orthogonal to the slider.
#desc The amount of damping when movement is across axes orthogonal to the slider.
#desc The upper limit of rotation in the slider.
#desc The lower limit of rotation in the slider.
#desc A factor applied to the all rotation once the limit is surpassed.
#desc The amount of restitution of the rotation when the limit is surpassed.
#desc The amount of damping of the rotation when the limit is surpassed.
#desc A factor applied to the all rotation in the limits.
#desc The amount of restitution of the rotation in the limits.
#desc The amount of damping of the rotation in the limits.
#desc A factor applied to the all rotation across axes orthogonal to the slider.
#desc The amount of restitution of the rotation across axes orthogonal to the slider.
#desc The amount of damping of the rotation across axes orthogonal to the slider.
#desc Represents the size of the [enum Param] enum.

#enum Param
enum {
    PARAM_LINEAR_LIMIT_UPPER = 0,
    PARAM_LINEAR_LIMIT_LOWER = 1,
    PARAM_LINEAR_LIMIT_SOFTNESS = 2,
    PARAM_LINEAR_LIMIT_RESTITUTION = 3,
    PARAM_LINEAR_LIMIT_DAMPING = 4,
    PARAM_LINEAR_MOTION_SOFTNESS = 5,
    PARAM_LINEAR_MOTION_RESTITUTION = 6,
    PARAM_LINEAR_MOTION_DAMPING = 7,
    PARAM_LINEAR_ORTHOGONAL_SOFTNESS = 8,
    PARAM_LINEAR_ORTHOGONAL_RESTITUTION = 9,
    PARAM_LINEAR_ORTHOGONAL_DAMPING = 10,
    PARAM_ANGULAR_LIMIT_UPPER = 11,
    PARAM_ANGULAR_LIMIT_LOWER = 12,
    PARAM_ANGULAR_LIMIT_SOFTNESS = 13,
    PARAM_ANGULAR_LIMIT_RESTITUTION = 14,
    PARAM_ANGULAR_LIMIT_DAMPING = 15,
    PARAM_ANGULAR_MOTION_SOFTNESS = 16,
    PARAM_ANGULAR_MOTION_RESTITUTION = 17,
    PARAM_ANGULAR_MOTION_DAMPING = 18,
    PARAM_ANGULAR_ORTHOGONAL_SOFTNESS = 19,
    PARAM_ANGULAR_ORTHOGONAL_RESTITUTION = 20,
    PARAM_ANGULAR_ORTHOGONAL_DAMPING = 21,
    PARAM_MAX = 22,
}
#desc The amount of damping of the rotation when the limit is surpassed.
#desc A lower damping value allows a rotation initiated by body A to travel to body B slower.
var angular_limit/damping: float:
	get = get_param, set = set_param

#desc The lower limit of rotation in the slider.
var angular_limit/lower_angle: float:
	get = get_param, set = set_param

#desc The amount of restitution of the rotation when the limit is surpassed.
#desc Does not affect damping.
var angular_limit/restitution: float:
	get = get_param, set = set_param

#desc A factor applied to the all rotation once the limit is surpassed.
#desc Makes all rotation slower when between 0 and 1.
var angular_limit/softness: float:
	get = get_param, set = set_param

#desc The upper limit of rotation in the slider.
var angular_limit/upper_angle: float:
	get = get_param, set = set_param

#desc The amount of damping of the rotation in the limits.
var angular_motion/damping: float:
	get = get_param, set = set_param

#desc The amount of restitution of the rotation in the limits.
var angular_motion/restitution: float:
	get = get_param, set = set_param

#desc A factor applied to the all rotation in the limits.
var angular_motion/softness: float:
	get = get_param, set = set_param

#desc The amount of damping of the rotation across axes orthogonal to the slider.
var angular_ortho/damping: float:
	get = get_param, set = set_param

#desc The amount of restitution of the rotation across axes orthogonal to the slider.
var angular_ortho/restitution: float:
	get = get_param, set = set_param

#desc A factor applied to the all rotation across axes orthogonal to the slider.
var angular_ortho/softness: float:
	get = get_param, set = set_param

#desc The amount of damping that happens once the limit defined by [member linear_limit/lower_distance] and [member linear_limit/upper_distance] is surpassed.
var linear_limit/damping: float:
	get = get_param, set = set_param

#desc The minimum difference between the pivot points on their X axis before damping happens.
var linear_limit/lower_distance: float:
	get = get_param, set = set_param

#desc The amount of restitution once the limits are surpassed. The lower, the more velocity-energy gets lost.
var linear_limit/restitution: float:
	get = get_param, set = set_param

#desc A factor applied to the movement across the slider axis once the limits get surpassed. The lower, the slower the movement.
var linear_limit/softness: float:
	get = get_param, set = set_param

#desc The maximum difference between the pivot points on their X axis before damping happens.
var linear_limit/upper_distance: float:
	get = get_param, set = set_param

#desc The amount of damping inside the slider limits.
var linear_motion/damping: float:
	get = get_param, set = set_param

#desc The amount of restitution inside the slider limits.
var linear_motion/restitution: float:
	get = get_param, set = set_param

#desc A factor applied to the movement across the slider axis as long as the slider is in the limits. The lower, the slower the movement.
var linear_motion/softness: float:
	get = get_param, set = set_param

#desc The amount of damping when movement is across axes orthogonal to the slider.
var linear_ortho/damping: float:
	get = get_param, set = set_param

#desc The amount of restitution when movement is across axes orthogonal to the slider.
var linear_ortho/restitution: float:
	get = get_param, set = set_param

#desc A factor applied to the movement across axes orthogonal to the slider.
var linear_ortho/softness: float:
	get = get_param, set = set_param



func get_param(param: int) -> float:
	pass;

func set_param(param: int, value: float) -> void:
	pass;


func get_param() -> float:
	return angular_limit/damping

func set_param(value: float) -> void:
	angular_limit/damping = value

func get_param() -> float:
	return angular_limit/lower_angle

func set_param(value: float) -> void:
	angular_limit/lower_angle = value

func get_param() -> float:
	return angular_limit/restitution

func set_param(value: float) -> void:
	angular_limit/restitution = value

func get_param() -> float:
	return angular_limit/softness

func set_param(value: float) -> void:
	angular_limit/softness = value

func get_param() -> float:
	return angular_limit/upper_angle

func set_param(value: float) -> void:
	angular_limit/upper_angle = value

func get_param() -> float:
	return angular_motion/damping

func set_param(value: float) -> void:
	angular_motion/damping = value

func get_param() -> float:
	return angular_motion/restitution

func set_param(value: float) -> void:
	angular_motion/restitution = value

func get_param() -> float:
	return angular_motion/softness

func set_param(value: float) -> void:
	angular_motion/softness = value

func get_param() -> float:
	return angular_ortho/damping

func set_param(value: float) -> void:
	angular_ortho/damping = value

func get_param() -> float:
	return angular_ortho/restitution

func set_param(value: float) -> void:
	angular_ortho/restitution = value

func get_param() -> float:
	return angular_ortho/softness

func set_param(value: float) -> void:
	angular_ortho/softness = value

func get_param() -> float:
	return linear_limit/damping

func set_param(value: float) -> void:
	linear_limit/damping = value

func get_param() -> float:
	return linear_limit/lower_distance

func set_param(value: float) -> void:
	linear_limit/lower_distance = value

func get_param() -> float:
	return linear_limit/restitution

func set_param(value: float) -> void:
	linear_limit/restitution = value

func get_param() -> float:
	return linear_limit/softness

func set_param(value: float) -> void:
	linear_limit/softness = value

func get_param() -> float:
	return linear_limit/upper_distance

func set_param(value: float) -> void:
	linear_limit/upper_distance = value

func get_param() -> float:
	return linear_motion/damping

func set_param(value: float) -> void:
	linear_motion/damping = value

func get_param() -> float:
	return linear_motion/restitution

func set_param(value: float) -> void:
	linear_motion/restitution = value

func get_param() -> float:
	return linear_motion/softness

func set_param(value: float) -> void:
	linear_motion/softness = value

func get_param() -> float:
	return linear_ortho/damping

func set_param(value: float) -> void:
	linear_ortho/damping = value

func get_param() -> float:
	return linear_ortho/restitution

func set_param(value: float) -> void:
	linear_ortho/restitution = value

func get_param() -> float:
	return linear_ortho/softness

func set_param(value: float) -> void:
	linear_ortho/softness = value

