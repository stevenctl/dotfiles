extends Texture
#brief Base class for 3-dimensionnal textures.
#desc Base class for [ImageTexture3D] and [CompressedTexture3D]. Cannot be used directly, but contains all the functions necessary for accessing the derived resource types. [Texture3D] is the base class for all 3-dimensional texture types. See also [TextureLayered].
#desc All images need to have the same width, height and number of mipmap levels.
#desc To create such a texture file yourself, reimport your image files using the Godot Editor import presets.
class_name Texture3D




#desc Called when the [Texture3D]'s data is queried.
func _get_data() -> Array[Image]:
	pass;

#desc Called when the [Texture3D]'s depth is queried.
func _get_depth() -> int:
	pass;

#desc Called when the [Texture3D]'s format is queried.
func _get_format() -> int:
	pass;

#desc Called when the [Texture3D]'s height is queried.
func _get_height() -> int:
	pass;

#desc Called when the [Texture3D]'s width is queried.
func _get_width() -> int:
	pass;

#desc Called when the presence of mipmaps in the [Texture3D] is queried.
func _has_mipmaps() -> bool:
	pass;

#desc Creates a placeholder version of this resource ([PlaceholderTexture3D]).
func create_placeholder() -> Resource:
	pass;

#desc Returns the [Texture3D]'s data as an array of [Image]s. Each [Image] represents a [i]slice[/i] of the [Texture3D], with different slices mapping to different depth (Z axis) levels.
func get_data() -> Array[Image]:
	pass;

#desc Returns the [Texture3D]'s depth in pixels. Depth is typically represented by the Z axis (a dimension not present in [Texture2D]).
func get_depth() -> int:
	pass;

#desc Returns the current format being used by this texture. See [enum Image.Format] for details.
func get_format() -> int:
	pass;

#desc Returns the [Texture3D]'s height in pixels. Width is typically represented by the Y axis.
func get_height() -> int:
	pass;

#desc Returns the [Texture3D]'s width in pixels. Width is typically represented by the X axis.
func get_width() -> int:
	pass;

#desc Returns [code]true[/code] if the [Texture3D] has generated mipmaps.
func has_mipmaps() -> bool:
	pass;


