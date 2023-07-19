extends Resource
#brief Resource for environment nodes (like [WorldEnvironment]) that define multiple rendering options.
#desc Resource for environment nodes (like [WorldEnvironment]) that define multiple environment operations (such as background [Sky] or [Color], ambient light, fog, depth-of-field...). These parameters affect the final render of the scene. The order of these operations is:
#desc - Depth of Field Blur
#desc - Glow
#desc - Tonemap (Auto Exposure)
#desc - Adjustments
#tutorial [Environment and post-processing] https://docs.godotengine.org/en/stable/tutorials/3d/environment_and_post_processing.html
#tutorial [Light transport in game engines] https://docs.godotengine.org/en/stable/tutorials/3d/high_dynamic_range.html
#tutorial [3D Material Testers Demo] https://godotengine.org/asset-library/asset/123
#tutorial [2D HDR Demo] https://godotengine.org/asset-library/asset/110
#tutorial [Third Person Shooter Demo] https://godotengine.org/asset-library/asset/678
class_name Environment

#desc Clears the background using the clear color defined in [member ProjectSettings.rendering/environment/defaults/default_clear_color].
#desc Clears the background using a custom clear color.
#desc Displays a user-defined sky in the background.
#desc Displays a [CanvasLayer] in the background.
#desc Keeps on screen every pixel drawn in the background. This is the fastest background mode, but it can only be safely used in fully-interior scenes (no visible sky or sky reflections). If enabled in a scene where the background is visible, "ghost trail" artifacts will be visible when moving the camera.
#desc Displays a camera feed in the background.
#desc Represents the size of the [enum BGMode] enum.
#desc Gather ambient light from whichever source is specified as the background.
#desc Disable ambient light. This provides a slight performance boost over [constant AMBIENT_SOURCE_SKY].
#desc Specify a specific [Color] for ambient light. This provides a slight performance boost over [constant AMBIENT_SOURCE_SKY].
#desc Gather ambient light from the [Sky] regardless of what the background is.
#desc Use the background for reflections.
#desc Disable reflections. This provides a slight performance boost over other options.
#desc Use the [Sky] for reflections regardless of what the background is.
#desc Linear tonemapper operator. Reads the linear data and passes it on unmodified. This can cause bright lighting to look blown out, with noticeable clipping in the output colors.
#desc Reinhardt tonemapper operator. Performs a variation on rendered pixels' colors by this formula: [code]color = color / (1 + color)[/code]. This avoids clipping bright highlights, but the resulting image can look a bit dull.
#desc Filmic tonemapper operator. This avoids clipping bright highlights, with a resulting image that usually looks more vivid than [constant TONE_MAPPER_REINHARDT].
#desc Use the Academy Color Encoding System tonemapper. ACES is slightly more expensive than other options, but it handles bright lighting in a more realistic fashion by desaturating it as it becomes brighter. ACES typically has a more contrasted output compared to [constant TONE_MAPPER_REINHARDT] and [constant TONE_MAPPER_FILMIC].
#desc [b]Note:[/b] This tonemapping operator is called "ACES Fitted" in Godot 3.x.
#desc Additive glow blending mode. Mostly used for particles, glows (bloom), lens flare, bright sources.
#desc Screen glow blending mode. Increases brightness, used frequently with bloom.
#desc Soft light glow blending mode. Modifies contrast, exposes shadows and highlights (vivid bloom).
#desc Replace glow blending mode. Replaces all pixels' color by the glow value. This can be used to simulate a full-screen blur effect by tweaking the glow parameters to match the original image's brightness.
#desc Mixes the glow with the underlying color to avoid increasing brightness as much while still maintaining a glow effect.
#desc Use 50% scale for SDFGI on the Y (vertical) axis. SDFGI cells will be twice as short as they are wide. This allows providing increased GI detail and reduced light leaking with thin floors and ceilings. This is usually the best choice for scenes that don't feature much verticality.
#desc Use 75% scale for SDFGI on the Y (vertical) axis. This is a balance between the 50% and 100% SDFGI Y scales.
#desc Use 100% scale for SDFGI on the Y (vertical) axis. SDFGI cells will be as tall as they are wide. This is usually the best choice for highly vertical scenes. The downside is that light leaking may become more noticeable with thin floors and ceilings.

#enum BGMode
enum {
    BG_CLEAR_COLOR = 0,
    BG_COLOR = 1,
    BG_SKY = 2,
    BG_CANVAS = 3,
    BG_KEEP = 4,
    BG_CAMERA_FEED = 5,
    BG_MAX = 6,
}
#enum AmbientSource
enum {
    AMBIENT_SOURCE_BG = 0,
    AMBIENT_SOURCE_DISABLED = 1,
    AMBIENT_SOURCE_COLOR = 2,
    AMBIENT_SOURCE_SKY = 3,
}
#enum ReflectionSource
enum {
    REFLECTION_SOURCE_BG = 0,
    REFLECTION_SOURCE_DISABLED = 1,
    REFLECTION_SOURCE_SKY = 2,
}
#enum ToneMapper
enum {
    TONE_MAPPER_LINEAR = 0,
    TONE_MAPPER_REINHARDT = 1,
    TONE_MAPPER_FILMIC = 2,
    TONE_MAPPER_ACES = 3,
}
#enum GlowBlendMode
enum {
    GLOW_BLEND_MODE_ADDITIVE = 0,
    GLOW_BLEND_MODE_SCREEN = 1,
    GLOW_BLEND_MODE_SOFTLIGHT = 2,
    GLOW_BLEND_MODE_REPLACE = 3,
    GLOW_BLEND_MODE_MIX = 4,
}
#enum SDFGIYScale
enum {
    SDFGI_Y_SCALE_50_PERCENT = 0,
    SDFGI_Y_SCALE_75_PERCENT = 1,
    SDFGI_Y_SCALE_100_PERCENT = 2,
}
#desc The global brightness value of the rendered scene. Effective only if [code]adjustment_enabled[/code] is [code]true[/code].
var adjustment_brightness: float:
	get = get_adjustment_brightness, set = set_adjustment_brightness

#desc The [Texture2D] or [Texture3D] lookup table (LUT) to use for the built-in post-process color grading. Can use a [GradientTexture1D] for a 1-dimensional LUT, or a [Texture3D] for a more complex LUT. Effective only if [code]adjustment_enabled[/code] is [code]true[/code].
var adjustment_color_correction: Texture:
	get = get_adjustment_color_correction, set = set_adjustment_color_correction

