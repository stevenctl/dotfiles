extends Resource
#brief Collection of [OpenXRAction] resources that make up an action set.
#desc Action sets in OpenXR define a collection of actions that can be activated in unison. This allows games to easily change between different states that require different inputs or need to reinterpret inputs. For instance we could have an action set that is active when a menu is open, an action set that is active when the player is freely walking around and an action set that is active when the player is controlling a vehicle.
#desc Action sets can contain the same action with the same name, if such action sets are active at the same time the action set with the highest priority defines which binding is active.
class_name OpenXRActionSet


#desc Collection of actions for this action set.
var actions: Array:
	get = get_actions, set = set_actions

#desc The localized name of this action set.
var localized_name: String:
	get = get_localized_name, set = set_localized_name

#desc The priority for this action set.
var priority: int:
	get = get_priority, set = set_priority



#desc Add an action to this action set.
func add_action(action: OpenXRAction) -> void:
	pass;

#desc Retrieve the number of actions in our action set.
func get_action_count() -> int:
	pass;

#desc Remove an action from this action set.
func remove_action(action: OpenXRAction) -> void:
	pass;


func get_actions() -> Array:
	return actions

func set_actions(value: Array) -> void:
	actions = value

func get_localized_name() -> String:
	return localized_name

func set_localized_name(value: String) -> void:
	localized_name = value

func get_priority() -> int:
	return priority

func set_priority(value: int) -> void:
	priority = value

