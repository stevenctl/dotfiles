extends VisualInstance3D
#brief Provides a base class for different kinds of light nodes.
#desc Light3D is the [i]abstract[/i] base class for light nodes. As it can't be instantiated, it shouldn't be used directly. Other types of light nodes inherit from it. Light3D contains the common variables and parameters used for lighting.
#tutorial [3D lights and shadows] https://docs.godotengine.org/en/stable/tutorials/3d/lights_and_shadows.html
#tutorial [Third Person Shooter Demo] https://godotengine.org/asset-library/asset/678
class_name Light3D

#desc Constant for accessing [member light_energy].
#desc Constant for accessing [member light_indirect_energy].
#desc Constant for accessing [member light_volumetric_fog_energy].
#desc Constant for accessing [member light_specular].
#desc Constant for accessing [member OmniLight3D.omni_range] or [member SpotLight3D.spot_range].
#desc Constant for accessing [member light_size].
#desc Constant for accessing [member OmniLight3D.omni_attenuation] or [member SpotLight3D.spot_attenuation].
#desc Constant for accessing [member SpotLight3D.spot_angle].
#desc Constant for accessing [member SpotLight3D.spot_angle_attenuation].
#desc Constant for accessing [member DirectionalLight3D.directional_shadow_max_distance].
#desc Constant for accessing [member DirectionalLight3D.directional_shadow_split_1].
#desc Constant for accessing [member DirectionalLight3D.directional_shadow_split_2].
#desc Constant for accessing [member DirectionalLight3D.directional_shadow_split_3].
#desc Constant for accessing [member DirectionalLight3D.directional_shadow_fade_start].
#desc Constant for accessing [member shadow_normal_bias].
#desc Constant for accessing [member shadow_bias].
#desc Constant for accessing [member DirectionalLight3D.directional_shadow_pancake_size].
#desc Constant for accessing [member shadow_opacity].
#desc Constant for accessing [member shadow_blur].
#desc Constant for accessing [member shadow_transmittance_bias].
#desc Constant for accessing [member light_intensity_lumens] and [member light_intensity_lux]. Only used when [member ProjectSettings.rendering/lights_and_shadows/use_physical_light_units] is [code]true[/code].
#desc Represents the size of the [enum Param] enum.
#desc Light is ignored when baking. This is the fastest mode, but the light will be taken into account when baking global illumination. This mode should generally be used for dynamic lights that change quickly, as the effect of global illumination is less noticeable on those lights.
#desc [b]Note:[/b] Hiding a light does [i]not[/i] affect baking [LightmapGI]. Hiding a light will still affect baking [VoxelGI] and SDFGI (see [member Environment.sdfgi_enabled).
#desc Light is taken into account in static baking ([VoxelGI], [LightmapGI], SDFGI ([member Environment.sdfgi_enabled])). The light can be moved around or modified, but its global illumination will not update in real-time. This is suitable for subtle changes (such as flickering torches), but generally not large changes such as toggling a light on and off.
#desc Light is taken into account in dynamic baking ([VoxelGI] and SDFGI ([member Environment.sdfgi_enabled]) only). The light can be moved around or modified with global illumination updating in real-time. The light's global illumination appearance will be slightly different compared to [constant BAKE_STATIC]. This has a greater performance cost compared to [constant BAKE_STATIC]. When using SDFGI, the update speed of dynamic lights is affected by [member ProjectSettings.rendering/global_illumination/sdfgi/frames_to_update_lights].

#enum Param
enum {
    PARAM_ENERGY = 0,
    PARAM_INDIRECT_ENERGY = 1,
    PARAM_VOLUMETRIC_FOG_ENERGY = 2,
    PARAM_SPECULAR = 3,
    PARAM_RANGE = 4,
    PARAM_SIZE = 5,
    PARAM_ATTENUATION = 6,
    PARAM_SPOT_ANGLE = 7,
    PARAM_SPOT_ATTENUATION = 8,
    PARAM_SHADOW_MAX_DISTANCE = 9,
    PARAM_SHADOW_SPLIT_1_OFFSET = 10,
    PARAM_SHADOW_SPLIT_2_OFFSET = 11,
    PARAM_SHADOW_SPLIT_3_OFFSET = 12,
    PARAM_SHADOW_FADE_START = 13,
    PARAM_SHADOW_NORMAL_BIAS = 14,
    PARAM_SHADOW_BIAS = 15,
    PARAM_SHADOW_PANCAKE_SIZE = 16,
    PARAM_SHADOW_OPACITY = 17,
    PARAM_SHADOW_BLUR = 18,
    PARAM_TRANSMITTANCE_BIAS = 19,
    PARAM_INTENSITY = 20,
    PARAM_MAX = 21,
}
#enum BakeMode
enum {
    BAKE_DISABLED = 0,
    BAKE_STATIC = 1,
    BAKE_DYNAMIC = 2,
}
#desc The distance from the camera at which the light begins to fade away (in 3D units).
#desc [b]Note:[/b] Only effective for [OmniLight3D] and [SpotLight3D].
var distance_fade_begin: float:
	get = get_distance_fade_begin, set = set_distance_fade_begin

