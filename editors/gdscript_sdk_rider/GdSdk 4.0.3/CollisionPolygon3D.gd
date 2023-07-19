extends Node3D
#brief Node that represents a 3D collision polygon, given by the thickening of a 2D polygon in the local XY plane along the local Z axis.
#desc Provides a 3D collision polygon to a [CollisionObject3D] parent, by thickening a 2D (convex or concave) polygon in the local XY plane along the local Z axis. The 2D polygon in the local XY plane can be drawn in the editor or specified by a list of vertices. That 2D polygon is thickened evenly in the local Z and -Z directions.
#desc This node has the same effect as several [ConvexPolygonShape3D] nodes, created by thickening the 2D convex polygons in the convex decomposition of the given 2D polygon (but without the overhead of multiple nodes).
#desc [b]Warning:[/b] A non-uniformly scaled CollisionPolygon3D node will probably not function as expected. Please make sure to keep its scale uniform (i.e. the same on all axes), and change its [member polygon]'s vertices instead.
class_name CollisionPolygon3D


#desc Length that the resulting collision extends in either direction perpendicular to its 2D polygon.
var depth: float:
	get = get_depth, set = set_depth

#desc If [code]true[/code], no collision will be produced.
var disabled: bool:
	get = is_disabled, set = set_disabled

#desc The collision margin for the generated [Shape3D]. See [member Shape3D.margin] for more details.
var margin: float:
	get = get_margin, set = set_margin

#desc Array of vertices which define the 2D polygon in the local XY plane.
#desc [b]Note:[/b] The returned value is a copy of the original. Methods which mutate the size or properties of the return value will not impact the original polygon. To change properties of the polygon, assign it to a temporary variable and make changes before reassigning the [code]polygon[/code] member.
var polygon: PackedVector2Array:
	get = get_polygon, set = set_polygon




func get_depth() -> float:
	return depth

func set_depth(value: float) -> void:
	depth = value

func is_disabled() -> bool:
	return disabled

func set_disabled(value: bool) -> void:
	disabled = value

func get_margin() -> float:
	return margin

func set_margin(value: float) -> void:
	margin = value

func get_polygon() -> PackedVector2Array:
	return polygon

func set_polygon(value: PackedVector2Array) -> void:
	polygon = value

