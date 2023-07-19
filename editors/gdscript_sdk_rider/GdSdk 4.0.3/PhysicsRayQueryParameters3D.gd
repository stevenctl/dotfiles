extends RefCounted
#brief Parameters to be sent to a 3D ray physics query.
#desc This class contains the ray position and other parameters to be used for [method PhysicsDirectSpaceState3D.intersect_ray].
class_name PhysicsRayQueryParameters3D


#desc If [code]true[/code], the query will take [Area3D]s into account.
var collide_with_areas: bool:
	get = is_collide_with_areas_enabled, set = set_collide_with_areas

#desc If [code]true[/code], the query will take [PhysicsBody3D]s into account.
var collide_with_bodies: bool:
	get = is_collide_with_bodies_enabled, set = set_collide_with_bodies

#desc The physics layers the query will detect (as a bitmask). By default, all collision layers are detected. See [url=$DOCS_URL/tutorials/physics/physics_introduction.html#collision-layers-and-masks]Collision layers and masks[/url] in the documentation for more information.
var collision_mask: int:
	get = get_collision_mask, set = set_collision_mask

#desc The list of object [RID]s that will be excluded from collisions. Use [method CollisionObject3D.get_rid] to get the [RID] associated with a [CollisionObject3D]-derived node.
var exclude: Array[RID]:
	get = get_exclude, set = set_exclude

#desc The starting point of the ray being queried for, in global coordinates.
var from: Vector3:
	get = get_from, set = set_from

#desc If [code]true[/code], the query will hit back faces with concave polygon shapes with back face enabled or heightmap shapes.
var hit_back_faces: bool:
	get = is_hit_back_faces_enabled, set = set_hit_back_faces

#desc If [code]true[/code], the query will detect a hit when starting inside shapes. In this case the collision normal will be [code]Vector3(0, 0, 0)[/code]. Does not affect concave polygon shapes or heightmap shapes.
var hit_from_inside: bool:
	get = is_hit_from_inside_enabled, set = set_hit_from_inside

#desc The ending point of the ray being queried for, in global coordinates.
var to: Vector3:
	get = get_to, set = set_to



#desc Returns a new, pre-configured [PhysicsRayQueryParameters3D] object. Use it to quickly create query parameters using the most common options.
#desc [codeblock]
#desc var query = PhysicsRayQueryParameters3D.create(position, position + Vector3(0, -10, 0))
#desc var collision = get_world_3d().direct_space_state.intersect_ray(query)
#desc [/codeblock]
static func create(from: Vector3, to: Vector3, collision_mask: int = 4294967295, exclude: RID[] = []) -> PhysicsRayQueryParameters3D:
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

func get_from() -> Vector3:
	return from

func set_from(value: Vector3) -> void:
	from = value

func is_hit_back_faces_enabled() -> bool:
	return hit_back_faces

func set_hit_back_faces(value: bool) -> void:
	hit_back_faces = value

func is_hit_from_inside_enabled() -> bool:
	return hit_from_inside

func set_hit_from_inside(value: bool) -> void:
	hit_from_inside = value

func get_to() -> Vector3:
	return to

func set_to(value: Vector3) -> void:
	to = value

