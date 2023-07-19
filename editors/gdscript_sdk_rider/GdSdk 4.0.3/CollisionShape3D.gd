extends Node3D
#brief Node that represents collision shape data in 3D space.
#desc Editor facility for creating and editing collision shapes in 3D space. Set the [member shape] property to configure the shape.
#desc You can use this node to represent all sorts of collision shapes, for example, add this to an [Area3D] to give it a detection shape, or add it to a [PhysicsBody3D] to create a solid object.
#desc [b]Warning:[/b] A non-uniformly scaled CollisionShape3D node will probably not function as expected. Please make sure to keep its scale uniform (i.e. the same on all axes), and change the size of its [member shape] resource instead.
#tutorial [Physics introduction] https://docs.godotengine.org/en/stable/tutorials/physics/physics_introduction.html
#tutorial [3D Kinematic Character Demo] https://godotengine.org/asset-library/asset/126
#tutorial [3D Platformer Demo] https://godotengine.org/asset-library/asset/125
#tutorial [Third Person Shooter Demo] https://godotengine.org/asset-library/asset/678
class_name CollisionShape3D


#desc A disabled collision shape has no effect in the world.
var disabled: bool:
	get = is_disabled, set = set_disabled

#desc The actual shape owned by this collision shape.
var shape: Shape3D:
	get = get_shape, set = set_shape



#desc Sets the collision shape's shape to the addition of all its convexed [MeshInstance3D] siblings geometry.
func make_convex_from_siblings() -> void:
	pass;

#desc If this method exists within a script it will be called whenever the shape resource has been modified.
func resource_changed(resource: Resource) -> void:
	pass;


func is_disabled() -> bool:
	return disabled

func set_disabled(value: bool) -> void:
	disabled = value

func get_shape() -> Shape3D:
	return shape

func set_shape(value: Shape3D) -> void:
	shape = value

