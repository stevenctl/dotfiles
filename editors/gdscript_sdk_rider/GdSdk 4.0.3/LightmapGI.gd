extends VisualInstance3D
#brief Computes and stores baked lightmaps for fast global illumination.
#desc The [LightmapGI] node is used to compute and store baked lightmaps. Lightmaps are used to provide high-quality indirect lighting with very little light leaking. [LightmapGI] can also provide rough reflections using spherical harmonics if [member directional] is enabled. Dynamic objects can receive indirect lighting thanks to [i]light probes[/i], which can be automatically placed by setting [member generate_probes_subdiv] to a value other than [constant GENERATE_PROBES_DISABLED]. Additional lightmap probes can also be added by creating [LightmapProbe] nodes. The downside is that lightmaps are fully static and cannot be baked in an exported project. Baking a [LightmapGI] node is also slower compared to [VoxelGI].
#desc [b]Procedural generation:[/b] Lightmap baking functionality is only available in the editor. This means [LightmapGI] is not suited to procedurally generated or user-built levels. For procedurally generated or user-built levels, use [VoxelGI] or SDFGI instead (see [member Environment.sdfgi_enabled]).
#desc [b]Performance:[/b] [LightmapGI] provides the best possible run-time performance for global illumination. It is suitable for low-end hardware including integrated graphics and mobile devices.
#desc [b]Note:[/b] Due to how lightmaps work, most properties only have a visible effect once lightmaps are baked again.
#desc [b]Note:[/b] Lightmap baking on [CSGShape3D]s and [PrimitiveMesh]es is not supported, as these cannot store UV2 data required for baking.
#desc [b]Note:[/b] If no custom lightmappers are installed, [LightmapGI] can only be baked when using the Vulkan backend (Forward+ or Mobile), not OpenGL.
class_name LightmapGI

#desc Low bake quality (fastest bake times). The quality of this preset can be adjusted by changing [member ProjectSettings.rendering/lightmapping/bake_quality/low_quality_ray_count] and [member ProjectSettings.rendering/lightmapping/bake_quality/low_quality_probe_ray_count].
#desc Medium bake quality (fast bake times). The quality of this preset can be adjusted by changing [member ProjectSettings.rendering/lightmapping/bake_quality/medium_quality_ray_count] and [member ProjectSettings.rendering/lightmapping/bake_quality/medium_quality_probe_ray_count].
#desc High bake quality (slow bake times). The quality of this preset can be adjusted by changing [member ProjectSettings.rendering/lightmapping/bake_quality/high_quality_ray_count] and [member ProjectSettings.rendering/lightmapping/bake_quality/high_quality_probe_ray_count].
#desc Highest bake quality (slowest bake times). The quality of this preset can be adjusted by changing [member ProjectSettings.rendering/lightmapping/bake_quality/ultra_quality_ray_count] and [member ProjectSettings.rendering/lightmapping/bake_quality/ultra_quality_probe_ray_count].
#desc Don't generate lightmap probes for lighting dynamic objects.
#desc Lowest level of subdivision (fastest bake times, smallest file sizes).
#desc Low level of subdivision (fast bake times, small file sizes).
#desc High level of subdivision (slow bake times, large file sizes).
#desc Highest level of subdivision (slowest bake times, largest file sizes).
#desc Lightmap baking was successful.
#desc Lightmap baking failed because the root node for the edited scene could not be accessed.
#desc Lightmap baking failed as the lightmap data resource is embedded in a foreign resource.
#desc Lightmap baking failed as there is no lightmapper available in this Godot build.
#desc Lightmap baking failed as the [LightmapGIData] save path isn't configured in the resource.
#desc Lightmap baking failed as there are no meshes whose [member GeometryInstance3D.gi_mode] is [constant GeometryInstance3D.GI_MODE_STATIC] and with valid UV2 mapping in the current scene. You may need to select 3D scenes in the Import dock and change their global illumination mode accordingly.
#desc Lightmap baking failed as the lightmapper failed to analyze some of the meshes marked as static for baking.
#desc Lightmap baking failed as the resulting image couldn't be saved or imported by Godot after it was saved.
#desc The user aborted the lightmap baking operation (typically by clicking the [b]Cancel[/b] button in the progress dialog).
#desc Ignore environment lighting when baking lightmaps.
#desc Use the scene's environment lighting when baking lightmaps.
#desc [b]Note:[/b] If baking lightmaps in a scene with no [WorldEnvironment] node, this will act like [constant ENVIRONMENT_MODE_DISABLED]. The editor's preview sky and sun is [i]not[/i] taken into account by [LightmapGI] when baking lightmaps.
#desc Use [member environment_custom_sky] as a source of environment lighting when baking lightmaps.
#desc Use [member environment_custom_color] multiplied by [member environment_custom_energy] as a constant source of environment lighting when baking lightmaps.