#desc The global contrast value of the rendered scene (default value is 1). Effective only if [code]adjustment_enabled[/code] is [code]true[/code].
var adjustment_contrast: float:
	get = get_adjustment_contrast, set = set_adjustment_contrast

#desc If [code]true[/code], enables the [code]adjustment_*[/code] properties provided by this resource. If [code]false[/code], modifications to the [code]adjustment_*[/code] properties will have no effect on the rendered scene.
#desc [b]Note:[/b] Adjustments are only supported in the Forward+ and Mobile rendering methods, not Compatibility.
var adjustment_enabled: bool:
	get = is_adjustment_enabled, set = set_adjustment_enabled

#desc The global color saturation value of the rendered scene (default value is 1). Effective only if [code]adjustment_enabled[/code] is [code]true[/code].
var adjustment_saturation: float:
	get = get_adjustment_saturation, set = set_adjustment_saturation

#desc The ambient light's [Color]. Only effective if [member ambient_light_sky_contribution] is lower than [code]1.0[/code] (exclusive).
var ambient_light_color: Color:
	get = get_ambient_light_color, set = set_ambient_light_color

#desc The ambient light's energy. The higher the value, the stronger the light. Only effective if [member ambient_light_sky_contribution] is lower than [code]1.0[/code] (exclusive).
var ambient_light_energy: float:
	get = get_ambient_light_energy, set = set_ambient_light_energy

#desc Defines the amount of light that the sky brings on the scene. A value of [code]0.0[/code] means that the sky's light emission has no effect on the scene illumination, thus all ambient illumination is provided by the ambient light. On the contrary, a value of [code]1.0[/code] means that [i]all[/i] the light that affects the scene is provided by the sky, thus the ambient light parameter has no effect on the scene.
#desc [b]Note:[/b] [member ambient_light_sky_contribution] is internally clamped between [code]0.0[/code] and [code]1.0[/code] (inclusive).
var ambient_light_sky_contribution: float:
	get = get_ambient_light_sky_contribution, set = set_ambient_light_sky_contribution

#desc The ambient light source to use for rendering materials and global illumination.
var ambient_light_source: int:
	get = get_ambient_source, set = set_ambient_source

#desc The ID of the camera feed to show in the background.
var background_camera_feed_id: int:
	get = get_camera_feed_id, set = set_camera_feed_id

#desc The maximum layer ID to display. Only effective when using the [constant BG_CANVAS] background mode.
var background_canvas_max_layer: int:
	get = get_canvas_max_layer, set = set_canvas_max_layer

#desc The [Color] displayed for clear areas of the scene. Only effective when using the [constant BG_COLOR] background mode.
var background_color: Color:
	get = get_bg_color, set = set_bg_color

#desc Multiplier for background energy. Increase to make background brighter, decrease to make background dimmer.
var background_energy_multiplier: float:
	get = get_bg_energy_multiplier, set = set_bg_energy_multiplier

#desc Luminance of background measured in nits (candela per square meter). Only used when [member ProjectSettings.rendering/lights_and_shadows/use_physical_light_units] is enabled. The default value is roughly equivalent to the sky at midday.
var background_intensity: float:
	get = get_bg_intensity, set = set_bg_intensity

#desc The background mode. See [enum BGMode] for possible values.
var background_mode: int:
	get = get_background, set = set_background

#desc If set above [code]0.0[/code] (exclusive), blends between the fog's color and the color of the background [Sky]. This has a small performance cost when set above [code]0.0[/code]. Must have [member background_mode] set to [constant BG_SKY].
#desc This is useful to simulate [url=https://en.wikipedia.org/wiki/Aerial_perspective]aerial perspective[/url] in large scenes with low density fog. However, it is not very useful for high-density fog, as the sky will shine through. When set to [code]1.0[/code], the fog color comes completely from the [Sky]. If set to [code]0.0[/code], aerial perspective is disabled.
var fog_aerial_perspective: float:
	get = get_fog_aerial_perspective, set = set_fog_aerial_perspective

#desc The [i]exponential[/i] fog density to use. Higher values result in a more dense fog. Fog rendering is exponential as in real life.
var fog_density: float:
	get = get_fog_density, set = set_fog_density

#desc If [code]true[/code], fog effects are enabled.
var fog_enabled: bool:
	get = is_fog_enabled, set = set_fog_enabled

#desc The height at which the height fog effect begins.
var fog_height: float:
	get = get_fog_height, set = set_fog_height

#desc The density used to increase fog as height decreases. To make fog increase as height increases, use a negative value.
var fog_height_density: float:
	get = get_fog_height_density, set = set_fog_height_density

#desc The fog's color.
var fog_light_color: Color:
	get = get_fog_light_color, set = set_fog_light_color

#desc The fog's brightness. Higher values result in brighter fog.
var fog_light_energy: float:
	get = get_fog_light_energy, set = set_fog_light_energy

#desc The factor to use when affecting the sky with non-volumetric fog. [code]1.0[/code] means that fog can fully obscure the sky. Lower values reduce the impact of fog on sky rendering, with [code]0.0[/code] not affecting sky rendering at all.
#desc [b]Note:[/b] [member fog_sky_affect] has no visual effect if [member fog_aerial_perspective] is [code]1.0[/code].
var fog_sky_affect: float:
	get = get_fog_sky_affect, set = set_fog_sky_affect

#desc If set above [code]0.0[/code], renders the scene's directional light(s) in the fog color depending on the view angle. This can be used to give the impression that the sun is "piercing" through the fog.
var fog_sun_scatter: float:
	get = get_fog_sun_scatter, set = set_fog_sun_scatter

#desc The glow blending mode.
var glow_blend_mode: int:
	get = get_glow_blend_mode, set = set_glow_blend_mode

#desc The bloom's intensity. If set to a value higher than [code]0[/code], this will make glow visible in areas darker than the [member glow_hdr_threshold].
var glow_bloom: float:
	get = get_glow_bloom, set = set_glow_bloom

#desc If [code]true[/code], the glow effect is enabled.
#desc [b]Note:[/b] Glow is only supported in the Forward+ and Mobile rendering methods, not Compatibility. When using the Mobile rendering method, glow will look different due to the lower dynamic range available in the Mobile rendering method.
var glow_enabled: bool:
	get = is_glow_enabled, set = set_glow_enabled

