extends CSGPrimitive3D
#brief A CSG Mesh shape that uses a mesh resource.
#desc This CSG node allows you to use any mesh resource as a CSG shape, provided it is closed, does not self-intersect, does not contain internal faces and has no edges that connect to more than two faces. See also [CSGPolygon3D] for drawing 2D extruded polygons to be used as CSG nodes.
#desc [b]Note:[/b] CSG nodes are intended to be used for level prototyping. Creating CSG nodes has a significant CPU cost compared to creating a [MeshInstance3D] with a [PrimitiveMesh]. Moving a CSG node within another CSG node also has a significant CPU cost, so it should be avoided during gameplay.
#tutorial [Prototyping levels with CSG] https://docs.godotengine.org/en/stable/tutorials/3d/csg_tools.html
class_name CSGMesh3D


#desc The [Material] used in drawing the CSG shape.
var material: Material:
	get = get_material, set = set_material

#desc The [Mesh] resource to use as a CSG shape.
#desc [b]Note:[/b] When using an [ArrayMesh], avoid meshes with vertex normals unless a flat shader is required. By default, CSGMesh will ignore the mesh's vertex normals and use a smooth shader calculated using the faces' normals. If a flat shader is required, ensure that all faces' vertex normals are parallel.
var mesh: Mesh:
	get = get_mesh, set = set_mesh




func get_material() -> Material:
	return material

func set_material(value: Material) -> void:
	material = value

func get_mesh() -> Mesh:
	return mesh

func set_mesh(value: Mesh) -> void:
	mesh = value

