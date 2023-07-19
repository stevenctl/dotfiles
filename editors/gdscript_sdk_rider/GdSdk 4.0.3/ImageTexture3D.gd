extends Texture3D
#brief Texture with 3 dimensions.
#desc [ImageTexture3D] is a 3-dimensional [ImageTexture] that has a width, height, and depth. See also [ImageTextureLayered].
#desc 3D textures are typically used to store density maps for [FogMaterial], color correction LUTs for [Environment], vector fields for [GPUParticlesAttractorVectorField3D] and collision maps for [GPUParticlesCollisionSDF3D]. 3D textures can also be used in custom shaders.
class_name ImageTexture3D




#desc Creates the [ImageTexture3D] with specified [param width], [param height], and [param depth]. See [enum Image.Format] for [param format] options. If [param use_mipmaps] is [code]true[/code], then generate mipmaps for the [ImageTexture3D].
func create(format: int, width: int, height: int, depth: int, use_mipmaps: bool, data: Image[]) -> int:
	pass;

#desc Replaces the texture's existing data with the layers specified in [code]data[/code]. The size of [code]data[/code] must match the parameters that were used for [method create]. In other words, the texture cannot be resized or have its format changed by calling [method update].
func update(data: Image[]) -> void:
	pass;


