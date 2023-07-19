extends PrimitiveMesh
#brief Class representing a spherical [PrimitiveMesh].
#desc Class representing a spherical [PrimitiveMesh].
class_name SphereMesh


#desc Full height of the sphere.
var height: float:
	get = get_height, set = set_height

#desc If [code]true[/code], a hemisphere is created rather than a full sphere.
#desc [b]Note:[/b] To get a regular hemisphere, the height and radius of the sphere must be equal.
var is_hemisphere: bool:
	get = get_is_hemisphere, set = set_is_hemisphere

#desc Number of radial segments on the sphere.
var radial_segments: int:
	get = get_radial_segments, set = set_radial_segments

#desc Radius of sphere.
var radius: float:
	get = get_radius, set = set_radius

#desc Number of segments along the height of the sphere.
var rings: int:
	get = get_rings, set = set_rings




func get_height() -> float:
	return height

func set_height(value: float) -> void:
	height = value

func get_is_hemisphere() -> bool:
	return is_hemisphere

func set_is_hemisphere(value: bool) -> void:
	is_hemisphere = value

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

