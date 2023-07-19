extends Texture2D
#brief Texture provided by a [CameraFeed].
#desc This texture gives access to the camera texture provided by a [CameraFeed].
#desc [b]Note:[/b] Many cameras supply YCbCr images which need to be converted in a shader.
class_name CameraTexture


#desc The ID of the [CameraFeed] for which we want to display the image.
var camera_feed_id: int:
	get = get_camera_feed_id, set = set_camera_feed_id

#desc Convenience property that gives access to the active property of the [CameraFeed].
var camera_is_active: bool:
	get = get_camera_active, set = set_camera_active

var resource_local_to_scene: bool:
	get = is_local_to_scene, set = set_local_to_scene

#desc Which image within the [CameraFeed] we want access to, important if the camera image is split in a Y and CbCr component.
var which_feed: int:
	get = get_which_feed, set = set_which_feed




func get_camera_feed_id() -> int:
	return camera_feed_id

func set_camera_feed_id(value: int) -> void:
	camera_feed_id = value

func get_camera_active() -> bool:
	return camera_is_active

func set_camera_active(value: bool) -> void:
	camera_is_active = value

func is_local_to_scene() -> bool:
	return resource_local_to_scene

func set_local_to_scene(value: bool) -> void:
	resource_local_to_scene = value

func get_which_feed() -> int:
	return which_feed

func set_which_feed(value: int) -> void:
	which_feed = value

