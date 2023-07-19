extends Shape3D
#brief Cylinder shape for 3D collisions.
#desc Cylinder shape for collisions. Like [CapsuleShape3D], but without hemispheres at the cylinder's ends.
#desc [b]Note:[/b] There are several known bugs with cylinder collision shapes. Using [CapsuleShape3D] or [BoxShape3D] instead is recommended.
#desc [b]Performance:[/b] Being a primitive collision shape, [CylinderShape3D] is fast to check collisions against (though not as fast as [SphereShape3D]). [CylinderShape3D] is also more demanding compared to [CapsuleShape3D].
#tutorial [Third Person Shooter Demo] https://godotengine.org/asset-library/asset/678
#tutorial [3D Physics Tests Demo] https://godotengine.org/asset-library/asset/675
#tutorial [3D Voxel Demo] https://godotengine.org/asset-library/asset/676
class_name CylinderShape3D


#desc The cylinder's height.
var height: float:
	get = get_height, set = set_height

#desc The cylinder's radius.
var radius: float:
	get = get_radius, set = set_radius




func get_height() -> float:
	return height

func set_height(value: float) -> void:
	height = value

func get_radius() -> float:
	return radius

func set_radius(value: float) -> void:
	radius = value

