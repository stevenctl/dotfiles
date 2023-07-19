extends Resource
#brief A [Resource] that contains vertex array-based geometry.
#desc Mesh is a type of [Resource] that contains vertex array-based geometry, divided in [i]surfaces[/i]. Each surface contains a completely separate array and a material used to draw it. Design wise, a mesh with multiple surfaces is preferred to a single surface, because objects created in 3D editing software commonly contain multiple materials.
#tutorial [3D Material Testers Demo] https://godotengine.org/asset-library/asset/123
#tutorial [3D Kinematic Character Demo] https://godotengine.org/asset-library/asset/126
#tutorial [3D Platformer Demo] https://godotengine.org/asset-library/asset/125
#tutorial [Third Person Shooter Demo] https://godotengine.org/asset-library/asset/678
class_name Mesh

#desc Render array as points (one vertex equals one point).
#desc Render array as lines (every two vertices a line is created).
#desc Render array as line strip.
#desc Render array as triangles (every three vertices a triangle is created).
#desc Render array as triangle strips.
#desc [PackedVector3Array], [PackedVector2Array], or [Array] of vertex positions.
#desc [PackedVector3Array] of vertex normals.
#desc [PackedFloat32Array] of vertex tangents. Each element in groups of 4 floats, first 3 floats determine the tangent, and the last the binormal direction as -1 or 1.
#desc [PackedColorArray] of vertex colors.
#desc [PackedVector2Array] for UV coordinates.
#desc [PackedVector2Array] for second UV coordinates.
#desc Contains custom color channel 0. [PackedByteArray] if [code](format >> [constant ARRAY_FORMAT_CUSTOM0_SHIFT]) & [constant ARRAY_FORMAT_CUSTOM_MASK])[/code] is [constant ARRAY_CUSTOM_RGBA8_UNORM], [constant ARRAY_CUSTOM_RGBA8_UNORM], [constant ARRAY_CUSTOM_RG_HALF] or [constant ARRAY_CUSTOM_RGBA_HALF]. [PackedFloat32Array] otherwise.
#desc Contains custom color channel 1. [PackedByteArray] if [code](format >> [constant ARRAY_FORMAT_CUSTOM1_SHIFT]) & [constant ARRAY_FORMAT_CUSTOM_MASK])[/code] is [constant ARRAY_CUSTOM_RGBA8_UNORM], [constant ARRAY_CUSTOM_RGBA8_UNORM], [constant ARRAY_CUSTOM_RG_HALF] or [constant ARRAY_CUSTOM_RGBA_HALF]. [PackedFloat32Array] otherwise.
#desc Contains custom color channel 2. [PackedByteArray] if [code](format >> [constant ARRAY_FORMAT_CUSTOM2_SHIFT]) & [constant ARRAY_FORMAT_CUSTOM_MASK])[/code] is [constant ARRAY_CUSTOM_RGBA8_UNORM], [constant ARRAY_CUSTOM_RGBA8_UNORM], [constant ARRAY_CUSTOM_RG_HALF] or [constant ARRAY_CUSTOM_RGBA_HALF]. [PackedFloat32Array] otherwise.
#desc Contains custom color channel 3. [PackedByteArray] if [code](format >> [constant ARRAY_FORMAT_CUSTOM3_SHIFT]) & [constant ARRAY_FORMAT_CUSTOM_MASK])[/code] is [constant ARRAY_CUSTOM_RGBA8_UNORM], [constant ARRAY_CUSTOM_RGBA8_UNORM], [constant ARRAY_CUSTOM_RG_HALF] or [constant ARRAY_CUSTOM_RGBA_HALF]. [PackedFloat32Array] otherwise.
#desc [PackedFloat32Array] or [PackedInt32Array] of bone indices. Contains either 4 or 8 numbers per vertex depending on the presence of the [constant ARRAY_FLAG_USE_8_BONE_WEIGHTS] flag.
#desc [PackedFloat32Array] or [PackedFloat64Array] of bone weights in the range [code]0.0[/code] to [code]1.0[/code] (inclusive). Contains either 4 or 8 numbers per vertex depending on the presence of the [constant ARRAY_FLAG_USE_8_BONE_WEIGHTS] flag.
#desc [PackedInt32Array] of integers used as indices referencing vertices, colors, normals, tangents, and textures. All of those arrays must have the same number of elements as the vertex array. No index can be beyond the vertex array size. When this index array is present, it puts the function into "index mode," where the index selects the *i*'th vertex, normal, tangent, color, UV, etc. This means if you want to have different normals or colors along an edge, you have to duplicate the vertices.
#desc For triangles, the index array is interpreted as triples, referring to the vertices of each triangle. For lines, the index array is in pairs indicating the start and end of each line.
#desc Represents the size of the [enum ArrayType] enum.
#desc Indicates this custom channel contains unsigned normalized byte colors from 0 to 1, encoded as [PackedByteArray].
#desc Indicates this custom channel contains signed normalized byte colors from -1 to 1, encoded as [PackedByteArray].
#desc Indicates this custom channel contains half precision float colors, encoded as [PackedByteArray]. Only red and green channels are used.
#desc Indicates this custom channel contains half precision float colors, encoded as [PackedByteArray].
#desc Indicates this custom channel contains full float colors, in a [PackedFloat32Array]. Only the red channel is used.
#desc Indicates this custom channel contains full float colors, in a [PackedFloat32Array]. Only red and green channels are used.
#desc Indicates this custom channel contains full float colors, in a [PackedFloat32Array]. Only red, green and blue channels are used.
#desc Indicates this custom channel contains full float colors, in a [PackedFloat32Array].
#desc Represents the size of the [enum ArrayCustomFormat] enum.
#desc Mesh array contains vertices. All meshes require a vertex array so this should always be present.
#desc Mesh array contains normals.
#desc Mesh array contains tangents.
#desc Mesh array contains colors.
#desc Mesh array contains UVs.
#desc Mesh array contains second UV.
#desc Mesh array contains custom channel index 0.
#desc Mesh array contains custom channel index 1.
#desc Mesh array contains custom channel index 2.
#desc Mesh array contains custom channel index 3.
#desc Mesh array contains bones.
#desc Mesh array contains bone weights.
#desc Mesh array uses indices.
#desc Mask of mesh channels permitted in blend shapes.
#desc Shift of first custom channel.
#desc Number of format bits per custom channel. See [enum ArrayCustomFormat].
#desc Amount to shift [enum ArrayCustomFormat] for custom channel index 0.
#desc Amount to shift [enum ArrayCustomFormat] for custom channel index 1.
#desc Amount to shift [enum ArrayCustomFormat] for custom channel index 2.
#desc Amount to shift [enum ArrayCustomFormat] for custom channel index 3.
#desc Mask of custom format bits per custom channel. Must be shifted by one of the SHIFT constants. See [enum ArrayCustomFormat].
#desc Shift of first compress flag. Compress flags should be passed to [method ArrayMesh.add_surface_from_arrays] and [method SurfaceTool.commit].
#desc Flag used to mark that the array contains 2D vertices.
#desc Flag indices that the mesh data will use [code]GL_DYNAMIC_DRAW[/code] on GLES. Unused on Vulkan.
#desc Flag used to mark that the mesh contains up to 8 bone influences per vertex. This flag indicates that [constant ARRAY_BONES] and [constant ARRAY_WEIGHTS] elements will have double length.
#desc Flag used to mark that the mesh intentionally contains no vertex array.
#desc Blend shapes are normalized.
#desc Blend shapes are relative to base weight.

