extends PrimitiveMesh
#brief Class representing a prism-shaped [PrimitiveMesh].
#desc Class representing a prism-shaped [PrimitiveMesh].
class_name PrismMesh


#desc Displacement of the upper edge along the X axis. 0.0 positions edge straight above the bottom-left edge.
var left_to_right: float:
	get = get_left_to_right, set = set_left_to_right

#desc Size of the prism.
var size: Vector3:
	get = get_size, set = set_size

#desc Number of added edge loops along the Z axis.
var subdivide_depth: int:
	get = get_subdivide_depth, set = set_subdivide_depth

#desc Number of added edge loops along the Y axis.
var subdivide_height: int:
	get = get_subdivide_height, set = set_subdivide_height

#desc Number of added edge loops along the X axis.
var subdivide_width: int:
	get = get_subdivide_width, set = set_subdivide_width




func get_left_to_right() -> float:
	return left_to_right

func set_left_to_right(value: float) -> void:
	left_to_right = value

func get_size() -> Vector3:
	return size

func set_size(value: Vector3) -> void:
	size = value

func get_subdivide_depth() -> int:
	return subdivide_depth

func set_subdivide_depth(value: int) -> void:
	subdivide_depth = value

func get_subdivide_height() -> int:
	return subdivide_height

func set_subdivide_height(value: int) -> void:
	subdivide_height = value

func get_subdivide_width() -> int:
	return subdivide_width

func set_subdivide_width(value: int) -> void:
	subdivide_width = value

