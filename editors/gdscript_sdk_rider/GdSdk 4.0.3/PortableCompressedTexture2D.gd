extends Texture2D
#brief Provides a compressed texture for disk and/or VRAM in a way that is portable.
#desc This class allows storing compressed textures as self contained (not imported) resources.
#desc For 2D usage (compressed on disk, uncompressed on VRAM), the lossy and lossless modes are recommended. For 3D usage (compressed on VRAM) it depends on the target platform.
#desc If you intend to only use desktop, S3TC or BPTC are recommended. For only mobile, ETC2 is recommended.
#desc For portable, self contained 3D textures that work on both desktop and mobile, Basis Universal is recommended (although it has a small quality cost and longer compression time as a tradeoff).
#desc This resource is intended to be created from code.
class_name PortableCompressedTexture2D


#enum CompressionMode
enum {
    COMPRESSION_MODE_LOSSLESS = 0,
    COMPRESSION_MODE_LOSSY = 1,
    COMPRESSION_MODE_BASIS_UNIVERSAL = 2,
    COMPRESSION_MODE_S3TC = 3,
    COMPRESSION_MODE_ETC2 = 4,
    COMPRESSION_MODE_BPTC = 5,
}
var _data: PackedByteArray:
	get = _get_data, set = _set_data

#desc When running on the editor, this class will keep the source compressed data in memory. Otherwise, the source compressed data is lost after loading and the resource can't be re saved.
#desc This flag allows to keep the compressed data in memory if you intend it to persist after loading.
var keep_compressed_buffer: bool:
	get = is_keeping_compressed_buffer, set = set_keep_compressed_buffer

var resource_local_to_scene: bool:
	get = is_local_to_scene, set = set_local_to_scene

#desc Allow overriding the texture size (for 2D only).
var size_override: Vector2:
	get = get_size_override, set = set_size_override



#desc Initializes the compressed texture from a base image. The compression mode must be provided.
#desc [param normal_map] is recommended to ensure optimum quality if this image will be used as a normal map.
#desc If lossy compression is requested, the quality setting can optionally be provided. This maps to Lossy WebP compression quality.
func create_from_image(image: Image, compression_mode: int, normal_map: bool = false, lossy_quality: float = 0.8) -> void:
	pass;

#desc Return the compression mode used (valid after initialized).
func get_compression_mode() -> int:
	pass;

#desc Return the image format used (valid after initialized).
func get_format() -> int:
	pass;

#desc Return whether the flag is overridden for all textures of this type.
static func is_keeping_all_compressed_buffers() -> bool:
	pass;

#desc Overrides the flag globally for all textures of this type. This is used primarily by the editor.
static func set_keep_all_compressed_buffers(keep: bool) -> void:
	pass;


func _get_data() -> PackedByteArray:
	return _data

func _set_data(value: PackedByteArray) -> void:
	_data = value

func is_keeping_compressed_buffer() -> bool:
	return keep_compressed_buffer

func set_keep_compressed_buffer(value: bool) -> void:
	keep_compressed_buffer = value

func is_local_to_scene() -> bool:
	return resource_local_to_scene

func set_local_to_scene(value: bool) -> void:
	resource_local_to_scene = value

func get_size_override() -> Vector2:
	return size_override

func set_size_override(value: Vector2) -> void:
	size_override = value

