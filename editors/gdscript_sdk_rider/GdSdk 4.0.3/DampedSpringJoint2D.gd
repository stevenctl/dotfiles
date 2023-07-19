extends Joint2D
#brief Damped spring constraint for 2D physics.
#desc Damped spring constraint for 2D physics. This resembles a spring joint that always wants to go back to a given length.
class_name DampedSpringJoint2D


#desc The spring joint's damping ratio. A value between [code]0[/code] and [code]1[/code]. When the two bodies move into different directions the system tries to align them to the spring axis again. A high [code]damping[/code] value forces the attached bodies to align faster.
var damping: float:
	get = get_damping, set = set_damping

#desc The spring joint's maximum length. The two attached bodies cannot stretch it past this value.
var length: float:
	get = get_length, set = set_length

#desc When the bodies attached to the spring joint move they stretch or squash it. The joint always tries to resize towards this length.
var rest_length: float:
	get = get_rest_length, set = set_rest_length

#desc The higher the value, the less the bodies attached to the joint will deform it. The joint applies an opposing force to the bodies, the product of the stiffness multiplied by the size difference from its resting length.
var stiffness: float:
	get = get_stiffness, set = set_stiffness




func get_damping() -> float:
	return damping

func set_damping(value: float) -> void:
	damping = value

func get_length() -> float:
	return length

func set_length(value: float) -> void:
	length = value

func get_rest_length() -> float:
	return rest_length

func set_rest_length(value: float) -> void:
	rest_length = value

func get_stiffness() -> float:
	return stiffness

func set_stiffness(value: float) -> void:
	stiffness = value

