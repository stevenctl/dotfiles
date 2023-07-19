extends Node2D
#brief Node that represents a 2D collision polygon.
#desc Provides a 2D collision polygon to a [CollisionObject2D] parent. Polygons can be drawn in the editor or specified by a list of vertices.
#desc Depending on the build mode, this node effectively provides several convex shapes (by convex decomposition of the polygon) or a single concave shape made of the polygon's segments.
#desc In the editor, a [CollisionPolygon2D] can be generated from a [Sprite2D]'s outline by selecting a [Sprite2D] node, going to the [b]Sprite2D[/b] menu at the top of the 2D editor viewport then choosing [b]Create CollisionPolygon2D Sibling[/b].
class_name CollisionPolygon2D

#desc Collisions will include the polygon and its contained area. In this mode the node has the same effect as several [ConvexPolygonShape2D] nodes, one for each convex shape in the convex decomposition of the polygon (but without the overhead of multiple nodes).
#desc Collisions will only include the polygon edges. In this mode the node has the same effect as a single [ConcavePolygonShape2D] made of segments, with the restriction that each segment (after the first one) starts where the previous one ends, and the last one ends where the first one starts (forming a closed but hollow polygon).

#enum BuildMode
enum {
    BUILD_SOLIDS = 0,
    BUILD_SEGMENTS = 1,
}
#desc Collision build mode. Use one of the [enum BuildMode] constants.
var build_mode: int:
	get = get_build_mode, set = set_build_mode

#desc If [code]true[/code], no collisions will be detected.
var disabled: bool:
	get = is_disabled, set = set_disabled

#desc If [code]true[/code], only edges that face up, relative to [CollisionPolygon2D]'s rotation, will collide with other objects.
#desc [b]Note:[/b] This property has no effect if this [CollisionPolygon2D] is a child of an [Area2D] node.
var one_way_collision: bool:
	get = is_one_way_collision_enabled, set = set_one_way_collision

#desc The margin used for one-way collision (in pixels). Higher values will make the shape thicker, and work better for colliders that enter the polygon at a high velocity.
var one_way_collision_margin: float:
	get = get_one_way_collision_margin, set = set_one_way_collision_margin

#desc The polygon's list of vertices. Each point will be connected to the next, and the final point will be connected to the first.
#desc [b]Warning:[/b] The returned value is a clone of the [PackedVector2Array], not a reference.
var polygon: PackedVector2Array:
	get = get_polygon, set = set_polygon




func get_build_mode() -> int:
	return build_mode

func set_build_mode(value: int) -> void:
	build_mode = value

func is_disabled() -> bool:
	return disabled

func set_disabled(value: bool) -> void:
	disabled = value

func is_one_way_collision_enabled() -> bool:
	return one_way_collision

func set_one_way_collision(value: bool) -> void:
	one_way_collision = value

func get_one_way_collision_margin() -> float:
	return one_way_collision_margin

func set_one_way_collision_margin(value: float) -> void:
	one_way_collision_margin = value

func get_polygon() -> PackedVector2Array:
	return polygon

func set_polygon(value: PackedVector2Array) -> void:
	polygon = value

