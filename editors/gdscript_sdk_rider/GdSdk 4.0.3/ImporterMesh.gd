extends Resource
#brief A [Resource] that contains vertex array-based geometry during the import process.
#desc ImporterMesh is a type of [Resource] analogous to [ArrayMesh]. It contains vertex array-based geometry, divided in [i]surfaces[/i]. Each surface contains a completely separate array and a material used to draw it. Design wise, a mesh with multiple surfaces is preferred to a single surface, because objects created in 3D editing software commonly contain multiple materials.
#desc Unlike its runtime counterpart, [ImporterMesh] contains mesh data before various import steps, such as lod and shadow mesh generation, have taken place. Modify surface data by calling [method clear], followed by [method add_surface] for each surface.
class_name ImporterMesh


var _data: Dictionary:
	get = _get_data, set = _set_data



#desc Adds name for a blend shape that will be added with [method add_surface]. Must be called before surface is added.
func add_blend_shape(name: String) -> void:
	pass;

#desc Creates a new surface. [method Mesh.get_surface_count] will become the [code]surf_idx[/code] for this new surface.
#desc Surfaces are created to be rendered using a [param primitive], which may be any of the values defined in [enum Mesh.PrimitiveType].
#desc The [param arrays] argument is an array of arrays. Each of the [constant Mesh.ARRAY_MAX] elements contains an array with some of the mesh data for this surface as described by the corresponding member of [enum Mesh.ArrayType] or [code]null[/code] if it is not used by the surface. For example, [code]arrays[0][/code] is the array of vertices. That first vertex sub-array is always required; the others are optional. Adding an index array puts this surface into "index mode" where the vertex and other arrays become the sources of data and the index array defines the vertex order. All sub-arrays must have the same length as the vertex array (or be an exact multiple of the vertex array's length, when multiple elements of a sub-array correspond to a single vertex) or be empty, except for [constant Mesh.ARRAY_INDEX] if it is used.
#desc The [param blend_shapes] argument is an array of vertex data for each blend shape. Each element is an array of the same structure as [param arrays], but [constant Mesh.ARRAY_VERTEX], [constant Mesh.ARRAY_NORMAL], and [constant Mesh.ARRAY_TANGENT] are set if and only if they are set in [param arrays] and all other entries are [code]null[/code].
#desc The [param lods] argument is a dictionary with [float] keys and [PackedInt32Array] values. Each entry in the dictionary represents a LOD level of the surface, where the value is the [constant Mesh.ARRAY_INDEX] array to use for the LOD level and the key is roughly proportional to the distance at which the LOD stats being used. I.e., increasing the key of a LOD also increases the distance that the objects has to be from the camera before the LOD is used.
#desc The [param flags] argument is the bitwise or of, as required: One value of [enum Mesh.ArrayCustomFormat] left shifted by [code]ARRAY_FORMAT_CUSTOMn_SHIFT[/code] for each custom channel in use, [constant Mesh.ARRAY_FLAG_USE_DYNAMIC_UPDATE], [constant Mesh.ARRAY_FLAG_USE_8_BONE_WEIGHTS], or [constant Mesh.ARRAY_FLAG_USES_EMPTY_VERTEX_ARRAY].
#desc [b]Note:[/b] When using indices, it is recommended to only use points, lines, or triangles.
func add_surface(primitive: int, arrays: Array, blend_shapes: Array[] = [], lods: Dictionary = {}, material: Material = null, name: String = "", flags: int = 0) -> void:
	pass;

#desc Removes all surfaces and blend shapes from this [ImporterMesh].
func clear() -> void:
	pass;

#desc Generates all lods for this ImporterMesh.
#desc [param normal_merge_angle] and [param normal_split_angle] are in degrees and used in the same way as the importer settings in [code]lods[/code]. As a good default, use 25 and 60 respectively.
#desc The number of generated lods can be accessed using [method get_surface_lod_count], and each LOD is available in [method get_surface_lod_size] and [method get_surface_lod_indices].
#desc [param bone_transform_array] is an [Array] which can be either empty or contain [Transform3D]s which, for each of the mesh's bone IDs, will apply mesh skinning when generating the LOD mesh variations. This is usually used to account for discrepancies in scale between the mesh itself and its skinning data.
func generate_lods(normal_merge_angle: float, normal_split_angle: float, bone_transform_array: Array) -> void:
	pass;

#desc Returns the number of blend shapes that the mesh holds.
func get_blend_shape_count() -> int:
	pass;

#desc Returns the blend shape mode for this Mesh.
func get_blend_shape_mode() -> int:
	pass;

#desc Returns the name of the blend shape at this index.
func get_blend_shape_name(blend_shape_idx: int) -> String:
	pass;

#desc Returns the size hint of this mesh for lightmap-unwrapping in UV-space.
func get_lightmap_size_hint() -> Vector2i:
	pass;

#desc Returns the mesh data represented by this [ImporterMesh] as a usable [ArrayMesh].
#desc This method caches the returned mesh, and subsequent calls will return the cached data until [method clear] is called.
#desc If not yet cached and [param base_mesh] is provided, [param base_mesh] will be used and mutated.
func get_mesh(base_mesh: ArrayMesh = null) -> ArrayMesh:
	pass;

#desc Returns the arrays for the vertices, normals, uvs, etc. that make up the requested surface. See [method add_surface].
func get_surface_arrays(surface_idx: int) -> Array:
	pass;

#desc Returns a single set of blend shape arrays for the requested blend shape index for a surface.
func get_surface_blend_shape_arrays(surface_idx: int, blend_shape_idx: int) -> Array:
	pass;

#desc Returns the number of surfaces that the mesh holds.
func get_surface_count() -> int:
	pass;

#desc Returns the format of the surface that the mesh holds.
func get_surface_format(surface_idx: int) -> int:
	pass;

#desc Returns the number of lods that the mesh holds on a given surface.
func get_surface_lod_count(surface_idx: int) -> int:
	pass;

#desc Returns the index buffer of a lod for a surface.
func get_surface_lod_indices(surface_idx: int, lod_idx: int) -> PackedInt32Array:
	pass;

#desc Returns the screen ratio which activates a lod for a surface.
func get_surface_lod_size(surface_idx: int, lod_idx: int) -> float:
	pass;

#desc Returns a [Material] in a given surface. Surface is rendered using this material.
func get_surface_material(surface_idx: int) -> Material:
	pass;

#desc Gets the name assigned to this surface.
func get_surface_name(surface_idx: int) -> String:
	pass;

#desc Returns the primitive type of the requested surface (see [method add_surface]).
func get_surface_primitive_type(surface_idx: int) -> int:
	pass;

#desc Sets the blend shape mode to one of [enum Mesh.BlendShapeMode].
func set_blend_shape_mode(mode: int) -> void:
	pass;

#desc Sets the size hint of this mesh for lightmap-unwrapping in UV-space.
func set_lightmap_size_hint(size: Vector2i) -> void:
	pass;

#desc Sets a [Material] for a given surface. Surface will be rendered using this material.
func set_surface_material(surface_idx: int, material: Material) -> void:
	pass;

#desc Sets a name for a given surface.
func set_surface_name(surface_idx: int, name: String) -> void:
	pass;


func _get_data() -> Dictionary:
	return _data

func _set_data(value: Dictionary) -> void:
	_data = value

