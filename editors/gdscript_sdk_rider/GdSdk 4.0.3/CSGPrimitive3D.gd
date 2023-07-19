extends CSGShape3D
#brief Base class for CSG primitives.
#desc Parent class for various CSG primitives. It contains code and functionality that is common between them. It cannot be used directly. Instead use one of the various classes that inherit from it.
#desc [b]Note:[/b] CSG nodes are intended to be used for level prototyping. Creating CSG nodes has a significant CPU cost compared to creating a [MeshInstance3D] with a [PrimitiveMesh]. Moving a CSG node within another CSG node also has a significant CPU cost, so it should be avoided during gameplay.
#tutorial [Prototyping levels with CSG] https://docs.godotengine.org/en/stable/tutorials/3d/csg_tools.html
class_name CSGPrimitive3D


#desc If set, the order of the vertices in each triangle are reversed resulting in the backside of the mesh being drawn.
var flip_faces: bool:
	get = get_flip_faces, set = set_flip_faces




func get_flip_faces() -> bool:
	return flip_faces

func set_flip_faces(value: bool) -> void:
	flip_faces = value