#enum PrimitiveType
enum {
    PRIMITIVE_POINTS = 0,
    PRIMITIVE_LINES = 1,
    PRIMITIVE_LINE_STRIP = 2,
    PRIMITIVE_TRIANGLES = 3,
    PRIMITIVE_TRIANGLE_STRIP = 4,
}
#enum ArrayType
enum {
    ARRAY_VERTEX = 0,
    ARRAY_NORMAL = 1,
    ARRAY_TANGENT = 2,
    ARRAY_COLOR = 3,
    ARRAY_TEX_UV = 4,
    ARRAY_TEX_UV2 = 5,
    ARRAY_CUSTOM0 = 6,
    ARRAY_CUSTOM1 = 7,
    ARRAY_CUSTOM2 = 8,
    ARRAY_CUSTOM3 = 9,
    ARRAY_BONES = 10,
    ARRAY_WEIGHTS = 11,
    ARRAY_INDEX = 12,
    ARRAY_MAX = 13,
}
#enum ArrayCustomFormat
enum {
    ARRAY_CUSTOM_RGBA8_UNORM = 0,
    ARRAY_CUSTOM_RGBA8_SNORM = 1,
    ARRAY_CUSTOM_RG_HALF = 2,
    ARRAY_CUSTOM_RGBA_HALF = 3,
    ARRAY_CUSTOM_R_FLOAT = 4,
    ARRAY_CUSTOM_RG_FLOAT = 5,
    ARRAY_CUSTOM_RGB_FLOAT = 6,
    ARRAY_CUSTOM_RGBA_FLOAT = 7,
    ARRAY_CUSTOM_MAX = 8,
}
#enum ArrayFormat
enum {
    ARRAY_FORMAT_VERTEX = 1,
    ARRAY_FORMAT_NORMAL = 2,
    ARRAY_FORMAT_TANGENT = 4,
    ARRAY_FORMAT_COLOR = 8,
    ARRAY_FORMAT_TEX_UV = 16,
    ARRAY_FORMAT_TEX_UV2 = 32,
    ARRAY_FORMAT_CUSTOM0 = 64,
    ARRAY_FORMAT_CUSTOM1 = 128,
    ARRAY_FORMAT_CUSTOM2 = 256,
    ARRAY_FORMAT_CUSTOM3 = 512,
    ARRAY_FORMAT_BONES = 1024,
    ARRAY_FORMAT_WEIGHTS = 2048,
    ARRAY_FORMAT_INDEX = 4096,
    ARRAY_FORMAT_BLEND_SHAPE_MASK = 7,
    ARRAY_FORMAT_CUSTOM_BASE = 13,
    ARRAY_FORMAT_CUSTOM_BITS = 3,
    ARRAY_FORMAT_CUSTOM0_SHIFT = 13,
    ARRAY_FORMAT_CUSTOM1_SHIFT = 16,
    ARRAY_FORMAT_CUSTOM2_SHIFT = 19,
    ARRAY_FORMAT_CUSTOM3_SHIFT = 22,
    ARRAY_FORMAT_CUSTOM_MASK = 7,
    ARRAY_COMPRESS_FLAGS_BASE = 25,
    ARRAY_FLAG_USE_2D_VERTICES = 33554432,
    ARRAY_FLAG_USE_DYNAMIC_UPDATE = 67108864,
    ARRAY_FLAG_USE_8_BONE_WEIGHTS = 134217728,
    ARRAY_FLAG_USES_EMPTY_VERTEX_ARRAY = 268435456,
}
#enum BlendShapeMode
enum {
    BLEND_SHAPE_MODE_NORMALIZED = 0,
    BLEND_SHAPE_MODE_RELATIVE = 1,
}
#desc Sets a hint to be used for lightmap resolution.
var lightmap_size_hint: Vector2i:
	get = get_lightmap_size_hint, set = set_lightmap_size_hint



