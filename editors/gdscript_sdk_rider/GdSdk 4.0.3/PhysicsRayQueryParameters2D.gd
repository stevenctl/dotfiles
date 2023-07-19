extends RefCounted
#brief Parameters to be sent to a 2D ray physics query.
#desc This class contains the ray position and other parameters to be used for [method PhysicsDirectSpaceState2D.intersect_ray].
class_name PhysicsRayQueryParameters2D


#desc If [code]true[/code], the query will take [Area2D]s into account.
var collide_with_areas: bool:
	get = is_collide_with_areas_enabled, set = set_collide_with_areas

#desc If [code]true[/code], the query will take [PhysicsBody2D]s into account.
var collide_with_bodies: bool:
	get = is_collide_with_bodies_enabled, set = set_collide_with_bodies

#desc The physics layers the query will detect (as a bitmask). By default, all collision layers are detected. See [url=$DOCS_URL/tutorials/physics/physics_introduction.html#collision-layers-and-masks]Collision layers and masks[/url] in the documentation for more information.
var collision_mask: int:
	get = get_collision_mask, set = set_collision_mask

#desc The list of object [RID]s that will be excluded from collisions. Use [method CollisionObject2D.get_rid] to get the [RID] associated with a [CollisionObject2D]-derived node.
var exclude: Array[RID]:
	get = get_exclude, set = set_exclude

#desc The starting point of the ray being queried for, in global coordinates.
var from: Vector2:
	get = get_from, set = set_from

#desc If [code]true[/code], the query will detect a hit when starting inside shapes. In this case the collision normal will be [code]Vector2(0, 0)[/code]. Does not affect concave polygon shapes.
var hit_from_inside: bool:
	get = is_hit_from_inside_enabled, set = set_hit_from_inside

#desc The ending point of the ray being queried for, in global coordinates.
var to: Vector2:
	get = get_to, set = set_to



#desc Returns a new, pre-configured [PhysicsRayQueryParameters2D] object. Use it to quickly create query parameters using the most common options.
#desc [codeblock]
#desc var query = PhysicsRayQueryParameters2D.create(global_position, global_position + Vector2(0, 100))
#desc var collision = get_world_2d().direct_space_state.intersect_ray(query)
#desc [/codeblock]
static func create(from: Vector2, to: Vector2, collision_mask: int = 4294967295, exclude: RID[] = []) -> PhysicsRayQueryParameters2D:
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

func get_exclude() -> Array[RID]:
	return exclude

func set_exclude(value: Array[RID]) -> void:
	exclude = value

func get_from() -> Vector2:
	return from

func set_from(value: Vector2) -> void:
	from = value

func is_hit_from_inside_enabled() -> bool:
	return hit_from_inside

func set_hit_from_inside(value: bool) -> void:
	hit_from_inside = value

func get_to() -> Vector2:
	return to

func set_to(value: Vector2) -> void:
	to = value

