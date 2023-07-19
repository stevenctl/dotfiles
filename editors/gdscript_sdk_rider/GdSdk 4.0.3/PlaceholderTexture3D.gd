extends Texture3D
#brief Placeholder class for a 3-dimensional texture.
#desc This class is used when loading a project that uses a [Texture3D] subclass in 2 conditions:
#desc - When running the project exported in dedicated server mode, only the texture's dimensions are kept (as they may be relied upon for gameplay purposes or positioning of other elements). This allows reducing the exported PCK's size significantly.
#desc - When this subclass is missing due to using a different engine version or build (e.g. modules disabled).
#desc [b]Note:[/b] This is not intended to be used as an actual texture for rendering. It is not guaranteed to work like one in shaders or materials (for example when calculating UV).
class_name PlaceholderTexture3D


#desc The texture's size (in pixels).
var size: Vector3i:
	get = get_size, set = set_size




func get_size() -> Vector3i:
	return size

func set_size(value: Vector3i) -> void:
	size = value

