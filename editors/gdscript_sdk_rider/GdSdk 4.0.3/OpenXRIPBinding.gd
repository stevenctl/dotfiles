extends Resource
#brief Defines a binding between an [OpenXRAction] and an XR input or output.
#desc This binding resource binds an [OpenXRAction] to inputs or outputs. As most controllers have left hand and right versions that are handled by the same interaction profile we can specify multiple bindings. For instance an action "Fire" could be bound to both "/user/hand/left/input/trigger" and "/user/hand/right/input/trigger".
class_name OpenXRIPBinding


#desc [OpenXRAction] that is bound to these paths.
var action: OpenXRAction:
	get = get_action, set = set_action

#desc Paths that define the inputs or outputs bound on the device.
var paths: PackedStringArray:
	get = get_paths, set = set_paths



#desc Add an input/output path to this binding.
func add_path(path: String) -> void:
	pass;

#desc Get the number of input/output paths in this binding.
func get_path_count() -> int:
	pass;

#desc Returns [code]true[/code] if this input/output path is part of this binding.
func has_path(path: String) -> bool:
	pass;

#desc Removes this input/output path from this binding.
func remove_path(path: String) -> void:
	pass;


func get_action() -> OpenXRAction:
	return action

func set_action(value: OpenXRAction) -> void:
	action = value

func get_paths() -> PackedStringArray:
	return paths

func set_paths(value: PackedStringArray) -> void:
	paths = value

