extends Material
#brief A [Material] used with [Sky] to generate a background based on user input parameters.
#desc ProceduralSkyMaterial provides a way to create an effective background quickly by defining procedural parameters for the sun, the sky and the ground. The sky and ground are very similar, they are defined by a color at the horizon, another color, and finally an easing curve to interpolate between these two colors. Similarly, the sun is described by a position in the sky, a color, and an easing curve. However, the sun also defines a minimum and maximum angle, these two values define at what distance the easing curve begins and ends from the sun, and thus end up defining the size of the sun in the sky.
#desc The [ProceduralSkyMaterial] uses a lightweight shader to draw the sky and is thus suited for real time updates. When you do not need a quick sky that is not realistic, this is a good option. If you need a more realistic option, try using [PhysicalSkyMaterial] instead.
#desc The [ProceduralSkyMaterial] supports up to 4 suns. Each sun takes its color, energy, and direction from the corresponding [DirectionalLight3D] in the scene.
class_name ProceduralSkyMaterial


#desc Color of the ground at the bottom. Blends with [member ground_horizon_color].
var ground_bottom_color: Color:
	get = get_ground_bottom_color, set = set_ground_bottom_color

#desc How quickly the [member ground_horizon_color] fades into the [member ground_bottom_color].
var ground_curve: float:
	get = get_ground_curve, set = set_ground_curve

#desc Multiplier for ground color. A higher value will make the ground brighter.
var ground_energy_multiplier: float:
	get = get_ground_energy_multiplier, set = set_ground_energy_multiplier

#desc Color of the ground at the horizon. Blends with [member ground_bottom_color].
var ground_horizon_color: Color:
	get = get_ground_horizon_color, set = set_ground_horizon_color

#desc The sky cover texture to use. This texture must use an equirectangular projection (similar to [PanoramaSkyMaterial]). The texture's colors will be [i]added[/i] to the existing sky color, and will be multiplied by [member sky_energy_multiplier] and [member sky_cover_modulate]. This is mainly suited to displaying stars at night, but it can also be used to display clouds at day or night (with a non-physically-accurate look).
var sky_cover: Texture2D:
	get = get_sky_cover, set = set_sky_cover

#desc The tint to apply to the [member sky_cover] texture. This can be used to change the sky cover's colors or opacity independently of the sky energy, which is useful for day/night or weather transitions. Only effective if a texture is defined in [member sky_cover].
var sky_cover_modulate: Color:
	get = get_sky_cover_modulate, set = set_sky_cover_modulate

#desc How quickly the [member sky_horizon_color] fades into the [member sky_top_color].
var sky_curve: float:
	get = get_sky_curve, set = set_sky_curve

#desc Multiplier for sky color. A higher value will make the sky brighter.
var sky_energy_multiplier: float:
	get = get_sky_energy_multiplier, set = set_sky_energy_multiplier

#desc Color of the sky at the horizon. Blends with [member sky_top_color].
var sky_horizon_color: Color:
	get = get_sky_horizon_color, set = set_sky_horizon_color

#desc Color of the sky at the top. Blends with [member sky_horizon_color].
var sky_top_color: Color:
	get = get_sky_top_color, set = set_sky_top_color

#desc Distance from center of sun where it fades out completely.
var sun_angle_max: float:
	get = get_sun_angle_max, set = set_sun_angle_max

#desc How quickly the sun fades away between the edge of the sun disk and [member sun_angle_max].
var sun_curve: float:
	get = get_sun_curve, set = set_sun_curve

#desc If [code]true[/code], enables debanding. Debanding adds a small amount of noise which helps reduce banding that appears from the smooth changes in color in the sky.
var use_debanding: bool:
	get = get_use_debanding, set = set_use_debanding




func get_ground_bottom_color() -> Color:
	return ground_bottom_color

func set_ground_bottom_color(value: Color) -> void:
	ground_bottom_color = value

func get_ground_curve() -> float:
	return ground_curve

func set_ground_curve(value: float) -> void:
	ground_curve = value

func get_ground_energy_multiplier() -> float:
	return ground_energy_multiplier

func set_ground_energy_multiplier(value: float) -> void:
	ground_energy_multiplier = value

func get_ground_horizon_color() -> Color:
	return ground_horizon_color

func set_ground_horizon_color(value: Color) -> void:
	ground_horizon_color = value

func get_sky_cover() -> Texture2D:
	return sky_cover

func set_sky_cover(value: Texture2D) -> void:
	sky_cover = value

func get_sky_cover_modulate() -> Color:
	return sky_cover_modulate

func set_sky_cover_modulate(value: Color) -> void:
	sky_cover_modulate = value

func get_sky_curve() -> float:
	return sky_curve

func set_sky_curve(value: float) -> void:
	sky_curve = value

func get_sky_energy_multiplier() -> float:
	return sky_energy_multiplier

func set_sky_energy_multiplier(value: float) -> void:
	sky_energy_multiplier = value

func get_sky_horizon_color() -> Color:
	return sky_horizon_color

func set_sky_horizon_color(value: Color) -> void:
	sky_horizon_color = value

func get_sky_top_color() -> Color:
	return sky_top_color

func set_sky_top_color(value: Color) -> void:
	sky_top_color = value

func get_sun_angle_max() -> float:
	return sun_angle_max

func set_sun_angle_max(value: float) -> void:
	sun_angle_max = value

func get_sun_curve() -> float:
	return sun_curve

func set_sun_curve(value: float) -> void:
	sun_curve = value

func get_use_debanding() -> bool:
	return use_debanding

func set_use_debanding(value: bool) -> void:
	use_debanding = value

