extends CameraAttributes
#brief Camera settings in an easy to use format.
#desc Controls camera-specific attributes such as auto-exposure, depth of field, and exposure override.
#desc When used in a [WorldEnvironment] it provides default settings for exposure, auto-exposure, and depth of field that will be used by all cameras without their own [CameraAttributes], including the editor camera. When used in a [Camera3D] it will override any [CameraAttributes] set in the [WorldEnvironment]. When used in [VoxelGI] or [LightmapGI], only the exposure settings will be used.
class_name CameraAttributesPractical


#desc The maximum sensitivity (in ISO) used when calculating auto exposure. When calculating scene average luminance, color values will be clamped to at least this value. This limits the auto-exposure from exposing below a certain brightness, resulting in a cut off point where the scene will remain bright.
var auto_exposure_max_sensitivity: float:
	get = get_auto_exposure_max_sensitivity, set = set_auto_exposure_max_sensitivity

#desc The minimum sensitivity (in ISO) used when calculating auto exposure. When calculating scene average luminance, color values will be clamped to at least this value. This limits the auto-exposure from exposing above a certain brightness, resulting in a cut off point where the scene will remain dark.
var auto_exposure_min_sensitivity: float:
	get = get_auto_exposure_min_sensitivity, set = set_auto_exposure_min_sensitivity

#desc Sets the maximum amount of blur. When using physically-based blur amounts, will instead act as a multiplier. High values lead to an increased amount of bluriness, but can be much more expensive to calculate. It is best to keep this as low as possible for a given art style.
var dof_blur_amount: float:
	get = get_dof_blur_amount, set = set_dof_blur_amount

#desc Objects further from the [Camera3D] by this amount will be blurred by the depth of field effect. Measured in meters.
var dof_blur_far_distance: float:
	get = get_dof_blur_far_distance, set = set_dof_blur_far_distance

#desc Enables depth of field blur for objects further than [member dof_blur_far_distance]. Strength of blur is controlled by [member dof_blur_amount] and modulated by [member dof_blur_far_transition].
#desc [b]Note:[/b] Depth of field blur is only supported in the Forward+ and Mobile rendering methods, not Compatibility.
var dof_blur_far_enabled: bool:
	get = is_dof_blur_far_enabled, set = set_dof_blur_far_enabled

#desc When positive, distance over which (starting from [member dof_blur_far_distance]) blur effect will scale from 0 to [member dof_blur_amount]. When negative, uses physically-based scaling so depth of field effect will scale from 0 at [member dof_blur_far_distance] and will increase in a physically accurate way as objects get further from the [Camera3D].
var dof_blur_far_transition: float:
	get = get_dof_blur_far_transition, set = set_dof_blur_far_transition

#desc Objects closer from the [Camera3D] by this amount will be blurred by the depth of field effect. Measured in meters.
var dof_blur_near_distance: float:
	get = get_dof_blur_near_distance, set = set_dof_blur_near_distance

#desc Enables depth of field blur for objects closer than [member dof_blur_near_distance]. Strength of blur is controlled by [member dof_blur_amount] and modulated by [member dof_blur_near_transition].
#desc [b]Note:[/b] Depth of field blur is only supported in the Forward+ and Mobile rendering methods, not Compatibility.
var dof_blur_near_enabled: bool:
	get = is_dof_blur_near_enabled, set = set_dof_blur_near_enabled

#desc When positive, distance over which blur effect will scale from 0 to [member dof_blur_amount], ending at [member dof_blur_near_distance]. When negative, uses physically-based scaling so depth of field effect will scale from 0 at [member dof_blur_near_distance] and will increase in a physically accurate way as objects get closer to the [Camera3D].
var dof_blur_near_transition: float:
	get = get_dof_blur_near_transition, set = set_dof_blur_near_transition




func get_auto_exposure_max_sensitivity() -> float:
	return auto_exposure_max_sensitivity

func set_auto_exposure_max_sensitivity(value: float) -> void:
	auto_exposure_max_sensitivity = value

func get_auto_exposure_min_sensitivity() -> float:
	return auto_exposure_min_sensitivity

func set_auto_exposure_min_sensitivity(value: float) -> void:
	auto_exposure_min_sensitivity = value

func get_dof_blur_amount() -> float:
	return dof_blur_amount

func set_dof_blur_amount(value: float) -> void:
	dof_blur_amount = value

func get_dof_blur_far_distance() -> float:
	return dof_blur_far_distance

func set_dof_blur_far_distance(value: float) -> void:
	dof_blur_far_distance = value

func is_dof_blur_far_enabled() -> bool:
	return dof_blur_far_enabled

func set_dof_blur_far_enabled(value: bool) -> void:
	dof_blur_far_enabled = value

func get_dof_blur_far_transition() -> float:
	return dof_blur_far_transition

func set_dof_blur_far_transition(value: float) -> void:
	dof_blur_far_transition = value

func get_dof_blur_near_distance() -> float:
	return dof_blur_near_distance

func set_dof_blur_near_distance(value: float) -> void:
	dof_blur_near_distance = value

func is_dof_blur_near_enabled() -> bool:
	return dof_blur_near_enabled

func set_dof_blur_near_enabled(value: bool) -> void:
	dof_blur_near_enabled = value

func get_dof_blur_near_transition() -> float:
	return dof_blur_near_transition

func set_dof_blur_near_transition(value: float) -> void:
	dof_blur_near_transition = value

