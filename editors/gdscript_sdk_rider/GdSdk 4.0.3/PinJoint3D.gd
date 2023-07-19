extends Joint3D
#brief Pin joint for 3D PhysicsBodies.
#desc Pin joint for 3D rigid bodies. It pins 2 bodies (dynamic or static) together. See also [Generic6DOFJoint3D].
class_name PinJoint3D

#desc The force with which the pinned objects stay in positional relation to each other. The higher, the stronger.
#desc The force with which the pinned objects stay in velocity relation to each other. The higher, the stronger.
#desc If above 0, this value is the maximum value for an impulse that this Joint3D produces.

#enum Param
enum {
    PARAM_BIAS = 0,
    PARAM_DAMPING = 1,
    PARAM_IMPULSE_CLAMP = 2,
}
#desc The force with which the pinned objects stay in positional relation to each other. The higher, the stronger.
var params/bias: float:
	get = get_param, set = set_param

#desc The force with which the pinned objects stay in velocity relation to each other. The higher, the stronger.
var params/damping: float:
	get = get_param, set = set_param

#desc If above 0, this value is the maximum value for an impulse that this Joint3D produces.
var params/impulse_clamp: float:
	get = get_param, set = set_param



#desc Returns the value of the specified parameter.
func get_param(param: int) -> float:
	pass;

#desc Sets the value of the specified parameter.
func set_param(param: int, value: float) -> void:
	pass;


func get_param() -> float:
	return params/bias

func set_param(value: float) -> void:
	params/bias = value

func get_param() -> float:
	return params/damping

func set_param(value: float) -> void:
	params/damping = value

func get_param() -> float:
	return params/impulse_clamp

func set_param(value: float) -> void:
	params/impulse_clamp = value