#desc The higher threshold of the HDR glow. Areas brighter than this threshold will be clamped for the purposes of the glow effect.
var glow_hdr_luminance_cap: float:
	get = get_glow_hdr_luminance_cap, set = set_glow_hdr_luminance_cap

#desc The bleed scale of the HDR glow.
var glow_hdr_scale: float:
	get = get_glow_hdr_bleed_scale, set = set_glow_hdr_bleed_scale

#desc The lower threshold of the HDR glow. When using the Mobile rendering method (which only supports a lower dynamic range up to [code]2.0[/code]), this may need to be below [code]1.0[/code] for glow to be visible. A value of [code]0.9[/code] works well in this case. This value also needs to be decreased below [code]1.0[/code] when using glow in 2D, as 2D rendering is performed in SDR.
var glow_hdr_threshold: float:
	get = get_glow_hdr_bleed_threshold, set = set_glow_hdr_bleed_threshold

#desc The overall brightness multiplier of the glow effect. When using the Mobile rendering method (which only supports a lower dynamic range up to [code]2.0[/code]), this should be increased to [code]1.5[/code] to compensate.
var glow_intensity: float:
	get = get_glow_intensity, set = set_glow_intensity

#desc The intensity of the 1st level of glow. This is the most "local" level (least blurry).
var glow_levels/1: float:
	get = get_glow_level, set = set_glow_level

#desc The intensity of the 2nd level of glow.
var glow_levels/2: float:
	get = get_glow_level, set = set_glow_level

#desc The intensity of the 3rd level of glow.
var glow_levels/3: float:
	get = get_glow_level, set = set_glow_level

#desc The intensity of the 4th level of glow.
var glow_levels/4: float:
	get = get_glow_level, set = set_glow_level

#desc The intensity of the 5th level of glow.
var glow_levels/5: float:
	get = get_glow_level, set = set_glow_level

#desc The intensity of the 6th level of glow.
var glow_levels/6: float:
	get = get_glow_level, set = set_glow_level

#desc The intensity of the 7th level of glow. This is the most "global" level (blurriest).
var glow_levels/7: float:
	get = get_glow_level, set = set_glow_level

#desc The texture that should be used as a glow map to [i]multiply[/i] the resulting glow color according to [member glow_map_strength]. This can be used to create a "lens dirt" effect. The texture's RGB color channels are used for modulation, but the alpha channel is ignored.
#desc [b]Note:[/b] The texture will be stretched to fit the screen. Therefore, it's recommended to use a texture with an aspect ratio that matches your project's base aspect ratio (typically 16:9).
var glow_map: Texture:
	get = get_glow_map, set = set_glow_map

#desc How strong of an impact the [member glow_map] should have on the overall glow effect. A strength of [code]0.0[/code] means the glow map has no effect on the overall glow effect. A strength of [code]1.0[/code] means the glow has a full effect on the overall glow effect (and can turn off glow entirely in specific areas of the screen if the glow map has black areas).
var glow_map_strength: float:
	get = get_glow_map_strength, set = set_glow_map_strength

#desc When using the [constant GLOW_BLEND_MODE_MIX] [member glow_blend_mode], this controls how much the source image is blended with the glow layer. A value of [code]0.0[/code] makes the glow rendering invisible, while a value of [code]1.0[/code] is equivalent to [constant GLOW_BLEND_MODE_REPLACE].
var glow_mix: float:
	get = get_glow_mix, set = set_glow_mix

#desc If [code]true[/code], glow levels will be normalized so that summed together their intensities equal [code]1.0[/code].
var glow_normalized: bool:
	get = is_glow_normalized, set = set_glow_normalized

#desc The strength of the glow effect. This applies as the glow is blurred across the screen and increases the distance and intensity of the blur. When using the Mobile rendering method, this should be increased to compensate for the lower dynamic range.
var glow_strength: float:
	get = get_glow_strength, set = set_glow_strength

#desc The reflected (specular) light source.
var reflected_light_source: int:
	get = get_reflection_source, set = set_reflection_source

#desc The energy multiplier applied to light every time it bounces from a surface when using SDFGI. Values greater than [code]0.0[/code] will simulate multiple bounces, resulting in a more realistic appearance. Increasing [member sdfgi_bounce_feedback] generally has no performance impact. See also [member sdfgi_energy].
#desc [b]Note:[/b] Values greater than [code]0.5[/code] can cause infinite feedback loops and should be avoided in scenes with bright materials.
#desc [b]Note:[/b] If [member sdfgi_bounce_feedback] is [code]0.0[/code], indirect lighting will not be represented in reflections as light will only bounce one time.
var sdfgi_bounce_feedback: float:
	get = get_sdfgi_bounce_feedback, set = set_sdfgi_bounce_feedback

#desc [b]Note:[/b] This property is linked to [member sdfgi_min_cell_size] and [member sdfgi_max_distance]. Changing its value will automatically change those properties as well.
var sdfgi_cascade0_distance: float:
	get = get_sdfgi_cascade0_distance, set = set_sdfgi_cascade0_distance

#desc The number of cascades to use for SDFGI (between 1 and 8). A higher number of cascades allows displaying SDFGI further away while preserving detail up close, at the cost of performance. When using SDFGI on small-scale levels, [member sdfgi_cascades] can often be decreased between [code]1[/code] and [code]4[/code] to improve performance.
var sdfgi_cascades: int:
	get = get_sdfgi_cascades, set = set_sdfgi_cascades

#desc If [code]true[/code], enables signed distance field global illumination for meshes that have their [member GeometryInstance3D.gi_mode] set to [constant GeometryInstance3D.GI_MODE_STATIC]. SDFGI is a real-time global illumination technique that works well with procedurally generated and user-built levels, including in situations where geometry is created during gameplay. The signed distance field is automatically generated around the camera as it moves. Dynamic lights are supported, but dynamic occluders and emissive surfaces are not.
#desc [b]Note:[/b] SDFGI is only supported in the Forward+ rendering method, not Mobile or Compatibility.
#desc [b]Performance:[/b] SDFGI is relatively demanding on the GPU and is not suited to low-end hardware such as integrated graphics (consider [LightmapGI] instead). To improve SDFGI performance, enable [member ProjectSettings.rendering/global_illumination/gi/use_half_resolution] in the Project Settings.
#desc [b]Note:[/b] Meshes should have sufficiently thick walls to avoid light leaks (avoid one-sided walls). For interior levels, enclose your level geometry in a sufficiently large box and bridge the loops to close the mesh.
var sdfgi_enabled: bool:
	get = is_sdfgi_enabled, set = set_sdfgi_enabled

