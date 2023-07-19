extends PrimitiveMesh
#brief Class representing a torus [PrimitiveMesh].
#desc Class representing a torus [PrimitiveMesh].
class_name TorusMesh


#desc The inner radius of the torus.
var inner_radius: float:
	get = get_inner_radius, set = set_inner_radius

#desc The outer radius of the torus.
var outer_radius: float:
	get = get_outer_radius, set = set_outer_radius

#desc The number of edges each ring of the torus is constructed of.
var ring_segments: int:
	get = get_ring_segments, set = set_ring_segments

#desc The number of slices the torus is constructed of.
var rings: int:
	get = get_rings, set = set_rings




func get_inner_radius() -> float:
	return inner_radius

func set_inner_radius(value: float) -> void:
	inner_radius = value

func get_outer_radius() -> float:
	return outer_radius

func set_outer_radius(value: float) -> void:
	outer_radius = value

func get_ring_segments() -> int:
	return ring_segments

func set_ring_segments(value: int) -> void:
	ring_segments = value

func get_rings() -> int:
	return rings

func set_rings(value: int) -> void:
	rings = value

