extends CameraAttributes
#brief Physically-based camera settings.
#desc [CameraAttributesPhysical] is used to set rendering settings based on a physically-based camera's settings. It is responsible for exposure, auto-exposure, and depth of field.
#desc When used in a [WorldEnvironment] it provides default settings for exposure, auto-exposure, and depth of field that will be used by all cameras without their own [CameraAttributes], including the editor camera. When used in a [Camera3D] it will override any [CameraAttributes] set in the [WorldEnvironment] and will override the [Camera3D]s [member Camera3D.far], [member Camera3D.near], [member Camera3D.fov], and [member Camera3D.keep_aspect] properties. When used in [VoxelGI] or [LightmapGI], only the exposure settings will be used.
#desc The default settings are intended for use in an outdoor environment, tips for settings for use in an indoor environment can be found in each setting's documentation.
#desc [b]Note:[/b] Depth of field blur is only supported in the Forward+ and Mobile rendering methods, not Compatibility.
class_name CameraAttributesPhysical


#desc The maximum luminance (in EV100) used when calculating auto exposure. When calculating scene average luminance, color values will be clamped to at least this value. This limits the auto-exposure from exposing below a certain brightness, resulting in a cut off point where the scene will remain bright.
var auto_exposure_max_exposure_value: float:
	get = get_auto_exposure_max_exposure_value, set = set_auto_exposure_max_exposure_value

#desc The minimum luminance luminance (in EV100) used when calculating auto exposure. When calculating scene average luminance, color values will be clamped to at least this value. This limits the auto-exposure from exposing above a certain brightness, resulting in a cut off point where the scene will remain dark.
var auto_exposure_min_exposure_value: float:
	get = get_auto_exposure_min_exposure_value, set = set_auto_exposure_min_exposure_value

#desc Size of the aperture of the camera, measured in f-stops. An f-stop is a unitless ratio between the focal length of the camera and the diameter of the aperture. A high aperture setting will result in a smaller aperture which leads to a dimmer image and sharper focus. A low aperture results in a wide aperture which lets in more light resulting in a brighter, less-focused image. Default is appropriate for outdoors at daytime (i.e. for use with a default [DirectionalLight3D]), for indoor lighting, a value between 2 and 4 is more appropriate.
#desc Only available when [member ProjectSettings.rendering/lights_and_shadows/use_physical_light_units] is enabled.
var exposure_aperture: float:
	get = get_aperture, set = set_aperture

#desc Time for shutter to open and close, measured in seconds. A higher value will let in more light leading to a brighter image, while a lower amount will let in less light leading to a darker image.
#desc Only available when [member ProjectSettings.rendering/lights_and_shadows/use_physical_light_units] is enabled.
var exposure_shutter_speed: float:
	get = get_shutter_speed, set = set_shutter_speed

#desc Override value for [member Camera3D.far]. Used internally when calculating depth of field. When attached to a [Camera3D] as its [member Camera3D.attributes], it will override the [member Camera3D.far] property.
var frustum_far: float:
	get = get_far, set = set_far

#desc Distance between camera lens and camera aperture, measured in millimeters. Controls field of view and depth of field. A larger focal length will result in a smaller field of view and a narrower depth of field meaning fewer objects will be in focus. A smaller focal length will result in a wider field of view and a larger depth of field meaning more objects will be in focus. When attached to a [Camera3D] as its [member Camera3D.attributes], it will override the [member Camera3D.fov] property and the [member Camera3D.keep_aspect] property.
var frustum_focal_length: float:
	get = get_focal_length, set = set_focal_length

#desc Distance from camera of object that will be in focus, measured in meters. Internally this will be clamped to be at least 1 millimeter larger than [member frustum_focal_length].
var frustum_focus_distance: float:
	get = get_focus_distance, set = set_focus_distance

#desc Override value for [member Camera3D.near]. Used internally when calculating depth of field. When attached to a [Camera3D] as its [member Camera3D.attributes], it will override the [member Camera3D.near] property.
var frustum_near: float:
	get = get_near, set = set_near



#desc Returns the vertical field of view that corresponds to the [member frustum_focal_length]. This value is calculated internally whenever [member frustum_focal_length] is changed.
func get_fov() -> float:
	pass;


func get_auto_exposure_max_exposure_value() -> float:
	return auto_exposure_max_exposure_value

func set_auto_exposure_max_exposure_value(value: float) -> void:
	auto_exposure_max_exposure_value = value

func get_auto_exposure_min_exposure_value() -> float:
	return auto_exposure_min_exposure_value

func set_auto_exposure_min_exposure_value(value: float) -> void:
	auto_exposure_min_exposure_value = value

func get_aperture() -> float:
	return exposure_aperture

func set_aperture(value: float) -> void:
	exposure_aperture = value

func get_shutter_speed() -> float:
	return exposure_shutter_speed

func set_shutter_speed(value: float) -> void:
	exposure_shutter_speed = value

func get_far() -> float:
	return frustum_far

func set_far(value: float) -> void:
	frustum_far = value

func get_focal_length() -> float:
	return frustum_focal_length

func set_focal_length(value: float) -> void:
	frustum_focal_length = value

func get_focus_distance() -> float:
	return frustum_focus_distance

func set_focus_distance(value: float) -> void:
	frustum_focus_distance = value

func get_near() -> float:
	return frustum_near

func set_near(value: float) -> void:
	frustum_near = value

