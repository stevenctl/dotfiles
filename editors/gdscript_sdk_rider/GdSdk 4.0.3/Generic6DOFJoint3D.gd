extends Joint3D
#brief The generic 6-degrees-of-freedom joint can implement a variety of joint types by locking certain axes' rotation or translation.
#desc The first 3 DOF axes are linear axes, which represent translation of Bodies, and the latter 3 DOF axes represent the angular motion. Each axis can be either locked, or limited.
class_name Generic6DOFJoint3D

#desc The minimum difference between the pivot points' axes.
#desc The maximum difference between the pivot points' axes.
#desc A factor applied to the movement across the axes. The lower, the slower the movement.
#desc The amount of restitution on the axes' movement. The lower, the more momentum gets lost.
#desc The amount of damping that happens at the linear motion across the axes.
#desc The velocity the linear motor will try to reach.
#desc The maximum force the linear motor will apply while trying to reach the velocity target.
#desc The minimum rotation in negative direction to break loose and rotate around the axes.
#desc The minimum rotation in positive direction to break loose and rotate around the axes.
#desc The speed of all rotations across the axes.
#desc The amount of rotational damping across the axes. The lower, the more damping occurs.
#desc The amount of rotational restitution across the axes. The lower, the more restitution occurs.
#desc The maximum amount of force that can occur, when rotating around the axes.
#desc When rotating across the axes, this error tolerance factor defines how much the correction gets slowed down. The lower, the slower.
#desc Target speed for the motor at the axes.
#desc Maximum acceleration for the motor at the axes.
#desc Represents the size of the [enum Param] enum.
#desc If enabled, linear motion is possible within the given limits.
#desc If enabled, rotational motion is possible within the given limits.
#desc If enabled, there is a rotational motor across these axes.
#desc If enabled, there is a linear motor across these axes.
#desc Represents the size of the [enum Flag] enum.

#enum Param
enum {
    PARAM_LINEAR_LOWER_LIMIT = 0,
    PARAM_LINEAR_UPPER_LIMIT = 1,
    PARAM_LINEAR_LIMIT_SOFTNESS = 2,
    PARAM_LINEAR_RESTITUTION = 3,
    PARAM_LINEAR_DAMPING = 4,
    PARAM_LINEAR_MOTOR_TARGET_VELOCITY = 5,
    PARAM_LINEAR_MOTOR_FORCE_LIMIT = 6,
    PARAM_LINEAR_SPRING_STIFFNESS = 7,
    PARAM_LINEAR_SPRING_DAMPING = 8,
    PARAM_LINEAR_SPRING_EQUILIBRIUM_POINT = 9,
    PARAM_ANGULAR_LOWER_LIMIT = 10,
    PARAM_ANGULAR_UPPER_LIMIT = 11,
    PARAM_ANGULAR_LIMIT_SOFTNESS = 12,
    PARAM_ANGULAR_DAMPING = 13,
    PARAM_ANGULAR_RESTITUTION = 14,
    PARAM_ANGULAR_FORCE_LIMIT = 15,
    PARAM_ANGULAR_ERP = 16,
    PARAM_ANGULAR_MOTOR_TARGET_VELOCITY = 17,
    PARAM_ANGULAR_MOTOR_FORCE_LIMIT = 18,
    PARAM_ANGULAR_SPRING_STIFFNESS = 19,
    PARAM_ANGULAR_SPRING_DAMPING = 20,
    PARAM_ANGULAR_SPRING_EQUILIBRIUM_POINT = 21,
    PARAM_MAX = 22,
}
#enum Flag
enum {
    FLAG_ENABLE_LINEAR_LIMIT = 0,
    FLAG_ENABLE_ANGULAR_LIMIT = 1,
    FLAG_ENABLE_LINEAR_SPRING = 3,
    FLAG_ENABLE_ANGULAR_SPRING = 2,
    FLAG_ENABLE_MOTOR = 4,
    FLAG_ENABLE_LINEAR_MOTOR = 5,
    FLAG_MAX = 6,
}
#desc The amount of rotational damping across the X axis.
#desc The lower, the longer an impulse from one side takes to travel to the other side.
var angular_limit_x/damping: float:
	get = get_param_x, set = set_param_x

