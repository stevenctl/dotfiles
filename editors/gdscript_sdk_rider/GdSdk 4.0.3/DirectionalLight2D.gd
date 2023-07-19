extends Light2D
#brief Directional 2D light from a distance.
#desc A directional light is a type of [Light2D] node that models an infinite number of parallel rays covering the entire scene. It is used for lights with strong intensity that are located far away from the scene (for example: to model sunlight or moonlight).
#desc [b]Note:[/b] [DirectionalLight2D] does not support light cull masks (but it supports shadow cull masks). It will always light up 2D nodes, regardless of the 2D node's [member CanvasItem.light_mask].
#tutorial [2D lights and shadows] https://docs.godotengine.org/en/stable/tutorials/2d/2d_lights_and_shadows.html
class_name DirectionalLight2D


#desc The height of the light. Used with 2D normal mapping. Ranges from 0 (parallel to the plane) to 1 (perpendicular to the plane).
var height: float:
	get = get_height, set = set_height

#desc The maximum distance from the camera center objects can be before their shadows are culled (in pixels). Decreasing this value can prevent objects located outside the camera from casting shadows (while also improving performance). [member Camera2D.zoom] is not taken into account by [member max_distance], which means that at higher zoom values, shadows will appear to fade out sooner when zooming onto a given point.
var max_distance: float:
	get = get_max_distance, set = set_max_distance




func get_height() -> float:
	return height

func set_height(value: float) -> void:
	height = value

func get_max_distance() -> float:
	return max_distance

func set_max_distance(value: float) -> void:
	max_distance = value

