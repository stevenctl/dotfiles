extends Node3D
#brief Camera node, displays from a point of view.
#desc [Camera3D] is a special node that displays what is visible from its current location. Cameras register themselves in the nearest [Viewport] node (when ascending the tree). Only one camera can be active per viewport. If no viewport is available ascending the tree, the camera will register in the global viewport. In other words, a camera just provides 3D display capabilities to a [Viewport], and, without one, a scene registered in that [Viewport] (or higher viewports) can't be displayed.
#tutorial [Third Person Shooter Demo] https://godotengine.org/asset-library/asset/678
class_name Camera3D

#desc Perspective projection. Objects on the screen becomes smaller when they are far away.
#desc Orthogonal projection, also known as orthographic projection. Objects remain the same size on the screen no matter how far away they are.
#desc Frustum projection. This mode allows adjusting [member frustum_offset] to create "tilted frustum" effects.
#desc Preserves the horizontal aspect ratio; also known as Vert- scaling. This is usually the best option for projects running in portrait mode, as taller aspect ratios will benefit from a wider vertical FOV.
#desc Preserves the vertical aspect ratio; also known as Hor+ scaling. This is usually the best option for projects running in landscape mode, as wider aspect ratios will automatically benefit from a wider horizontal FOV.
#desc Disables [url=https://en.wikipedia.org/wiki/Doppler_effect]Doppler effect[/url] simulation (default).
#desc Simulate [url=https://en.wikipedia.org/wiki/Doppler_effect]Doppler effect[/url] by tracking positions of objects that are changed in [code]_process[/code]. Changes in the relative velocity of this camera compared to those objects affect how audio is perceived (changing the audio's [member AudioStreamPlayer3D.pitch_scale]).
#desc Simulate [url=https://en.wikipedia.org/wiki/Doppler_effect]Doppler effect[/url] by tracking positions of objects that are changed in [code]_physics_process[/code]. Changes in the relative velocity of this camera compared to those objects affect how audio is perceived (changing the audio's [member AudioStreamPlayer3D.pitch_scale]).

#enum ProjectionType
enum {
    PROJECTION_PERSPECTIVE = 0,
    PROJECTION_ORTHOGONAL = 1,
    PROJECTION_FRUSTUM = 2,
}
#enum KeepAspect
enum {
    KEEP_WIDTH = 0,
    KEEP_HEIGHT = 1,
}
#enum DopplerTracking
enum {
    DOPPLER_TRACKING_DISABLED = 0,
    DOPPLER_TRACKING_IDLE_STEP = 1,
    DOPPLER_TRACKING_PHYSICS_STEP = 2,
}
#desc The [CameraAttributes] to use for this camera.
var attributes: CameraAttributes:
	get = get_attributes, set = set_attributes

#desc The culling mask that describes which 3D render layers are rendered by this camera.
var cull_mask: int:
	get = get_cull_mask, set = set_cull_mask

#desc If [code]true[/code], the ancestor [Viewport] is currently using this camera.
#desc If multiple cameras are in the scene, one will always be made current. For example, if two [Camera3D] nodes are present in the scene and only one is current, setting one camera's [member current] to [code]false[/code] will cause the other camera to be made current.
var current: bool:
	get = is_current, set = set_current

#desc If not [constant DOPPLER_TRACKING_DISABLED], this camera will simulate the [url=https://en.wikipedia.org/wiki/Doppler_effect]Doppler effect[/url] for objects changed in particular [code]_process[/code] methods. See [enum DopplerTracking] for possible values.
var doppler_tracking: int:
	get = get_doppler_tracking, set = set_doppler_tracking

#desc The [Environment] to use for this camera.
var environment: Environment:
	get = get_environment, set = set_environment

#desc The distance to the far culling boundary for this camera relative to its local Z axis.
var far: float:
	get = get_far, set = set_far

#desc The camera's field of view angle (in degrees). Only applicable in perspective mode. Since [member keep_aspect] locks one axis, [code]fov[/code] sets the other axis' field of view angle.
#desc For reference, the default vertical field of view value ([code]75.0[/code]) is equivalent to a horizontal FOV of:
#desc - ~91.31 degrees in a 4:3 viewport
#desc - ~101.67 degrees in a 16:10 viewport
#desc - ~107.51 degrees in a 16:9 viewport
#desc - ~121.63 degrees in a 21:9 viewport
var fov: float:
	get = get_fov, set = set_fov

