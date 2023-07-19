extends CSGPrimitive3D
#brief Extrudes a 2D polygon shape to create a 3D mesh.
#desc An array of 2D points is extruded to quickly and easily create a variety of 3D meshes. See also [CSGMesh3D] for using 3D meshes as CSG nodes.
#desc [b]Note:[/b] CSG nodes are intended to be used for level prototyping. Creating CSG nodes has a significant CPU cost compared to creating a [MeshInstance3D] with a [PrimitiveMesh]. Moving a CSG node within another CSG node also has a significant CPU cost, so it should be avoided during gameplay.
#tutorial [Prototyping levels with CSG] https://docs.godotengine.org/en/stable/tutorials/3d/csg_tools.html
class_name CSGPolygon3D

#desc The [member polygon] shape is extruded along the negative Z axis.
#desc The [member polygon] shape is extruded by rotating it around the Y axis.
#desc The [member polygon] shape is extruded along the [Path3D] specified in [member path_node].
#desc The [member polygon] shape is not rotated.
#desc [b]Note:[/b] Requires the path Z coordinates to continually decrease to ensure viable shapes.
#desc The [member polygon] shape is rotated along the path, but it is not rotated around the path axis.
#desc [b]Note:[/b] Requires the path Z coordinates to continually decrease to ensure viable shapes.
#desc The [member polygon] shape follows the path and its rotations around the path axis.
#desc When [member mode] is set to [constant MODE_PATH], [member path_interval] will determine the distance, in meters, each interval of the path will extrude.
#desc When [member mode] is set to [constant MODE_PATH], [member path_interval] will subdivide the polygons along the path.

#enum Mode
enum {
    MODE_DEPTH = 0,
    MODE_SPIN = 1,
    MODE_PATH = 2,
}
#enum PathRotation
enum {
    PATH_ROTATION_POLYGON = 0,
    PATH_ROTATION_PATH = 1,
    PATH_ROTATION_PATH_FOLLOW = 2,
}
#enum PathIntervalType
enum {
    PATH_INTERVAL_DISTANCE = 0,
    PATH_INTERVAL_SUBDIVIDE = 1,
}
#desc When [member mode] is [constant MODE_DEPTH], the depth of the extrusion.
var depth: float:
	get = get_depth, set = set_depth

#desc Material to use for the resulting mesh. The UV maps the top half of the material to the extruded shape (U along the length of the extrusions and V around the outline of the [member polygon]), the bottom-left quarter to the front end face, and the bottom-right quarter to the back end face.
var material: Material:
	get = get_material, set = set_material

#desc The [member mode] used to extrude the [member polygon].
var mode: int:
	get = get_mode, set = set_mode

#desc When [member mode] is [constant MODE_PATH], by default, the top half of the [member material] is stretched along the entire length of the extruded shape. If [code]false[/code] the top half of the material is repeated every step of the extrusion.
var path_continuous_u: bool:
	get = is_path_continuous_u, set = set_path_continuous_u

#desc When [member mode] is [constant MODE_PATH], the path interval or ratio of path points to extrusions.
var path_interval: float:
	get = get_path_interval, set = set_path_interval

#desc When [member mode] is [constant MODE_PATH], this will determine if the interval should be by distance ([constant PATH_INTERVAL_DISTANCE]) or subdivision fractions ([constant PATH_INTERVAL_SUBDIVIDE]).
var path_interval_type: int:
	get = get_path_interval_type, set = set_path_interval_type

#desc When [member mode] is [constant MODE_PATH], if [code]true[/code] the ends of the path are joined, by adding an extrusion between the last and first points of the path.
var path_joined: bool:
	get = is_path_joined, set = set_path_joined

#desc When [member mode] is [constant MODE_PATH], if [code]true[/code] the [Transform3D] of the [CSGPolygon3D] is used as the starting point for the extrusions, not the [Transform3D] of the [member path_node].
var path_local: bool:
	get = is_path_local, set = set_path_local

#desc When [member mode] is [constant MODE_PATH], the location of the [Path3D] object used to extrude the [member polygon].
var path_node: NodePath:
	get = get_path_node, set = set_path_node

#desc When [member mode] is [constant MODE_PATH], the [enum PathRotation] method used to rotate the [member polygon] as it is extruded.
var path_rotation: int:
	get = get_path_rotation, set = set_path_rotation

#desc When [member mode] is [constant MODE_PATH], extrusions that are less than this angle, will be merged together to reduce polygon count.
var path_simplify_angle: float:
	get = get_path_simplify_angle, set = set_path_simplify_angle

#desc When [member mode] is [constant MODE_PATH], this is the distance along the path, in meters, the texture coordinates will tile. When set to 0, texture coordinates will match geometry exactly with no tiling.
var path_u_distance: float:
	get = get_path_u_distance, set = set_path_u_distance

#desc The point array that defines the 2D polygon that is extruded. This can be a convex or concave polygon with 3 or more points. The polygon must [i]not[/i] have any intersecting edges. Otherwise, triangulation will fail and no mesh will be generated.
#desc [b]Note:[/b] If only 1 or 2 points are defined in [member polygon], no mesh will be generated.
var polygon: PackedVector2Array:
	get = get_polygon, set = set_polygon

#desc If [code]true[/code], applies smooth shading to the extrusions.
var smooth_faces: bool:
	get = get_smooth_faces, set = set_smooth_faces

#desc When [member mode] is [constant MODE_SPIN], the total number of degrees the [member polygon] is rotated when extruding.
var spin_degrees: float:
	get = get_spin_degrees, set = set_spin_degrees

#desc When [member mode] is [constant MODE_SPIN], the number of extrusions made.
var spin_sides: int:
	get = get_spin_sides, set = set_spin_sides




func get_depth() -> float:
	return depth

func set_depth(value: float) -> void:
	depth = value

func get_material() -> Material:
	return material

func set_material(value: Material) -> void:
	material = value

func get_mode() -> int:
	return mode

func set_mode(value: int) -> void:
	mode = value

func is_path_continuous_u() -> bool:
	return path_continuous_u

func set_path_continuous_u(value: bool) -> void:
	path_continuous_u = value

func get_path_interval() -> float:
	return path_interval

func set_path_interval(value: float) -> void:
	path_interval = value

func get_path_interval_type() -> int:
	return path_interval_type

func set_path_interval_type(value: int) -> void:
	path_interval_type = value

func is_path_joined() -> bool:
	return path_joined

func set_path_joined(value: bool) -> void:
	path_joined = value

func is_path_local() -> bool:
	return path_local

func set_path_local(value: bool) -> void:
	path_local = value

func get_path_node() -> NodePath:
	return path_node

func set_path_node(value: NodePath) -> void:
	path_node = value

func get_path_rotation() -> int:
	return path_rotation

func set_path_rotation(value: int) -> void:
	path_rotation = value

func get_path_simplify_angle() -> float:
	return path_simplify_angle

func set_path_simplify_angle(value: float) -> void:
	path_simplify_angle = value

func get_path_u_distance() -> float:
	return path_u_distance

func set_path_u_distance(value: float) -> void:
	path_u_distance = value

func get_polygon() -> PackedVector2Array:
	return polygon

func set_polygon(value: PackedVector2Array) -> void:
	polygon = value

func get_smooth_faces() -> bool:
	return smooth_faces

func set_smooth_faces(value: bool) -> void:
	smooth_faces = value

func get_spin_degrees() -> float:
	return spin_degrees

func set_spin_degrees(value: float) -> void:
	spin_degrees = value

func get_spin_sides() -> int:
	return spin_sides

func set_spin_sides(value: int) -> void:
	spin_sides = value

