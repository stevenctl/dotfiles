extends CSGPrimitive3D
#brief A CSG Cylinder shape.
#desc This node allows you to create a cylinder (or cone) for use with the CSG system.
#desc [b]Note:[/b] CSG nodes are intended to be used for level prototyping. Creating CSG nodes has a significant CPU cost compared to creating a [MeshInstance3D] with a [PrimitiveMesh]. Moving a CSG node within another CSG node also has a significant CPU cost, so it should be avoided during gameplay.
#tutorial [Prototyping levels with CSG] https://docs.godotengine.org/en/stable/tutorials/3d/csg_tools.html
class_name CSGCylinder3D


#desc If [code]true[/code] a cone is created, the [member radius] will only apply to one side.
var cone: bool:
	get = is_cone, set = set_cone

#desc The height of the cylinder.
var height: float:
	get = get_height, set = set_height

#desc The material used to render the cylinder.
var material: Material:
	get = get_material, set = set_material

#desc The radius of the cylinder.
var radius: float:
	get = get_radius, set = set_radius

#desc The number of sides of the cylinder, the higher this number the more detail there will be in the cylinder.
var sides: int:
	get = get_sides, set = set_sides

#desc If [code]true[/code] the normals of the cylinder are set to give a smooth effect making the cylinder seem rounded. If [code]false[/code] the cylinder will have a flat shaded look.
var smooth_faces: bool:
	get = get_smooth_faces, set = set_smooth_faces




func is_cone() -> bool:
	return cone

func set_cone(value: bool) -> void:
	cone = value

func get_height() -> float:
	return height

func set_height(value: float) -> void:
	height = value

func get_material() -> Material:
	return material

func set_material(value: Material) -> void:
	material = value

func get_radius() -> float:
	return radius

func set_radius(value: float) -> void:
	radius = value

func get_sides() -> int:
	return sides

func set_sides(value: int) -> void:
	sides = value

func get_smooth_faces() -> bool:
	return smooth_faces

func set_smooth_faces(value: bool) -> void:
	smooth_faces = value

