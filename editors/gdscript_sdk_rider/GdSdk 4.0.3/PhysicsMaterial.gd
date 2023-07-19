extends Resource
#brief A material for physics properties.
#desc Provides a means of modifying the collision properties of a [PhysicsBody3D].
class_name PhysicsMaterial


#desc If [code]true[/code], subtracts the bounciness from the colliding object's bounciness instead of adding it.
var absorbent: bool:
	get = is_absorbent, set = set_absorbent

#desc The body's bounciness. Values range from [code]0[/code] (no bounce) to [code]1[/code] (full bounciness).
var bounce: float:
	get = get_bounce, set = set_bounce

#desc The body's friction. Values range from [code]0[/code] (frictionless) to [code]1[/code] (maximum friction).
var friction: float:
	get = get_friction, set = set_friction

#desc If [code]true[/code], the physics engine will use the friction of the object marked as "rough" when two objects collide. If [code]false[/code], the physics engine will use the lowest friction of all colliding objects instead. If [code]true[/code] for both colliding objects, the physics engine will use the highest friction.
var rough: bool:
	get = is_rough, set = set_rough




func is_absorbent() -> bool:
	return absorbent

func set_absorbent(value: bool) -> void:
	absorbent = value

func get_bounce() -> float:
	return bounce

func set_bounce(value: float) -> void:
	bounce = value

func get_friction() -> float:
	return friction

func set_friction(value: float) -> void:
	friction = value

func is_rough() -> bool:
	return rough

func set_rough(value: bool) -> void:
	rough = value