#desc If [code]true[/code], the light will smoothly fade away when far from the active [Camera3D] starting at [member distance_fade_begin]. This acts as a form of level of detail (LOD). The light will fade out over [member distance_fade_begin] + [member distance_fade_length], after which it will be culled and not sent to the shader at all. Use this to reduce the number of active lights in a scene and thus improve performance.
#desc [b]Note:[/b] Only effective for [OmniLight3D] and [SpotLight3D].
var distance_fade_enabled: bool:
	get = is_distance_fade_enabled, set = set_enable_distance_fade

#desc Distance over which the light and its shadow fades. The light's energy and shadow's opacity is progressively reduced over this distance and is completely invisible at the end.
#desc [b]Note:[/b] Only effective for [OmniLight3D] and [SpotLight3D].
var distance_fade_length: float:
	get = get_distance_fade_length, set = set_distance_fade_length

#desc The distance from the camera at which the light's shadow cuts off (in 3D units). Set this to a value lower than [member distance_fade_begin] + [member distance_fade_length] to further improve performance, as shadow rendering is often more expensive than light rendering itself.
#desc [b]Note:[/b] Only effective for [OmniLight3D] and [SpotLight3D], and only when [member shadow_enabled] is [code]true[/code].
var distance_fade_shadow: float:
	get = get_distance_fade_shadow, set = set_distance_fade_shadow

#desc If [code]true[/code], the light only appears in the editor and will not be visible at runtime.
var editor_only: bool:
	get = is_editor_only, set = set_editor_only

#desc The light's angular size in degrees. Increasing this will make shadows softer at greater distances (also called percentage-closer soft shadows, or PCSS). Only available for [DirectionalLight3D]s. For reference, the Sun from the Earth is approximately [code]0.5[/code]. Increasing this value above [code]0.0[/code] for lights with shadows enabled will have a noticeable performance cost due to PCSS.
#desc [b]Note:[/b] [member light_angular_distance] is not affected by [member Node3D.scale] (the light's scale or its parent's scale).
#desc [b]Note:[/b] PCSS for directional lights is only supported in the Forward+ rendering method, not Mobile or Compatibility.
var light_angular_distance: float:
	get = get_param, set = set_param

#desc The light's bake mode. This will affect the global illumination techniques that have an effect on the light's rendering. See [enum BakeMode].
#desc [b]Note:[/b] Meshes' global illumination mode will also affect the global illumination rendering. See [member GeometryInstance3D.gi_mode].
var light_bake_mode: int:
	get = get_bake_mode, set = set_bake_mode

#desc The light's color. An [i]overbright[/i] color can be used to achieve a result equivalent to increasing the light's [member light_energy].
var light_color: Color:
	get = get_color, set = set_color

#desc The light will affect objects in the selected layers.
var light_cull_mask: int:
	get = get_cull_mask, set = set_cull_mask

#desc The light's strength multiplier (this is not a physical unit). For [OmniLight3D] and [SpotLight3D], changing this value will only change the light color's intensity, not the light's radius.
var light_energy: float:
	get = get_param, set = set_param

#desc Secondary multiplier used with indirect light (light bounces). Used with [VoxelGI] and SDFGI (see [member Environment.sdfgi_enabled]).
#desc [b]Note:[/b] This property is ignored if [member light_energy] is equal to [code]0.0[/code], as the light won't be present at all in the GI shader.
var light_indirect_energy: float:
	get = get_param, set = set_param

#desc Used by positional lights ([OmniLight3D] and [SpotLight3D]) when [member ProjectSettings.rendering/lights_and_shadows/use_physical_light_units] is [code]true[/code]. Sets the intensity of the light source measured in Lumens. Lumens are a measure of luminous flux, which is the total amount of visible light emitted by a light source per unit of time.
#desc For [SpotLight3D]s, we assume that the area outside the visible cone is surrounded by a perfect light absorbing material. Accordingly, the apparent brightness of the cone area does not change as the cone increases and decreases in size.
#desc A typical household lightbulb can range from around 600 lumens to 1,200 lumens, a candle is about 13 lumens, while a streetlight can be approximately 60,000 lumens.
var light_intensity_lumens: float:
	get = get_param, set = set_param

