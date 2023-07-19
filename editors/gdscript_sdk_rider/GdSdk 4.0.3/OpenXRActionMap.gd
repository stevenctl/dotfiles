extends Resource
#brief Collection of [OpenXRActionSet] and [OpenXRInteractionProfile] resources for the OpenXR module.
#desc OpenXR uses an action system similar to Godots Input map system to bind inputs and outputs on various types of XR controllers to named actions. OpenXR specifies more detail on these inputs and outputs than Godot supports.
#desc Another important distinction is that OpenXR offers no control over these bindings. The bindings we register are suggestions, it is up to the XR runtime to offer users the ability to change these bindings. This allows the XR runtime to fill in the gaps if new hardware becomes available.
#desc The action map therefore needs to be loaded at startup and can't be changed afterwards. This resource is a container for the entire action map.
class_name OpenXRActionMap


#desc Collection of [OpenXRActionSet]s that are part of this action map.
var action_sets: Array:
	get = get_action_sets, set = set_action_sets

#desc Collection of [OpenXRInteractionProfile]s that are part of this action map.
var interaction_profiles: Array:
	get = get_interaction_profiles, set = set_interaction_profiles



#desc Add an action set.
func add_action_set(action_set: OpenXRActionSet) -> void:
	pass;

#desc Add an interaction profile.
func add_interaction_profile(interaction_profile: OpenXRInteractionProfile) -> void:
	pass;

#desc Setup this action set with our default actions.
func create_default_action_sets() -> void:
	pass;

#desc Retrieve an action set by name.
func find_action_set(name: String) -> OpenXRActionSet:
	pass;

#desc Find an interaction profile by its name (path).
func find_interaction_profile(name: String) -> OpenXRInteractionProfile:
	pass;

#desc Retrieve the action set at this index.
func get_action_set(idx: int) -> OpenXRActionSet:
	pass;

#desc Retrieve the number of actions sets in our action map.
func get_action_set_count() -> int:
	pass;

#desc Get the interaction profile at this index.
func get_interaction_profile(idx: int) -> OpenXRInteractionProfile:
	pass;

#desc Retrieve the number of interaction profiles in our action map.
func get_interaction_profile_count() -> int:
	pass;

#desc Remove an action set.
func remove_action_set(action_set: OpenXRActionSet) -> void:
	pass;

#desc Remove an interaction profile.
func remove_interaction_profile(interaction_profile: OpenXRInteractionProfile) -> void:
	pass;


func get_action_sets() -> Array:
	return action_sets

func set_action_sets(value: Array) -> void:
	action_sets = value

func get_interaction_profiles() -> Array:
	return interaction_profiles

func set_interaction_profiles(value: Array) -> void:
	interaction_profiles = value

