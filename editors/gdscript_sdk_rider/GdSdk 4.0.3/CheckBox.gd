extends Button
#brief Binary choice user interface widget. See also [CheckButton].
#desc A checkbox allows the user to make a binary choice (choosing only one of two possible options). It's similar to [CheckButton] in functionality, but it has a different appearance. To follow established UX patterns, it's recommended to use CheckBox when toggling it has [b]no[/b] immediate effect on something. For example, it could be used when toggling it will only do something once a confirmation button is pressed.
#desc See also [BaseButton] which contains common properties and methods associated with this node.
class_name CheckBox


var alignment: int:
	get = get_text_alignment, set = set_text_alignment

var toggle_mode: bool:
	get = is_toggle_mode, set = set_toggle_mode




func get_text_alignment() -> int:
	return alignment

func set_text_alignment(value: int) -> void:
	alignment = value

func is_toggle_mode() -> bool:
	return toggle_mode

func set_toggle_mode(value: bool) -> void:
	toggle_mode = value