#desc Used by [DirectionalLight3D]s when [member ProjectSettings.rendering/lights_and_shadows/use_physical_light_units] is [code]true[/code]. Sets the intensity of the light source measured in Lux. Lux is a measure of luminous flux per unit area, it is equal to one lumen per square meter. Lux is the measure of how much light hits a surface at a given time.
#desc On a clear sunny day a surface in direct sunlight may be approximately 100,000 lux, a typical room in a home may be approximately 50 lux, while the moonlit ground may be approximately 0.1 lux.
var light_intensity_lux: float:
	get = get_param, set = set_param

#desc If [code]true[/code], the light's effect is reversed, darkening areas and casting bright shadows.
var light_negative: bool:
	get = is_negative, set = set_negative

#desc [Texture2D] projected by light. [member shadow_enabled] must be on for the projector to work. Light projectors make the light appear as if it is shining through a colored but transparent object, almost like light shining through stained-glass.
#desc [b]Note:[/b] Unlike [BaseMaterial3D] whose filter mode can be adjusted on a per-material basis, the filter mode for light projector textures is set globally with [member ProjectSettings.rendering/textures/light_projectors/filter].
#desc [b]Note:[/b] Light projector textures are only supported in the Forward+ and Mobile rendering methods, not Compatibility.
var light_projector: Texture2D:
	get = get_projector, set = set_projector

#desc The size of the light in Godot units. Only available for [OmniLight3D]s and [SpotLight3D]s. Increasing this value will make the light fade out slower and shadows appear blurrier (also called percentage-closer soft shadows, or PCSS). This can be used to simulate area lights to an extent. Increasing this value above [code]0.0[/code] for lights with shadows enabled will have a noticeable performance cost due to PCSS.
#desc [b]Note:[/b] [member light_size] is not affected by [member Node3D.scale] (the light's scale or its parent's scale).
#desc [b]Note:[/b] PCSS for positional lights is only supported in the Forward+ and Mobile rendering methods, not Compatibility.
var light_size: float:
	get = get_param, set = set_param

#desc The intensity of the specular blob in objects affected by the light. At [code]0[/code], the light becomes a pure diffuse light. When not baking emission, this can be used to avoid unrealistic reflections when placing lights above an emissive surface.
var light_specular: float:
	get = get_param, set = set_param

#desc Sets the color temperature of the light source, measured in Kelvin. This is used to calculate a correlated color temperature which tints the [member light_color].
#desc The sun on a cloudy day is approximately 6500 Kelvin, on a clear day it is between 5500 to 6000 Kelvin, and on a clear day at sunrise or sunset it ranges to around 1850 Kelvin.
var light_temperature: float:
	get = get_temperature, set = set_temperature

#desc Secondary multiplier multiplied with [member light_energy] then used with the [Environment]'s volumetric fog (if enabled). If set to [code]0.0[/code], computing volumetric fog will be skipped for this light, which can improve performance for large amounts of lights when volumetric fog is enabled.
#desc [b]Note:[/b] To prevent short-lived dynamic light effects from poorly interacting with volumetric fog, lights used in those effects should have [member light_volumetric_fog_energy] set to [code]0.0[/code] unless [member Environment.volumetric_fog_temporal_reprojection_enabled] is disabled (or unless the reprojection amount is significantly lowered).
var light_volumetric_fog_energy: float:
	get = get_param, set = set_param

#desc Used to adjust shadow appearance. Too small a value results in self-shadowing ("shadow acne"), while too large a value causes shadows to separate from casters ("peter-panning"). Adjust as needed.
var shadow_bias: float:
	get = get_param, set = set_param

#desc Blurs the edges of the shadow. Can be used to hide pixel artifacts in low-resolution shadow maps. A high value can impact performance, make shadows appear grainy and can cause other unwanted artifacts. Try to keep as near default as possible.
var shadow_blur: float:
	get = get_param, set = set_param

#desc If [code]true[/code], the light will cast real-time shadows. This has a significant performance cost. Only enable shadow rendering when it makes a noticeable difference in the scene's appearance, and consider using [member distance_fade_enabled] to hide the light when far away from the [Camera3D].
var shadow_enabled: bool:
	get = has_shadow, set = set_shadow

#desc Offsets the lookup into the shadow map by the object's normal. This can be used to reduce self-shadowing artifacts without using [member shadow_bias]. In practice, this value should be tweaked along with [member shadow_bias] to reduce artifacts as much as possible.
var shadow_normal_bias: float:
	get = get_param, set = set_param

