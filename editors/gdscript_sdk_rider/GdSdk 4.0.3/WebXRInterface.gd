extends XRInterface
#brief XR interface using WebXR.
#desc WebXR is an open standard that allows creating VR and AR applications that run in the web browser.
#desc As such, this interface is only available when running in Web exports.
#desc WebXR supports a wide range of devices, from the very capable (like Valve Index, HTC Vive, Oculus Rift and Quest) down to the much less capable (like Google Cardboard, Oculus Go, GearVR, or plain smartphones).
#desc Since WebXR is based on JavaScript, it makes extensive use of callbacks, which means that [WebXRInterface] is forced to use signals, where other XR interfaces would instead use functions that return a result immediately. This makes [WebXRInterface] quite a bit more complicated to initialize than other XR interfaces.
#desc Here's the minimum code required to start an immersive VR session:
#desc [codeblock]
#desc extends Node3D
#desc 
#desc var webxr_interface
#desc var vr_supported = false
#desc 
#desc func _ready():
#desc # We assume this node has a button as a child.
#desc # This button is for the user to consent to entering immersive VR mode.
#desc $Button.pressed.connect(self._on_button_pressed)
#desc 
#desc webxr_interface = XRServer.find_interface("WebXR")
#desc if webxr_interface:
#desc # WebXR uses a lot of asynchronous callbacks, so we connect to various
#desc # signals in order to receive them.
#desc webxr_interface.session_supported.connect(self._webxr_session_supported)
#desc webxr_interface.session_started.connect(self._webxr_session_started)
#desc webxr_interface.session_ended.connect(self._webxr_session_ended)
#desc webxr_interface.session_failed.connect(self._webxr_session_failed)
#desc 
#desc # This returns immediately - our _webxr_session_supported() method
#desc # (which we connected to the "session_supported" signal above) will
#desc # be called sometime later to let us know if it's supported or not.
#desc webxr_interface.is_session_supported("immersive-vr")
#desc 
#desc func _webxr_session_supported(session_mode, supported):
#desc if session_mode == 'immersive-vr':
#desc vr_supported = supported
#desc 
#desc func _on_button_pressed():
#desc if not vr_supported:
#desc OS.alert("Your browser doesn't support VR")
#desc return
#desc 
#desc # We want an immersive VR session, as opposed to AR ('immersive-ar') or a
#desc # simple 3DoF viewer ('viewer').
#desc webxr_interface.session_mode = 'immersive-vr'
#desc # 'bounded-floor' is room scale, 'local-floor' is a standing or sitting
#desc # experience (it puts you 1.6m above the ground if you have 3DoF headset),
#desc # whereas as 'local' puts you down at the XROrigin.
#desc # This list means it'll first try to request 'bounded-floor', then
#desc # fallback on 'local-floor' and ultimately 'local', if nothing else is
#desc # supported.
#desc webxr_interface.requested_reference_space_types = 'bounded-floor, local-floor, local'
#desc # In order to use 'local-floor' or 'bounded-floor' we must also
#desc # mark the features as required or optional.
#desc webxr_interface.required_features = 'local-floor'
#desc webxr_interface.optional_features = 'bounded-floor'
#desc 
#desc # This will return false if we're unable to even request the session,
#desc # however, it can still fail asynchronously later in the process, so we
#desc # only know if it's really succeeded or failed when our
#desc # _webxr_session_started() or _webxr_session_failed() methods are called.
#desc if not webxr_interface.initialize():
#desc OS.alert("Failed to initialize")
#desc return
#desc 
#desc func _webxr_session_started():
#desc $Button.visible = false
#desc # This tells Godot to start rendering to the headset.
#desc get_viewport().use_xr = true
#desc # This will be the reference space type you ultimately got, out of the
#desc # types that you requested above. This is useful if you want the game to
#desc # work a little differently in 'bounded-floor' versus 'local-floor'.
#desc print ("Reference space type: " + webxr_interface.reference_space_type)
#desc 
#desc func _webxr_session_ended():
#desc $Button.visible = true
#desc # If the user exits immersive mode, then we tell Godot to render to the web
#desc # page again.
#desc get_viewport().use_xr = false
#desc 
#desc func _webxr_session_failed(message):
#desc OS.alert("Failed to initialize: " + message)
#desc [/codeblock]
#desc There are a couple ways to handle "controller" input:
#desc - Using [XRController3D] nodes and their [signal XRController3D.button_pressed] and [signal XRController3D.button_released] signals. This is how controllers are typically handled in XR apps in Godot, however, this will only work with advanced VR controllers like the Oculus Touch or Index controllers, for example.
#desc - Using the [signal select], [signal squeeze] and related signals. This method will work for both advanced VR controllers, and non-traditional input sources like a tap on the screen, a spoken voice command or a button press on the device itself.
#desc You can use both methods to allow your game or app to support a wider or narrower set of devices and input methods, or to allow more advanced interactions with more advanced devices.
#tutorial [How to make a VR game for WebXR with Godot 4] https://www.snopekgames.com/tutorial/2023/how-make-vr-game-webxr-godot-4
class_name WebXRInterface

