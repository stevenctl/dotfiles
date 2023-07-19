extends PhysicsDirectSpaceState2D
class_name PhysicsDirectSpaceState2DExtension




func _cast_motion(shape_rid: RID, transform: Transform2D, motion: Vector2, margin: float, collision_mask: int, collide_with_bodies: bool, collide_with_areas: bool, closest_safe: float*, closest_unsafe: float*) -> bool:
	pass;

func _collide_shape(shape_rid: RID, transform: Transform2D, motion: Vector2, margin: float, collision_mask: int, collide_with_bodies: bool, collide_with_areas: bool, results: void*, max_results: int, result_count: int32_t*) -> bool:
	pass;

func _intersect_point(position: Vector2, canvas_instance_id: int, collision_mask: int, collide_with_bodies: bool, collide_with_areas: bool, results: PhysicsServer2DExtensionShapeResult*, max_results: int) -> int:
	pass;

func _intersect_ray(from: Vector2, to: Vector2, collision_mask: int, collide_with_bodies: bool, collide_with_areas: bool, hit_from_inside: bool, result: PhysicsServer2DExtensionRayResult*) -> bool:
	pass;

func _intersect_shape(shape_rid: RID, transform: Transform2D, motion: Vector2, margin: float, collision_mask: int, collide_with_bodies: bool, collide_with_areas: bool, result: PhysicsServer2DExtensionShapeResult*, max_results: int) -> int:
	pass;

func _rest_info(shape_rid: RID, transform: Transform2D, motion: Vector2, margin: float, collision_mask: int, collide_with_bodies: bool, collide_with_areas: bool, rest_info: PhysicsServer2DExtensionShapeRestInfo*) -> bool:
	pass;

func is_body_excluded_from_query(body: RID) -> bool:
	pass;