#desc The energy multiplier to use for SDFGI. Higher values will result in brighter indirect lighting and reflections. See also [member sdfgi_bounce_feedback].
var sdfgi_energy: float:
	get = get_sdfgi_energy, set = set_sdfgi_energy

#desc The maximum distance at which SDFGI is visible. Beyond this distance, environment lighting or other sources of GI such as [ReflectionProbe] will be used as a fallback.
#desc [b]Note:[/b] This property is linked to [member sdfgi_min_cell_size] and [member sdfgi_cascade0_distance]. Changing its value will automatically change those properties as well.
var sdfgi_max_distance: float:
	get = get_sdfgi_max_distance, set = set_sdfgi_max_distance

#desc The cell size to use for the closest SDFGI cascade (in 3D units). Lower values allow SDFGI to be more precise up close, at the cost of making SDFGI updates more demanding. This can cause stuttering when the camera moves fast. Higher values allow SDFGI to cover more ground, while also reducing the performance impact of SDFGI updates.
#desc [b]Note:[/b] This property is linked to [member sdfgi_max_distance] and [member sdfgi_cascade0_distance]. Changing its value will automatically change those properties as well.
var sdfgi_min_cell_size: float:
	get = get_sdfgi_min_cell_size, set = set_sdfgi_min_cell_size

#desc The normal bias to use for SDFGI probes. Increasing this value can reduce visible streaking artifacts on sloped surfaces, at the cost of increased light leaking.
var sdfgi_normal_bias: float:
	get = get_sdfgi_normal_bias, set = set_sdfgi_normal_bias

#desc The constant bias to use for SDFGI probes. Increasing this value can reduce visible streaking artifacts on sloped surfaces, at the cost of increased light leaking.
var sdfgi_probe_bias: float:
	get = get_sdfgi_probe_bias, set = set_sdfgi_probe_bias

#desc If [code]true[/code], SDFGI takes the environment lighting into account. This should be set to [code]false[/code] for interior scenes.
var sdfgi_read_sky_light: bool:
	get = is_sdfgi_reading_sky_light, set = set_sdfgi_read_sky_light

#desc If [code]true[/code], SDFGI uses an occlusion detection approach to reduce light leaking. Occlusion may however introduce dark blotches in certain spots, which may be undesired in mostly outdoor scenes. [member sdfgi_use_occlusion] has a performance impact and should only be enabled when needed.
var sdfgi_use_occlusion: bool:
	get = is_sdfgi_using_occlusion, set = set_sdfgi_use_occlusion

#desc The Y scale to use for SDFGI cells. Lower values will result in SDFGI cells being packed together more closely on the Y axis. This is used to balance between quality and covering a lot of vertical ground. [member sdfgi_y_scale] should be set depending on how vertical your scene is (and how fast your camera may move on the Y axis).
var sdfgi_y_scale: int:
	get = get_sdfgi_y_scale, set = set_sdfgi_y_scale

#desc The [Sky] resource used for this [Environment].
var sky: Sky:
	get = get_sky, set = set_sky

#desc If set to a value greater than [code]0.0[/code], overrides the field of view to use for sky rendering. If set to [code]0.0[/code], the same FOV as the current [Camera3D] is used for sky rendering.
var sky_custom_fov: float:
	get = get_sky_custom_fov, set = set_sky_custom_fov

#desc The rotation to use for sky rendering.
var sky_rotation: Vector3:
	get = get_sky_rotation, set = set_sky_rotation

#desc The screen-space ambient occlusion intensity on materials that have an AO texture defined. Values higher than [code]0[/code] will make the SSAO effect visible in areas darkened by AO textures.
var ssao_ao_channel_affect: float:
	get = get_ssao_ao_channel_affect, set = set_ssao_ao_channel_affect

#desc Sets the strength of the additional level of detail for the screen-space ambient occlusion effect. A high value makes the detail pass more prominent, but it may contribute to aliasing in your final image.
var ssao_detail: float:
	get = get_ssao_detail, set = set_ssao_detail

#desc If [code]true[/code], the screen-space ambient occlusion effect is enabled. This darkens objects' corners and cavities to simulate ambient light not reaching the entire object as in real life. This works well for small, dynamic objects, but baked lighting or ambient occlusion textures will do a better job at displaying ambient occlusion on large static objects. Godot uses a form of SSAO called Adaptive Screen Space Ambient Occlusion which is itself a form of Horizon Based Ambient Occlusion.
#desc [b]Note:[/b] SSAO is only supported in the Forward+ rendering method, not Mobile or Compatibility.
var ssao_enabled: bool:
	get = is_ssao_enabled, set = set_ssao_enabled

#desc The threshold for considering whether a given point on a surface is occluded or not represented as an angle from the horizon mapped into the [code]0.0-1.0[/code] range. A value of [code]1.0[/code] results in no occlusion.
var ssao_horizon: float:
	get = get_ssao_horizon, set = set_ssao_horizon

#desc The primary screen-space ambient occlusion intensity. Acts as a multiplier for the screen-space ambient occlusion effect. A higher value results in darker occlusion.
var ssao_intensity: float:
	get = get_ssao_intensity, set = set_ssao_intensity

#desc The screen-space ambient occlusion intensity in direct light. In real life, ambient occlusion only applies to indirect light, which means its effects can't be seen in direct light. Values higher than [code]0[/code] will make the SSAO effect visible in direct light.
var ssao_light_affect: float:
	get = get_ssao_direct_light_affect, set = set_ssao_direct_light_affect

#desc The distribution of occlusion. A higher value results in darker occlusion, similar to [member ssao_intensity], but with a sharper falloff.
var ssao_power: float:
	get = get_ssao_power, set = set_ssao_power

#desc The distance at which objects can occlude each other when calculating screen-space ambient occlusion. Higher values will result in occlusion over a greater distance at the cost of performance and quality.
var ssao_radius: float:
	get = get_ssao_radius, set = set_ssao_radius

#desc The amount that the screen-space ambient occlusion effect is allowed to blur over the edges of objects. Setting too high will result in aliasing around the edges of objects. Setting too low will make object edges appear blurry.
var ssao_sharpness: float:
	get = get_ssao_sharpness, set = set_ssao_sharpness

