extends CSGPrimitive3D
#brief A CSG Box shape.
#desc This node allows you to create a box for use with the CSG system.
#desc [b]Note:[/b] CSG nodes are intended to be used for level prototyping. Creating CSG nodes has a significant CPU cost compared to creating a [MeshInstance3D] with a [PrimitiveMesh]. Moving a CSG node within another CSG node also has a significant CPU cost, so it should be avoided during gameplay.
#tutorial [Prototyping levels with CSG] https://docs.godotengine.org/en/stable/tutorials/3d/csg_tools.html
class_name CSGBox3D


#desc The material used to render the box.
var material: Material:
	get = get_material, set = set_material

#desc The box's width, height and depth.
var size: Vector3:
	get = get_size, set = set_size




func get_material() -> Material:
	return material

func set_material(value: Material) -> void:
	material = value

func get_size() -> Vector3:
	return size

func set_size(value: Vector3) -> void:
	size = value

