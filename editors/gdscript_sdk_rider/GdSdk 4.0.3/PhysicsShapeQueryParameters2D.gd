extends RefCounted
#brief Parameters to be sent to a 2D shape physics query.
#desc This class contains the shape and other parameters for [PhysicsDirectSpaceState2D] intersection/collision queries.
class_name PhysicsShapeQueryParameters2D


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

#desc The collision margin for the shape.
var margin: float:
	get = get_margin, set = set_margin

#desc The motion of the shape being queried for.
var motion: Vector2:
	get = get_motion, set = set_motion

#desc The [Shape2D] that will be used for collision/intersection queries. This stores the actual reference which avoids the shape to be released while being used for queries, so always prefer using this over [member shape_rid].
var shape: Resource:
	get = get_shape, set = set_shape

#desc The queried shape's [RID] that will be used for collision/intersection queries. Use this over [member shape] if you want to optimize for performance using the Servers API:
#desc [codeblocks]
#desc [gdscript]
#desc var shape_rid = PhysicsServer2D.circle_shape_create()
#desc var radius = 64
#desc PhysicsServer2D.shape_set_data(shape_rid, radius)
#desc 
#desc var params = PhysicsShapeQueryParameters2D.new()
#desc params.shape_rid = shape_rid
#desc 
#desc # Execute physics queries here...
#desc 
#desc # Release the shape when done with physics queries.
#desc PhysicsServer2D.free_rid(shape_rid)
#desc [/gdscript]
#desc [csharp]
#desc RID shapeRid = PhysicsServer2D.CircleShapeCreate();
#desc int radius = 64;
#desc PhysicsServer2D.ShapeSetData(shapeRid, radius);
#desc 
#desc var params = new PhysicsShapeQueryParameters2D();
#desc params.ShapeRid = shapeRid;
#desc 
#desc // Execute physics queries here...
#desc 
#desc // Release the shape when done with physics queries.
#desc PhysicsServer2D.FreeRid(shapeRid);
#desc [/csharp]
#desc [/codeblocks]
var shape_rid: RID:
	get = get_shape_rid, set = set_shape_rid

#desc The queried shape's transform matrix.
var transform: Transform2D:
	get = get_transform, set = set_transform




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

func get_margin() -> float:
	return margin

func set_margin(value: float) -> void:
	margin = value

func get_motion() -> Vector2:
	return motion

func set_motion(value: Vector2) -> void:
	motion = value

func get_shape() -> Resource:
	return shape

func set_shape(value: Resource) -> void:
	shape = value

func get_shape_rid() -> RID:
	return shape_rid

func set_shape_rid(value: RID) -> void:
	shape_rid = value

func get_transform() -> Transform2D:
	return transform

func set_transform(value: Transform2D) -> void:
	transform = value