#desc If [code]true[/code], rotation across the X axis is limited.
var angular_limit_x/enabled: bool:
	get = get_flag_x, set = set_flag_x

#desc When rotating across the X axis, this error tolerance factor defines how much the correction gets slowed down. The lower, the slower.
var angular_limit_x/erp: float:
	get = get_param_x, set = set_param_x

#desc The maximum amount of force that can occur, when rotating around the X axis.
var angular_limit_x/force_limit: float:
	get = get_param_x, set = set_param_x

#desc The minimum rotation in negative direction to break loose and rotate around the X axis.
var angular_limit_x/lower_angle: float:
	get = get_param_x, set = set_param_x

#desc The amount of rotational restitution across the X axis. The lower, the more restitution occurs.
var angular_limit_x/restitution: float:
	get = get_param_x, set = set_param_x

#desc The speed of all rotations across the X axis.
var angular_limit_x/softness: float:
	get = get_param_x, set = set_param_x

#desc The minimum rotation in positive direction to break loose and rotate around the X axis.
var angular_limit_x/upper_angle: float:
	get = get_param_x, set = set_param_x

#desc The amount of rotational damping across the Y axis. The lower, the more damping occurs.
var angular_limit_y/damping: float:
	get = get_param_y, set = set_param_y

#desc If [code]true[/code], rotation across the Y axis is limited.
var angular_limit_y/enabled: bool:
	get = get_flag_y, set = set_flag_y

#desc When rotating across the Y axis, this error tolerance factor defines how much the correction gets slowed down. The lower, the slower.
var angular_limit_y/erp: float:
	get = get_param_y, set = set_param_y

#desc The maximum amount of force that can occur, when rotating around the Y axis.
var angular_limit_y/force_limit: float:
	get = get_param_y, set = set_param_y

#desc The minimum rotation in negative direction to break loose and rotate around the Y axis.
var angular_limit_y/lower_angle: float:
	get = get_param_y, set = set_param_y

#desc The amount of rotational restitution across the Y axis. The lower, the more restitution occurs.
var angular_limit_y/restitution: float:
	get = get_param_y, set = set_param_y

#desc The speed of all rotations across the Y axis.
var angular_limit_y/softness: float:
	get = get_param_y, set = set_param_y

#desc The minimum rotation in positive direction to break loose and rotate around the Y axis.
var angular_limit_y/upper_angle: float:
	get = get_param_y, set = set_param_y

#desc The amount of rotational damping across the Z axis. The lower, the more damping occurs.
var angular_limit_z/damping: float:
	get = get_param_z, set = set_param_z

#desc If [code]true[/code], rotation across the Z axis is limited.
var angular_limit_z/enabled: bool:
	get = get_flag_z, set = set_flag_z

#desc When rotating across the Z axis, this error tolerance factor defines how much the correction gets slowed down. The lower, the slower.
var angular_limit_z/erp: float:
	get = get_param_z, set = set_param_z

#desc The maximum amount of force that can occur, when rotating around the Z axis.
var angular_limit_z/force_limit: float:
	get = get_param_z, set = set_param_z

#desc The minimum rotation in negative direction to break loose and rotate around the Z axis.
var angular_limit_z/lower_angle: float:
	get = get_param_z, set = set_param_z

#desc The amount of rotational restitution across the Z axis. The lower, the more restitution occurs.
var angular_limit_z/restitution: float:
	get = get_param_z, set = set_param_z

#desc The speed of all rotations across the Z axis.
var angular_limit_z/softness: float:
	get = get_param_z, set = set_param_z

#desc The minimum rotation in positive direction to break loose and rotate around the Z axis.
var angular_limit_z/upper_angle: float:
	get = get_param_z, set = set_param_z

#desc If [code]true[/code], a rotating motor at the X axis is enabled.
var angular_motor_x/enabled: bool:
	get = get_flag_x, set = set_flag_x

#desc Maximum acceleration for the motor at the X axis.
var angular_motor_x/force_limit: float:
	get = get_param_x, set = set_param_x