#desc The camera's frustum offset. This can be changed from the default to create "tilted frustum" effects such as [url=https://zdoom.org/wiki/Y-shearing]Y-shearing[/url].
#desc [b]Note:[/b] Only effective if [member projection] is [constant PROJECTION_FRUSTUM].
var frustum_offset: Vector2:
	get = get_frustum_offset, set = set_frustum_offset

#desc The horizontal (X) offset of the camera viewport.
var h_offset: float:
	get = get_h_offset, set = set_h_offset

#desc The axis to lock during [member fov]/[member size] adjustments. Can be either [constant KEEP_WIDTH] or [constant KEEP_HEIGHT].
var keep_aspect: int:
	get = get_keep_aspect_mode, set = set_keep_aspect_mode

#desc The distance to the near culling boundary for this camera relative to its local Z axis.
var near: float:
	get = get_near, set = set_near

#desc The camera's projection mode. In [constant PROJECTION_PERSPECTIVE] mode, objects' Z distance from the camera's local space scales their perceived size.
var projection: int:
	get = get_projection, set = set_projection

#desc The camera's size in meters measured as the diameter of the width or height, depending on [member keep_aspect]. Only applicable in orthogonal and frustum modes.
var size: float:
	get = get_size, set = set_size

#desc The vertical (Y) offset of the camera viewport.
var v_offset: float:
	get = get_v_offset, set = set_v_offset



#desc If this is the current camera, remove it from being current. If [param enable_next] is [code]true[/code], request to make the next camera current, if any.
func clear_current(enable_next: bool = true) -> void:
	pass;

#desc Returns the camera's RID from the [RenderingServer].
func get_camera_rid() -> RID:
	pass;

#desc Returns the transform of the camera plus the vertical ([member v_offset]) and horizontal ([member h_offset]) offsets; and any other adjustments made to the position and orientation of the camera by subclassed cameras such as [XRCamera3D].
func get_camera_transform() -> Transform3D:
	pass;

#desc Returns whether or not the specified layer of the [member cull_mask] is enabled, given a [param layer_number] between 1 and 20.
func get_cull_mask_value(layer_number: int) -> bool:
	pass;

#desc Returns the camera's frustum planes in world space units as an array of [Plane]s in the following order: near, far, left, top, right, bottom. Not to be confused with [member frustum_offset].
func get_frustum() -> Array[Plane]:
	pass;

#desc Returns the RID of a pyramid shape encompassing the camera's view frustum, ignoring the camera's near plane. The tip of the pyramid represents the position of the camera.
func get_pyramid_shape_rid() -> RID:
	pass;

#desc Returns [code]true[/code] if the given position is behind the camera (the blue part of the linked diagram). [url=https://raw.githubusercontent.com/godotengine/godot-docs/master/img/camera3d_position_frustum.png]See this diagram[/url] for an overview of position query methods.
#desc [b]Note:[/b] A position which returns [code]false[/code] may still be outside the camera's field of view.
func is_position_behind(world_point: Vector3) -> bool:
	pass;

#desc Returns [code]true[/code] if the given position is inside the camera's frustum (the green part of the linked diagram). [url=https://raw.githubusercontent.com/godotengine/godot-docs/master/img/camera3d_position_frustum.png]See this diagram[/url] for an overview of position query methods.
func is_position_in_frustum(world_point: Vector3) -> bool:
	pass;

#desc Makes this camera the current camera for the [Viewport] (see class description). If the camera node is outside the scene tree, it will attempt to become current once it's added.
func make_current() -> void:
	pass;

#desc Returns a normal vector from the screen point location directed along the camera. Orthogonal cameras are normalized. Perspective cameras account for perspective, screen width/height, etc.
func project_local_ray_normal(screen_point: Vector2) -> Vector3:
	pass;

