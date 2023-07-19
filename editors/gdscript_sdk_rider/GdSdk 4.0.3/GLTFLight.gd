extends Resource
#brief Represents a GLTF light.
#desc Represents a light as defined by the [code]KHR_lights_punctual[/code] GLTF extension.
#tutorial [KHR_lights_punctual GLTF extension spec] https://github.com/KhronosGroup/glTF/blob/main/extensions/2.0/Khronos/KHR_lights_punctual
class_name GLTFLight


#desc The [Color] of the light. Defaults to white. A black color causes the light to have no effect.
var color: Color:
	get = get_color, set = set_color

#desc The inner angle of the cone in a spotlight. Must be less than or equal to the outer cone angle.
#desc Within this angle, the light is at full brightness. Between the inner and outer cone angles, there is a transition from full brightness to zero brightness. When creating a Godot [SpotLight3D], the ratio between the inner and outer cone angles is used to calculate the attenuation of the light.
var inner_cone_angle: float:
	get = get_inner_cone_angle, set = set_inner_cone_angle

#desc The intensity of the light. This is expressed in candelas (lumens per steradian) for point and spot lights, and lux (lumens per m²) for directional lights. When creating a Godot light, this value is converted to a unitless multiplier.
var intensity: float:
	get = get_intensity, set = set_intensity

#desc The type of the light. The values accepted by Godot are "point", "spot", and "directional", which correspond to Godot's [OmniLight3D], [SpotLight3D], and [DirectionalLight3D] respectively.
var light_type: String:
	get = get_light_type, set = set_light_type

#desc The outer angle of the cone in a spotlight. Must be greater than or equal to the inner angle.
#desc At this angle, the light drops off to zero brightness. Between the inner and outer cone angles, there is a transition from full brightness to zero brightness. If this angle is a half turn, then the spotlight emits in all directions. When creating a Godot [SpotLight3D], the outer cone angle is used as the angle of the spotlight.
var outer_cone_angle: float:
	get = get_outer_cone_angle, set = set_outer_cone_angle

#desc The range of the light, beyond which the light has no effect. GLTF lights with no range defined behave like physical lights (which have infinite range). When creating a Godot light, the range is clamped to 4096.
var range: float:
	get = get_range, set = set_range



#desc Creates a new GLTFLight instance by parsing the given [Dictionary].
static func from_dictionary(dictionary: Dictionary) -> GLTFLight:
	pass;

#desc Create a new GLTFLight instance from the given Godot [Light3D] node.
static func from_node(light_node: Light3D) -> GLTFLight:
	pass;

#desc Serializes this GLTFLight instance into a [Dictionary].
func to_dictionary() -> Dictionary:
	pass;

#desc Converts this GLTFLight instance into a Godot [Light3D] node.
func to_node() -> Light3D:
	pass;


func get_color() -> Color:
	return color

func set_color(value: Color) -> void:
	color = value

func get_inner_cone_angle() -> float:
	return inner_cone_angle

func set_inner_cone_angle(value: float) -> void:
	inner_cone_angle = value

func get_intensity() -> float:
	return intensity

func set_intensity(value: float) -> void:
	intensity = value

func get_light_type() -> String:
	return light_type

func set_light_type(value: String) -> void:
	light_type = value

func get_outer_cone_angle() -> float:
	return outer_cone_angle

func set_outer_cone_angle(value: float) -> void:
	outer_cone_angle = value

func get_range() -> float:
	return range

func set_range(value: float) -> void:
	range = value

