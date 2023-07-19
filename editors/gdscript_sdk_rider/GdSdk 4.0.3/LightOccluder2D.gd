extends Node2D
#brief Occludes light cast by a Light2D, casting shadows.
#desc Occludes light cast by a Light2D, casting shadows. The LightOccluder2D must be provided with an [OccluderPolygon2D] in order for the shadow to be computed.
#tutorial [2D lights and shadows] https://docs.godotengine.org/en/stable/tutorials/2d/2d_lights_and_shadows.html
class_name LightOccluder2D


#desc The [OccluderPolygon2D] used to compute the shadow.
var occluder: OccluderPolygon2D:
	get = get_occluder_polygon, set = set_occluder_polygon

#desc The LightOccluder2D's occluder light mask. The LightOccluder2D will cast shadows only from Light2D(s) that have the same light mask(s).
var occluder_light_mask: int:
	get = get_occluder_light_mask, set = set_occluder_light_mask

var sdf_collision: bool:
	get = is_set_as_sdf_collision, set = set_as_sdf_collision




func get_occluder_polygon() -> OccluderPolygon2D:
	return occluder

func set_occluder_polygon(value: OccluderPolygon2D) -> void:
	occluder = value

func get_occluder_light_mask() -> int:
	return occluder_light_mask

func set_occluder_light_mask(value: int) -> void:
	occluder_light_mask = value

func is_set_as_sdf_collision() -> bool:
	return sdf_collision

func set_as_sdf_collision(value: bool) -> void:
	sdf_collision = value

