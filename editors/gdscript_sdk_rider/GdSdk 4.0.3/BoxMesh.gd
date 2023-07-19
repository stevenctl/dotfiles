extends PrimitiveMesh
#brief Generate an axis-aligned box [PrimitiveMesh].
#desc Generate an axis-aligned box [PrimitiveMesh].
#desc The box's UV layout is arranged in a 3×2 layout that allows texturing each face individually. To apply the same texture on all faces, change the material's UV property to [code]Vector3(3, 2, 1)[/code]. This is equivalent to adding [code]UV *= vec2(3.0, 2.0)[/code] in a vertex shader.
#desc [b]Note:[/b] When using a large textured [BoxMesh] (e.g. as a floor), you may stumble upon UV jittering issues depending on the camera angle. To solve this, increase [member subdivide_depth], [member subdivide_height] and [member subdivide_width] until you no longer notice UV jittering.
class_name BoxMesh


#desc The box's width, height and depth.
var size: Vector3:
	get = get_size, set = set_size

#desc Number of extra edge loops inserted along the Z axis.
var subdivide_depth: int:
	get = get_subdivide_depth, set = set_subdivide_depth

#desc Number of extra edge loops inserted along the Y axis.
var subdivide_height: int:
	get = get_subdivide_height, set = set_subdivide_height

#desc Number of extra edge loops inserted along the X axis.
var subdivide_width: int:
	get = get_subdivide_width, set = set_subdivide_width




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

