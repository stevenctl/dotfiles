extends Joint3D
#brief A hinge between two 3D PhysicsBodies.
#desc A HingeJoint3D normally uses the Z axis of body A as the hinge axis, another axis can be specified when adding it manually though. See also [Generic6DOFJoint3D].
class_name HingeJoint3D

#desc The speed with which the two bodies get pulled together when they move in different directions.
#desc The maximum rotation. Only active if [member angular_limit/enable] is [code]true[/code].
#desc The minimum rotation. Only active if [member angular_limit/enable] is [code]true[/code].
#desc The speed with which the rotation across the axis perpendicular to the hinge gets corrected.
#desc The lower this value, the more the rotation gets slowed down.
#desc Target speed for the motor.
#desc Maximum acceleration for the motor.
#desc Represents the size of the [enum Param] enum.
#desc If [code]true[/code], the hinges maximum and minimum rotation, defined by [member angular_limit/lower] and [member angular_limit/upper] has effects.
#desc When activated, a motor turns the hinge.
#desc Represents the size of the [enum Flag] enum.

#enum Param
enum {
    PARAM_BIAS = 0,
    PARAM_LIMIT_UPPER = 1,
    PARAM_LIMIT_LOWER = 2,
    PARAM_LIMIT_BIAS = 3,
    PARAM_LIMIT_SOFTNESS = 4,
    PARAM_LIMIT_RELAXATION = 5,
    PARAM_MOTOR_TARGET_VELOCITY = 6,
    PARAM_MOTOR_MAX_IMPULSE = 7,
    PARAM_MAX = 8,
}
#enum Flag
enum {
    FLAG_USE_LIMIT = 0,
    FLAG_ENABLE_MOTOR = 1,
    FLAG_MAX = 2,
}
#desc The speed with which the rotation across the axis perpendicular to the hinge gets corrected.
var angular_limit/bias: float:
	get = get_param, set = set_param

#desc If [code]true[/code], the hinges maximum and minimum rotation, defined by [member angular_limit/lower] and [member angular_limit/upper] has effects.
var angular_limit/enable: bool:
	get = get_flag, set = set_flag

#desc The minimum rotation. Only active if [member angular_limit/enable] is [code]true[/code].
var angular_limit/lower: float:
	get = get_param, set = set_param

#desc The lower this value, the more the rotation gets slowed down.
var angular_limit/relaxation: float:
	get = get_param, set = set_param

var angular_limit/softness: float:
	get = get_param, set = set_param

#desc The maximum rotation. Only active if [member angular_limit/enable] is [code]true[/code].
var angular_limit/upper: float:
	get = get_param, set = set_param

#desc When activated, a motor turns the hinge.
var motor/enable: bool:
	get = get_flag, set = set_flag

#desc Maximum acceleration for the motor.
var motor/max_impulse: float:
	get = get_param, set = set_param

#desc Target speed for the motor.
var motor/target_velocity: float:
	get = get_param, set = set_param

#desc The speed with which the two bodies get pulled together when they move in different directions.
var params/bias: float:
	get = get_param, set = set_param



#desc Returns the value of the specified flag.
func get_flag(flag: int) -> bool:
	pass;

#desc Returns the value of the specified parameter.
func get_param(param: int) -> float:
	pass;

#desc If [code]true[/code], enables the specified flag.
func set_flag(flag: int, enabled: bool) -> void:
	pass;

#desc Sets the value of the specified parameter.
func set_param(param: int, value: float) -> void:
	pass;


func get_param() -> float:
	return angular_limit/bias

func set_param(value: float) -> void:
	angular_limit/bias = value

func get_flag() -> bool:
	return angular_limit/enable

func set_flag(value: bool) -> void:
	angular_limit/enable = value

func get_param() -> float:
	return angular_limit/lower

func set_param(value: float) -> void:
	angular_limit/lower = value

func get_param() -> float:
	return angular_limit/relaxation

func set_param(value: float) -> void:
	angular_limit/relaxation = value

func get_param() -> float:
	return angular_limit/softness

func set_param(value: float) -> void:
	angular_limit/softness = value

func get_param() -> float:
	return angular_limit/upper

func set_param(value: float) -> void:
	angular_limit/upper = value

func get_flag() -> bool:
	return motor/enable

func set_flag(value: bool) -> void:
	motor/enable = value

func get_param() -> float:
	return motor/max_impulse

func set_param(value: float) -> void:
	motor/max_impulse = value

func get_param() -> float:
	return motor/target_velocity

func set_param(value: float) -> void:
	motor/target_velocity = value

func get_param() -> float:
	return params/bias

func set_param(value: float) -> void:
	params/bias = value