#desc If [code]true[/code], the screen-space indirect lighting effect is enabled. Screen space indirect lighting is a form of indirect lighting that allows diffuse light to bounce between nearby objects. Screen-space indirect lighting works very similarly to screen-space ambient occlusion, in that it only affects a limited range. It is intended to be used along with a form of proper global illumination like SDFGI or [VoxelGI]. Screen-space indirect lighting is not affected by individual light's [member Light3D.light_indirect_energy].
#desc [b]Note:[/b] SSIL is only supported in the Forward+ rendering method, not Mobile or Compatibility.
var ssil_enabled: bool:
	get = is_ssil_enabled, set = set_ssil_enabled

#desc The brightness multiplier for the screen-space indirect lighting effect. A higher value will result in brighter light.
var ssil_intensity: float:
	get = get_ssil_intensity, set = set_ssil_intensity

#desc Amount of normal rejection used when calculating screen-space indirect lighting. Normal rejection uses the normal of a given sample point to reject samples that are facing away from the current pixel. Normal rejection is necessary to avoid light leaking when only one side of an object is illuminated. However, normal rejection can be disabled if light leaking is desirable, such as when the scene mostly contains emissive objects that emit light from faces that cannot be seen from the camera.
var ssil_normal_rejection: float:
	get = get_ssil_normal_rejection, set = set_ssil_normal_rejection

#desc The distance that bounced lighting can travel when using the screen space indirect lighting effect. A larger value will result in light bouncing further in a scene, but may result in under-sampling artifacts which look like long spikes surrounding light sources.
var ssil_radius: float:
	get = get_ssil_radius, set = set_ssil_radius

#desc The amount that the screen-space indirect lighting effect is allowed to blur over the edges of objects. Setting too high will result in aliasing around the edges of objects. Setting too low will make object edges appear blurry.
var ssil_sharpness: float:
	get = get_ssil_sharpness, set = set_ssil_sharpness

#desc The depth tolerance for screen-space reflections.
var ssr_depth_tolerance: float:
	get = get_ssr_depth_tolerance, set = set_ssr_depth_tolerance

#desc If [code]true[/code], screen-space reflections are enabled. Screen-space reflections are more accurate than reflections from [VoxelGI]s or [ReflectionProbe]s, but are slower and can't reflect surfaces occluded by others.
#desc [b]Note:[/b] SSR is only supported in the Forward+ rendering method, not Mobile or Compatibility.
var ssr_enabled: bool:
	get = is_ssr_enabled, set = set_ssr_enabled

#desc The fade-in distance for screen-space reflections. Affects the area from the reflected material to the screen-space reflection. Only positive values are valid (negative values will be clamped to [code]0.0[/code]).
var ssr_fade_in: float:
	get = get_ssr_fade_in, set = set_ssr_fade_in

#desc The fade-out distance for screen-space reflections. Affects the area from the screen-space reflection to the "global" reflection. Only positive values are valid (negative values will be clamped to [code]0.0[/code]).
var ssr_fade_out: float:
	get = get_ssr_fade_out, set = set_ssr_fade_out

#desc The maximum number of steps for screen-space reflections. Higher values are slower.
var ssr_max_steps: int:
	get = get_ssr_max_steps, set = set_ssr_max_steps

#desc The default exposure used for tonemapping. Higher values result in a brighter image. See also [member tonemap_white].
var tonemap_exposure: float:
	get = get_tonemap_exposure, set = set_tonemap_exposure

#desc The tonemapping mode to use. Tonemapping is the process that "converts" HDR values to be suitable for rendering on a LDR display. (Godot doesn't support rendering on HDR displays yet.)
var tonemap_mode: int:
	get = get_tonemapper, set = set_tonemapper

#desc The white reference value for tonemapping (also called "whitepoint"). Higher values can make highlights look less blown out, and will also slightly darken the whole scene as a result. Only effective if the [member tonemap_mode] isn't set to [constant TONE_MAPPER_LINEAR]. See also [member tonemap_exposure].
var tonemap_white: float:
	get = get_tonemap_white, set = set_tonemap_white

#desc The [Color] of the volumetric fog when interacting with lights. Mist and fog have an albedo close to [code]Color(1, 1, 1, 1)[/code] while smoke has a darker albedo.
var volumetric_fog_albedo: Color:
	get = get_volumetric_fog_albedo, set = set_volumetric_fog_albedo

#desc Scales the strength of ambient light used in the volumetric fog. A value of [code]0.0[/code] means that ambient light will not impact the volumetric fog. [member volumetric_fog_ambient_inject] has a small performance cost when set above [code]0.0[/code].
#desc [b]Note:[/b] This has no visible effect if [member volumetric_fog_density] is [code]0.0[/code] or if [member volumetric_fog_albedo] is a fully black color.
var volumetric_fog_ambient_inject: float:
	get = get_volumetric_fog_ambient_inject, set = set_volumetric_fog_ambient_inject

#desc The direction of scattered light as it goes through the volumetric fog. A value close to [code]1.0[/code] means almost all light is scattered forward. A value close to [code]0.0[/code] means light is scattered equally in all directions. A value close to [code]-1.0[/code] means light is scattered mostly backward. Fog and mist scatter light slightly forward, while smoke scatters light equally in all directions.
var volumetric_fog_anisotropy: float:
	get = get_volumetric_fog_anisotropy, set = set_volumetric_fog_anisotropy

#desc The base [i]exponential[/i] density of the volumetric fog. Set this to the lowest density you want to have globally. [FogVolume]s can be used to add to or subtract from this density in specific areas. Fog rendering is exponential as in real life.
#desc A value of [code]0.0[/code] disables global volumetric fog while allowing [FogVolume]s to display volumetric fog in specific areas.
#desc To make volumetric fog work as a volumetric [i]lighting[/i] solution, set [member volumetric_fog_density] to the lowest non-zero value ([code]0.0001[/code]) then increase lights' [member Light3D.light_volumetric_fog_energy] to values between [code]10000[/code] and [code]100000[/code] to compensate for the very low density.
var volumetric_fog_density: float:
	get = get_volumetric_fog_density, set = set_volumetric_fog_density

#desc The distribution of size down the length of the froxel buffer. A higher value compresses the froxels closer to the camera and places more detail closer to the camera.
var volumetric_fog_detail_spread: float:
	get = get_volumetric_fog_detail_spread, set = set_volumetric_fog_detail_spread

