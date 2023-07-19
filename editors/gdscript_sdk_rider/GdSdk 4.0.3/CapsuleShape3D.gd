extends Shape3D
#brief Capsule shape resource for 3D collisions.
#desc 3D capsule shape to be added as a [i]direct[/i] child of a [PhysicsBody3D] or [Area3D] using a [CollisionShape3D] node. In 3D, a capsule is a cylinder shape with hemispheres at both ends.
#desc [b]Performance:[/b] Being a primitive collision shape, [CapsuleShape3D] is fast to check collisions against (though not as fast as [SphereShape3D]). [CapsuleShape3D] is cheaper to check collisions against compared to [CylinderShape3D].
#tutorial [3D Physics Tests Demo] https://godotengine.org/asset-library/asset/675
class_name CapsuleShape3D


#desc The capsule's height.
var height: float:
	get = get_height, set = set_height

#desc The capsule's radius.
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

