extends TextureLayered
#brief Placeholder class for a 2-dimensional texture array.
#desc This class is used when loading a project that uses a [TextureLayered] subclass in 2 conditions:
#desc - When running the project exported in dedicated server mode, only the texture's dimensions are kept (as they may be relied upon for gameplay purposes or positioning of other elements). This allows reducing the exported PCK's size significantly.
#desc - When this subclass is missing due to using a different engine version or build (e.g. modules disabled).
#desc [b]Note:[/b] This is not intended to be used as an actual texture for rendering. It is not guaranteed to work like one in shaders or materials (for example when calculating UV).
class_name PlaceholderTextureLayered


#desc The number of layers in the texture array.
var layers: int:
	get = get_layers, set = set_layers

#desc The size of each texture layer (in pixels).
var size: Vector2i:
	get = get_size, set = set_size




func get_layers() -> int:
	return layers

func set_layers(value: int) -> void:
	layers = value

func get_size() -> Vector2i:
	return size

func set_size(value: Vector2i) -> void:
	size = value

