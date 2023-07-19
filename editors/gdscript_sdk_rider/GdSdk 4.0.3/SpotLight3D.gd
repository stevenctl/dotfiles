extends Light3D
#brief A spotlight, such as a reflector spotlight or a lantern.
#desc A Spotlight is a type of [Light3D] node that emits lights in a specific direction, in the shape of a cone. The light is attenuated through the distance. This attenuation can be configured by changing the energy, radius and attenuation parameters of [Light3D].
#desc [b]Note:[/b] When using the Mobile rendering method, only 8 spot lights can be displayed on each mesh resource. Attempting to display more than 8 spot lights on a single mesh resource will result in spot lights flickering in and out as the camera moves. When using the Compatibility rendering method, only 8 spot lights can be displayed on each mesh resource by default, but this can be increased by adjusting [member ProjectSettings.rendering/limits/opengl/max_lights_per_object].
#desc [b]Note:[/b] When using the Mobile or Compatibility rendering methods, spot lights will only correctly affect meshes whose visibility AABB intersects with the light's AABB. If using a shader to deform the mesh in a way that makes it go outside its AABB, [member GeometryInstance3D.extra_cull_margin] must be increased on the mesh. Otherwise, the light may not be visible on the mesh.
#tutorial [3D lights and shadows] https://docs.godotengine.org/en/stable/tutorials/3d/lights_and_shadows.html
#tutorial [Third Person Shooter Demo] https://godotengine.org/asset-library/asset/678
class_name SpotLight3D


var shadow_bias: float:
	get = get_param, set = set_param

var shadow_normal_bias: float:
	get = get_param, set = set_param

#desc The spotlight's angle in degrees.
#desc [b]Note:[/b] [member spot_angle] is not affected by [member Node3D.scale] (the light's scale or its parent's scale).
var spot_angle: float:
	get = get_param, set = set_param

#desc The spotlight's [i]angular[/i] attenuation curve. See also [member spot_attenuation].
var spot_angle_attenuation: float:
	get = get_param, set = set_param

#desc The spotlight's light energy (drop-off) attenuation curve. A number of presets are available in the [b]Inspector[/b] by right-clicking the curve. Zero and negative values are allowed but can produce unusual effects. See also [member spot_angle_attenuation].
#desc [b]Note:[/b] Very high [member spot_attenuation] values (typically above 10) can impact performance negatively if the light is made to use a larger [member spot_range] to compensate. This is because culling opportunities will become less common and shading costs will be increased (as the light will cover more pixels on screen while resulting in the same amount of brightness). To improve performance, use the lowest [member spot_attenuation] value possible for the visuals you're trying to achieve.
var spot_attenuation: float:
	get = get_param, set = set_param

#desc The maximal range that can be reached by the spotlight. Note that the effectively lit area may appear to be smaller depending on the [member spot_attenuation] in use. No matter the [member spot_attenuation] in use, the light will never reach anything outside this range.
#desc [b]Note:[/b] [member spot_range] is not affected by [member Node3D.scale] (the light's scale or its parent's scale).
var spot_range: float:
	get = get_param, set = set_param




func get_param() -> float:
	return shadow_bias

func set_param(value: float) -> void:
	shadow_bias = value

func get_param() -> float:
	return shadow_normal_bias

func set_param(value: float) -> void:
	shadow_normal_bias = value

func get_param() -> float:
	return spot_angle

func set_param(value: float) -> void:
	spot_angle = value

func get_param() -> float:
	return spot_angle_attenuation

func set_param(value: float) -> void:
	spot_angle_attenuation = value

func get_param() -> float:
	return spot_attenuation

func set_param(value: float) -> void:
	spot_attenuation = value

func get_param() -> float:
	return spot_range

func set_param(value: float) -> void:
	spot_range = value