#desc The emitted light from the volumetric fog. Even with emission, volumetric fog will not cast light onto other surfaces. Emission is useful to establish an ambient color. As the volumetric fog effect uses single-scattering only, fog tends to need a little bit of emission to soften the harsh shadows.
var volumetric_fog_emission: Color:
	get = get_volumetric_fog_emission, set = set_volumetric_fog_emission

#desc The brightness of the emitted light from the volumetric fog.
var volumetric_fog_emission_energy: float:
	get = get_volumetric_fog_emission_energy, set = set_volumetric_fog_emission_energy

#desc Enables the volumetric fog effect. Volumetric fog uses a screen-aligned froxel buffer to calculate accurate volumetric scattering in the short to medium range. Volumetric fog interacts with [FogVolume]s and lights to calculate localized and global fog. Volumetric fog uses a PBR single-scattering model based on extinction, scattering, and emission which it exposes to users as density, albedo, and emission.
#desc [b]Note:[/b] Volumetric fog is only supported in the Forward+ rendering method, not Mobile or Compatibility.
var volumetric_fog_enabled: bool:
	get = is_volumetric_fog_enabled, set = set_volumetric_fog_enabled

#desc Scales the strength of Global Illumination used in the volumetric fog's albedo color. A value of [code]0.0[/code] means that Global Illumination will not impact the volumetric fog. [member volumetric_fog_gi_inject] has a small performance cost when set above [code]0.0[/code].
#desc [b]Note:[/b] This has no visible effect if [member volumetric_fog_density] is [code]0.0[/code] or if [member volumetric_fog_albedo] is a fully black color.
#desc [b]Note:[/b] Only [VoxelGI] and SDFGI ([member Environment.sdfgi_enabled]) are taken into account when using [member volumetric_fog_gi_inject]. Global illumination from [LightmapGI], [ReflectionProbe] and SSIL (see [member ssil_enabled]) will be ignored by volumetric fog.
var volumetric_fog_gi_inject: float:
	get = get_volumetric_fog_gi_inject, set = set_volumetric_fog_gi_inject

#desc The distance over which the volumetric fog is computed. Increase to compute fog over a greater range, decrease to add more detail when a long range is not needed. For best quality fog, keep this as low as possible. See also [member ProjectSettings.rendering/environment/volumetric_fog/volume_depth].
var volumetric_fog_length: float:
	get = get_volumetric_fog_length, set = set_volumetric_fog_length

#desc The factor to use when affecting the sky with volumetric fog. [code]1.0[/code] means that volumetric fog can fully obscure the sky. Lower values reduce the impact of volumetric fog on sky rendering, with [code]0.0[/code] not affecting sky rendering at all.
#desc [b]Note:[/b] [member volumetric_fog_sky_affect] also affects [FogVolume]s, even if [member volumetric_fog_density] is [code]0.0[/code]. If you notice [FogVolume]s are disappearing when looking towards the sky, set [member volumetric_fog_sky_affect] to [code]1.0[/code].
var volumetric_fog_sky_affect: float:
	get = get_volumetric_fog_sky_affect, set = set_volumetric_fog_sky_affect

#desc The amount by which to blend the last frame with the current frame. A higher number results in smoother volumetric fog, but makes "ghosting" much worse. A lower value reduces ghosting but can result in the per-frame temporal jitter becoming visible.
var volumetric_fog_temporal_reprojection_amount: float:
	get = get_volumetric_fog_temporal_reprojection_amount, set = set_volumetric_fog_temporal_reprojection_amount

#desc Enables temporal reprojection in the volumetric fog. Temporal reprojection blends the current frame's volumetric fog with the last frame's volumetric fog to smooth out jagged edges. The performance cost is minimal; however, it leads to moving [FogVolume]s and [Light3D]s "ghosting" and leaving a trail behind them. When temporal reprojection is enabled, try to avoid moving [FogVolume]s or [Light3D]s too fast. Short-lived dynamic lighting effects should have [member Light3D.light_volumetric_fog_energy] set to [code]0.0[/code] to avoid ghosting.
var volumetric_fog_temporal_reprojection_enabled: bool:
	get = is_volumetric_fog_temporal_reprojection_enabled, set = set_volumetric_fog_temporal_reprojection_enabled



#desc Returns the intensity of the glow level [param idx].
func get_glow_level(idx: int) -> float:
	pass;

#desc Sets the intensity of the glow level [param idx]. A value above [code]0.0[/code] enables the level. Each level relies on the previous level. This means that enabling higher glow levels will slow down the glow effect rendering, even if previous levels aren't enabled.
func set_glow_level(idx: int, intensity: float) -> void:
	pass;


func get_adjustment_brightness() -> float:
	return adjustment_brightness

func set_adjustment_brightness(value: float) -> void:
	adjustment_brightness = value

func get_adjustment_color_correction() -> Texture:
	return adjustment_color_correction

func set_adjustment_color_correction(value: Texture) -> void:
	adjustment_color_correction = value

func get_adjustment_contrast() -> float:
	return adjustment_contrast

func set_adjustment_contrast(value: float) -> void:
	adjustment_contrast = value

func is_adjustment_enabled() -> bool:
	return adjustment_enabled

func set_adjustment_enabled(value: bool) -> void:
	adjustment_enabled = value

func get_adjustment_saturation() -> float:
	return adjustment_saturation

func set_adjustment_saturation(value: float) -> void:
	adjustment_saturation = value

func get_ambient_light_color() -> Color:
	return ambient_light_color

func set_ambient_light_color(value: Color) -> void:
	ambient_light_color = value

func get_ambient_light_energy() -> float:
	return ambient_light_energy

func set_ambient_light_energy(value: float) -> void:
	ambient_light_energy = value

func get_ambient_light_sky_contribution() -> float:
	return ambient_light_sky_contribution

func set_ambient_light_sky_contribution(value: float) -> void:
	ambient_light_sky_contribution = value

func get_ambient_source() -> int:
	return ambient_light_source

func set_ambient_source(value: int) -> void:
	ambient_light_source = value

func get_camera_feed_id() -> int:
	return background_camera_feed_id

func set_camera_feed_id(value: int) -> void:
	background_camera_feed_id = value

func get_canvas_max_layer() -> int:
	return background_canvas_max_layer

func set_canvas_max_layer(value: int) -> void:
	background_canvas_max_layer = value

func get_bg_color() -> Color:
	return background_color

func set_bg_color(value: Color) -> void:
	background_color = value

func get_bg_energy_multiplier() -> float:
	return background_energy_multiplier

func set_bg_energy_multiplier(value: float) -> void:
	background_energy_multiplier = value

