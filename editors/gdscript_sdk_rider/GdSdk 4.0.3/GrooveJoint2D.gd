extends Joint2D
#brief Groove constraint for 2D physics.
#desc Groove constraint for 2D physics. This is useful for making a body "slide" through a segment placed in another.
class_name GrooveJoint2D


#desc The body B's initial anchor position defined by the joint's origin and a local offset [member initial_offset] along the joint's Y axis (along the groove).
var initial_offset: float:
	get = get_initial_offset, set = set_initial_offset

#desc The groove's length. The groove is from the joint's origin towards [member length] along the joint's local Y axis.
var length: float:
	get = get_length, set = set_length




func get_initial_offset() -> float:
	return initial_offset

func set_initial_offset(value: float) -> void:
	initial_offset = value

func get_length() -> float:
	return length

func set_length(value: float) -> void:
	length = value