#desc The opacity to use when rendering the light's shadow map. Values lower than [code]1.0[/code] make the light appear through shadows. This can be used to fake global illumination at a low performance cost.
var shadow_opacity: float:
	get = get_param, set = set_param

#desc If [code]true[/code], reverses the backface culling of the mesh. This can be useful when you have a flat mesh that has a light behind it. If you need to cast a shadow on both sides of the mesh, set the mesh to use double-sided shadows with [constant GeometryInstance3D.SHADOW_CASTING_SETTING_DOUBLE_SIDED].
var shadow_reverse_cull_face: bool:
	get = get_shadow_reverse_cull_face, set = set_shadow_reverse_cull_face

var shadow_transmittance_bias: float:
	get = get_param, set = set_param



#desc Returns the [Color] of an idealized blackbody at the given [member light_temperature]. This value is calculated internally based on the [member light_temperature]. This [Color] is multiplied by [member light_color] before being sent to the [RenderingServer].
func get_correlated_color() -> Color:
	pass;

#desc Returns the value of the specified [enum Light3D.Param] parameter.
func get_param(param: int) -> float:
	pass;

#desc Sets the value of the specified [enum Light3D.Param] parameter.
func set_param(param: int, value: float) -> void:
	pass;


func get_distance_fade_begin() -> float:
	return distance_fade_begin

func set_distance_fade_begin(value: float) -> void:
	distance_fade_begin = value

func is_distance_fade_enabled() -> bool:
	return distance_fade_enabled

func set_enable_distance_fade(value: bool) -> void:
	distance_fade_enabled = value

func get_distance_fade_length() -> float:
	return distance_fade_length

func set_distance_fade_length(value: float) -> void:
	distance_fade_length = value

func get_distance_fade_shadow() -> float:
	return distance_fade_shadow

func set_distance_fade_shadow(value: float) -> void:
	distance_fade_shadow = value

func is_editor_only() -> bool:
	return editor_only

func set_editor_only(value: bool) -> void:
	editor_only = value

func get_param() -> float:
	return light_angular_distance

func set_param(value: float) -> void:
	light_angular_distance = value

func get_bake_mode() -> int:
	return light_bake_mode

func set_bake_mode(value: int) -> void:
	light_bake_mode = value

func get_color() -> Color:
	return light_color

func set_color(value: Color) -> void:
	light_color = value

func get_cull_mask() -> int:
	return light_cull_mask

func set_cull_mask(value: int) -> void:
	light_cull_mask = value

func get_param() -> float:
	return light_energy

func set_param(value: float) -> void:
	light_energy = value

func get_param() -> float:
	return light_indirect_energy

func set_param(value: float) -> void:
	light_indirect_energy = value

func get_param() -> float:
	return light_intensity_lumens

func set_param(value: float) -> void:
	light_intensity_lumens = value

func get_param() -> float:
	return light_intensity_lux

func set_param(value: float) -> void:
	light_intensity_lux = value

func is_negative() -> bool:
	return light_negative

func set_negative(value: bool) -> void:
	light_negative = value

func get_projector() -> Texture2D:
	return light_projector

func set_projector(value: Texture2D) -> void:
	light_projector = value

func get_param() -> float:
	return light_size

func set_param(value: float) -> void:
	light_size = value

func get_param() -> float:
	return light_specular

func set_param(value: float) -> void:
	light_specular = value

func get_temperature() -> float:
	return light_temperature

func set_temperature(value: float) -> void:
	light_temperature = value

func get_param() -> float:
	return light_volumetric_fog_energy

func set_param(value: float) -> void:
	light_volumetric_fog_energy = value

func get_param() -> float:
	return shadow_bias

func set_param(value: float) -> void:
	shadow_bias = value

func get_param() -> float:
	return shadow_blur

func set_param(value: float) -> void:
	shadow_blur = value

func has_shadow() -> bool:
	return shadow_enabled

func set_shadow(value: bool) -> void:
	shadow_enabled = value

func get_param() -> float:
	return shadow_normal_bias

func set_param(value: float) -> void:
	shadow_normal_bias = value

func get_param() -> float:
	return shadow_opacity

func set_param(value: float) -> void:
	shadow_opacity = value

func get_shadow_reverse_cull_face() -> bool:
	return shadow_reverse_cull_face

func set_shadow_reverse_cull_face(value: bool) -> void:
	shadow_reverse_cull_face = value

func get_param() -> float:
	return shadow_transmittance_bias

func set_param(value: float) -> void:
	shadow_transmittance_bias = value

