extends Node3D
#brief A helper node, mostly used in 3rd person cameras.
#desc The SpringArm3D node is a node that casts a ray (or collision shape) along its z axis and moves all its direct children to the collision point, minus a margin.
#desc The most common use case for this is to make a 3rd person camera that reacts to collisions in the environment.
#desc The SpringArm3D will either cast a ray, or if a shape is given, it will cast the shape in the direction of its z axis.
#desc If you use the SpringArm3D as a camera controller for your player, you might need to exclude the player's collider from the SpringArm3D's collision check.
class_name SpringArm3D


#desc The layers against which the collision check shall be done. See [url=$DOCS_URL/tutorials/physics/physics_introduction.html#collision-layers-and-masks]Collision layers and masks[/url] in the documentation for more information.
var collision_mask: int:
	get = get_collision_mask, set = set_collision_mask

#desc When the collision check is made, a candidate length for the SpringArm3D is given.
#desc The margin is then subtracted to this length and the translation is applied to the child objects of the SpringArm3D.
#desc This margin is useful for when the SpringArm3D has a [Camera3D] as a child node: without the margin, the [Camera3D] would be placed on the exact point of collision, while with the margin the [Camera3D] would be placed close to the point of collision.
var margin: float:
	get = get_margin, set = set_margin

#desc The [Shape3D] to use for the SpringArm3D.
#desc When the shape is set, the SpringArm3D will cast the [Shape3D] on its z axis instead of performing a ray cast.
var shape: Shape3D:
	get = get_shape, set = set_shape

#desc The maximum extent of the SpringArm3D. This is used as a length for both the ray and the shape cast used internally to calculate the desired position of the SpringArm3D's child nodes.
#desc To know more about how to perform a shape cast or a ray cast, please consult the [PhysicsDirectSpaceState3D] documentation.
var spring_length: float:
	get = get_length, set = set_length



#desc Adds the [PhysicsBody3D] object with the given [RID] to the list of [PhysicsBody3D] objects excluded from the collision check.
func add_excluded_object(RID: RID) -> void:
	pass;

#desc Clears the list of [PhysicsBody3D] objects excluded from the collision check.
func clear_excluded_objects() -> void:
	pass;

#desc Returns the spring arm's current length.
func get_hit_length() -> float:
	pass;

#desc Removes the given [RID] from the list of [PhysicsBody3D] objects excluded from the collision check.
func remove_excluded_object(RID: RID) -> bool:
	pass;


func get_collision_mask() -> int:
	return collision_mask

func set_collision_mask(value: int) -> void:
	collision_mask = value

func get_margin() -> float:
	return margin

func set_margin(value: float) -> void:
	margin = value

func get_shape() -> Shape3D:
	return shape

func set_shape(value: Shape3D) -> void:
	shape = value

func get_length() -> float:
	return spring_length

func set_length(value: float) -> void:
	spring_length = value

