extends Noise
#brief Generates noise using the FastNoiseLite library.
#desc This class generates noise using the FastNoiseLite library, which is a collection of several noise algorithms including Cellular, Perlin, Value, and more.
#desc Most generated noise values are in the range of [code][-1,1][/code], however not always. Some of the cellular noise algorithms return results above [code]1[/code].
class_name FastNoiseLite

#desc A lattice of points are assigned random values then interpolated based on neighboring values.
#desc Similar to Value noise, but slower. Has more variance in peaks and valleys.
#desc Cubic noise can be used to avoid certain artifacts when using value noise to create a bumpmap. In general, you should always use this mode if the value noise is being used for a heightmap or bumpmap.
#desc A lattice of random gradients. Their dot products are interpolated to obtain values in between the lattices.
#desc Cellular includes both Worley noise and Voronoi diagrams which creates various regions of the same value.
#desc As opposed to [constant TYPE_PERLIN], gradients exist in a simplex lattice rather than a grid lattice, avoiding directional artifacts.
#desc Modified, higher quality version of [constant TYPE_SIMPLEX], but slower.
#desc No fractal noise.
#desc Method using Fractional Brownian Motion to combine octaves into a fractal.
#desc Method of combining octaves into a fractal resulting in a "ridged" look.
#desc Method of combining octaves into a fractal with a ping pong effect.
#desc Euclidean distance to the nearest point.
#desc Squared Euclidean distance to the nearest point.
#desc Manhattan distance (taxicab metric) to the nearest point.
#desc Blend of [constant DISTANCE_EUCLIDEAN] and [constant DISTANCE_MANHATTAN] to give curved cell boundaries
#desc The cellular distance function will return the same value for all points within a cell.
#desc The cellular distance function will return a value determined by the distance to the nearest point.
#desc The cellular distance function returns the distance to the second-nearest point.
#desc The distance to the nearest point is added to the distance to the second-nearest point.
#desc The distance to the nearest point is subtracted from the distance to the second-nearest point.
#desc The distance to the nearest point is multiplied with the distance to the second-nearest point.
#desc The distance to the nearest point is divided by the distance to the second-nearest point.
#desc The domain is warped using the simplex noise algorithm.
#desc The domain is warped using a simplified version of the simplex noise algorithm.
#desc The domain is warped using a simple noise grid (not as smooth as the other methods, but more performant).
#desc No fractal noise for warping the space.
#desc Warping the space progressively, octave for octave, resulting in a more "liquified" distortion.
#desc Warping the space independently for each octave, resulting in a more chaotic distortion.

#enum NoiseType
enum {
    TYPE_VALUE = 5,
    TYPE_VALUE_CUBIC = 4,
    TYPE_PERLIN = 3,
    TYPE_CELLULAR = 2,
    TYPE_SIMPLEX = 0,
    TYPE_SIMPLEX_SMOOTH = 1,
}
#enum FractalType
enum {
    FRACTAL_NONE = 0,
    FRACTAL_FBM = 1,
    FRACTAL_RIDGED = 2,
    FRACTAL_PING_PONG = 3,
}
#enum CellularDistanceFunction
enum {
    DISTANCE_EUCLIDEAN = 0,
    DISTANCE_EUCLIDEAN_SQUARED = 1,
    DISTANCE_MANHATTAN = 2,
    DISTANCE_HYBRID = 3,
}
#enum CellularReturnType
enum {
    RETURN_CELL_VALUE = 0,
    RETURN_DISTANCE = 1,
    RETURN_DISTANCE2 = 2,
    RETURN_DISTANCE2_ADD = 3,
    RETURN_DISTANCE2_SUB = 4,
    RETURN_DISTANCE2_MUL = 5,
    RETURN_DISTANCE2_DIV = 6,
}
#enum DomainWarpType
enum {
    DOMAIN_WARP_SIMPLEX = 0,
    DOMAIN_WARP_SIMPLEX_REDUCED = 1,
    DOMAIN_WARP_BASIC_GRID = 2,
}
#enum DomainWarpFractalType
enum {
    DOMAIN_WARP_FRACTAL_NONE = 0,
    DOMAIN_WARP_FRACTAL_PROGRESSIVE = 1,
    DOMAIN_WARP_FRACTAL_INDEPENDENT = 2,
}
#desc Determines how the distance to the nearest/second-nearest point is computed. See [enum CellularDistanceFunction] for options.
var cellular_distance_function: int:
	get = get_cellular_distance_function, set = set_cellular_distance_function