func get_bg_intensity() -> float:
	return background_intensity

func set_bg_intensity(value: float) -> void:
	background_intensity = value

func get_background() -> int:
	return background_mode

func set_background(value: int) -> void:
	background_mode = value

func get_fog_aerial_perspective() -> float:
	return fog_aerial_perspective

func set_fog_aerial_perspective(value: float) -> void:
	fog_aerial_perspective = value

func get_fog_density() -> float:
	return fog_density

func set_fog_density(value: float) -> void:
	fog_density = value

func is_fog_enabled() -> bool:
	return fog_enabled

func set_fog_enabled(value: bool) -> void:
	fog_enabled = value

func get_fog_height() -> float:
	return fog_height

func set_fog_height(value: float) -> void:
	fog_height = value

func get_fog_height_density() -> float:
	return fog_height_density

func set_fog_height_density(value: float) -> void:
	fog_height_density = value

func get_fog_light_color() -> Color:
	return fog_light_color

func set_fog_light_color(value: Color) -> void:
	fog_light_color = value

func get_fog_light_energy() -> float:
	return fog_light_energy

func set_fog_light_energy(value: float) -> void:
	fog_light_energy = value

func get_fog_sky_affect() -> float:
	return fog_sky_affect

func set_fog_sky_affect(value: float) -> void:
	fog_sky_affect = value

func get_fog_sun_scatter() -> float:
	return fog_sun_scatter

func set_fog_sun_scatter(value: float) -> void:
	fog_sun_scatter = value

func get_glow_blend_mode() -> int:
	return glow_blend_mode

func set_glow_blend_mode(value: int) -> void:
	glow_blend_mode = value

func get_glow_bloom() -> float:
	return glow_bloom

func set_glow_bloom(value: float) -> void:
	glow_bloom = value

func is_glow_enabled() -> bool:
	return glow_enabled

func set_glow_enabled(value: bool) -> void:
	glow_enabled = value

func get_glow_hdr_luminance_cap() -> float:
	return glow_hdr_luminance_cap

func set_glow_hdr_luminance_cap(value: float) -> void:
	glow_hdr_luminance_cap = value

func get_glow_hdr_bleed_scale() -> float:
	return glow_hdr_scale

func set_glow_hdr_bleed_scale(value: float) -> void:
	glow_hdr_scale = value

func get_glow_hdr_bleed_threshold() -> float:
	return glow_hdr_threshold

func set_glow_hdr_bleed_threshold(value: float) -> void:
	glow_hdr_threshold = value

func get_glow_intensity() -> float:
	return glow_intensity

func set_glow_intensity(value: float) -> void:
	glow_intensity = value

func get_glow_level() -> float:
	return glow_levels/1

func set_glow_level(value: float) -> void:
	glow_levels/1 = value

func get_glow_level() -> float:
	return glow_levels/2

func set_glow_level(value: float) -> void:
	glow_levels/2 = value

func get_glow_level() -> float:
	return glow_levels/3

func set_glow_level(value: float) -> void:
	glow_levels/3 = value

func get_glow_level() -> float:
	return glow_levels/4

func set_glow_level(value: float) -> void:
	glow_levels/4 = value

func get_glow_level() -> float:
	return glow_levels/5

func set_glow_level(value: float) -> void:
	glow_levels/5 = value

func get_glow_level() -> float:
	return glow_levels/6

func set_glow_level(value: float) -> void:
	glow_levels/6 = value

func get_glow_level() -> float:
	return glow_levels/7

func set_glow_level(value: float) -> void:
	glow_levels/7 = value

func get_glow_map() -> Texture:
	return glow_map

func set_glow_map(value: Texture) -> void:
	glow_map = value

func get_glow_map_strength() -> float:
	return glow_map_strength

func set_glow_map_strength(value: float) -> void:
	glow_map_strength = value

func get_glow_mix() -> float:
	return glow_mix

func set_glow_mix(value: float) -> void:
	glow_mix = value

func is_glow_normalized() -> bool:
	return glow_normalized

func set_glow_normalized(value: bool) -> void:
	glow_normalized = value

func get_glow_strength() -> float:
	return glow_strength

func set_glow_strength(value: float) -> void:
	glow_strength = value

func get_reflection_source() -> int:
	return reflected_light_source

func set_reflection_source(value: int) -> void:
	reflected_light_source = value

func get_sdfgi_bounce_feedback() -> float:
	return sdfgi_bounce_feedback

func set_sdfgi_bounce_feedback(value: float) -> void:
	sdfgi_bounce_feedback = value

func get_sdfgi_cascade0_distance() -> float:
	return sdfgi_cascade0_distance

func set_sdfgi_cascade0_distance(value: float) -> void:
	sdfgi_cascade0_distance = value

func get_sdfgi_cascades() -> int:
	return sdfgi_cascades

func set_sdfgi_cascades(value: int) -> void:
	sdfgi_cascades = value

func is_sdfgi_enabled() -> bool:
	return sdfgi_enabled

func set_sdfgi_enabled(value: bool) -> void:
	sdfgi_enabled = value

func get_sdfgi_energy() -> float:
	return sdfgi_energy

func set_sdfgi_energy(value: float) -> void:
	sdfgi_energy = value

func get_sdfgi_max_distance() -> float:
	return sdfgi_max_distance

func set_sdfgi_max_distance(value: float) -> void:
	sdfgi_max_distance = value

func get_sdfgi_min_cell_size() -> float:
	return sdfgi_min_cell_size

func set_sdfgi_min_cell_size(value: float) -> void:
	sdfgi_min_cell_size = value

func get_sdfgi_normal_bias() -> float:
	return sdfgi_normal_bias

func set_sdfgi_normal_bias(value: float) -> void:
	sdfgi_normal_bias = value

func get_sdfgi_probe_bias() -> float:
	return sdfgi_probe_bias

func set_sdfgi_probe_bias(value: float) -> void:
	sdfgi_probe_bias = value

func is_sdfgi_reading_sky_light() -> bool:
	return sdfgi_read_sky_light

func set_sdfgi_read_sky_light(value: bool) -> void:
	sdfgi_read_sky_light = value

func is_sdfgi_using_occlusion() -> bool:
	return sdfgi_use_occlusion

func set_sdfgi_use_occlusion(value: bool) -> void:
	sdfgi_use_occlusion = value

func get_sdfgi_y_scale() -> int:
	return sdfgi_y_scale

