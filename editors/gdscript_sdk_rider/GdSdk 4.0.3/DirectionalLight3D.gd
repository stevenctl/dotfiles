extends Light3D
#brief Directional light from a distance, as from the Sun.
#desc A directional light is a type of [Light3D] node that models an infinite number of parallel rays covering the entire scene. It is used for lights with strong intensity that are located far away from the scene to model sunlight or moonlight. The worldspace location of the DirectionalLight3D transform (origin) is ignored. Only the basis is used to determine light direction.
#tutorial [Lights and shadows] https://docs.godotengine.org/en/stable/tutorials/3d/lights_and_shadows.html
class_name DirectionalLight3D

#desc Renders the entire scene's shadow map from an orthogonal point of view. This is the fastest directional shadow mode. May result in blurrier shadows on close objects.
#desc Splits the view frustum in 2 areas, each with its own shadow map. This shadow mode is a compromise between [constant SHADOW_ORTHOGONAL] and [constant SHADOW_PARALLEL_4_SPLITS] in terms of performance.
#desc Splits the view frustum in 4 areas, each with its own shadow map. This is the slowest directional shadow mode.
#desc Makes the light visible in both scene lighting and sky rendering.
#desc Makes the light visible in scene lighting only (including direct lighting and global illumination). When using this mode, the light will not be visible from sky shaders.
#desc Makes the light visible to sky shaders only. When using this mode the light will not cast light into the scene (either through direct lighting or through global illumination), but can be accessed through sky shaders. This can be useful, for example, when you want to control sky effects without illuminating the scene (during a night cycle, for example).

#enum ShadowMode
enum {
    SHADOW_ORTHOGONAL = 0,
    SHADOW_PARALLEL_2_SPLITS = 1,
    SHADOW_PARALLEL_4_SPLITS = 2,
}
#enum SkyMode
enum {
    SKY_MODE_LIGHT_AND_SKY = 0,
    SKY_MODE_LIGHT_ONLY = 1,
    SKY_MODE_SKY_ONLY = 2,
}
#desc If [code]true[/code], shadow detail is sacrificed in exchange for smoother transitions between splits. Enabling shadow blend splitting also has a moderate performance cost. This is ignored when [member directional_shadow_mode] is [constant SHADOW_ORTHOGONAL].
var directional_shadow_blend_splits: bool:
	get = is_blend_splits_enabled, set = set_blend_splits

#desc Proportion of [member directional_shadow_max_distance] at which point the shadow starts to fade. At [member directional_shadow_max_distance], the shadow will disappear. The default value is a balance between smooth fading and distant shadow visibility. If the camera moves fast and the [member directional_shadow_max_distance] is low, consider lowering [member directional_shadow_fade_start] below [code]0.8[/code] to make shadow transitions less noticeable. On the other hand, if you tuned [member directional_shadow_max_distance] to cover the entire scene, you can set [member directional_shadow_fade_start] to [code]1.0[/code] to prevent the shadow from fading in the distance (it will suddenly cut off instead).
var directional_shadow_fade_start: float:
	get = get_param, set = set_param

#desc The maximum distance for shadow splits. Increasing this value will make directional shadows visible from further away, at the cost of lower overall shadow detail and performance (since more objects need to be included in the directional shadow rendering).
var directional_shadow_max_distance: float:
	get = get_param, set = set_param

#desc The light's shadow rendering algorithm. See [enum ShadowMode].
var directional_shadow_mode: int:
	get = get_shadow_mode, set = set_shadow_mode

#desc Sets the size of the directional shadow pancake. The pancake offsets the start of the shadow's camera frustum to provide a higher effective depth resolution for the shadow. However, a high pancake size can cause artifacts in the shadows of large objects that are close to the edge of the frustum. Reducing the pancake size can help. Setting the size to [code]0[/code] turns off the pancaking effect.
var directional_shadow_pancake_size: float:
	get = get_param, set = set_param

#desc The distance from camera to shadow split 1. Relative to [member directional_shadow_max_distance]. Only used when [member directional_shadow_mode] is [constant SHADOW_PARALLEL_2_SPLITS] or [constant SHADOW_PARALLEL_4_SPLITS].
var directional_shadow_split_1: float:
	get = get_param, set = set_param

#desc The distance from shadow split 1 to split 2. Relative to [member directional_shadow_max_distance]. Only used when [member directional_shadow_mode] is [constant SHADOW_PARALLEL_4_SPLITS].
var directional_shadow_split_2: float:
	get = get_param, set = set_param

#desc The distance from shadow split 2 to split 3. Relative to [member directional_shadow_max_distance]. Only used when [member directional_shadow_mode] is [constant SHADOW_PARALLEL_4_SPLITS].
var directional_shadow_split_3: float:
	get = get_param, set = set_param

#desc Set whether this [DirectionalLight3D] is visible in the sky, in the scene, or both in the sky and in the scene. See [enum SkyMode] for options.
var sky_mode: int:
	get = get_sky_mode, set = set_sky_mode




func is_blend_splits_enabled() -> bool:
	return directional_shadow_blend_splits

func set_blend_splits(value: bool) -> void:
	directional_shadow_blend_splits = value

func get_param() -> float:
	return directional_shadow_fade_start

func set_param(value: float) -> void:
	directional_shadow_fade_start = value

func get_param() -> float:
	return directional_shadow_max_distance

func set_param(value: float) -> void:
	directional_shadow_max_distance = value

func get_shadow_mode() -> int:
	return directional_shadow_mode

func set_shadow_mode(value: int) -> void:
	directional_shadow_mode = value

func get_param() -> float:
	return directional_shadow_pancake_size

func set_param(value: float) -> void:
	directional_shadow_pancake_size = value

func get_param() -> float:
	return directional_shadow_split_1

func set_param(value: float) -> void:
	directional_shadow_split_1 = value

func get_param() -> float:
	return directional_shadow_split_2

func set_param(value: float) -> void:
	directional_shadow_split_2 = value

func get_param() -> float:
	return directional_shadow_split_3

func set_param(value: float) -> void:
	directional_shadow_split_3 = value

func get_sky_mode() -> int:
	return sky_mode

func set_sky_mode(value: int) -> void:
	sky_mode = value

