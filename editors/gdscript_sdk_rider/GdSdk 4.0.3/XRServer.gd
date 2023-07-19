extends Object
#brief Server for AR and VR features.
#desc The AR/VR server is the heart of our Advanced and Virtual Reality solution and handles all the processing.
#tutorial [XR documentation index] https://docs.godotengine.org/en/stable/tutorials/xr/index.html
class_name XRServer

#desc Emitted when a new interface has been added.
signal interface_added(interface_name: StringName)
#desc Emitted when an interface is removed.
signal interface_removed(interface_name: StringName)
#desc Emitted when a new tracker has been added. If you don't use a fixed number of controllers or if you're using [XRAnchor3D]s for an AR solution, it is important to react to this signal to add the appropriate [XRController3D] or [XRAnchor3D] nodes related to this new tracker.
signal tracker_added(tracker_name: StringName, type: int)
#desc Emitted when a tracker is removed. You should remove any [XRController3D] or [XRAnchor3D] points if applicable. This is not mandatory, the nodes simply become inactive and will be made active again when a new tracker becomes available (i.e. a new controller is switched on that takes the place of the previous one).
signal tracker_removed(tracker_name: StringName, type: int)
#desc Emitted when an existing tracker has been updated. This can happen if the user switches controllers.
signal tracker_updated(tracker_name: StringName, type: int)
#desc The tracker tracks the location of the players head. This is usually a location centered between the players eyes. Note that for handheld AR devices this can be the current location of the device.
#desc The tracker tracks the location of a controller.
#desc The tracker tracks the location of a base station.
#desc The tracker tracks the location and size of an AR anchor.
#desc Used internally to filter trackers of any known type.
#desc Used internally if we haven't set the tracker type yet.
#desc Used internally to select all trackers.
#desc Fully reset the orientation of the HMD. Regardless of what direction the user is looking to in the real world. The user will look dead ahead in the virtual world.
#desc Resets the orientation but keeps the tilt of the device. So if we're looking down, we keep looking down but heading will be reset.
#desc Does not reset the orientation of the HMD, only the position of the player gets centered.

#enum TrackerType
enum {
    TRACKER_HEAD = 1,
    TRACKER_CONTROLLER = 2,
    TRACKER_BASESTATION = 4,
    TRACKER_ANCHOR = 8,
    TRACKER_ANY_KNOWN = 127,
    TRACKER_UNKNOWN = 128,
    TRACKER_ANY = 255,
}
#enum RotationMode
enum {
    RESET_FULL_ROTATION = 0,
    RESET_BUT_KEEP_TILT = 1,
    DONT_RESET_ROTATION = 2,
}
#desc The primary [XRInterface] currently bound to the [XRServer].
var primary_interface: XRInterface:
	get = get_primary_interface, set = set_primary_interface

#desc The current origin of our tracking space in the virtual world. This is used by the renderer to properly position the camera with new tracking data.
#desc [b]Note:[/b] This property is managed by the current [XROrigin3D] node. It is exposed for access from GDExtensions.
var world_origin: Transform3D:
	get = get_world_origin, set = set_world_origin

#desc Allows you to adjust the scale to your game's units. Most AR/VR platforms assume a scale of 1 game world unit = 1 real world meter.
var world_scale: float:
	get = get_world_scale, set = set_world_scale



#desc Registers an [XRInterface] object.
func add_interface(interface: XRInterface) -> void:
	pass;

#desc Registers a new [XRPositionalTracker] that tracks a spatial location in real space.
func add_tracker(tracker: XRPositionalTracker) -> void:
	pass;

#desc This is an important function to understand correctly. AR and VR platforms all handle positioning slightly differently.
#desc For platforms that do not offer spatial tracking, our origin point (0, 0, 0) is the location of our HMD, but you have little control over the direction the player is facing in the real world.
#desc For platforms that do offer spatial tracking, our origin point depends very much on the system. For OpenVR, our origin point is usually the center of the tracking space, on the ground. For other platforms, it's often the location of the tracking camera.
#desc This method allows you to center your tracker on the location of the HMD. It will take the current location of the HMD and use that to adjust all your tracking data; in essence, realigning the real world to your player's current position in the game world.
#desc For this method to produce usable results, tracking information must be available. This often takes a few frames after starting your game.
#desc You should call this method after a few seconds have passed. For example, when the user requests a realignment of the display holding a designated button on a controller for a short period of time, or when implementing a teleport mechanism.
func center_on_hmd(rotation_mode: int, keep_height: bool) -> void:
	pass;

#desc Finds an interface by its [param name]. For example, if your project uses capabilities of an AR/VR platform, you can find the interface for that platform by name and initialize it.
func find_interface(name: String) -> XRInterface:
	pass;

#desc Returns the primary interface's transformation.
func get_hmd_transform() -> Transform3D:
	pass;

#desc Returns the interface registered at the given [param idx] index in the list of interfaces.
func get_interface(idx: int) -> XRInterface:
	pass;

#desc Returns the number of interfaces currently registered with the AR/VR server. If your project supports multiple AR/VR platforms, you can look through the available interface, and either present the user with a selection or simply try to initialize each interface and use the first one that returns [code]true[/code].
func get_interface_count() -> int:
	pass;

#desc Returns a list of available interfaces the ID and name of each interface.
func get_interfaces() -> Array[Dictionary]:
	pass;

#desc Returns the reference frame transform. Mostly used internally and exposed for GDExtension build interfaces.
func get_reference_frame() -> Transform3D:
	pass;

#desc Returns the positional tracker with the given [param tracker_name].
func get_tracker(tracker_name: StringName) -> XRPositionalTracker:
	pass;

#desc Returns a dictionary of trackers for [param tracker_types].
func get_trackers(tracker_types: int) -> Dictionary:
	pass;

#desc Removes this [param interface].
func remove_interface(interface: XRInterface) -> void:
	pass;

#desc Removes this positional [param tracker].
func remove_tracker(tracker: XRPositionalTracker) -> void:
	pass;


func get_primary_interface() -> XRInterface:
	return primary_interface

func set_primary_interface(value: XRInterface) -> void:
	primary_interface = value

func get_world_origin() -> Transform3D:
	return world_origin

func set_world_origin(value: Transform3D) -> void:
	world_origin = value

func get_world_scale() -> float:
	return world_scale

func set_world_scale(value: float) -> void:
	world_scale = value