#desc Emitted to indicate that the reference space has been reset or reconfigured.
#desc When (or whether) this is emitted depends on the user's browser or device, but may include when the user has changed the dimensions of their play space (which you may be able to access via [method XRInterface.get_play_area]) or pressed/held a button to recenter their position.
#desc See [url=https://developer.mozilla.org/en-US/docs/Web/API/XRReferenceSpace/reset_event]WebXR's XRReferenceSpace reset event[/url] for more information.
signal reference_space_reset
#desc Emitted after one of the input sources has finished its "primary action".
#desc Use [method get_input_source_tracker] and [method get_input_source_target_ray_mode] to get more information about the input source.
signal select(input_source_id: int)
#desc Emitted when one of the input sources has finished its "primary action".
#desc Use [method get_input_source_tracker] and [method get_input_source_target_ray_mode] to get more information about the input source.
signal selectend(input_source_id: int)
#desc Emitted when one of the input source has started its "primary action".
#desc Use [method get_input_source_tracker] and [method get_input_source_target_ray_mode] to get more information about the input source.
signal selectstart(input_source_id: int)
#desc Emitted when the user ends the WebXR session (which can be done using UI from the browser or device).
#desc At this point, you should do [code]get_viewport().use_xr = false[/code] to instruct Godot to resume rendering to the screen.
signal session_ended
#desc Emitted by [method XRInterface.initialize] if the session fails to start.
#desc [code]message[/code] may optionally contain an error message from WebXR, or an empty string if no message is available.
signal session_failed(message: String)
#desc Emitted by [method XRInterface.initialize] if the session is successfully started.
#desc At this point, it's safe to do [code]get_viewport().use_xr = true[/code] to instruct Godot to start rendering to the XR device.
signal session_started
#desc Emitted by [method is_session_supported] to indicate if the given [code]session_mode[/code] is supported or not.
signal session_supported(session_mode: String, supported: bool)
#desc Emitted after one of the input sources has finished its "primary squeeze action".
#desc Use [method get_input_source_tracker] and [method get_input_source_target_ray_mode] to get more information about the input source.
signal squeeze(input_source_id: int)
#desc Emitted when one of the input sources has finished its "primary squeeze action".
#desc Use [method get_input_source_tracker] and [method get_input_source_target_ray_mode] to get more information about the input source.
signal squeezeend(input_source_id: int)
#desc Emitted when one of the input sources has started its "primary squeeze action".
#desc Use [method get_input_source_tracker] and [method get_input_source_target_ray_mode] to get more information about the input source.
signal squeezestart(input_source_id: int)
#desc Emitted when [member visibility_state] has changed.
signal visibility_state_changed
#desc We don't know the the target ray mode.
#desc Target ray originates at the viewer's eyes and points in the direction they are looking.
#desc Target ray from a handheld pointer, most likely a VR touch controller.
#desc Target ray from touch screen, mouse or other tactile input device.

#enum TargetRayMode
enum {
    TARGET_RAY_MODE_UNKNOWN = 0,
    TARGET_RAY_MODE_GAZE = 1,
    TARGET_RAY_MODE_TRACKED_POINTER = 2,
    TARGET_RAY_MODE_SCREEN = 3,
}
#desc A comma-seperated list of optional features used by [method XRInterface.initialize] when setting up the WebXR session.
#desc If a user's browser or device doesn't support one of the given features, initialization will continue, but you won't be able to use the requested feature.
#desc This doesn't have any effect on the interface when already initialized.
#desc Possible values come from [url=https://developer.mozilla.org/en-US/docs/Web/API/XRReferenceSpaceType]WebXR's XRReferenceSpaceType[/url]. If you want to use a particular reference space type, it must be listed in either [member required_features] or [member optional_features].
var optional_features: String:
	get = get_optional_features, set = set_optional_features

#desc The reference space type (from the list of requested types set in the [member requested_reference_space_types] property), that was ultimately used by [method XRInterface.initialize] when setting up the WebXR session.
#desc Possible values come from [url=https://developer.mozilla.org/en-US/docs/Web/API/XRReferenceSpaceType]WebXR's XRReferenceSpaceType[/url]. If you want to use a particular reference space type, it must be listed in either [member required_features] or [member optional_features].
var reference_space_type: String:
	get = get_reference_space_type

