extends Resource
#brief Defines a 2D polygon for LightOccluder2D.
#desc Editor facility that helps you draw a 2D polygon used as resource for [LightOccluder2D].
class_name OccluderPolygon2D

#desc Culling is disabled. See [member cull_mode].
#desc Culling is performed in the clockwise direction. See [member cull_mode].
#desc Culling is performed in the counterclockwise direction. See [member cull_mode].

#enum CullMode
enum {
    CULL_DISABLED = 0,
    CULL_CLOCKWISE = 1,
    CULL_COUNTER_CLOCKWISE = 2,
}
#desc If [code]true[/code], closes the polygon. A closed OccluderPolygon2D occludes the light coming from any direction. An opened OccluderPolygon2D occludes the light only at its outline's direction.
var closed: bool:
	get = is_closed, set = set_closed

#desc The culling mode to use.
var cull_mode: int:
	get = get_cull_mode, set = set_cull_mode

#desc A [Vector2] array with the index for polygon's vertices positions.
#desc [b]Note:[/b] The returned value is a copy of the underlying array, rather than a reference.
var polygon: PackedVector2Array:
	get = get_polygon, set = set_polygon




func is_closed() -> bool:
	return closed

func set_closed(value: bool) -> void:
	closed = value

func get_cull_mode() -> int:
	return cull_mode

func set_cull_mode(value: int) -> void:
	cull_mode = value

func get_polygon() -> PackedVector2Array:
	return polygon

func set_polygon(value: PackedVector2Array) -> void:
	polygon = value

