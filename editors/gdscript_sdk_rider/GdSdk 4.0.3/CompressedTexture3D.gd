extends Texture3D
#brief Texture with 3 dimensions, optionally compressed.
#desc [CompressedTexture3D] is the VRAM-compressed counterpart of [ImageTexture3D]. The file extension for [CompressedTexture3D] files is [code].ctex3d[/code]. This file format is internal to Godot; it is created by importing other image formats with the import system.
#desc [CompressedTexture3D] uses VRAM compression, which allows to reduce memory usage on the GPU when rendering the texture. This also improves loading times, as VRAM-compressed textures are faster to load compared to textures using lossless compression. VRAM compression can exhibit noticeable artifacts and is intended to be used for 3D rendering, not 2D.
#desc See [Texture3D] for a general description of 3D textures.
class_name CompressedTexture3D


#desc The [CompressedTexture3D]'s file path to a [code].ctex3d[/code] file.
var load_path: String:
	get = get_load_path, set = load



#desc Loads the texture from the specified [param path].
func load(path: String) -> int:
	pass;


func get_load_path() -> String:
	return load_path

func load(value: String) -> void:
	load_path = value

