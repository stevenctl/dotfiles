extends Button
#brief Special button that brings up a [PopupMenu] when clicked.
#desc Special button that brings up a [PopupMenu] when clicked.
#desc New items can be created inside this [PopupMenu] using [code]get_popup().add_item("My Item Name")[/code]. You can also create them directly from the editor. To do so, select the [MenuButton] node, then in the toolbar at the top of the 2D editor, click [b]Items[/b] then click [b]Add[/b] in the popup. You will be able to give each item new properties.
#desc See also [BaseButton] which contains common properties and methods associated with this node.
class_name MenuButton

#desc Emitted when the [PopupMenu] of this MenuButton is about to show.
signal about_to_popup

var action_mode: int:
	get = get_action_mode, set = set_action_mode

var flat: bool:
	get = is_flat, set = set_flat

var focus_mode: int:
	get = get_focus_mode, set = set_focus_mode

#desc The number of items currently in the list.
var item_count: int:
	get = get_item_count, set = set_item_count

#desc If [code]true[/code], when the cursor hovers above another [MenuButton] within the same parent which also has [code]switch_on_hover[/code] enabled, it will close the current [MenuButton] and open the other one.
var switch_on_hover: bool:
	get = is_switch_on_hover, set = set_switch_on_hover

var toggle_mode: bool:
	get = is_toggle_mode, set = set_toggle_mode



#desc Returns the [PopupMenu] contained in this button.
#desc [b]Warning:[/b] This is a required internal node, removing and freeing it may cause a crash. If you wish to hide it or any of its children, use their [member Window.visible] property.
func get_popup() -> PopupMenu:
	pass;

#desc If [code]true[/code], shortcuts are disabled and cannot be used to trigger the button.
func set_disable_shortcuts(disabled: bool) -> void:
	pass;

#desc Adjusts popup position and sizing for the [MenuButton], then shows the [PopupMenu]. Prefer this over using [code]get_popup().popup()[/code].
func show_popup() -> void:
	pass;


func get_action_mode() -> int:
	return action_mode

func set_action_mode(value: int) -> void:
	action_mode = value

func is_flat() -> bool:
	return flat

func set_flat(value: bool) -> void:
	flat = value

func get_focus_mode() -> int:
	return focus_mode

func set_focus_mode(value: int) -> void:
	focus_mode = value

func get_item_count() -> int:
	return item_count

func set_item_count(value: int) -> void:
	item_count = value

func is_switch_on_hover() -> bool:
	return switch_on_hover

func set_switch_on_hover(value: bool) -> void:
	switch_on_hover = value

func is_toggle_mode() -> bool:
	return toggle_mode

func set_toggle_mode(value: bool) -> void:
	toggle_mode = value