#desc Target speed for the motor at the X axis.
var angular_motor_x/target_velocity: float:
	get = get_param_x, set = set_param_x

#desc If [code]true[/code], a rotating motor at the Y axis is enabled.
var angular_motor_y/enabled: bool:
	get = get_flag_y, set = set_flag_y

#desc Maximum acceleration for the motor at the Y axis.
var angular_motor_y/force_limit: float:
	get = get_param_y, set = set_param_y

#desc Target speed for the motor at the Y axis.
var angular_motor_y/target_velocity: float:
	get = get_param_y, set = set_param_y

#desc If [code]true[/code], a rotating motor at the Z axis is enabled.
var angular_motor_z/enabled: bool:
	get = get_flag_z, set = set_flag_z

#desc Maximum acceleration for the motor at the Z axis.
var angular_motor_z/force_limit: float:
	get = get_param_z, set = set_param_z

#desc Target speed for the motor at the Z axis.
var angular_motor_z/target_velocity: float:
	get = get_param_z, set = set_param_z

var angular_spring_x/damping: float:
	get = get_param_x, set = set_param_x

var angular_spring_x/enabled: bool:
	get = get_flag_x, set = set_flag_x

var angular_spring_x/equilibrium_point: float:
	get = get_param_x, set = set_param_x

var angular_spring_x/stiffness: float:
	get = get_param_x, set = set_param_x

var angular_spring_y/damping: float:
	get = get_param_y, set = set_param_y

var angular_spring_y/enabled: bool:
	get = get_flag_y, set = set_flag_y

var angular_spring_y/equilibrium_point: float:
	get = get_param_y, set = set_param_y

var angular_spring_y/stiffness: float:
	get = get_param_y, set = set_param_y

var angular_spring_z/damping: float:
	get = get_param_z, set = set_param_z

var angular_spring_z/enabled: bool:
	get = get_flag_z, set = set_flag_z

var angular_spring_z/equilibrium_point: float:
	get = get_param_z, set = set_param_z

var angular_spring_z/stiffness: float:
	get = get_param_z, set = set_param_z

#desc The amount of damping that happens at the X motion.
var linear_limit_x/damping: float:
	get = get_param_x, set = set_param_x

#desc If [code]true[/code], the linear motion across the X axis is limited.
var linear_limit_x/enabled: bool:
	get = get_flag_x, set = set_flag_x

#desc The minimum difference between the pivot points' X axis.
var linear_limit_x/lower_distance: float:
	get = get_param_x, set = set_param_x

#desc The amount of restitution on the X axis movement. The lower, the more momentum gets lost.
var linear_limit_x/restitution: float:
	get = get_param_x, set = set_param_x

#desc A factor applied to the movement across the X axis. The lower, the slower the movement.
var linear_limit_x/softness: float:
	get = get_param_x, set = set_param_x

#desc The maximum difference between the pivot points' X axis.
var linear_limit_x/upper_distance: float:
	get = get_param_x, set = set_param_x

#desc The amount of damping that happens at the Y motion.
var linear_limit_y/damping: float:
	get = get_param_y, set = set_param_y

#desc If [code]true[/code], the linear motion across the Y axis is limited.
var linear_limit_y/enabled: bool:
	get = get_flag_y, set = set_flag_y

#desc The minimum difference between the pivot points' Y axis.
var linear_limit_y/lower_distance: float:
	get = get_param_y, set = set_param_y

#desc The amount of restitution on the Y axis movement. The lower, the more momentum gets lost.
var linear_limit_y/restitution: float:
	get = get_param_y, set = set_param_y

#desc A factor applied to the movement across the Y axis. The lower, the slower the movement.
var linear_limit_y/softness: float:
	get = get_param_y, set = set_param_y

#desc The maximum difference between the pivot points' Y axis.
var linear_limit_y/upper_distance: float:
	get = get_param_y, set = set_param_y

#desc The amount of damping that happens at the Z motion.
var linear_limit_z/damping: float:
	get = get_param_z, set = set_param_z

#desc If [code]true[/code], the linear motion across the Z axis is limited.
var linear_limit_z/enabled: bool:
	get = get_flag_z, set = set_flag_z

