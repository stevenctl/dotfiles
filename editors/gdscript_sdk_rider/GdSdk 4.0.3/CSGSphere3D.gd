extends CSGPrimitive3D
#brief A CSG Sphere shape.
#desc This node allows you to create a sphere for use with the CSG system.
#desc [b]Note:[/b] CSG nodes are intended to be used for level prototyping. Creating CSG nodes has a significant CPU cost compared to creating a [MeshInstance3D] with a [PrimitiveMesh]. Moving a CSG node within another CSG node also has a significant CPU cost, so it should be avoided during gameplay.
#tutorial [Prototyping levels with CSG] https://docs.godotengine.org/en/stable/tutorials/3d/csg_tools.html
class_name CSGSphere3D


#desc The material used to render the sphere.
var material: Material:
	get = get_material, set = set_material

#desc Number of vertical slices for the sphere.
var radial_segments: int:
	get = get_radial_segments, set = set_radial_segments

#desc Radius of the sphere.
var radius: float:
	get = get_radius, set = set_radius

#desc Number of horizontal slices for the sphere.
var rings: int:
	get = get_rings, set = set_rings

#desc If [code]true[/code] the normals of the sphere are set to give a smooth effect making the sphere seem rounded. If [code]false[/code] the sphere will have a flat shaded look.
var smooth_faces: bool:
	get = get_smooth_faces, set = set_smooth_faces




func get_material() -> Material:
	return material

func set_material(value: Material) -> void:
	material = value

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

func get_smooth_faces() -> bool:
	return smooth_faces

func set_smooth_faces(value: bool) -> void:
	smooth_faces = value

