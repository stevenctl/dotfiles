extends PrimitiveMesh
#brief Class representing a planar [PrimitiveMesh].
#desc Class representing a planar [PrimitiveMesh]. This flat mesh does not have a thickness. By default, this mesh is aligned on the X and Z axes; this default rotation isn't suited for use with billboarded materials. For billboarded materials, change [member orientation] to [constant FACE_Z].
#desc [b]Note:[/b] When using a large textured [PlaneMesh] (e.g. as a floor), you may stumble upon UV jittering issues depending on the camera angle. To solve this, increase [member subdivide_depth] and [member subdivide_width] until you no longer notice UV jittering.
class_name PlaneMesh

#desc [PlaneMesh] will face the positive X-axis.
#desc [PlaneMesh] will face the positive Y-axis. This matches the behavior of the [PlaneMesh] in Godot 3.x.
#desc [PlaneMesh] will face the positive Z-axis. This matches the behavior of the QuadMesh in Godot 3.x.

#enum Orientation
enum {
    FACE_X = 0,
    FACE_Y = 1,
    FACE_Z = 2,
}
#desc Offset of the generated plane. Useful for particles.
var center_offset: Vector3:
	get = get_center_offset, set = set_center_offset

#desc Direction that the [PlaneMesh] is facing. See [enum Orientation] for options.
var orientation: int:
	get = get_orientation, set = set_orientation

#desc Size of the generated plane.
var size: Vector2:
	get = get_size, set = set_size

#desc Number of subdivision along the Z axis.
var subdivide_depth: int:
	get = get_subdivide_depth, set = set_subdivide_depth

#desc Number of subdivision along the X axis.
var subdivide_width: int:
	get = get_subdivide_width, set = set_subdivide_width




func get_center_offset() -> Vector3:
	return center_offset

func set_center_offset(value: Vector3) -> void:
	center_offset = value

func get_orientation() -> int:
	return orientation

func set_orientation(value: int) -> void:
	orientation = value

func get_size() -> Vector2:
	return size

func set_size(value: Vector2) -> void:
	size = value

func get_subdivide_depth() -> int:
	return subdivide_depth

func set_subdivide_depth(value: int) -> void:
	subdivide_depth = value

func get_subdivide_width() -> int:
	return subdivide_width

func set_subdivide_width(value: int) -> void:
	subdivide_width = value

