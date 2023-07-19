extends Resource
#brief An OpenXR action.
#desc This resource defines an OpenXR action. Actions can be used both for inputs (buttons/joystick/trigger/etc) and outputs (haptics).
#desc OpenXR performs automatic conversion between action type and input type whenever possible. An analog trigger bound to a boolean action will thus return [code]false[/code] if the trigger is depressed and [code]true[/code] if pressed fully.
#desc Actions are not directly bound to specific devices, instead OpenXR recognizes a limited number of top level paths that identify devices by usage. We can restrict which devices an action can be bound to by these top level paths. For instance an action that should only be used for hand held controllers can have the top level paths "/user/hand/left" and "/user/hand/right" associated with them. See the [url=https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#semantic-path-reserved]reserved path section in the OpenXR specification[/url] for more info on the top level paths.
#desc Note that the name of the resource is used to register the action with.
class_name OpenXRAction

#desc This action provides a boolean value.
#desc This action provides a float value between [code]0.0[/code] and [code]1.0[/code] for any analog input such as triggers.
#desc This action provides a [Vector2] value and can be bound to embedded trackpads and joysticks.

#enum ActionType
enum {
    OPENXR_ACTION_BOOL = 0,
    OPENXR_ACTION_FLOAT = 1,
    OPENXR_ACTION_VECTOR2 = 2,
    OPENXR_ACTION_POSE = 3,
}
#desc The type of action.
var action_type: int:
	get = get_action_type, set = set_action_type

#desc The localized description of this action.
var localized_name: String:
	get = get_localized_name, set = set_localized_name

#desc A collections of toplevel paths to which this action can be bound.
var toplevel_paths: PackedStringArray:
	get = get_toplevel_paths, set = set_toplevel_paths




func get_action_type() -> int:
	return action_type

func set_action_type(value: int) -> void:
	action_type = value

func get_localized_name() -> String:
	return localized_name

func set_localized_name(value: String) -> void:
	localized_name = value

func get_toplevel_paths() -> PackedStringArray:
	return toplevel_paths

func set_toplevel_paths(value: PackedStringArray) -> void:
	toplevel_paths = value

