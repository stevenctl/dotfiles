extends RefCounted
#brief Base class for an XR interface implementation.
#desc This class needs to be implemented to make an AR or VR platform available to Godot and these should be implemented as C++ modules or GDExtension modules. Part of the interface is exposed to GDScript so you can detect, enable and configure an AR or VR platform.
#desc Interfaces should be written in such a way that simply enabling them will give us a working setup. You can query the available interfaces through [XRServer].
#tutorial [XR documentation index] https://docs.godotengine.org/en/stable/tutorials/xr/index.html
class_name XRInterface

#desc Emitted when the play area is changed. This can be a result of the player resetting the boundary or entering a new play area, the player changing the play area mode, the world scale changing or the player resetting their headset orientation.
signal play_area_changed(mode: int)
#desc No XR capabilities.
#desc This interface can work with normal rendering output (non-HMD based AR).
#desc This interface supports stereoscopic rendering.
#desc This interface supports quad rendering (not yet supported by Godot).
#desc This interface supports VR.
#desc This interface supports AR (video background and real world tracking).
#desc This interface outputs to an external device. If the main viewport is used, the on screen output is an unmodified buffer of either the left or right eye (stretched if the viewport size is not changed to the same aspect ratio of [method get_render_target_size]). Using a separate viewport node frees up the main viewport for other purposes.
#desc Tracking is behaving as expected.
#desc Tracking is hindered by excessive motion (the player is moving faster than tracking can keep up).
#desc Tracking is hindered by insufficient features, it's too dark (for camera-based tracking), player is blocked, etc.
#desc We don't know the status of the tracking or this interface does not provide feedback.
#desc Tracking is not functional (camera not plugged in or obscured, lighthouses turned off, etc.).
#desc Play area mode not set or not available.
#desc Play area only supports orientation tracking, no positional tracking, area will center around player.
#desc Player is in seated position, limited positional tracking, fixed guardian around player.
#desc Player is free to move around, full positional tracking.
#desc Same as [constant XR_PLAY_AREA_ROOMSCALE] but origin point is fixed to the center of the physical space, [method XRServer.center_on_hmd] disabled.
#desc Opaque blend mode. This is typically used for VR devices.
#desc Additive blend mode. This is typically used for AR devices or VR devices with passthrough.
#desc Alpha blend mode. This is typically used for AR or VR devices with passthrough capabilities. The alpha channel controls how much of the passthrough is visible. Alpha of 0.0 means the passthrough is visible and this pixel works in ADDITIVE mode. Alpha of 1.0 means that the passthrough is not visible and this pixel works in OPAQUE mode.

#enum Capabilities
enum {
    XR_NONE = 0,
    XR_MONO = 1,
    XR_STEREO = 2,
    XR_QUAD = 4,
    XR_VR = 8,
    XR_AR = 16,
    XR_EXTERNAL = 32,
}
#enum TrackingStatus
enum {
    XR_NORMAL_TRACKING = 0,
    XR_EXCESSIVE_MOTION = 1,
    XR_INSUFFICIENT_FEATURES = 2,
    XR_UNKNOWN_TRACKING = 3,
    XR_NOT_TRACKING = 4,
}
#enum PlayAreaMode
enum {
    XR_PLAY_AREA_UNKNOWN = 0,
    XR_PLAY_AREA_3DOF = 1,
    XR_PLAY_AREA_SITTING = 2,
    XR_PLAY_AREA_ROOMSCALE = 3,
    XR_PLAY_AREA_STAGE = 4,
}
#enum EnvironmentBlendMode
enum {
    XR_ENV_BLEND_MODE_OPAQUE = 0,
    XR_ENV_BLEND_MODE_ADDITIVE = 1,
    XR_ENV_BLEND_MODE_ALPHA_BLEND = 2,
}
#desc On an AR interface, [code]true[/code] if anchor detection is enabled.
var ar_is_anchor_detection_enabled: bool:
	get = get_anchor_detection_is_enabled, set = set_anchor_detection_is_enabled

#desc [code]true[/code] if this is the primary interface.
var interface_is_primary: bool:
	get = is_primary, set = set_primary

#desc The play area mode for this interface.
var xr_play_area_mode: int:
	get = get_play_area_mode, set = set_play_area_mode



#desc If this is an AR interface that requires displaying a camera feed as the background, this method returns the feed ID in the [CameraServer] for this interface.
func get_camera_feed_id() -> int:
	pass;

#desc Returns a combination of [enum Capabilities] flags providing information about the capabilities of this interface.
func get_capabilities() -> int:
	pass;

#desc Returns the name of this interface (OpenXR, OpenVR, OpenHMD, ARKit, etc).
func get_name() -> StringName:
	pass;

#desc Returns an array of vectors that denotes the physical play area mapped to the virtual space around the [XROrigin3D] point. The points form a convex polygon that can be used to react to or visualize the play area. This returns an empty array if this feature is not supported or if the information is not yet available.
func get_play_area() -> PackedVector3Array:
	pass;

