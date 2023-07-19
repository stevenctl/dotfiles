extends Mesh
#brief Base class for all primitive meshes. Handles applying a [Material] to a primitive mesh.
#desc Base class for all primitive meshes. Handles applying a [Material] to a primitive mesh. Examples include [BoxMesh], [CapsuleMesh], [CylinderMesh], [PlaneMesh], [PrismMesh], and [SphereMesh].
class_name PrimitiveMesh


#desc If set, generates UV2 UV coordinates applying a padding using the [member uv2_padding] setting. UV2 is needed for lightmapping.
var add_uv2: bool:
	get = get_add_uv2, set = set_add_uv2

#desc Overrides the [AABB] with one defined by user for use with frustum culling. Especially useful to avoid unexpected culling when using a shader to offset vertices.
var custom_aabb: AABB:
	get = get_custom_aabb, set = set_custom_aabb

#desc If set, the order of the vertices in each triangle are reversed resulting in the backside of the mesh being drawn.
#desc This gives the same result as using [constant BaseMaterial3D.CULL_FRONT] in [member BaseMaterial3D.cull_mode].
var flip_faces: bool:
	get = get_flip_faces, set = set_flip_faces

#desc The current [Material] of the primitive mesh.
var material: Material:
	get = get_material, set = set_material

#desc If [member add_uv2] is set, specifies the padding in pixels applied along seams of the mesh. Lower padding values allow making better use of the lightmap texture (resulting in higher texel density), but may introduce visible lightmap bleeding along edges.
#desc If the size of the lightmap texture can't be determined when generating the mesh, UV2 is calculated assuming a texture size of 1024x1024.
var uv2_padding: float:
	get = get_uv2_padding, set = set_uv2_padding



func _create_mesh_array() -> Array:
	pass;

#desc Returns mesh arrays used to constitute surface of [Mesh]. The result can be passed to [method ArrayMesh.add_surface_from_arrays] to create a new surface. For example:
#desc [codeblocks]
#desc [gdscript]
#desc var c = CylinderMesh.new()
#desc var arr_mesh = ArrayMesh.new()
#desc arr_mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, c.get_mesh_arrays())
#desc [/gdscript]
#desc [csharp]
#desc var c = new CylinderMesh();
#desc var arrMesh = new ArrayMesh();
#desc arrMesh.AddSurfaceFromArrays(Mesh.PrimitiveType.Triangles, c.GetMeshArrays());
#desc [/csharp]
#desc [/codeblocks]
func get_mesh_arrays() -> Array:
	pass;


func get_add_uv2() -> bool:
	return add_uv2

func set_add_uv2(value: bool) -> void:
	add_uv2 = value

func get_custom_aabb() -> AABB:
	return custom_aabb

func set_custom_aabb(value: AABB) -> void:
	custom_aabb = value

func get_flip_faces() -> bool:
	return flip_faces

func set_flip_faces(value: bool) -> void:
	flip_faces = value

func get_material() -> Material:
	return material

func set_material(value: Material) -> void:
	material = value

func get_uv2_padding() -> float:
	return uv2_padding

func set_uv2_padding(value: float) -> void:
	uv2_padding = value

