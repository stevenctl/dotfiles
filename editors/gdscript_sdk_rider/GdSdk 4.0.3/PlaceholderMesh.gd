extends Mesh
#brief Placeholder class for a mesh.
#desc This class is used when loading a project that uses a [Mesh] subclass in 2 conditions:
#desc - When running the project exported in dedicated server mode, only the texture's dimensions are kept (as they may be relied upon for gameplay purposes or positioning of other elements). This allows reducing the exported PCK's size significantly.
#desc - When this subclass is missing due to using a different engine version or build (e.g. modules disabled).
class_name PlaceholderMesh


#desc The smallest [AABB] enclosing this mesh in local space.
var aabb: AABB:
	get = get_aabb, set = set_aabb




func get_aabb() -> AABB:
	return aabb

func set_aabb(value: AABB) -> void:
	aabb = value

