extends Texture
#brief Base class for texture types which contain the data of multiple [Image]s. Each image is of the same size and format.
#desc Base class for [ImageTextureLayered] and [CompressedTextureLayered]. Cannot be used directly, but contains all the functions necessary for accessing the derived resource types. See also [Texture3D].
#desc Data is set on a per-layer basis. For [Texture2DArray]s, the layer specifies the array layer.
#desc All images need to have the same width, height and number of mipmap levels.
#desc A [TextureLayered] can be loaded with [method ResourceLoader.load].
#desc Internally, Godot maps these files to their respective counterparts in the target rendering driver (Vulkan, OpenGL3).
class_name TextureLayered

#desc Texture is a generic [Texture2DArray].
#desc Texture is a [Cubemap], with each side in its own layer (6 in total).
#desc Texture is a [CubemapArray], with each cubemap being made of 6 layers.

#enum LayeredType
enum {
    LAYERED_TYPE_2D_ARRAY = 0,
    LAYERED_TYPE_CUBEMAP = 1,
    LAYERED_TYPE_CUBEMAP_ARRAY = 2,
}


#desc Called when the [TextureLayered]'s format is queried.
func _get_format() -> int:
	pass;

#desc Called when the [TextureLayered]'s height is queried.
func _get_height() -> int:
	pass;

#desc Called when the data for a layer in the [TextureLayered] is queried.
func _get_layer_data(layer_index: int) -> Image:
	pass;

#desc Called when the layers' type in the [TextureLayered] is queried.
func _get_layered_type() -> int:
	pass;

#desc Called when the number of layers in the [TextureLayered] is queried.
func _get_layers() -> int:
	pass;

#desc Called when the [TextureLayered]'s width queried.
func _get_width() -> int:
	pass;

#desc Called when the presence of mipmaps in the [TextureLayered] is queried.
func _has_mipmaps() -> bool:
	pass;

#desc Returns the current format being used by this texture. See [enum Image.Format] for details.
func get_format() -> int:
	pass;

#desc Returns the height of the texture in pixels. Height is typically represented by the Y axis.
func get_height() -> int:
	pass;

#desc Returns an [Image] resource with the data from specified [param layer].
func get_layer_data(layer: int) -> Image:
	pass;

#desc Returns the [TextureLayered]'s type. The type determines how the data is accessed, with cubemaps having special types.
func get_layered_type() -> int:
	pass;

#desc Returns the number of referenced [Image]s.
func get_layers() -> int:
	pass;

#desc Returns the width of the texture in pixels. Width is typically represented by the X axis.
func get_width() -> int:
	pass;

#desc Returns [code]true[/code] if the layers have generated mipmaps.
func has_mipmaps() -> bool:
	pass;


