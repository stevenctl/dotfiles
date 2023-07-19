extends Resource
#brief Suggested bindings object for OpenXR.
#desc This object stores suggested bindings for an interaction profile. Interaction profiles define the meta data for a tracked XR device such as an XR controller.
#desc For more information see the [url=https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#semantic-path-interaction-profiles]interaction profiles info in the OpenXR specification[/url].
class_name OpenXRInteractionProfile


#desc Action bindings for this interaction profile.
var bindings: Array:
	get = get_bindings, set = set_bindings

#desc The interaction profile path identifying the XR device.
var interaction_profile_path: String:
	get = get_interaction_profile_path, set = set_interaction_profile_path



#desc Retrieve the binding at this index.
func get_binding(index: int) -> OpenXRIPBinding:
	pass;

#desc Get the number of bindings in this interaction profile.
func get_binding_count() -> int:
	pass;


func get_bindings() -> Array:
	return bindings

func set_bindings(value: Array) -> void:
	bindings = value

func get_interaction_profile_path() -> String:
	return interaction_profile_path

func set_interaction_profile_path(value: String) -> void:
	interaction_profile_path = value

