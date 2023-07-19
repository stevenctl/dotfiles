extends Light3D
#brief Omnidirectional light, such as a light bulb or a candle.
#desc An Omnidirectional light is a type of [Light3D] that emits light in all directions. The light is attenuated by distance and this attenuation can be configured by changing its energy, radius, and attenuation parameters.
#desc [b]Note:[/b] When using the Mobile rendering method, only 8 omni lights can be displayed on each mesh resource. Attempting to display more than 8 omni lights on a single mesh resource will result in omni lights flickering in and out as the camera moves. When using the Compatibility rendering method, only 8 omni lights can be displayed on each mesh resource by default, but this can be increased by adjusting [member ProjectSettings.rendering/limits/opengl/max_lights_per_object].
#desc [b]Note:[/b] When using the Mobile or Compatibility rendering methods, omni lights will only correctly affect meshes whose visibility AABB intersects with the light's AABB. If using a shader to deform the mesh in a way that makes it go outside its AABB, [member GeometryInstance3D.extra_cull_margin] must be increased on the mesh. Otherwise, the light may not be visible on the mesh.
#tutorial [3D lights and shadows] https://docs.godotengine.org/en/stable/tutorials/3d/lights_and_shadows.html
class_name OmniLight3D

#desc Shadows are rendered to a dual-paraboloid texture. Faster than [constant SHADOW_CUBE], but lower-quality.
#desc Shadows are rendered to a cubemap. Slower than [constant SHADOW_DUAL_PARABOLOID], but higher-quality.

#enum ShadowMode
enum {
    SHADOW_DUAL_PARABOLOID = 0,
    SHADOW_CUBE = 1,
}
#desc The light's attenuation (drop-off) curve. A number of presets are available in the [b]Inspector[/b] by right-clicking the curve. Zero and negative values are allowed but can produce unusual effects.
#desc [b]Note:[/b] Very high [member omni_attenuation] values (typically above 10) can impact performance negatively if the light is made to use a larger [member omni_range] to compensate. This is because culling opportunities will become less common and shading costs will be increased (as the light will cover more pixels on screen while resulting in the same amount of brightness). To improve performance, use the lowest [member omni_attenuation] value possible for the visuals you're trying to achieve.
var omni_attenuation: float:
	get = get_param, set = set_param

#desc The light's radius. Note that the effectively lit area may appear to be smaller depending on the [member omni_attenuation] in use. No matter the [member omni_attenuation] in use, the light will never reach anything outside this radius.
#desc [b]Note:[/b] [member omni_range] is not affected by [member Node3D.scale] (the light's scale or its parent's scale).
var omni_range: float:
	get = get_param, set = set_param

#desc See [enum ShadowMode].
var omni_shadow_mode: int:
	get = get_shadow_mode, set = set_shadow_mode

var shadow_normal_bias: float:
	get = get_param, set = set_param




func get_param() -> float:
	return omni_attenuation

func set_param(value: float) -> void:
	omni_attenuation = value

func get_param() -> float:
	return omni_range

func set_param(value: float) -> void:
	omni_range = value

func get_shadow_mode() -> int:
	return omni_shadow_mode

func set_shadow_mode(value: int) -> void:
	omni_shadow_mode = value

func get_param() -> float:
	return shadow_normal_bias

func set_param(value: float) -> void:
	shadow_normal_bias = value

