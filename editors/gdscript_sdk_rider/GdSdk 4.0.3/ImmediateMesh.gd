extends Mesh
#brief Mesh optimized for creating geometry manually.
#desc A mesh type optimized for creating geometry manually, similar to OpenGL 1.x immediate mode.
#desc Here's a sample on how to generate a triangular face:
#desc [codeblocks]
#desc var mesh = ImmediateMesh.new()
#desc mesh.surface_begin(Mesh.PRIMITIVE_TRIANGLES)
#desc mesh.surface_add_vertex(Vector3.LEFT)
#desc mesh.surface_add_vertex(Vector3.FORWARD)
#desc mesh.surface_add_vertex(Vector3.ZERO)
#desc mesh.surface_end()
#desc [/codeblocks]
#desc [b]Note:[/b] Generating complex geometries with [ImmediateMesh] is highly inefficient. Instead, it is designed to generate simple geometry that changes often.
#tutorial [Using ImmediateMesh] https://docs.godotengine.org/en/stable/tutorials/3d/procedural_geometry/immediatemesh.html
class_name ImmediateMesh




#desc Clear all surfaces.
func clear_surfaces() -> void:
	pass;

#desc Add a 3D vertex using the current attributes previously set.
func surface_add_vertex(vertex: Vector3) -> void:
	pass;

#desc Add a 2D vertex using the current attributes previously set.
func surface_add_vertex_2d(vertex: Vector2) -> void:
	pass;

#desc Begin a new surface.
func surface_begin(primitive: int, material: Material = null) -> void:
	pass;

#desc End and commit current surface. Note that surface being created will not be visible until this function is called.
func surface_end() -> void:
	pass;

#desc Set the color attribute that will be pushed with the next vertex.
func surface_set_color(color: Color) -> void:
	pass;

#desc Set the normal attribute that will be pushed with the next vertex.
func surface_set_normal(normal: Vector3) -> void:
	pass;

#desc Set the tangent attribute that will be pushed with the next vertex.
func surface_set_tangent(tangent: Plane) -> void:
	pass;

#desc Set the UV attribute that will be pushed with the next vertex.
func surface_set_uv(uv: Vector2) -> void:
	pass;

#desc Set the UV2 attribute that will be pushed with the next vertex.
func surface_set_uv2(uv2: Vector2) -> void:
	pass;