#desc The minimum difference between the pivot points' Z axis.
var linear_limit_z/lower_distance: float:
	get = get_param_z, set = set_param_z

#desc The amount of restitution on the Z axis movement. The lower, the more momentum gets lost.
var linear_limit_z/restitution: float:
	get = get_param_z, set = set_param_z

#desc A factor applied to the movement across the Z axis. The lower, the slower the movement.
var linear_limit_z/softness: float:
	get = get_param_z, set = set_param_z

#desc The maximum difference between the pivot points' Z axis.
var linear_limit_z/upper_distance: float:
	get = get_param_z, set = set_param_z

#desc If [code]true[/code], then there is a linear motor on the X axis. It will attempt to reach the target velocity while staying within the force limits.
var linear_motor_x/enabled: bool:
	get = get_flag_x, set = set_flag_x

#desc The maximum force the linear motor can apply on the X axis while trying to reach the target velocity.
var linear_motor_x/force_limit: float:
	get = get_param_x, set = set_param_x

#desc The speed that the linear motor will attempt to reach on the X axis.
var linear_motor_x/target_velocity: float:
	get = get_param_x, set = set_param_x

#desc If [code]true[/code], then there is a linear motor on the Y axis. It will attempt to reach the target velocity while staying within the force limits.
var linear_motor_y/enabled: bool:
	get = get_flag_y, set = set_flag_y

#desc The maximum force the linear motor can apply on the Y axis while trying to reach the target velocity.
var linear_motor_y/force_limit: float:
	get = get_param_y, set = set_param_y

#desc The speed that the linear motor will attempt to reach on the Y axis.
var linear_motor_y/target_velocity: float:
	get = get_param_y, set = set_param_y

#desc If [code]true[/code], then there is a linear motor on the Z axis. It will attempt to reach the target velocity while staying within the force limits.
var linear_motor_z/enabled: bool:
	get = get_flag_z, set = set_flag_z

#desc The maximum force the linear motor can apply on the Z axis while trying to reach the target velocity.
var linear_motor_z/force_limit: float:
	get = get_param_z, set = set_param_z

#desc The speed that the linear motor will attempt to reach on the Z axis.
var linear_motor_z/target_velocity: float:
	get = get_param_z, set = set_param_z

var linear_spring_x/damping: float:
	get = get_param_x, set = set_param_x

var linear_spring_x/enabled: bool:
	get = get_flag_x, set = set_flag_x

var linear_spring_x/equilibrium_point: float:
	get = get_param_x, set = set_param_x

var linear_spring_x/stiffness: float:
	get = get_param_x, set = set_param_x

var linear_spring_y/damping: float:
	get = get_param_y, set = set_param_y

var linear_spring_y/enabled: bool:
	get = get_flag_y, set = set_flag_y

var linear_spring_y/equilibrium_point: float:
	get = get_param_y, set = set_param_y

var linear_spring_y/stiffness: float:
	get = get_param_y, set = set_param_y

var linear_spring_z/damping: float:
	get = get_param_z, set = set_param_z

var linear_spring_z/enabled: bool:
	get = get_flag_z, set = set_flag_z

var linear_spring_z/equilibrium_point: float:
	get = get_param_z, set = set_param_z

var linear_spring_z/stiffness: float:
	get = get_param_z, set = set_param_z



func get_flag_x(flag: int) -> bool:
	pass;

func get_flag_y(flag: int) -> bool:
	pass;

func get_flag_z(flag: int) -> bool:
	pass;

func get_param_x(param: int) -> float:
	pass;

func get_param_y(param: int) -> float:
	pass;

func get_param_z(param: int) -> float:
	pass;

func set_flag_x(flag: int, value: bool) -> void:
	pass;

func set_flag_y(flag: int, value: bool) -> void:
	pass;

func set_flag_z(flag: int, value: bool) -> void:
	pass;

func set_param_x(param: int, value: float) -> void:
	pass;

func set_param_y(param: int, value: float) -> void:
	pass;

func set_param_z(param: int, value: float) -> void:
	pass;


func get_param_x() -> float:
	return angular_limit_x/damping

func set_param_x(value: float) -> void:
	angular_limit_x/damping = value