#desc Returns the projection matrix for a view/eye.
func get_projection_for_view(view: int, aspect: float, near: float, far: float) -> Projection:
	pass;

#desc Returns the resolution at which we should render our intermediate results before things like lens distortion are applied by the VR platform.
func get_render_target_size() -> Vector2:
	pass;

#desc Returns the an array of supported environment blend modes, see [enum XRInterface.EnvironmentBlendMode].
func get_supported_environment_blend_modes() -> Array:
	pass;

#desc If supported, returns the status of our tracking. This will allow you to provide feedback to the user whether there are issues with positional tracking.
func get_tracking_status() -> int:
	pass;

#desc Returns the transform for a view/eye.
#desc [param view] is the view/eye index.
#desc [param cam_transform] is the transform that maps device coordinates to scene coordinates, typically the [member Node3D.global_transform] of the current XROrigin3D.
func get_transform_for_view(view: int, cam_transform: Transform3D) -> Transform3D:
	pass;

#desc Returns the number of views that need to be rendered for this device. 1 for Monoscopic, 2 for Stereoscopic.
func get_view_count() -> int:
	pass;

#desc Call this to initialize this interface. The first interface that is initialized is identified as the primary interface and it will be used for rendering output.
#desc After initializing the interface you want to use you then need to enable the AR/VR mode of a viewport and rendering should commence.
#desc [b]Note:[/b] You must enable the XR mode on the main viewport for any device that uses the main output of Godot, such as for mobile VR.
#desc If you do this for a platform that handles its own output (such as OpenVR) Godot will show just one eye without distortion on screen. Alternatively, you can add a separate viewport node to your scene and enable AR/VR on that viewport. It will be used to output to the HMD, leaving you free to do anything you like in the main window, such as using a separate camera as a spectator camera or rendering something completely different.
#desc While currently not used, you can activate additional interfaces. You may wish to do this if you want to track controllers from other platforms. However, at this point in time only one interface can render to an HMD.
func initialize() -> bool:
	pass;

#desc Is [code]true[/code] if this interface has been initialized.
func is_initialized() -> bool:
	pass;

#desc Is [code]true[/code] if passthrough is enabled.
func is_passthrough_enabled() -> bool:
	pass;

#desc Is [code]true[/code] if this interface supports passthrough.
func is_passthrough_supported() -> bool:
	pass;

#desc Sets the active environment blend mode.
#desc [param mode] is the [enum XRInterface.EnvironmentBlendMode] starting with the next frame.
#desc [b]Note:[/b] Not all runtimes support all environment blend modes, so it is important to check this at startup. For example:
#desc [codeblock]
#desc func _ready():
#desc var xr_interface: XRInterface = XRServer.find_interface("OpenXR")
#desc if xr_interface and xr_interface.is_initialized():
#desc var vp: Viewport = get_viewport()
#desc vp.use_xr = true
#desc var acceptable_modes = [ XRInterface.XR_ENV_BLEND_MODE_OPAQUE, XRInterface.XR_ENV_BLEND_MODE_ADDITIVE ]
#desc var modes = xr_interface.get_supported_environment_blend_modes()
#desc for mode in acceptable_modes:
#desc if mode in modes:
#desc xr_interface.set_environment_blend_mode(mode)
#desc break
#desc [/codeblock]
func set_environment_blend_mode(mode: int) -> bool:
	pass;

#desc Sets the active play area mode, will return [code]false[/code] if the mode can't be used with this interface.
func set_play_area_mode(mode: int) -> bool:
	pass;

#desc Starts passthrough, will return [code]false[/code] if passthrough couldn't be started.
#desc [b]Note:[/b] The viewport used for XR must have a transparent background, otherwise passthrough may not properly render.
func start_passthrough() -> bool:
	pass;

#desc Stops passthrough.
func stop_passthrough() -> void:
	pass;

#desc Call this to find out if a given play area mode is supported by this interface.
func supports_play_area_mode(mode: int) -> bool:
	pass;

#desc Triggers a haptic pulse on a device associated with this interface.
#desc [param action_name] is the name of the action for this pulse.
#desc [param tracker_name] is optional and can be used to direct the pulse to a specific device provided that device is bound to this haptic.
func trigger_haptic_pulse(action_name: String, tracker_name: StringName, frequency: float, amplitude: float, duration_sec: float, delay_sec: float) -> void:
	pass;

#desc Turns the interface off.
func uninitialize() -> void:
	pass;


func get_anchor_detection_is_enabled() -> bool:
	return ar_is_anchor_detection_enabled

func set_anchor_detection_is_enabled(value: bool) -> void:
	ar_is_anchor_detection_enabled = value

func is_primary() -> bool:
	return interface_is_primary

func set_primary(value: bool) -> void:
	interface_is_primary = value

func get_play_area_mode() -> int:
	return xr_play_area_mode

func set_play_area_mode(value: int) -> void:
	xr_play_area_mode = value

