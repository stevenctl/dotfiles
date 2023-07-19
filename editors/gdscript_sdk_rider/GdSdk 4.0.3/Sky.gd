extends Resource
#brief Background that uses a [Material] to draw a sky.
#desc The [Sky] class uses a [Material] to draw the background and update the reflection/radiance cubemaps.
class_name Sky

#desc Radiance texture size is 32×32 pixels.
#desc Radiance texture size is 64×64 pixels.
#desc Radiance texture size is 128×128 pixels.
#desc Radiance texture size is 256×256 pixels.
#desc Radiance texture size is 512×512 pixels.
#desc Radiance texture size is 1024×1024 pixels.
#desc Radiance texture size is 2048×2048 pixels.
#desc Represents the size of the [enum RadianceSize] enum.
#desc Automatically selects the appropriate process mode based on your sky shader. If your shader uses [code]TIME[/code] or [code]POSITION[/code], this will use [constant PROCESS_MODE_REALTIME]. If your shader uses any of the [code]LIGHT_*[/code] variables or any custom uniforms, this uses [constant PROCESS_MODE_INCREMENTAL]. Otherwise, this defaults to [constant PROCESS_MODE_QUALITY].
#desc Uses high quality importance sampling to process the radiance map. In general, this results in much higher quality than [constant PROCESS_MODE_REALTIME] but takes much longer to generate. This should not be used if you plan on changing the sky at runtime. If you are finding that the reflection is not blurry enough and is showing sparkles or fireflies, try increasing [member ProjectSettings.rendering/reflections/sky_reflections/ggx_samples].
#desc Uses the same high quality importance sampling to process the radiance map as [constant PROCESS_MODE_QUALITY], but updates over several frames. The number of frames is determined by [member ProjectSettings.rendering/reflections/sky_reflections/roughness_layers]. Use this when you need highest quality radiance maps, but have a sky that updates slowly.
#desc Uses the fast filtering algorithm to process the radiance map. In general this results in lower quality, but substantially faster run times. If you need better quality, but still need to update the sky every frame, consider turning on [member ProjectSettings.rendering/reflections/sky_reflections/fast_filter_high_quality].
#desc [b]Note:[/b] The fast filtering algorithm is limited to 256×256 cubemaps, so [member radiance_size] must be set to [constant RADIANCE_SIZE_256]. Otherwise, a warning is printed and the overridden radiance size is ignored.

#enum RadianceSize
enum {
    RADIANCE_SIZE_32 = 0,
    RADIANCE_SIZE_64 = 1,
    RADIANCE_SIZE_128 = 2,
    RADIANCE_SIZE_256 = 3,
    RADIANCE_SIZE_512 = 4,
    RADIANCE_SIZE_1024 = 5,
    RADIANCE_SIZE_2048 = 6,
    RADIANCE_SIZE_MAX = 7,
}
#enum ProcessMode
enum {
    PROCESS_MODE_AUTOMATIC = 0,
    PROCESS_MODE_QUALITY = 1,
    PROCESS_MODE_INCREMENTAL = 2,
    PROCESS_MODE_REALTIME = 3,
}
#desc Sets the method for generating the radiance map from the sky. The radiance map is a cubemap with increasingly blurry versions of the sky corresponding to different levels of roughness. Radiance maps can be expensive to calculate. See [enum ProcessMode] for options.
var process_mode: int:
	get = get_process_mode, set = set_process_mode

#desc The [Sky]'s radiance map size. The higher the radiance map size, the more detailed the lighting from the [Sky] will be.
#desc See [enum RadianceSize] constants for values.
#desc [b]Note:[/b] Some hardware will have trouble with higher radiance sizes, especially [constant RADIANCE_SIZE_512] and above. Only use such high values on high-end hardware.
var radiance_size: int:
	get = get_radiance_size, set = set_radiance_size

#desc [Material] used to draw the background. Can be [PanoramaSkyMaterial], [ProceduralSkyMaterial], [PhysicalSkyMaterial], or even a [ShaderMaterial] if you want to use your own custom shader.
var sky_material: Material:
	get = get_material, set = set_material




func get_process_mode() -> int:
	return process_mode

func set_process_mode(value: int) -> void:
	process_mode = value

func get_radiance_size() -> int:
	return radiance_size

func set_radiance_size(value: int) -> void:
	radiance_size = value

func get_material() -> Material:
	return sky_material

func set_material(value: Material) -> void:
	sky_material = value

