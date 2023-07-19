extends Button
#brief Checkable button. See also [CheckBox].
#desc CheckButton is a toggle button displayed as a check field. It's similar to [CheckBox] in functionality, but it has a different appearance. To follow established UX patterns, it's recommended to use CheckButton when toggling it has an [b]immediate[/b] effect on something. For example, it could be used if toggling it enables/disables a setting without requiring the user to press a confirmation button.
#desc See also [BaseButton] which contains common properties and methods associated with this node.
class_name CheckButton


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