#desc Returns the 3D point in world space that maps to the given 2D coordinate in the [Viewport] rectangle on a plane that is the given [param z_depth] distance into the scene away from the camera.
func project_position(screen_point: Vector2, z_depth: float) -> Vector3:
	pass;

#desc Returns a normal vector in world space, that is the result of projecting a point on the [Viewport] rectangle by the inverse camera projection. This is useful for casting rays in the form of (origin, normal) for object intersection or picking.
func project_ray_normal(screen_point: Vector2) -> Vector3:
	pass;

#desc Returns a 3D position in world space, that is the result of projecting a point on the [Viewport] rectangle by the inverse camera projection. This is useful for casting rays in the form of (origin, normal) for object intersection or picking.
func project_ray_origin(screen_point: Vector2) -> Vector3:
	pass;

#desc Based on [param value], enables or disables the specified layer in the [member cull_mask], given a [param layer_number] between 1 and 20.
func set_cull_mask_value(layer_number: int, value: bool) -> void:
	pass;

#desc Sets the camera projection to frustum mode (see [constant PROJECTION_FRUSTUM]), by specifying a [param size], an [param offset], and the [param z_near] and [param z_far] clip planes in world space units. See also [member frustum_offset].
func set_frustum(size: float, offset: Vector2, z_near: float, z_far: float) -> void:
	pass;

#desc Sets the camera projection to orthogonal mode (see [constant PROJECTION_ORTHOGONAL]), by specifying a [param size], and the [param z_near] and [param z_far] clip planes in world space units. (As a hint, 2D games often use this projection, with values specified in pixels.)
func set_orthogonal(size: float, z_near: float, z_far: float) -> void:
	pass;

#desc Sets the camera projection to perspective mode (see [constant PROJECTION_PERSPECTIVE]), by specifying a [param fov] (field of view) angle in degrees, and the [param z_near] and [param z_far] clip planes in world space units.
func set_perspective(fov: float, z_near: float, z_far: float) -> void:
	pass;

#desc Returns the 2D coordinate in the [Viewport] rectangle that maps to the given 3D point in world space.
#desc [b]Note:[/b] When using this to position GUI elements over a 3D viewport, use [method is_position_behind] to prevent them from appearing if the 3D point is behind the camera:
#desc [codeblock]
#desc # This code block is part of a script that inherits from Node3D.
#desc # `control` is a reference to a node inheriting from Control.
#desc control.visible = not get_viewport().get_camera_3d().is_position_behind(global_transform.origin)
#desc control.position = get_viewport().get_camera_3d().unproject_position(global_transform.origin)
#desc [/codeblock]
func unproject_position(world_point: Vector3) -> Vector2:
	pass;


func get_attributes() -> CameraAttributes:
	return attributes

func set_attributes(value: CameraAttributes) -> void:
	attributes = value

func get_cull_mask() -> int:
	return cull_mask

func set_cull_mask(value: int) -> void:
	cull_mask = value

func is_current() -> bool:
	return current

func set_current(value: bool) -> void:
	current = value

func get_doppler_tracking() -> int:
	return doppler_tracking

func set_doppler_tracking(value: int) -> void:
	doppler_tracking = value

func get_environment() -> Environment:
	return environment

func set_environment(value: Environment) -> void:
	environment = value

func get_far() -> float:
	return far

func set_far(value: float) -> void:
	far = value

func get_fov() -> float:
	return fov

func set_fov(value: float) -> void:
	fov = value

func get_frustum_offset() -> Vector2:
	return frustum_offset

func set_frustum_offset(value: Vector2) -> void:
	frustum_offset = value

func get_h_offset() -> float:
	return h_offset

func set_h_offset(value: float) -> void:
	h_offset = value

func get_keep_aspect_mode() -> int:
	return keep_aspect

func set_keep_aspect_mode(value: int) -> void:
	keep_aspect = value

func get_near() -> float:
	return near

func set_near(value: float) -> void:
	near = value

func get_projection() -> int:
	return projection

func set_projection(value: int) -> void:
	projection = value

func get_size() -> float:
	return size

func set_size(value: float) -> void:
	size = value

func get_v_offset() -> float:
	return v_offset

func set_v_offset(value: float) -> void:
	v_offset = value