#desc Virtual method to override the [AABB] for a custom class extending [Mesh].
func _get_aabb() -> AABB:
	pass;

#desc Virtual method to override the number of blend shapes for a custom class extending [Mesh].
func _get_blend_shape_count() -> int:
	pass;

#desc Virtual method to override the retrieval of blend shape names for a custom class extending [Mesh].
func _get_blend_shape_name(index: int) -> StringName:
	pass;

#desc Virtual method to override the surface count for a custom class extending [Mesh].
func _get_surface_count() -> int:
	pass;

#desc Virtual method to override the names of blend shapes for a custom class extending [Mesh].
func _set_blend_shape_name(index: int, name: StringName) -> void:
	pass;

#desc Virtual method to override the surface array index length for a custom class extending [Mesh].
func _surface_get_array_index_len(index: int) -> int:
	pass;

#desc Virtual method to override the surface array length for a custom class extending [Mesh].
func _surface_get_array_len(index: int) -> int:
	pass;

#desc Virtual method to override the surface arrays for a custom class extending [Mesh].
func _surface_get_arrays(index: int) -> Array:
	pass;

#desc Virtual method to override the blend shape arrays for a custom class extending [Mesh].
func _surface_get_blend_shape_arrays(index: int) -> Array[Array]:
	pass;

