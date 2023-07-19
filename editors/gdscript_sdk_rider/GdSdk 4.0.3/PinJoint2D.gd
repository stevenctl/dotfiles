extends Joint2D
#brief Pin joint for 2D shapes.
#desc Pin joint for 2D rigid bodies. It pins two bodies (dynamic or static) together.
class_name PinJoint2D


#desc The higher this value, the more the bond to the pinned partner can flex.
var softness: float:
	get = get_softness, set = set_softness




func get_softness() -> float:
	return softness

func set_softness(value: float) -> void:
	softness = value

