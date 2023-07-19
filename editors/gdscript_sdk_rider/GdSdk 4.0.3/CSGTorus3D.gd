extends CSGPrimitive3D
#brief A CSG Torus shape.
#desc This node allows you to create a torus for use with the CSG system.
#desc [b]Note:[/b] CSG nodes are intended to be used for level prototyping. Creating CSG nodes has a significant CPU cost compared to creating a [MeshInstance3D] with a [PrimitiveMesh]. Moving a CSG node within another CSG node also has a significant CPU cost, so it should be avoided during gameplay.
#tutorial [Prototyping levels with CSG] https://docs.godotengine.org/en/stable/tutorials/3d/csg_tools.html
class_name CSGTorus3D


#desc The inner radius of the torus.
var inner_radius: float:
	get = get_inner_radius, set = set_inner_radius

#desc The material used to render the torus.
var material: Material:
	get = get_material, set = set_material

#desc The outer radius of the torus.
var outer_radius: float:
	get = get_outer_radius, set = set_outer_radius

#desc The number of edges each ring of the torus is constructed of.
var ring_sides: int:
	get = get_ring_sides, set = set_ring_sides

#desc The number of slices the torus is constructed of.
var sides: int:
	get = get_sides, set = set_sides

#desc If [code]true[/code] the normals of the torus are set to give a smooth effect making the torus seem rounded. If [code]false[/code] the torus will have a flat shaded look.
var smooth_faces: bool:
	get = get_smooth_faces, set = set_smooth_faces




func get_inner_radius() -> float:
	return inner_radius

func set_inner_radius(value: float) -> void:
	inner_radius = value

func get_material() -> Material:
	return material

func set_material(value: Material) -> void:
	material = value

func get_outer_radius() -> float:
	return outer_radius

func set_outer_radius(value: float) -> void:
	outer_radius = value

func get_ring_sides() -> int:
	return ring_sides

func set_ring_sides(value: int) -> void:
	ring_sides = value

func get_sides() -> int:
	return sides

func set_sides(value: int) -> void:
	sides = value

func get_smooth_faces() -> bool:
	return smooth_faces

func set_smooth_faces(value: bool) -> void:
	smooth_faces = value