#desc Virtual method to override the surface format for a custom class extending [Mesh].
func _surface_get_format(index: int) -> int:
	pass;

#desc Virtual method to override the surface LODs for a custom class extending [Mesh].
func _surface_get_lods(index: int) -> Dictionary:
	pass;

#desc Virtual method to override the surface material for a custom class extending [Mesh].
func _surface_get_material(index: int) -> Material:
	pass;

#desc Virtual method to override the surface primitive type for a custom class extending [Mesh].
func _surface_get_primitive_type(index: int) -> int:
	pass;

#desc Virtual method to override the setting of a [param material] at the given [param index] for a custom class extending [Mesh].
func _surface_set_material(index: int, material: Material) -> void:
	pass;

#desc Calculate a [ConvexPolygonShape3D] from the mesh.
#desc If [param clean] is [code]true[/code] (default), duplicate and interior vertices are removed automatically. You can set it to [code]false[/code] to make the process faster if not needed.
#desc If [param simplify] is [code]true[/code], the geometry can be further simplified to reduce the number of vertices. Disabled by default.
func create_convex_shape(clean: bool = true, simplify: bool = false) -> ConvexPolygonShape3D:
	pass;

#desc Calculate an outline mesh at a defined offset (margin) from the original mesh.
#desc [b]Note:[/b] This method typically returns the vertices in reverse order (e.g. clockwise to counterclockwise).
func create_outline(margin: float) -> Mesh:
	pass;

#desc Creates a placeholder version of this resource ([PlaceholderMesh]).
func create_placeholder() -> Resource:
	pass;

#desc Calculate a [ConcavePolygonShape3D] from the mesh.
func create_trimesh_shape() -> ConcavePolygonShape3D:
	pass;

#desc Generate a [TriangleMesh] from the mesh. Considers only surfaces using one of these primitive types: [constant PRIMITIVE_TRIANGLES], [constant PRIMITIVE_TRIANGLE_STRIP].
func generate_triangle_mesh() -> TriangleMesh:
	pass;

#desc Returns the smallest [AABB] enclosing this mesh in local space. Not affected by [code]custom_aabb[/code].
#desc [b]Note:[/b] This is only implemented for [ArrayMesh] and [PrimitiveMesh].
func get_aabb() -> AABB:
	pass;

#desc Returns all the vertices that make up the faces of the mesh. Each three vertices represent one triangle.
func get_faces() -> PackedVector3Array:
	pass;

#desc Returns the number of surfaces that the [Mesh] holds.
func get_surface_count() -> int:
	pass;

#desc Returns the arrays for the vertices, normals, uvs, etc. that make up the requested surface (see [method ArrayMesh.add_surface_from_arrays]).
func surface_get_arrays(surf_idx: int) -> Array:
	pass;

#desc Returns the blend shape arrays for the requested surface.
func surface_get_blend_shape_arrays(surf_idx: int) -> Array[Array]:
	pass;

#desc Returns a [Material] in a given surface. Surface is rendered using this material.
func surface_get_material(surf_idx: int) -> Material:
	pass;

#desc Sets a [Material] for a given surface. Surface will be rendered using this material.
func surface_set_material(surf_idx: int, material: Material) -> void:
	pass;


func get_lightmap_size_hint() -> Vector2i:
	return lightmap_size_hint

func set_lightmap_size_hint(value: Vector2i) -> void:
	lightmap_size_hint = value

