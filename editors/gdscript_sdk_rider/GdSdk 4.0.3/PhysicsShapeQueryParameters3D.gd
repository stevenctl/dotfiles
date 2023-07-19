extends RefCounted
#brief Parameters to be sent to a 3D shape physics query.
#desc This class contains the shape and other parameters for [PhysicsDirectSpaceState3D] intersection/collision queries.
class_name PhysicsShapeQueryParameters3D


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

#desc The collision margin for the shape.
var margin: float:
	get = get_margin, set = set_margin

#desc The motion of the shape being queried for.
var motion: Vector3:
	get = get_motion, set = set_motion

#desc The [Shape3D] that will be used for collision/intersection queries. This stores the actual reference which avoids the shape to be released while being used for queries, so always prefer using this over [member shape_rid].
var shape: Resource:
	get = get_shape, set = set_shape

#desc The queried shape's [RID] that will be used for collision/intersection queries. Use this over [member shape] if you want to optimize for performance using the Servers API:
#desc [codeblocks]
#desc [gdscript]
#desc var shape_rid = PhysicsServer3D.shape_create(PhysicsServer3D.SHAPE_SPHERE)
#desc var radius = 2.0
#desc PhysicsServer3D.shape_set_data(shape_rid, radius)
#desc 
#desc var params = PhysicsShapeQueryParameters3D.new()
#desc params.shape_rid = shape_rid
#desc 
#desc # Execute physics queries here...
#desc 
#desc # Release the shape when done with physics queries.
#desc PhysicsServer3D.free_rid(shape_rid)
#desc [/gdscript]
#desc [csharp]
#desc RID shapeRid = PhysicsServer3D.ShapeCreate(PhysicsServer3D.ShapeType.Sphere);
#desc float radius = 2.0f;
#desc PhysicsServer3D.ShapeSetData(shapeRid, radius);
#desc 
#desc var params = new PhysicsShapeQueryParameters3D();
#desc params.ShapeRid = shapeRid;
#desc 
#desc // Execute physics queries here...
#desc 
#desc // Release the shape when done with physics queries.
#desc PhysicsServer3D.FreeRid(shapeRid);
#desc [/csharp]
#desc [/codeblocks]
var shape_rid: RID:
	get = get_shape_rid, set = set_shape_rid

#desc The queried shape's transform matrix.
var transform: Transform3D:
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

func get_motion() -> Vector3:
	return motion

func set_motion(value: Vector3) -> void:
	motion = value

func get_shape() -> Resource:
	return shape

func set_shape(value: Resource) -> void:
	shape = value

func get_shape_rid() -> RID:
	return shape_rid

func set_shape_rid(value: RID) -> void:
	shape_rid = value

func get_transform() -> Transform3D:
	return transform

func set_transform(value: Transform3D) -> void:
	transform = value