#desc Maximum distance a point can move off of its grid position. Set to [code]0[/code] for an even grid.
var cellular_jitter: float:
	get = get_cellular_jitter, set = set_cellular_jitter

#desc Return type from cellular noise calculations. See [enum CellularReturnType].
var cellular_return_type: int:
	get = get_cellular_return_type, set = set_cellular_return_type

#desc Sets the maximum warp distance from the origin.
var domain_warp_amplitude: float:
	get = get_domain_warp_amplitude, set = set_domain_warp_amplitude

#desc If enabled, another FastNoiseLite instance is used to warp the space, resulting in a distortion of the noise.
var domain_warp_enabled: bool:
	get = is_domain_warp_enabled, set = set_domain_warp_enabled

#desc Determines the strength of each subsequent layer of the noise which is used to warp the space.
#desc A low value places more emphasis on the lower frequency base layers, while a high value puts more emphasis on the higher frequency layers.
var domain_warp_fractal_gain: float:
	get = get_domain_warp_fractal_gain, set = set_domain_warp_fractal_gain

#desc Octave lacunarity of the fractal noise which warps the space. Increasing this value results in higher octaves producing noise with finer details and a rougher appearance.
var domain_warp_fractal_lacunarity: float:
	get = get_domain_warp_fractal_lacunarity, set = set_domain_warp_fractal_lacunarity

#desc The number of noise layers that are sampled to get the final value for the fractal noise which warps the space.
var domain_warp_fractal_octaves: int:
	get = get_domain_warp_fractal_octaves, set = set_domain_warp_fractal_octaves

#desc The method for combining octaves into a fractal which is used to warp the space. See [enum DomainWarpFractalType].
var domain_warp_fractal_type: int:
	get = get_domain_warp_fractal_type, set = set_domain_warp_fractal_type

#desc Frequency of the noise which warps the space. Low frequency results in smooth noise while high frequency results in rougher, more granular noise.
var domain_warp_frequency: float:
	get = get_domain_warp_frequency, set = set_domain_warp_frequency

#desc Sets the warp algorithm. See [enum DomainWarpType].
var domain_warp_type: int:
	get = get_domain_warp_type, set = set_domain_warp_type

#desc Determines the strength of each subsequent layer of noise in fractal noise.
#desc A low value places more emphasis on the lower frequency base layers, while a high value puts more emphasis on the higher frequency layers.
var fractal_gain: float:
	get = get_fractal_gain, set = set_fractal_gain

#desc Frequency multiplier between subsequent octaves. Increasing this value results in higher octaves producing noise with finer details and a rougher appearance.
var fractal_lacunarity: float:
	get = get_fractal_lacunarity, set = set_fractal_lacunarity

#desc The number of noise layers that are sampled to get the final value for fractal noise types.
var fractal_octaves: int:
	get = get_fractal_octaves, set = set_fractal_octaves

#desc Sets the strength of the fractal ping pong type.
var fractal_ping_pong_strength: float:
	get = get_fractal_ping_pong_strength, set = set_fractal_ping_pong_strength

#desc The method for combining octaves into a fractal. See [enum FractalType].
var fractal_type: int:
	get = get_fractal_type, set = set_fractal_type

