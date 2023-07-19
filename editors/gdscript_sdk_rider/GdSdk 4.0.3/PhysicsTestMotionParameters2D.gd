extends RefCounted
#brief Parameters to be sent to a 2D body motion test.
#desc This class contains parameters used in [method PhysicsServer2D.body_test_motion].
class_name PhysicsTestMotionParameters2D


#desc If set to [code]true[/code], shapes of type [constant PhysicsServer2D.SHAPE_SEPARATION_RAY] are used to detect collisions and can stop the motion. Can be useful when snapping to the ground.
#desc If set to [code]false[/code], shapes of type [constant PhysicsServer2D.SHAPE_SEPARATION_RAY] are only used for separation when overlapping with other bodies. That's the main use for separation ray shapes.
var collide_separation_ray: bool:
	get = is_collide_separation_ray_enabled, set = set_collide_separation_ray_enabled

#desc Optional array of body [RID] to exclude from collision. Use [method CollisionObject2D.get_rid] to get the [RID] associated with a [CollisionObject2D]-derived node.
var exclude_bodies: Array[RID]:
	get = get_exclude_bodies, set = set_exclude_bodies

#desc Optional array of object unique instance ID to exclude from collision. See [method Object.get_instance_id].
var exclude_objects: Array[int]:
	get = get_exclude_objects, set = set_exclude_objects

#desc Transform in global space where the motion should start. Usually set to [member Node2D.global_transform] for the current body's transform.
var from: Transform2D:
	get = get_from, set = set_from

#desc Increases the size of the shapes involved in the collision detection.
var margin: float:
	get = get_margin, set = set_margin

#desc Motion vector to define the length and direction of the motion to test.
var motion: Vector2:
	get = get_motion, set = set_motion

#desc If set to [code]true[/code], any depenetration from the recovery phase is reported as a collision; this is used e.g. by [CharacterBody2D] for improving floor detection during floor snapping.
#desc If set to [code]false[/code], only collisions resulting from the motion are reported, which is generally the desired behavior.
var recovery_as_collision: bool:
	get = is_recovery_as_collision_enabled, set = set_recovery_as_collision_enabled




func is_collide_separation_ray_enabled() -> bool:
	return collide_separation_ray

func set_collide_separation_ray_enabled(value: bool) -> void:
	collide_separation_ray = value

func get_exclude_bodies() -> Array[RID]:
	return exclude_bodies

func set_exclude_bodies(value: Array[RID]) -> void:
	exclude_bodies = value

func get_exclude_objects() -> Array[int]:
	return exclude_objects

func set_exclude_objects(value: Array[int]) -> void:
	exclude_objects = value

func get_from() -> Transform2D:
	return from

func set_from(value: Transform2D) -> void:
	from = value

func get_margin() -> float:
	return margin

func set_margin(value: float) -> void:
	margin = value

func get_motion() -> Vector2:
	return motion

func set_motion(value: Vector2) -> void:
	motion = value

func is_recovery_as_collision_enabled() -> bool:
	return recovery_as_collision

func set_recovery_as_collision_enabled(value: bool) -> void:
	recovery_as_collision = value

