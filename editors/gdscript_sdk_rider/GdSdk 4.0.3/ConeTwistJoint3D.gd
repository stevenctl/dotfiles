extends Joint3D
#brief A twist joint between two 3D PhysicsBodies.
#desc The joint can rotate the bodies across an axis defined by the local x-axes of the [Joint3D].
#desc The twist axis is initiated as the X axis of the [Joint3D].
#desc Once the Bodies swing, the twist axis is calculated as the middle of the x-axes of the Joint3D in the local space of the two Bodies. See also [Generic6DOFJoint3D].
class_name ConeTwistJoint3D

#desc Swing is rotation from side to side, around the axis perpendicular to the twist axis.
#desc The swing span defines, how much rotation will not get corrected along the swing axis.
#desc Could be defined as looseness in the [ConeTwistJoint3D].
#desc If below 0.05, this behavior is locked.
#desc Twist is the rotation around the twist axis, this value defined how far the joint can twist.
#desc Twist is locked if below 0.05.
#desc The speed with which the swing or twist will take place.
#desc The higher, the faster.
#desc The ease with which the joint starts to twist. If it's too low, it takes more force to start twisting the joint.
#desc Defines, how fast the swing- and twist-speed-difference on both sides gets synced.
#desc Represents the size of the [enum Param] enum.

#enum Param
enum {
    PARAM_SWING_SPAN = 0,
    PARAM_TWIST_SPAN = 1,
    PARAM_BIAS = 2,
    PARAM_SOFTNESS = 3,
    PARAM_RELAXATION = 4,
    PARAM_MAX = 5,
}
#desc The speed with which the swing or twist will take place.
#desc The higher, the faster.
var bias: float:
	get = get_param, set = set_param

#desc Defines, how fast the swing- and twist-speed-difference on both sides gets synced.
var relaxation: float:
	get = get_param, set = set_param

#desc The ease with which the joint starts to twist. If it's too low, it takes more force to start twisting the joint.
var softness: float:
	get = get_param, set = set_param

#desc Swing is rotation from side to side, around the axis perpendicular to the twist axis.
#desc The swing span defines, how much rotation will not get corrected along the swing axis.
#desc Could be defined as looseness in the [ConeTwistJoint3D].
#desc If below 0.05, this behavior is locked.
var swing_span: float:
	get = get_param, set = set_param

#desc Twist is the rotation around the twist axis, this value defined how far the joint can twist.
#desc Twist is locked if below 0.05.
var twist_span: float:
	get = get_param, set = set_param



#desc Returns the value of the specified parameter.
func get_param(param: int) -> float:
	pass;

#desc Sets the value of the specified parameter.
func set_param(param: int, value: float) -> void:
	pass;


func get_param() -> float:
	return bias

func set_param(value: float) -> void:
	bias = value

func get_param() -> float:
	return relaxation

func set_param(value: float) -> void:
	relaxation = value

func get_param() -> float:
	return softness

func set_param(value: float) -> void:
	softness = value

func get_param() -> float:
	return swing_span

func set_param(value: float) -> void:
	swing_span = value

func get_param() -> float:
	return twist_span

func set_param(value: float) -> void:
	twist_span = value