#desc Higher weighting means higher octaves have less impact if lower octaves have a large impact.
var fractal_weighted_strength: float:
	get = get_fractal_weighted_strength, set = set_fractal_weighted_strength

#desc The frequency for all noise types. Low frequency results in smooth noise while high frequency results in rougher, more granular noise.
var frequency: float:
	get = get_frequency, set = set_frequency

#desc The noise algorithm used. See [enum NoiseType].
var noise_type: int:
	get = get_noise_type, set = set_noise_type

#desc Translate the noise input coordinates by the given [Vector3].
var offset: Vector3:
	get = get_offset, set = set_offset

#desc The random number seed for all noise types.
var seed: int:
	get = get_seed, set = set_seed




func get_cellular_distance_function() -> int:
	return cellular_distance_function

func set_cellular_distance_function(value: int) -> void:
	cellular_distance_function = value

func get_cellular_jitter() -> float:
	return cellular_jitter

func set_cellular_jitter(value: float) -> void:
	cellular_jitter = value

func get_cellular_return_type() -> int:
	return cellular_return_type

func set_cellular_return_type(value: int) -> void:
	cellular_return_type = value

func get_domain_warp_amplitude() -> float:
	return domain_warp_amplitude

func set_domain_warp_amplitude(value: float) -> void:
	domain_warp_amplitude = value

func is_domain_warp_enabled() -> bool:
	return domain_warp_enabled

func set_domain_warp_enabled(value: bool) -> void:
	domain_warp_enabled = value

func get_domain_warp_fractal_gain() -> float:
	return domain_warp_fractal_gain

func set_domain_warp_fractal_gain(value: float) -> void:
	domain_warp_fractal_gain = value

func get_domain_warp_fractal_lacunarity() -> float:
	return domain_warp_fractal_lacunarity

func set_domain_warp_fractal_lacunarity(value: float) -> void:
	domain_warp_fractal_lacunarity = value

func get_domain_warp_fractal_octaves() -> int:
	return domain_warp_fractal_octaves

func set_domain_warp_fractal_octaves(value: int) -> void:
	domain_warp_fractal_octaves = value

func get_domain_warp_fractal_type() -> int:
	return domain_warp_fractal_type

func set_domain_warp_fractal_type(value: int) -> void:
	domain_warp_fractal_type = value

func get_domain_warp_frequency() -> float:
	return domain_warp_frequency

func set_domain_warp_frequency(value: float) -> void:
	domain_warp_frequency = value

func get_domain_warp_type() -> int:
	return domain_warp_type

func set_domain_warp_type(value: int) -> void:
	domain_warp_type = value

func get_fractal_gain() -> float:
	return fractal_gain

func set_fractal_gain(value: float) -> void:
	fractal_gain = value

func get_fractal_lacunarity() -> float:
	return fractal_lacunarity

func set_fractal_lacunarity(value: float) -> void:
	fractal_lacunarity = value

func get_fractal_octaves() -> int:
	return fractal_octaves

func set_fractal_octaves(value: int) -> void:
	fractal_octaves = value

func get_fractal_ping_pong_strength() -> float:
	return fractal_ping_pong_strength

func set_fractal_ping_pong_strength(value: float) -> void:
	fractal_ping_pong_strength = value

func get_fractal_type() -> int:
	return fractal_type

func set_fractal_type(value: int) -> void:
	fractal_type = value

func get_fractal_weighted_strength() -> float:
	return fractal_weighted_strength

func set_fractal_weighted_strength(value: float) -> void:
	fractal_weighted_strength = value

func get_frequency() -> float:
	return frequency

func set_frequency(value: float) -> void:
	frequency = value

func get_noise_type() -> int:
	return noise_type

func set_noise_type(value: int) -> void:
	noise_type = value

func get_offset() -> Vector3:
	return offset

func set_offset(value: Vector3) -> void:
	offset = value

func get_seed() -> int:
	return seed

func set_seed(value: int) -> void:
	seed = value

