extends Resource
#brief Group of Buttons.
#desc Group of [BaseButton]. The members of this group are treated like radio buttons in the sense that only one button can be pressed at the same time.
#desc Every member of the ButtonGroup should have [member BaseButton.toggle_mode] set to [code]true[/code].
class_name ButtonGroup

#desc Emitted when one of the buttons of the group is pressed.
signal pressed(button: BaseButton)

var resource_local_to_scene: bool:
	get = is_local_to_scene, set = set_local_to_scene



#desc Returns an [Array] of [Button]s who have this as their [ButtonGroup] (see [member BaseButton.button_group]).
func get_buttons() -> Array[BaseButton]:
	pass;

#desc Returns the current pressed button.
func get_pressed_button() -> BaseButton:
	pass;


func is_local_to_scene() -> bool:
	return resource_local_to_scene

func set_local_to_scene(value: bool) -> void:
	resource_local_to_scene = value

