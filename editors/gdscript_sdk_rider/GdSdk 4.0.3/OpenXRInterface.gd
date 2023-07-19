extends XRInterface
#brief Our OpenXR interface.
#desc The OpenXR interface allows Godot to interact with OpenXR runtimes and make it possible to create XR experiences and games.
#desc Due to the needs of OpenXR this interface works slightly different than other plugin based XR interfaces. It needs to be initialized when Godot starts. You need to enable OpenXR, settings for this can be found in your games project settings under the XR heading. You do need to mark a viewport for use with XR in order for Godot to know which render result should be output to the headset.
#tutorial [Setting up XR] https://docs.godotengine.org/en/stable/tutorials/xr/setting_up_xr.html
class_name OpenXRInterface

#desc Informs the user queued a recenter of the player position.
signal pose_recentered
#desc Informs our OpenXR session has been started.
signal session_begun
#desc Informs our OpenXR session now has focus.
signal session_focussed
#desc Informs our OpenXR session is stopping.
signal session_stopping
#desc Informs our OpenXR session is now visible (output is being sent to the HMD).
signal session_visible

#desc The display refresh rate for the current HMD. Only functional if this feature is supported by the OpenXR runtime and after the interface has been initialized.
var display_refresh_rate: float:
	get = get_display_refresh_rate, set = set_display_refresh_rate



#desc Returns a list of action sets registered with Godot (loaded from the action map at runtime).
func get_action_sets() -> Array:
	pass;

#desc Returns display refresh rates supported by the current HMD. Only returned if this feature is supported by the OpenXR runtime and after the interface has been initialized.
func get_available_display_refresh_rates() -> Array:
	pass;

#desc Returns [code]true[/code] if the given action set is active.
func is_action_set_active(name: String) -> bool:
	pass;

#desc Sets the given action set as active or inactive.
func set_action_set_active(name: String, active: bool) -> void:
	pass;


func get_display_refresh_rate() -> float:
	return display_refresh_rate

func set_display_refresh_rate(value: float) -> void:
	display_refresh_rate = value

