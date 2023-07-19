extends CollisionObject2D
#brief Base class for all objects affected by physics in 2D space.
#desc PhysicsBody2D is an abstract base class for implementing a physics body. All *Body2D types inherit from it.
#tutorial [Physics introduction] https://docs.godotengine.org/en/stable/tutorials/physics/physics_introduction.html
class_name PhysicsBody2D


var input_pickable: bool:
	get = is_pickable, set = set_pickable



#desc Adds a body to the list of bodies that this body can't collide with.
func add_collision_exception_with(body: Node) -> void:
	pass;

#desc Returns an array of nodes that were added as collision exceptions for this body.
func get_collision_exceptions() -> Array[PhysicsBody2D]:
	pass;

#desc Moves the body along the vector [param motion]. In order to be frame rate independent in [method Node._physics_process] or [method Node._process], [param motion] should be computed using [code]delta[/code].
#desc Returns a [KinematicCollision2D], which contains information about the collision when stopped, or when touching another body along the motion.
#desc If [param test_only] is [code]true[/code], the body does not move but the would-be collision information is given.
#desc [param safe_margin] is the extra margin used for collision recovery (see [member CharacterBody2D.safe_margin] for more details).
#desc If [param recovery_as_collision] is [code]true[/code], any depenetration from the recovery phase is also reported as a collision; this is used e.g. by [CharacterBody2D] for improving floor detection during floor snapping.
func move_and_collide(motion: Vector2, test_only: bool = false, safe_margin: float = 0.08, recovery_as_collision: bool = false) -> KinematicCollision2D:
	pass;

#desc Removes a body from the list of bodies that this body can't collide with.
func remove_collision_exception_with(body: Node) -> void:
	pass;

#desc Checks for collisions without moving the body. In order to be frame rate independent in [method Node._physics_process] or [method Node._process], [param motion] should be computed using [code]delta[/code].
#desc Virtually sets the node's position, scale and rotation to that of the given [Transform2D], then tries to move the body along the vector [param motion]. Returns [code]true[/code] if a collision would stop the body from moving along the whole path.
#desc [param collision] is an optional object of type [KinematicCollision2D], which contains additional information about the collision when stopped, or when touching another body along the motion.
#desc [param safe_margin] is the extra margin used for collision recovery (see [member CharacterBody2D.safe_margin] for more details).
#desc If [param recovery_as_collision] is [code]true[/code], any depenetration from the recovery phase is also reported as a collision; this is useful for checking whether the body would [i]touch[/i] any other bodies.
func test_move(from: Transform2D, motion: Vector2, collision: KinematicCollision2D = null, safe_margin: float = 0.08, recovery_as_collision: bool = false) -> bool:
	pass;


func is_pickable() -> bool:
	return input_pickable

func set_pickable(value: bool) -> void:
	input_pickable = value