func get_flag_x() -> bool:
	return angular_limit_x/enabled

func set_flag_x(value: bool) -> void:
	angular_limit_x/enabled = value

func get_param_x() -> float:
	return angular_limit_x/erp

func set_param_x(value: float) -> void:
	angular_limit_x/erp = value

func get_param_x() -> float:
	return angular_limit_x/force_limit

func set_param_x(value: float) -> void:
	angular_limit_x/force_limit = value

func get_param_x() -> float:
	return angular_limit_x/lower_angle

func set_param_x(value: float) -> void:
	angular_limit_x/lower_angle = value

func get_param_x() -> float:
	return angular_limit_x/restitution

func set_param_x(value: float) -> void:
	angular_limit_x/restitution = value

func get_param_x() -> float:
	return angular_limit_x/softness

func set_param_x(value: float) -> void:
	angular_limit_x/softness = value

func get_param_x() -> float:
	return angular_limit_x/upper_angle

func set_param_x(value: float) -> void:
	angular_limit_x/upper_angle = value

func get_param_y() -> float:
	return angular_limit_y/damping

func set_param_y(value: float) -> void:
	angular_limit_y/damping = value

func get_flag_y() -> bool:
	return angular_limit_y/enabled

func set_flag_y(value: bool) -> void:
	angular_limit_y/enabled = value

func get_param_y() -> float:
	return angular_limit_y/erp

func set_param_y(value: float) -> void:
	angular_limit_y/erp = value

func get_param_y() -> float:
	return angular_limit_y/force_limit

func set_param_y(value: float) -> void:
	angular_limit_y/force_limit = value

func get_param_y() -> float:
	return angular_limit_y/lower_angle

func set_param_y(value: float) -> void:
	angular_limit_y/lower_angle = value

func get_param_y() -> float:
	return angular_limit_y/restitution

func set_param_y(value: float) -> void:
	angular_limit_y/restitution = value

func get_param_y() -> float:
	return angular_limit_y/softness

func set_param_y(value: float) -> void:
	angular_limit_y/softness = value

func get_param_y() -> float:
	return angular_limit_y/upper_angle

func set_param_y(value: float) -> void:
	angular_limit_y/upper_angle = value

func get_param_z() -> float:
	return angular_limit_z/damping

func set_param_z(value: float) -> void:
	angular_limit_z/damping = value

func get_flag_z() -> bool:
	return angular_limit_z/enabled

func set_flag_z(value: bool) -> void:
	angular_limit_z/enabled = value

func get_param_z() -> float:
	return angular_limit_z/erp

func set_param_z(value: float) -> void:
	angular_limit_z/erp = value

func get_param_z() -> float:
	return angular_limit_z/force_limit

func set_param_z(value: float) -> void:
	angular_limit_z/force_limit = value

func get_param_z() -> float:
	return angular_limit_z/lower_angle

func set_param_z(value: float) -> void:
	angular_limit_z/lower_angle = value

func get_param_z() -> float:
	return angular_limit_z/restitution

func set_param_z(value: float) -> void:
	angular_limit_z/restitution = value

func get_param_z() -> float:
	return angular_limit_z/softness

func set_param_z(value: float) -> void:
	angular_limit_z/softness = value

func get_param_z() -> float:
	return angular_limit_z/upper_angle

func set_param_z(value: float) -> void:
	angular_limit_z/upper_angle = value

func get_flag_x() -> bool:
	return angular_motor_x/enabled

func set_flag_x(value: bool) -> void:
	angular_motor_x/enabled = value

func get_param_x() -> float:
	return angular_motor_x/force_limit

func set_param_x(value: float) -> void:
	angular_motor_x/force_limit = value

func get_param_x() -> float:
	return angular_motor_x/target_velocity

func set_param_x(value: float) -> void:
	angular_motor_x/target_velocity = value

func get_flag_y() -> bool:
	return angular_motor_y/enabled

func set_flag_y(value: bool) -> void:
	angular_motor_y/enabled = value

func get_param_y() -> float:
	return angular_motor_y/force_limit

func set_param_y(value: float) -> void:
	angular_motor_y/force_limit = value