#enum BakeQuality
enum {
    BAKE_QUALITY_LOW = 0,
    BAKE_QUALITY_MEDIUM = 1,
    BAKE_QUALITY_HIGH = 2,
    BAKE_QUALITY_ULTRA = 3,
}
#enum GenerateProbes
enum {
    GENERATE_PROBES_DISABLED = 0,
    GENERATE_PROBES_SUBDIV_4 = 1,
    GENERATE_PROBES_SUBDIV_8 = 2,
    GENERATE_PROBES_SUBDIV_16 = 3,
    GENERATE_PROBES_SUBDIV_32 = 4,
}
#enum BakeError
enum {
    BAKE_ERROR_OK = 0,
    BAKE_ERROR_NO_SCENE_ROOT = 1,
    BAKE_ERROR_FOREIGN_DATA = 2,
    BAKE_ERROR_NO_LIGHTMAPPER = 3,
    BAKE_ERROR_NO_SAVE_PATH = 4,
    BAKE_ERROR_NO_MESHES = 5,
    BAKE_ERROR_MESHES_INVALID = 6,
    BAKE_ERROR_CANT_CREATE_IMAGE = 7,
    BAKE_ERROR_USER_ABORTED = 8,
}
#enum EnvironmentMode
enum {
    ENVIRONMENT_MODE_DISABLED = 0,
    ENVIRONMENT_MODE_SCENE = 1,
    ENVIRONMENT_MODE_CUSTOM_SKY = 2,
    ENVIRONMENT_MODE_CUSTOM_COLOR = 3,
}
#desc The bias to use when computing shadows. Increasing [member bias] can fix shadow acne on the resulting baked lightmap, but can introduce peter-panning (shadows not connecting to their casters). Real-time [Light3D] shadows are not affected by this [member bias] property.
var bias: float:
	get = get_bias, set = set_bias

#desc Number of light bounces that are taken into account during baking. Higher values result in brighter, more realistic lighting, at the cost of longer bake times. If set to [code]0[/code], only environment lighting, direct light and emissive lighting is baked.
var bounces: int:
	get = get_bounces, set = set_bounces

#desc The [CameraAttributes] resource that specifies exposure levels to bake at. Auto-exposure and non exposure properties will be ignored. Exposure settings should be used to reduce the dynamic range present when baking. If exposure is too high, the [LightmapGI] will have banding artifacts or may have over-exposure artifacts.
var camera_attributes: CameraAttributes:
	get = get_camera_attributes, set = set_camera_attributes

#desc If [code]true[/code], bakes lightmaps to contain directional information as spherical harmonics. This results in more realistic lighting appearance, especially with normal mapped materials and for lights that have their direct light baked ([member Light3D.light_bake_mode] set to [constant Light3D.BAKE_STATIC]). The directional information is also used to provide rough reflections for static and dynamic objects. This has a small run-time performance cost as the shader has to perform more work to interpret the direction information from the lightmap. Directional lightmaps also take longer to bake and result in larger file sizes.
#desc [b]Note:[/b] The property's name has no relationship with [DirectionalLight3D]. [member directional] works with all light types.
var directional: bool:
	get = is_directional, set = set_directional

#desc The color to use for environment lighting. Only effective if [member environment_mode] is [constant ENVIRONMENT_MODE_CUSTOM_COLOR].
var environment_custom_color: Color:
	get = get_environment_custom_color, set = set_environment_custom_color

#desc The color multiplier to use for environment lighting. Only effective if [member environment_mode] is [constant ENVIRONMENT_MODE_CUSTOM_COLOR].
var environment_custom_energy: float:
	get = get_environment_custom_energy, set = set_environment_custom_energy

