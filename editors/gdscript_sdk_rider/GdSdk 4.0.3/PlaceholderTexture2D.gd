extends Texture2D
#brief Placeholder class for a 2-dimensional texture.
#desc This class is used when loading a project that uses a [Texture2D] subclass in 2 conditions:
#desc - When running the project exported in dedicated server mode, only the texture's dimensions are kept (as they may be relied upon for gameplay purposes or positioning of other elements). This allows reducing the exported PCK's size significantly.
#desc - When this subclass is missing due to using a different engine version or build (e.g. modules disabled).
#desc [b]Note:[/b] This is not intended to be used as an actual texture for rendering. It is not guaranteed to work like one in shaders or materials (for example when calculating UV).
class_name PlaceholderTexture2D


var resource_local_to_scene: bool:
	get = is_local_to_scene, set = set_local_to_scene

#desc The texture's size (in pixels).
var size: Vector2:
	get = get_size, set = set_size




func is_local_to_scene() -> bool:
	return resource_local_to_scene

func set_local_to_scene(value: bool) -> void:
	resource_local_to_scene = value

func get_size() -> Vector2:
	return size

func set_size(value: Vector2) -> void:
	size = value

