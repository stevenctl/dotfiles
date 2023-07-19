extends Shape2D
#brief World boundary (infinite plane) shape resource for 2D physics.
#desc 2D world boundary shape to be added as a [i]direct[/i] child of a [PhysicsBody2D] or [Area2D] using a [CollisionShape2D] node. [WorldBoundaryShape2D] works like an infinite plane and will not allow any physics body to go to the negative side. Note that the [member normal] matters; anything "below" the plane will collide with it. If the [WorldBoundaryShape2D] is used in a [PhysicsBody2D], it will cause colliding objects placed "below" it to teleport "above" the plane.
#desc [b]Performance:[/b] Being a primitive collision shape, [WorldBoundaryShape2D] is fast to check collisions against.
class_name WorldBoundaryShape2D


#desc The line's distance from the origin.
var distance: float:
	get = get_distance, set = set_distance

#desc The line's normal. Defaults to [code]Vector2.UP[/code].
var normal: Vector2:
	get = get_normal, set = set_normal




func get_distance() -> float:
	return distance

func set_distance(value: float) -> void:
	distance = value

func get_normal() -> Vector2:
	return normal

func set_normal(value: Vector2) -> void:
	normal = value