func get_param_y() -> float:
	return angular_motor_y/target_velocity

func set_param_y(value: float) -> void:
	angular_motor_y/target_velocity = value

func get_flag_z() -> bool:
	return angular_motor_z/enabled

func set_flag_z(value: bool) -> void:
	angular_motor_z/enabled = value

func get_param_z() -> float:
	return angular_motor_z/force_limit

func set_param_z(value: float) -> void:
	angular_motor_z/force_limit = value

func get_param_z() -> float:
	return angular_motor_z/target_velocity

func set_param_z(value: float) -> void:
	angular_motor_z/target_velocity = value

func get_param_x() -> float:
	return angular_spring_x/damping

func set_param_x(value: float) -> void:
	angular_spring_x/damping = value

func get_flag_x() -> bool:
	return angular_spring_x/enabled

func set_flag_x(value: bool) -> void:
	angular_spring_x/enabled = value

func get_param_x() -> float:
	return angular_spring_x/equilibrium_point

func set_param_x(value: float) -> void:
	angular_spring_x/equilibrium_point = value

func get_param_x() -> float:
	return angular_spring_x/stiffness

func set_param_x(value: float) -> void:
	angular_spring_x/stiffness = value

func get_param_y() -> float:
	return angular_spring_y/damping

func set_param_y(value: float) -> void:
	angular_spring_y/damping = value

func get_flag_y() -> bool:
	return angular_spring_y/enabled

func set_flag_y(value: bool) -> void:
	angular_spring_y/enabled = value

func get_param_y() -> float:
	return angular_spring_y/equilibrium_point

func set_param_y(value: float) -> void:
	angular_spring_y/equilibrium_point = value

func get_param_y() -> float:
	return angular_spring_y/stiffness

func set_param_y(value: float) -> void:
	angular_spring_y/stiffness = value

func get_param_z() -> float:
	return angular_spring_z/damping

func set_param_z(value: float) -> void:
	angular_spring_z/damping = value

func get_flag_z() -> bool:
	return angular_spring_z/enabled

func set_flag_z(value: bool) -> void:
	angular_spring_z/enabled = value

func get_param_z() -> float:
	return angular_spring_z/equilibrium_point

func set_param_z(value: float) -> void:
	angular_spring_z/equilibrium_point = value

func get_param_z() -> float:
	return angular_spring_z/stiffness

func set_param_z(value: float) -> void:
	angular_spring_z/stiffness = value

func get_param_x() -> float:
	return linear_limit_x/damping

func set_param_x(value: float) -> void:
	linear_limit_x/damping = value

func get_flag_x() -> bool:
	return linear_limit_x/enabled

func set_flag_x(value: bool) -> void:
	linear_limit_x/enabled = value

func get_param_x() -> float:
	return linear_limit_x/lower_distance

func set_param_x(value: float) -> void:
	linear_limit_x/lower_distance = value

func get_param_x() -> float:
	return linear_limit_x/restitution

func set_param_x(value: float) -> void:
	linear_limit_x/restitution = value

func get_param_x() -> float:
	return linear_limit_x/softness

func set_param_x(value: float) -> void:
	linear_limit_x/softness = value

func get_param_x() -> float:
	return linear_limit_x/upper_distance

func set_param_x(value: float) -> void:
	linear_limit_x/upper_distance = value

func get_param_y() -> float:
	return linear_limit_y/damping

func set_param_y(value: float) -> void:
	linear_limit_y/damping = value

func get_flag_y() -> bool:
	return linear_limit_y/enabled

func set_flag_y(value: bool) -> void:
	linear_limit_y/enabled = value

func get_param_y() -> float:
	return linear_limit_y/lower_distance

func set_param_y(value: float) -> void:
	linear_limit_y/lower_distance = value

func get_param_y() -> float:
	return linear_limit_y/restitution

func set_param_y(value: float) -> void:
	linear_limit_y/restitution = value

func get_param_y() -> float:
	return linear_limit_y/softness

func set_param_y(value: float) -> void:
	linear_limit_y/softness = value

func get_param_y() -> float:
	return linear_limit_y/upper_distance

