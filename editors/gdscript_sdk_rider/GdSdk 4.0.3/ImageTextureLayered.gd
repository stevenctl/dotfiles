extends TextureLayered
#brief Base class for texture types which contain the data of multiple [ImageTexture]s. Each image is of the same size and format.
#desc Base class for [Texture2DArray], [Cubemap] and [CubemapArray]. Cannot be used directly, but contains all the functions necessary for accessing the derived resource types. See also [Texture3D].
class_name ImageTextureLayered




#desc Creates an [ImageTextureLayered] from an array of [Image]s. See [method Image.create] for the expected data format. The first image decides the width, height, image format and mipmapping setting. The other images [i]must[/i] have the same width, height, image format and mipmapping setting.
#desc Each [Image] represents one [code]layer[/code].
func create_from_images(images: Image[]) -> int:
	pass;

#desc Replaces the existing [Image] data at the given [code]layer[/code] with this new image.
#desc The given [Image] must have the same width, height, image format and mipmapping setting (a [code]bool[/code] value) as the rest of the referenced images.
#desc If the image format is unsupported, it will be decompressed and converted to a similar and supported [enum Image.Format].
#desc The update is immediate: it's synchronized with drawing.
func update_layer(image: Image, layer: int) -> void:
	pass;