#desc A comma-seperated list of reference space types used by [method XRInterface.initialize] when setting up the WebXR session.
#desc The reference space types are requested in order, and the first one supported by the users device or browser will be used. The [member reference_space_type] property contains the reference space type that was ultimately selected.
#desc This doesn't have any effect on the interface when already initialized.
#desc Possible values come from [url=https://developer.mozilla.org/en-US/docs/Web/API/XRReferenceSpaceType]WebXR's XRReferenceSpaceType[/url]. If you want to use a particular reference space type, it must be listed in either [member required_features] or [member optional_features].
var requested_reference_space_types: String:
	get = get_requested_reference_space_types, set = set_requested_reference_space_types

#desc A comma-seperated list of required features used by [method XRInterface.initialize] when setting up the WebXR session.
#desc If a user's browser or device doesn't support one of the given features, initialization will fail and [signal session_failed] will be emitted.
#desc This doesn't have any effect on the interface when already initialized.
#desc Possible values come from [url=https://developer.mozilla.org/en-US/docs/Web/API/XRReferenceSpaceType]WebXR's XRReferenceSpaceType[/url]. If you want to use a particular reference space type, it must be listed in either [member required_features] or [member optional_features].
var required_features: String:
	get = get_required_features, set = set_required_features

#desc The session mode used by [method XRInterface.initialize] when setting up the WebXR session.
#desc This doesn't have any effect on the interface when already initialized.
#desc Possible values come from [url=https://developer.mozilla.org/en-US/docs/Web/API/XRSessionMode]WebXR's XRSessionMode[/url], including: [code]"immersive-vr"[/code], [code]"immersive-ar"[/code], and [code]"inline"[/code].
var session_mode: String:
	get = get_session_mode, set = set_session_mode

#desc Indicates if the WebXR session's imagery is visible to the user.
#desc Possible values come from [url=https://developer.mozilla.org/en-US/docs/Web/API/XRVisibilityState]WebXR's XRVisibilityState[/url], including [code]"hidden"[/code], [code]"visible"[/code], and [code]"visible-blurred"[/code].
var visibility_state: String:
	get = get_visibility_state



#desc Returns the target ray mode for the given [code]input_source_id[/code].
#desc This can help interpret the input coming from that input source. See [url=https://developer.mozilla.org/en-US/docs/Web/API/XRInputSource/targetRayMode]XRInputSource.targetRayMode[/url] for more information.
func get_input_source_target_ray_mode(input_source_id: int) -> int:
	pass;

#desc Gets an [XRPositionalTracker] for the given [code]input_source_id[/code].
#desc In the context of WebXR, an input source can be an advanced VR controller like the Oculus Touch or Index controllers, or even a tap on the screen, a spoken voice command or a button press on the device itself. When a non-traditional input source is used, interpret the position and orientation of the [XRPositionalTracker] as a ray pointing at the object the user wishes to interact with.
#desc Use this method to get information about the input source that triggered one of these signals:
#desc - [signal selectstart]
#desc - [signal select]
#desc - [signal selectend]
#desc - [signal squeezestart]
#desc - [signal squeeze]
#desc - [signal squeezestart]
func get_input_source_tracker(input_source_id: int) -> XRPositionalTracker:
	pass;

#desc Returns [code]true[/code] if there is an active input source with the given [code]input_source_id[/code].
func is_input_source_active(input_source_id: int) -> bool:
	pass;

#desc Checks if the given [code]session_mode[/code] is supported by the user's browser.
#desc Possible values come from [url=https://developer.mozilla.org/en-US/docs/Web/API/XRSessionMode]WebXR's XRSessionMode[/url], including: [code]"immersive-vr"[/code], [code]"immersive-ar"[/code], and [code]"inline"[/code].
#desc This method returns nothing, instead it emits the [signal session_supported] signal with the result.
func is_session_supported(session_mode: String) -> void:
	pass;


func get_optional_features() -> String:
	return optional_features

func set_optional_features(value: String) -> void:
	optional_features = value

func get_reference_space_type() -> String:
	return reference_space_type

func get_requested_reference_space_types() -> String:
	return requested_reference_space_types

func set_requested_reference_space_types(value: String) -> void:
	requested_reference_space_types = value

func get_required_features() -> String:
	return required_features

func set_required_features(value: String) -> void:
	required_features = value

func get_session_mode() -> String:
	return session_mode

func set_session_mode(value: String) -> void:
	session_mode = value

func get_visibility_state() -> String:
	return visibility_state

