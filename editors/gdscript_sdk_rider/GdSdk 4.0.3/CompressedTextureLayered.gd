extends TextureLayered
#brief Base class for texture arrays that can optionally be compressed.
#desc Base class for [CompressedTexture2DArray] and [CompressedTexture3D]. Cannot be used directly, but contains all the functions necessary for accessing the derived resource types. See also [TextureLayered].
class_name CompressedTextureLayered


#desc The path the texture should be loaded from.
var load_path: String:
	get = get_load_path, set = load



#desc Loads the texture at [param path].
func load(path: String) -> int:
	pass;


func get_load_path() -> String:
	return load_path

func load(value: String) -> void:
	load_path = value