func set_sdfgi_y_scale(value: int) -> void:
	sdfgi_y_scale = value

func get_sky() -> Sky:
	return sky

func set_sky(value: Sky) -> void:
	sky = value

func get_sky_custom_fov() -> float:
	return sky_custom_fov

func set_sky_custom_fov(value: float) -> void:
	sky_custom_fov = value

func get_sky_rotation() -> Vector3:
	return sky_rotation

func set_sky_rotation(value: Vector3) -> void:
	sky_rotation = value

func get_ssao_ao_channel_affect() -> float:
	return ssao_ao_channel_affect

func set_ssao_ao_channel_affect(value: float) -> void:
	ssao_ao_channel_affect = value

func get_ssao_detail() -> float:
	return ssao_detail

func set_ssao_detail(value: float) -> void:
	ssao_detail = value

func is_ssao_enabled() -> bool:
	return ssao_enabled

func set_ssao_enabled(value: bool) -> void:
	ssao_enabled = value

func get_ssao_horizon() -> float:
	return ssao_horizon

func set_ssao_horizon(value: float) -> void:
	ssao_horizon = value

func get_ssao_intensity() -> float:
	return ssao_intensity

func set_ssao_intensity(value: float) -> void:
	ssao_intensity = value

func get_ssao_direct_light_affect() -> float:
	return ssao_light_affect

func set_ssao_direct_light_affect(value: float) -> void:
	ssao_light_affect = value

func get_ssao_power() -> float:
	return ssao_power

func set_ssao_power(value: float) -> void:
	ssao_power = value

func get_ssao_radius() -> float:
	return ssao_radius

func set_ssao_radius(value: float) -> void:
	ssao_radius = value

func get_ssao_sharpness() -> float:
	return ssao_sharpness

func set_ssao_sharpness(value: float) -> void:
	ssao_sharpness = value

func is_ssil_enabled() -> bool:
	return ssil_enabled

func set_ssil_enabled(value: bool) -> void:
	ssil_enabled = value

func get_ssil_intensity() -> float:
	return ssil_intensity

func set_ssil_intensity(value: float) -> void:
	ssil_intensity = value

func get_ssil_normal_rejection() -> float:
	return ssil_normal_rejection

func set_ssil_normal_rejection(value: float) -> void:
	ssil_normal_rejection = value

func get_ssil_radius() -> float:
	return ssil_radius

func set_ssil_radius(value: float) -> void:
	ssil_radius = value

func get_ssil_sharpness() -> float:
	return ssil_sharpness

func set_ssil_sharpness(value: float) -> void:
	ssil_sharpness = value

func get_ssr_depth_tolerance() -> float:
	return ssr_depth_tolerance

func set_ssr_depth_tolerance(value: float) -> void:
	ssr_depth_tolerance = value

func is_ssr_enabled() -> bool:
	return ssr_enabled

func set_ssr_enabled(value: bool) -> void:
	ssr_enabled = value

func get_ssr_fade_in() -> float:
	return ssr_fade_in

func set_ssr_fade_in(value: float) -> void:
	ssr_fade_in = value

func get_ssr_fade_out() -> float:
	return ssr_fade_out

func set_ssr_fade_out(value: float) -> void:
	ssr_fade_out = value

func get_ssr_max_steps() -> int:
	return ssr_max_steps

func set_ssr_max_steps(value: int) -> void:
	ssr_max_steps = value

func get_tonemap_exposure() -> float:
	return tonemap_exposure

func set_tonemap_exposure(value: float) -> void:
	tonemap_exposure = value

func get_tonemapper() -> int:
	return tonemap_mode

func set_tonemapper(value: int) -> void:
	tonemap_mode = value

func get_tonemap_white() -> float:
	return tonemap_white

func set_tonemap_white(value: float) -> void:
	tonemap_white = value

func get_volumetric_fog_albedo() -> Color:
	return volumetric_fog_albedo

func set_volumetric_fog_albedo(value: Color) -> void:
	volumetric_fog_albedo = value

func get_volumetric_fog_ambient_inject() -> float:
	return volumetric_fog_ambient_inject

func set_volumetric_fog_ambient_inject(value: float) -> void:
	volumetric_fog_ambient_inject = value

func get_volumetric_fog_anisotropy() -> float:
	return volumetric_fog_anisotropy

func set_volumetric_fog_anisotropy(value: float) -> void:
	volumetric_fog_anisotropy = value

func get_volumetric_fog_density() -> float:
	return volumetric_fog_density

func set_volumetric_fog_density(value: float) -> void:
	volumetric_fog_density = value

func get_volumetric_fog_detail_spread() -> float:
	return volumetric_fog_detail_spread

func set_volumetric_fog_detail_spread(value: float) -> void:
	volumetric_fog_detail_spread = value

func get_volumetric_fog_emission() -> Color:
	return volumetric_fog_emission

func set_volumetric_fog_emission(value: Color) -> void:
	volumetric_fog_emission = value

func get_volumetric_fog_emission_energy() -> float:
	return volumetric_fog_emission_energy

func set_volumetric_fog_emission_energy(value: float) -> void:
	volumetric_fog_emission_energy = value

func is_volumetric_fog_enabled() -> bool:
	return volumetric_fog_enabled

func set_volumetric_fog_enabled(value: bool) -> void:
	volumetric_fog_enabled = value

func get_volumetric_fog_gi_inject() -> float:
	return volumetric_fog_gi_inject

func set_volumetric_fog_gi_inject(value: float) -> void:
	volumetric_fog_gi_inject = value

func get_volumetric_fog_length() -> float:
	return volumetric_fog_length

func set_volumetric_fog_length(value: float) -> void:
	volumetric_fog_length = value

func get_volumetric_fog_sky_affect() -> float:
	return volumetric_fog_sky_affect

func set_volumetric_fog_sky_affect(value: float) -> void:
	volumetric_fog_sky_affect = value

func get_volumetric_fog_temporal_reprojection_amount() -> float:
	return volumetric_fog_temporal_reprojection_amount

func set_volumetric_fog_temporal_reprojection_amount(value: float) -> void:
	volumetric_fog_temporal_reprojection_amount = value

func is_volumetric_fog_temporal_reprojection_enabled() -> bool:
	return volumetric_fog_temporal_reprojection_enabled

func set_volumetric_fog_temporal_reprojection_enabled(value: bool) -> void:
	volumetric_fog_temporal_reprojection_enabled = value