func set_param_y(value: float) -> void:
	linear_limit_y/upper_distance = value

func get_param_z() -> float:
	return linear_limit_z/damping

func set_param_z(value: float) -> void:
	linear_limit_z/damping = value

func get_flag_z() -> bool:
	return linear_limit_z/enabled

func set_flag_z(value: bool) -> void:
	linear_limit_z/enabled = value

func get_param_z() -> float:
	return linear_limit_z/lower_distance

func set_param_z(value: float) -> void:
	linear_limit_z/lower_distance = value

func get_param_z() -> float:
	return linear_limit_z/restitution

func set_param_z(value: float) -> void:
	linear_limit_z/restitution = value

func get_param_z() -> float:
	return linear_limit_z/softness

func set_param_z(value: float) -> void:
	linear_limit_z/softness = value

func get_param_z() -> float:
	return linear_limit_z/upper_distance

func set_param_z(value: float) -> void:
	linear_limit_z/upper_distance = value

func get_flag_x() -> bool:
	return linear_motor_x/enabled

func set_flag_x(value: bool) -> void:
	linear_motor_x/enabled = value

func get_param_x() -> float:
	return linear_motor_x/force_limit

func set_param_x(value: float) -> void:
	linear_motor_x/force_limit = value

func get_param_x() -> float:
	return linear_motor_x/target_velocity

func set_param_x(value: float) -> void:
	linear_motor_x/target_velocity = value

func get_flag_y() -> bool:
	return linear_motor_y/enabled

func set_flag_y(value: bool) -> void:
	linear_motor_y/enabled = value

func get_param_y() -> float:
	return linear_motor_y/force_limit

func set_param_y(value: float) -> void:
	linear_motor_y/force_limit = value

func get_param_y() -> float:
	return linear_motor_y/target_velocity

func set_param_y(value: float) -> void:
	linear_motor_y/target_velocity = value

func get_flag_z() -> bool:
	return linear_motor_z/enabled

func set_flag_z(value: bool) -> void:
	linear_motor_z/enabled = value

func get_param_z() -> float:
	return linear_motor_z/force_limit

func set_param_z(value: float) -> void:
	linear_motor_z/force_limit = value

func get_param_z() -> float:
	return linear_motor_z/target_velocity

func set_param_z(value: float) -> void:
	linear_motor_z/target_velocity = value

func get_param_x() -> float:
	return linear_spring_x/damping

func set_param_x(value: float) -> void:
	linear_spring_x/damping = value

func get_flag_x() -> bool:
	return linear_spring_x/enabled

func set_flag_x(value: bool) -> void:
	linear_spring_x/enabled = value

func get_param_x() -> float:
	return linear_spring_x/equilibrium_point

func set_param_x(value: float) -> void:
	linear_spring_x/equilibrium_point = value

func get_param_x() -> float:
	return linear_spring_x/stiffness

func set_param_x(value: float) -> void:
	linear_spring_x/stiffness = value

func get_param_y() -> float:
	return linear_spring_y/damping

func set_param_y(value: float) -> void:
	linear_spring_y/damping = value

func get_flag_y() -> bool:
	return linear_spring_y/enabled

func set_flag_y(value: bool) -> void:
	linear_spring_y/enabled = value

func get_param_y() -> float:
	return linear_spring_y/equilibrium_point

func set_param_y(value: float) -> void:
	linear_spring_y/equilibrium_point = value

func get_param_y() -> float:
	return linear_spring_y/stiffness

func set_param_y(value: float) -> void:
	linear_spring_y/stiffness = value

func get_param_z() -> float:
	return linear_spring_z/damping

func set_param_z(value: float) -> void:
	linear_spring_z/damping = value

func get_flag_z() -> bool:
	return linear_spring_z/enabled

func set_flag_z(value: bool) -> void:
	linear_spring_z/enabled = value

func get_param_z() -> float:
	return linear_spring_z/equilibrium_point

func set_param_z(value: float) -> void:
	linear_spring_z/equilibrium_point = value

func get_param_z() -> float:
	return linear_spring_z/stiffness

func set_param_z(value: float) -> void:
	linear_spring_z/stiffness = value

