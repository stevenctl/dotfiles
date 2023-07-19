extends Node2D
#brief Casts light in a 2D environment.
#desc Casts light in a 2D environment. A light is defined as a color, an energy value, a mode (see constants), and various other parameters (range and shadows-related).
#tutorial [2D lights and shadows] https://docs.godotengine.org/en/stable/tutorials/2d/2d_lights_and_shadows.html
class_name Light2D

#desc No filter applies to the shadow map. This provides hard shadow edges and is the fastest to render. See [member shadow_filter].
#desc Percentage closer filtering (5 samples) applies to the shadow map. This is slower compared to hard shadow rendering. See [member shadow_filter].
#desc Percentage closer filtering (13 samples) applies to the shadow map. This is the slowest shadow filtering mode, and should be used sparingly. See [member shadow_filter].
#desc Adds the value of pixels corresponding to the Light2D to the values of pixels under it. This is the common behavior of a light.
#desc Subtracts the value of pixels corresponding to the Light2D to the values of pixels under it, resulting in inversed light effect.
#desc Mix the value of pixels corresponding to the Light2D to the values of pixels under it by linear interpolation.

#enum ShadowFilter
enum {
    SHADOW_FILTER_NONE = 0,
    SHADOW_FILTER_PCF5 = 1,
    SHADOW_FILTER_PCF13 = 2,
}
#enum BlendMode
enum {
    BLEND_MODE_ADD = 0,
    BLEND_MODE_SUB = 1,
    BLEND_MODE_MIX = 2,
}
#desc The Light2D's blend mode. See [enum BlendMode] constants for values.
var blend_mode: int:
	get = get_blend_mode, set = set_blend_mode

#desc The Light2D's [Color].
var color: Color:
	get = get_color, set = set_color

#desc If [code]true[/code], Light2D will only appear when editing the scene.
var editor_only: bool:
	get = is_editor_only, set = set_editor_only

#desc If [code]true[/code], Light2D will emit light.
var enabled: bool:
	get = is_enabled, set = set_enabled

#desc The Light2D's energy value. The larger the value, the stronger the light.
var energy: float:
	get = get_energy, set = set_energy

#desc The layer mask. Only objects with a matching [member CanvasItem.light_mask] will be affected by the Light2D. See also [member shadow_item_cull_mask], which affects which objects can cast shadows.
#desc [b]Note:[/b] [member range_item_cull_mask] is ignored by [DirectionalLight2D], which will always light a 2D node regardless of the 2D node's [member CanvasItem.light_mask].
var range_item_cull_mask: int:
	get = get_item_cull_mask, set = set_item_cull_mask

#desc Maximum layer value of objects that are affected by the Light2D.
var range_layer_max: int:
	get = get_layer_range_max, set = set_layer_range_max

#desc Minimum layer value of objects that are affected by the Light2D.
var range_layer_min: int:
	get = get_layer_range_min, set = set_layer_range_min

#desc Maximum [code]z[/code] value of objects that are affected by the Light2D.
var range_z_max: int:
	get = get_z_range_max, set = set_z_range_max

#desc Minimum [code]z[/code] value of objects that are affected by the Light2D.
var range_z_min: int:
	get = get_z_range_min, set = set_z_range_min

#desc [Color] of shadows cast by the Light2D.
var shadow_color: Color:
	get = get_shadow_color, set = set_shadow_color

#desc If [code]true[/code], the Light2D will cast shadows.
var shadow_enabled: bool:
	get = is_shadow_enabled, set = set_shadow_enabled

#desc Shadow filter type. See [enum ShadowFilter] for possible values.
var shadow_filter: int:
	get = get_shadow_filter, set = set_shadow_filter

#desc Smoothing value for shadows. Higher values will result in softer shadows, at the cost of visible streaks that can appear in shadow rendering. [member shadow_filter_smooth] only has an effect if [member shadow_filter] is [constant SHADOW_FILTER_PCF5] or [constant SHADOW_FILTER_PCF13].
var shadow_filter_smooth: float:
	get = get_shadow_smooth, set = set_shadow_smooth

#desc The shadow mask. Used with [LightOccluder2D] to cast shadows. Only occluders with a matching [member CanvasItem.light_mask] will cast shadows. See also [member range_item_cull_mask], which affects which objects can [i]receive[/i] the light.
var shadow_item_cull_mask: int:
	get = get_item_shadow_cull_mask, set = set_item_shadow_cull_mask



#desc Returns the light's height, which is used in 2D normal mapping. See [member PointLight2D.height] and [member DirectionalLight2D.height].
func get_height() -> float:
	pass;

#desc Sets the light's height, which is used in 2D normal mapping. See [member PointLight2D.height] and [member DirectionalLight2D.height].
func set_height(height: float) -> void:
	pass;


func get_blend_mode() -> int:
	return blend_mode

func set_blend_mode(value: int) -> void:
	blend_mode = value

func get_color() -> Color:
	return color

func set_color(value: Color) -> void:
	color = value

func is_editor_only() -> bool:
	return editor_only

func set_editor_only(value: bool) -> void:
	editor_only = value

func is_enabled() -> bool:
	return enabled

func set_enabled(value: bool) -> void:
	enabled = value

func get_energy() -> float:
	return energy

func set_energy(value: float) -> void:
	energy = value

func get_item_cull_mask() -> int:
	return range_item_cull_mask

func set_item_cull_mask(value: int) -> void:
	range_item_cull_mask = value

func get_layer_range_max() -> int:
	return range_layer_max

func set_layer_range_max(value: int) -> void:
	range_layer_max = value

func get_layer_range_min() -> int:
	return range_layer_min

func set_layer_range_min(value: int) -> void:
	range_layer_min = value

func get_z_range_max() -> int:
	return range_z_max

func set_z_range_max(value: int) -> void:
	range_z_max = value

func get_z_range_min() -> int:
	return range_z_min

func set_z_range_min(value: int) -> void:
	range_z_min = value

func get_shadow_color() -> Color:
	return shadow_color

func set_shadow_color(value: Color) -> void:
	shadow_color = value

func is_shadow_enabled() -> bool:
	return shadow_enabled

func set_shadow_enabled(value: bool) -> void:
	shadow_enabled = value

func get_shadow_filter() -> int:
	return shadow_filter

func set_shadow_filter(value: int) -> void:
	shadow_filter = value

func get_shadow_smooth() -> float:
	return shadow_filter_smooth

func set_shadow_smooth(value: float) -> void:
	shadow_filter_smooth = value

func get_item_shadow_cull_mask() -> int:
	return shadow_item_cull_mask

func set_item_shadow_cull_mask(value: int) -> void:
	shadow_item_cull_mask = value

