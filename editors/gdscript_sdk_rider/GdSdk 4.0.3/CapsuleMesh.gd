extends PrimitiveMesh
#brief Class representing a capsule-shaped [PrimitiveMesh].
#desc Class representing a capsule-shaped [PrimitiveMesh].
class_name CapsuleMesh


#desc Total height of the capsule mesh (including the hemispherical ends).
var height: float:
	get = get_height, set = set_height

#desc Number of radial segments on the capsule mesh.
var radial_segments: int:
	get = get_radial_segments, set = set_radial_segments

#desc Radius of the capsule mesh.
var radius: float:
	get = get_radius, set = set_radius

#desc Number of rings along the height of the capsule.
var rings: int:
	get = get_rings, set = set_rings




func get_height() -> float:
	return height

func set_height(value: float) -> void:
	height = value

func get_radial_segments() -> int:
	return radial_segments

func set_radial_segments(value: int) -> void:
	radial_segments = value

func get_radius() -> float:
	return radius

func set_radius(value: float) -> void:
	radius = value

func get_rings() -> int:
	return rings

func set_rings(value: int) -> void:
	rings = value

