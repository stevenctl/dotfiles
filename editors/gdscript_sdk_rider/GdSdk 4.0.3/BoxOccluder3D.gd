extends Occluder3D
#brief Cuboid shape for use with occlusion culling in [OccluderInstance3D].
#desc [BoxOccluder3D] stores a cuboid shape that can be used by the engine's occlusion culling system.
#desc See [OccluderInstance3D]'s documentation for instructions on setting up occlusion culling.
class_name BoxOccluder3D


#desc The box's size in 3D units.
var size: Vector3:
	get = get_size, set = set_size




func get_size() -> Vector3:
	return size

func set_size(value: Vector3) -> void:
	size = value

