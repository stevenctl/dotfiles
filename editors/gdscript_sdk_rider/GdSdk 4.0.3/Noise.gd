extends Resource
#brief Abstract base class for noise generators.
#desc This class defines the interface for noise generation libraries to inherit from.
#desc A default get_seamless_noise() implementation is provided for libraries that do not provide seamless noise. This function requests a larger image from get_image(), reverses the quadrants of the image, then uses the strips of extra width to blend over the seams.
#desc Inheriting noise classes can optionally override this function to provide a more optimal algorithm.
class_name Noise




#desc Returns a 2D [Image] noise image.
#desc Note: With [param normalize] set to [code]false[/code] the default implementation expects the noise generator to return values in the range [code]-1.0[/code] to [code]1.0[/code].
func get_image(width: int, height: int, invert: bool = false, in_3d_space: bool = false, normalize: bool = true) -> Image:
	pass;

#desc Returns the 1D noise value at the given (x) coordinate.
func get_noise_1d(x: float) -> float:
	pass;

#desc Returns the 2D noise value at the given position.
func get_noise_2d(x: float, y: float) -> float:
	pass;

#desc Returns the 2D noise value at the given position.
func get_noise_2dv(v: Vector2) -> float:
	pass;

#desc Returns the 3D noise value at the given position.
func get_noise_3d(x: float, y: float, z: float) -> float:
	pass;

#desc Returns the 3D noise value at the given position.
func get_noise_3dv(v: Vector3) -> float:
	pass;

#desc Returns a seamless 2D [Image] noise image.
#desc Note: With [param normalize] set to [code]false[/code] the default implementation expects the noise generator to return values in the range [code]-1.0[/code] to [code]1.0[/code].
func get_seamless_image(width: int, height: int, invert: bool = false, in_3d_space: bool = false, skirt: float = 0.1, normalize: bool = true) -> Image:
	pass;


