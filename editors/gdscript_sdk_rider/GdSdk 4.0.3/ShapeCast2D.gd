extends Node2D
#brief Node for physics collision sweep and immediate overlap queries. Similar to the [RayCast2D] node.
#desc Shape casting allows to detect collision objects by sweeping the [member shape] along the cast direction determined by [member target_position] (useful for things like beam weapons).
#desc Immediate collision overlaps can be done with the [member target_position] set to [code]Vector2(0, 0)[/code] and by calling [method force_shapecast_update] within the same [b]physics frame[/b]. This also helps to overcome some limitations of [Area2D] when used as a continuous detection area, often requiring waiting a couple of frames before collision information is available to [Area2D] nodes, and when using the signals creates unnecessary complexity.
#desc The node can detect multiple collision objects, but it's usually used to detect the first collision.
#desc [b]Note:[/b] shape casting is more computationally expensive compared to ray casting.
class_name ShapeCast2D


#desc If [code]true[/code], collision with [Area2D]s will be reported.
var collide_with_areas: bool:
	get = is_collide_with_areas_enabled, set = set_collide_with_areas

#desc If [code]true[/code], collision with [PhysicsBody2D]s will be reported.
var collide_with_bodies: bool:
	get = is_collide_with_bodies_enabled, set = set_collide_with_bodies

#desc The shape's collision mask. Only objects in at least one collision layer enabled in the mask will be detected.
var collision_mask: int:
	get = get_collision_mask, set = set_collision_mask

#desc Returns the complete collision information from the collision sweep. The data returned is the same as in the [method PhysicsDirectSpaceState2D.get_rest_info] method.
var collision_result: Array:
	get = _get_collision_result

#desc If [code]true[/code], collisions will be reported.
var enabled: bool:
	get = is_enabled, set = set_enabled

#desc If [code]true[/code], the parent node will be excluded from collision detection.
var exclude_parent: bool:
	get = get_exclude_parent_body, set = set_exclude_parent_body

#desc The collision margin for the shape. A larger margin helps detecting collisions more consistently, at the cost of precision.
var margin: float:
	get = get_margin, set = set_margin

#desc The number of intersections can be limited with this parameter, to reduce the processing time.
var max_results: int:
	get = get_max_results, set = set_max_results

#desc The [Shape2D]-derived shape to be used for collision queries.
var shape: Shape2D:
	get = get_shape, set = set_shape

#desc The shape's destination point, relative to this node's [code]position[/code].
var target_position: Vector2:
	get = get_target_position, set = set_target_position



#desc Adds a collision exception so the shape does not report collisions with the specified [CollisionObject2D] node.
func add_exception(node: CollisionObject2D) -> void:
	pass;

#desc Adds a collision exception so the shape does not report collisions with the specified [RID].
func add_exception_rid(rid: RID) -> void:
	pass;

#desc Removes all collision exceptions for this shape.
func clear_exceptions() -> void:
	pass;

#desc Updates the collision information for the shape. Use this method to update the collision information immediately instead of waiting for the next [code]_physics_process[/code] call, for example if the shape or its parent has changed state.
#desc [b]Note:[/b] [code]enabled == true[/code] is not required for this to work.
func force_shapecast_update() -> void:
	pass;

#desc The fraction from the [ShapeCast2D]'s origin to its [member target_position] (between 0 and 1) of how far the shape can move without triggering a collision.
func get_closest_collision_safe_fraction() -> float:
	pass;

#desc The fraction from the [ShapeCast2D]'s origin to its [member target_position] (between 0 and 1) of how far the shape must move to trigger a collision.
func get_closest_collision_unsafe_fraction() -> float:
	pass;

#desc Returns the collided [Object] of one of the multiple collisions at [param index], or [code]null[/code] if no object is intersecting the shape (i.e. [method is_colliding] returns [code]false[/code]).
func get_collider(index: int) -> Object:
	pass;

#desc Returns the [RID] of the collided object of one of the multiple collisions at [param index].
func get_collider_rid(index: int) -> RID:
	pass;

#desc Returns the shape ID of the colliding shape of one of the multiple collisions at [param index], or [code]0[/code] if no object is intersecting the shape (i.e. [method is_colliding] returns [code]false[/code]).
func get_collider_shape(index: int) -> int:
	pass;

#desc The number of collisions detected at the point of impact. Use this to iterate over multiple collisions as provided by [method get_collider], [method get_collider_shape], [method get_collision_point], and [method get_collision_normal] methods.
func get_collision_count() -> int:
	pass;

#desc Returns whether or not the specified layer of the [member collision_mask] is enabled, given a [param layer_number] between 1 and 32.
func get_collision_mask_value(layer_number: int) -> bool:
	pass;

#desc Returns the normal of one of the multiple collisions at [param index] of the intersecting object.
func get_collision_normal(index: int) -> Vector2:
	pass;

#desc Returns the collision point of one of the multiple collisions at [param index] where the shape intersects the colliding object.
#desc [b]Note:[/b] this point is in the [b]global[/b] coordinate system.
func get_collision_point(index: int) -> Vector2:
	pass;

#desc Returns whether any object is intersecting with the shape's vector (considering the vector length).
func is_colliding() -> bool:
	pass;

#desc Removes a collision exception so the shape does report collisions with the specified [CollisionObject2D] node.
func remove_exception(node: CollisionObject2D) -> void:
	pass;

#desc Removes a collision exception so the shape does report collisions with the specified [RID].
func remove_exception_rid(rid: RID) -> void:
	pass;

#desc Based on [param value], enables or disables the specified layer in the [member collision_mask], given a [param layer_number] between 1 and 32.
func set_collision_mask_value(layer_number: int, value: bool) -> void:
	pass;


func is_collide_with_areas_enabled() -> bool:
	return collide_with_areas

func set_collide_with_areas(value: bool) -> void:
	collide_with_areas = value

func is_collide_with_bodies_enabled() -> bool:
	return collide_with_bodies

func set_collide_with_bodies(value: bool) -> void:
	collide_with_bodies = value

func get_collision_mask() -> int:
	return collision_mask

func set_collision_mask(value: int) -> void:
	collision_mask = value

func _get_collision_result() -> Array:
	return collision_result

func is_enabled() -> bool:
	return enabled

func set_enabled(value: bool) -> void:
	enabled = value

func get_exclude_parent_body() -> bool:
	return exclude_parent

func set_exclude_parent_body(value: bool) -> void:
	exclude_parent = value

func get_margin() -> float:
	return margin

func set_margin(value: float) -> void:
	margin = value

func get_max_results() -> int:
	return max_results

func set_max_results(value: int) -> void:
	max_results = value

func get_shape() -> Shape2D:
	return shape

func set_shape(value: Shape2D) -> void:
	shape = value

func get_target_position() -> Vector2:
	return target_position

func set_target_position(value: Vector2) -> void:
	target_position = value

