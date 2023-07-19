extends RefCounted
#brief Parameters to be sent to a 2D point physics query.
#desc This class contains the position and other parameters to be used for [method PhysicsDirectSpaceState2D.intersect_point].
class_name PhysicsPointQueryParameters2D


#desc If different from [code]0[/code], restricts the query to a specific canvas layer specified by its instance ID. See [method Object.get_instance_id].
#desc If [code]0[/code], restricts the query to the Viewport's default canvas layer.
var canvas_instance_id: int:
	get = get_canvas_instance_id, set = set_canvas_instance_id

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

#desc The position being queried for, in global coordinates.
var position: Vector2:
	get = get_position, set = set_position




func get_canvas_instance_id() -> int:
	return canvas_instance_id

func set_canvas_instance_id(value: int) -> void:
	canvas_instance_id = value

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

func get_position() -> Vector2:
	return position

func set_position(value: Vector2) -> void:
	position = value

