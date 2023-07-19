extends RefCounted
#brief A camera feed gives you access to a single physical camera attached to your device.
#desc A camera feed gives you access to a single physical camera attached to your device. When enabled, Godot will start capturing frames from the camera which can then be used. See also [CameraServer].
#desc [b]Note:[/b] Many cameras will return YCbCr images which are split into two textures and need to be combined in a shader. Godot does this automatically for you if you set the environment to show the camera image in the background.
class_name CameraFeed

#desc No image set for the feed.
#desc Feed supplies RGB images.
#desc Feed supplies YCbCr images that need to be converted to RGB.
#desc Feed supplies separate Y and CbCr images that need to be combined and converted to RGB.
#desc Unspecified position.
#desc Camera is mounted at the front of the device.
#desc Camera is mounted at the back of the device.

#enum FeedDataType
enum {
    FEED_NOIMAGE = 0,
    FEED_RGB = 1,
    FEED_YCBCR = 2,
    FEED_YCBCR_SEP = 3,
}
#enum FeedPosition
enum {
    FEED_UNSPECIFIED = 0,
    FEED_FRONT = 1,
    FEED_BACK = 2,
}
#desc If [code]true[/code], the feed is active.
var feed_is_active: bool:
	get = is_active, set = set_active

#desc The transform applied to the camera's image.
var feed_transform: Transform2D:
	get = get_transform, set = set_transform



#desc Returns feed image data type.
func get_datatype() -> int:
	pass;

#desc Returns the unique ID for this feed.
func get_id() -> int:
	pass;

#desc Returns the camera's name.
func get_name() -> String:
	pass;

#desc Returns the position of camera on the device.
func get_position() -> int:
	pass;


func is_active() -> bool:
	return feed_is_active

func set_active(value: bool) -> void:
	feed_is_active = value

func get_transform() -> Transform2D:
	return feed_transform

func set_transform(value: Transform2D) -> void:
	feed_transform = value

