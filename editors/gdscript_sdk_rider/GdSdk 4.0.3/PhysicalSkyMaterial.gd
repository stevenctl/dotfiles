extends Material
#brief [Sky] [Material] used for a physically based sky.
#desc The [PhysicalSkyMaterial] uses the Preetham analytic daylight model to draw a sky based on physical properties. This results in a substantially more realistic sky than the [ProceduralSkyMaterial], but it is slightly slower and less flexible.
#desc The [PhysicalSkyMaterial] only supports one sun. The color, energy, and direction of the sun are taken from the first [DirectionalLight3D] in the scene tree.
#desc As it is based on a daylight model, the sky fades to black as the sunset ends. If you want a full day/night cycle, you will have to add a night sky by converting this to a [ShaderMaterial] and adding a night sky directly into the resulting shader.
class_name PhysicalSkyMaterial


#desc The sky's overall brightness multiplier. Higher values result in a brighter sky.
var energy_multiplier: float:
	get = get_energy_multiplier, set = set_energy_multiplier

#desc Modulates the [Color] on the bottom half of the sky to represent the ground.
var ground_color: Color:
	get = get_ground_color, set = set_ground_color

#desc Controls the strength of [url=https://en.wikipedia.org/wiki/Mie_scattering]Mie scattering[/url] for the sky. Mie scattering results from light colliding with larger particles (like water). On earth, Mie scattering results in a whitish color around the sun and horizon.
var mie_coefficient: float:
	get = get_mie_coefficient, set = set_mie_coefficient

#desc Controls the [Color] of the [url=https://en.wikipedia.org/wiki/Mie_scattering]Mie scattering[/url] effect. While not physically accurate, this allows for the creation of alien-looking planets.
var mie_color: Color:
	get = get_mie_color, set = set_mie_color

#desc Controls the direction of the [url=https://en.wikipedia.org/wiki/Mie_scattering]Mie scattering[/url]. A value of [code]1[/code] means that when light hits a particle it's passing through straight forward. A value of [code]-1[/code] means that all light is scatter backwards.
var mie_eccentricity: float:
	get = get_mie_eccentricity, set = set_mie_eccentricity

#desc [Texture2D] for the night sky. This is added to the sky, so if it is bright enough, it may be visible during the day.
var night_sky: Texture2D:
	get = get_night_sky, set = set_night_sky

#desc Controls the strength of the [url=https://en.wikipedia.org/wiki/Rayleigh_scattering]Rayleigh scattering[/url]. Rayleigh scattering results from light colliding with small particles. It is responsible for the blue color of the sky.
var rayleigh_coefficient: float:
	get = get_rayleigh_coefficient, set = set_rayleigh_coefficient

#desc Controls the [Color] of the [url=https://en.wikipedia.org/wiki/Rayleigh_scattering]Rayleigh scattering[/url]. While not physically accurate, this allows for the creation of alien-looking planets. For example, setting this to a red [Color] results in a Mars-looking atmosphere with a corresponding blue sunset.
var rayleigh_color: Color:
	get = get_rayleigh_color, set = set_rayleigh_color

#desc Sets the size of the sun disk. Default value is based on Sol's perceived size from Earth.
var sun_disk_scale: float:
	get = get_sun_disk_scale, set = set_sun_disk_scale

#desc Sets the thickness of the atmosphere. High turbidity creates a foggy-looking atmosphere, while a low turbidity results in a clearer atmosphere.
var turbidity: float:
	get = get_turbidity, set = set_turbidity

#desc If [code]true[/code], enables debanding. Debanding adds a small amount of noise which helps reduce banding that appears from the smooth changes in color in the sky.
var use_debanding: bool:
	get = get_use_debanding, set = set_use_debanding




func get_energy_multiplier() -> float:
	return energy_multiplier

func set_energy_multiplier(value: float) -> void:
	energy_multiplier = value

func get_ground_color() -> Color:
	return ground_color

func set_ground_color(value: Color) -> void:
	ground_color = value

func get_mie_coefficient() -> float:
	return mie_coefficient

func set_mie_coefficient(value: float) -> void:
	mie_coefficient = value

func get_mie_color() -> Color:
	return mie_color

func set_mie_color(value: Color) -> void:
	mie_color = value

func get_mie_eccentricity() -> float:
	return mie_eccentricity

func set_mie_eccentricity(value: float) -> void:
	mie_eccentricity = value

func get_night_sky() -> Texture2D:
	return night_sky

func set_night_sky(value: Texture2D) -> void:
	night_sky = value

func get_rayleigh_coefficient() -> float:
	return rayleigh_coefficient

func set_rayleigh_coefficient(value: float) -> void:
	rayleigh_coefficient = value

func get_rayleigh_color() -> Color:
	return rayleigh_color

func set_rayleigh_color(value: Color) -> void:
	rayleigh_color = value

func get_sun_disk_scale() -> float:
	return sun_disk_scale

func set_sun_disk_scale(value: float) -> void:
	sun_disk_scale = value

func get_turbidity() -> float:
	return turbidity

func set_turbidity(value: float) -> void:
	turbidity = value

func get_use_debanding() -> bool:
	return use_debanding

func set_use_debanding(value: bool) -> void:
	use_debanding = value

