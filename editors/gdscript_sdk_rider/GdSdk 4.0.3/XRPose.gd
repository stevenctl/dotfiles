extends RefCounted
#brief This object contains all data related to a pose on a tracked object.
#desc XR runtimes often identify multiple locations on devices such as controllers that are spatially tracked.
#desc Orientation, location, linear velocity and angular velocity are all provided for each pose by the XR runtime. This object contains this state of a pose.
class_name XRPose

#desc No tracking information is available for this pose.
#desc Tracking information may be inaccurate or estimated. For example, with inside out tracking this would indicate a controller may be (partially) obscured.
#desc Tracking information is deemed accurate and up to date.

#enum TrackingConfidence
enum {
    XR_TRACKING_CONFIDENCE_NONE = 0,
    XR_TRACKING_CONFIDENCE_LOW = 1,
    XR_TRACKING_CONFIDENCE_HIGH = 2,
}
#desc The angular velocity for this pose.
var angular_velocity: Vector3:
	get = get_angular_velocity, set = set_angular_velocity

#desc If [code]true[/code] our tracking data is up to date. If [code]false[/code] we're no longer receiving new tracking data and our state is whatever that last valid state was.
var has_tracking_data: bool:
	get = get_has_tracking_data, set = set_has_tracking_data

#desc The linear velocity of this pose.
var linear_velocity: Vector3:
	get = get_linear_velocity, set = set_linear_velocity

#desc The name of this pose. Pose names are often driven by an action map setup by the user. Godot does suggest a number of pose names that it expects [XRInterface]s to implement:
#desc - [code]root[/code] defines a root location, often used for tracked objects that do not have further nodes.
#desc - [code]aim[/code] defines the tip of a controller with the orientation pointing outwards, for example: add your raycasts to this.
#desc - [code]grip[/code] defines the location where the user grips the controller
#desc - [code]skeleton[/code] defines the root location a hand mesh should be placed when using hand tracking and the animated skeleton supplied by the XR runtime.
var name: StringName:
	get = get_name, set = set_name

#desc The tracking confidence for this pose, provides insight on how accurate the spatial positioning of this record is.
var tracking_confidence: int:
	get = get_tracking_confidence, set = set_tracking_confidence

#desc The transform containing the original and transform as reported by the XR runtime.
var transform: Transform3D:
	get = get_transform, set = set_transform



#desc Returns the [member transform] with world scale and our reference frame applied. This is the transform used to position [XRNode3D] objects.
func get_adjusted_transform() -> Transform3D:
	pass;


func get_angular_velocity() -> Vector3:
	return angular_velocity

func set_angular_velocity(value: Vector3) -> void:
	angular_velocity = value

func get_has_tracking_data() -> bool:
	return has_tracking_data

func set_has_tracking_data(value: bool) -> void:
	has_tracking_data = value

func get_linear_velocity() -> Vector3:
	return linear_velocity

func set_linear_velocity(value: Vector3) -> void:
	linear_velocity = value

func get_name() -> StringName:
	return name

func set_name(value: StringName) -> void:
	name = value

func get_tracking_confidence() -> int:
	return tracking_confidence

func set_tracking_confidence(value: int) -> void:
	tracking_confidence = value

func get_transform() -> Transform3D:
	return transform

func set_transform(value: Transform3D) -> void:
	transform = value

