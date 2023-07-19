extends InputEvent
#brief Input event type for actions.
#desc Contains a generic action which can be targeted from several types of inputs. Actions can be created from the [b]Input Map[/b] tab in the [b]Project > Project Settings[/b] menu. See [method Node._input].
#desc [b]Note:[/b] Unlike the other [InputEvent] subclasses which map to unique physical events, this virtual one is not emitted by the engine. This class is useful to emit actions manually with [method Input.parse_input_event], which are then received in [method Node._input]. To check if a physical event matches an action from the Input Map, use [method InputEvent.is_action] and [method InputEvent.is_action_pressed].
#tutorial [InputEvent: Actions] https://docs.godotengine.org/en/stable/tutorials/inputs/inputevent.html#actions
#tutorial [2D Dodge The Creeps Demo] https://godotengine.org/asset-library/asset/515
#tutorial [3D Voxel Demo] https://godotengine.org/asset-library/asset/676
class_name InputEventAction


#desc The action's name. Actions are accessed via this [String].
var action: StringName:
	get = get_action, set = set_action

#desc If [code]true[/code], the action's state is pressed. If [code]false[/code], the action's state is released.
var pressed: bool:
	get = is_pressed, set = set_pressed

#desc The action's strength between 0 and 1. This value is considered as equal to 0 if pressed is [code]false[/code]. The event strength allows faking analog joypad motion events, by specifying how strongly the joypad axis is bent or pressed.
var strength: float:
	get = get_strength, set = set_strength




func get_action() -> StringName:
	return action

func set_action(value: StringName) -> void:
	action = value

func is_pressed() -> bool:
	return pressed

func set_pressed(value: bool) -> void:
	pressed = value

func get_strength() -> float:
	return strength

func set_strength(value: float) -> void:
	strength = value

