extends Texture2D
#brief Texture with 2 dimensions, optionally compressed.
#desc A texture that is loaded from a [code].ctex[/code] file. This file format is internal to Godot; it is created by importing other image formats with the import system. [CompressedTexture2D] can use one of 4 compression methods (including a lack of any compression):
#desc - Lossless (WebP or PNG, uncompressed on the GPU)
#desc - Lossy (WebP, uncompressed on the GPU)
#desc - VRAM Compressed (compressed on the GPU)
#desc - VRAM Uncompressed (uncompressed on the GPU)
#desc - Basis Universal (compressed on the GPU. Lower file sizes than VRAM Compressed, but slower to compress and lower quality than VRAM Compressed)
#desc Only [b]VRAM Compressed[/b] actually reduces the memory usage on the GPU. The [b]Lossless[/b] and [b]Lossy[/b] compression methods will reduce the required storage on disk, but they will not reduce memory usage on the GPU as the texture is sent to the GPU uncompressed.
#desc Using [b]VRAM Compressed[/b] also improves loading times, as VRAM-compressed textures are faster to load compared to textures using lossless or lossy compression. VRAM compression can exhibit noticeable artifacts and is intended to be used for 3D rendering, not 2D.
class_name CompressedTexture2D


#desc The [CompressedTexture2D]'s file path to a [code].ctex[/code] file.
var load_path: String:
	get = get_load_path, set = load

var resource_local_to_scene: bool:
	get = is_local_to_scene, set = set_local_to_scene



#desc Loads the texture from the specified [param path].
func load(path: String) -> int:
	pass;


func get_load_path() -> String:
	return load_path

func load(value: String) -> void:
	load_path = value

func is_local_to_scene() -> bool:
	return resource_local_to_scene

func set_local_to_scene(value: bool) -> void:
	resource_local_to_scene = value