#desc The sky to use as a source of environment lighting. Only effective if [member environment_mode] is [constant ENVIRONMENT_MODE_CUSTOM_SKY].
var environment_custom_sky: Sky:
	get = get_environment_custom_sky, set = set_environment_custom_sky

#desc The environment mode to use when baking lightmaps.
var environment_mode: int:
	get = get_environment_mode, set = set_environment_mode

#desc The level of subdivision to use when automatically generating [LightmapProbe]s for dynamic object lighting. Higher values result in more accurate indirect lighting on dynamic objects, at the cost of longer bake times and larger file sizes.
#desc [b]Note:[/b] Automatically generated [LightmapProbe]s are not visible as nodes in the Scene tree dock, and cannot be modified this way after they are generated.
#desc [b]Note:[/b] Regardless of [member generate_probes_subdiv], direct lighting on dynamic objects is always applied using [Light3D] nodes in real-time.
var generate_probes_subdiv: int:
	get = get_generate_probes, set = set_generate_probes

#desc If [code]true[/code], ignore environment lighting when baking lightmaps.
var interior: bool:
	get = is_interior, set = set_interior

#desc The [LightmapGIData] associated to this [LightmapGI] node. This resource is automatically created after baking, and is not meant to be created manually.
var light_data: LightmapGIData:
	get = get_light_data, set = set_light_data

#desc The maximum texture size for the generated texture atlas. Higher values will result in fewer slices being generated, but may not work on all hardware as a result of hardware limitations on texture sizes. Leave [member max_texture_size] at its default value of [code]16384[/code] if unsure.
var max_texture_size: int:
	get = get_max_texture_size, set = set_max_texture_size

#desc The quality preset to use when baking lightmaps. This affects bake times, but output file sizes remain mostly identical across quality levels.
#desc To further speed up bake times, decrease [member bounces], disable [member use_denoiser] and increase the lightmap texel size on 3D scenes in the Import doc.
var quality: int:
	get = get_bake_quality, set = set_bake_quality

#desc If [code]true[/code], uses a CPU-based denoising algorithm on the generated lightmap. This eliminates most noise within the generated lightmap at the cost of longer bake times. File sizes are generally not impacted significantly by the use of a denoiser, although lossless compression may do a better job at compressing a denoised image.
#desc [b]Note:[/b] The built-in denoiser (OpenImageDenoise) may crash when denoising lightmaps in large scenes. If you encounter a crash at the end of lightmap baking, try disabling [member use_denoiser].
var use_denoiser: bool:
	get = is_using_denoiser, set = set_use_denoiser




func get_bias() -> float:
	return bias

func set_bias(value: float) -> void:
	bias = value

func get_bounces() -> int:
	return bounces

func set_bounces(value: int) -> void:
	bounces = value

func get_camera_attributes() -> CameraAttributes:
	return camera_attributes

func set_camera_attributes(value: CameraAttributes) -> void:
	camera_attributes = value

func is_directional() -> bool:
	return directional

func set_directional(value: bool) -> void:
	directional = value

func get_environment_custom_color() -> Color:
	return environment_custom_color

func set_environment_custom_color(value: Color) -> void:
	environment_custom_color = value

func get_environment_custom_energy() -> float:
	return environment_custom_energy

func set_environment_custom_energy(value: float) -> void:
	environment_custom_energy = value

func get_environment_custom_sky() -> Sky:
	return environment_custom_sky

func set_environment_custom_sky(value: Sky) -> void:
	environment_custom_sky = value

func get_environment_mode() -> int:
	return environment_mode

func set_environment_mode(value: int) -> void:
	environment_mode = value

func get_generate_probes() -> int:
	return generate_probes_subdiv

func set_generate_probes(value: int) -> void:
	generate_probes_subdiv = value

func is_interior() -> bool:
	return interior

func set_interior(value: bool) -> void:
	interior = value

func get_light_data() -> LightmapGIData:
	return light_data

func set_light_data(value: LightmapGIData) -> void:
	light_data = value

func get_max_texture_size() -> int:
	return max_texture_size

func set_max_texture_size(value: int) -> void:
	max_texture_size = value

func get_bake_quality() -> int:
	return quality

func set_bake_quality(value: int) -> void:
	quality = value

func is_using_denoiser() -> bool:
	return use_denoiser

func set_use_denoiser(value: bool) -> void:
	use_denoiser = value

