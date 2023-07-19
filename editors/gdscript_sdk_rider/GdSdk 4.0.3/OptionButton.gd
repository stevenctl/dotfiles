extends Button
#brief Button control that provides selectable options when pressed.
#desc OptionButton is a type button that provides a selectable list of items when pressed. The item selected becomes the "current" item and is displayed as the button text.
#desc See also [BaseButton] which contains common properties and methods associated with this node.
#desc [b]Note:[/b] Properties [member Button.text] and [member Button.icon] are automatically set based on the selected item. They shouldn't be changed manually.
class_name OptionButton

#desc Emitted when the user navigates to an item using the [member ProjectSettings.input/ui_up] or [member ProjectSettings.input/ui_down] input actions. The index of the item selected is passed as argument.
signal item_focused(index: int)
#desc Emitted when the current item has been changed by the user. The index of the item selected is passed as argument.
signal item_selected(index: int)

var action_mode: int:
	get = get_action_mode, set = set_action_mode

var alignment: int:
	get = get_text_alignment, set = set_text_alignment

#desc If [code]true[/code], minimum size will be determined by the longest item's text, instead of the currently selected one's.
#desc [b]Note:[/b] For performance reasons, the minimum size doesn't update immediately when adding, removing or modifying items.
var fit_to_longest_item: bool:
	get = is_fit_to_longest_item, set = set_fit_to_longest_item

#desc The number of items to select from.
var item_count: int:
	get = get_item_count, set = set_item_count

#desc The index of the currently selected item, or [code]-1[/code] if no item is selected.
var selected: int:
	get = get_selected, set = _select_int

var toggle_mode: bool:
	get = is_toggle_mode, set = set_toggle_mode



#desc Adds an item, with a [param texture] icon, text [param label] and (optionally) [param id]. If no [param id] is passed, the item index will be used as the item's ID. New items are appended at the end.
func add_icon_item(texture: Texture2D, label: String, id: int = -1) -> void:
	pass;

#desc Adds an item, with text [param label] and (optionally) [param id]. If no [param id] is passed, the item index will be used as the item's ID. New items are appended at the end.
func add_item(label: String, id: int = -1) -> void:
	pass;

#desc Adds a separator to the list of items. Separators help to group items, and can optionally be given a [param text] header. A separator also gets an index assigned, and is appended at the end of the item list.
func add_separator(text: String = "") -> void:
	pass;

#desc Clears all the items in the [OptionButton].
func clear() -> void:
	pass;

#desc Returns the icon of the item at index [param idx].
func get_item_icon(idx: int) -> Texture2D:
	pass;

#desc Returns the ID of the item at index [param idx].
func get_item_id(idx: int) -> int:
	pass;

#desc Returns the index of the item with the given [param id].
func get_item_index(id: int) -> int:
	pass;

#desc Retrieves the metadata of an item. Metadata may be any type and can be used to store extra information about an item, such as an external string ID.
func get_item_metadata(idx: int) -> Variant:
	pass;

#desc Returns the text of the item at index [param idx].
func get_item_text(idx: int) -> String:
	pass;

#desc Returns the tooltip of the item at index [param idx].
func get_item_tooltip(idx: int) -> String:
	pass;

#desc Returns the [PopupMenu] contained in this button.
#desc [b]Warning:[/b] This is a required internal node, removing and freeing it may cause a crash. If you wish to hide it or any of its children, use their [member Window.visible] property.
func get_popup() -> PopupMenu:
	pass;

#desc Returns the index of the first item which is not disabled, or marked as a separator. If [param from_last] is [code]true[/code], the items will be searched in reverse order.
#desc Returns [code]-1[/code] if no item is found.
func get_selectable_item(from_last: bool = false) -> int:
	pass;

#desc Returns the ID of the selected item, or [code]-1[/code] if no item is selected.
func get_selected_id() -> int:
	pass;

#desc Gets the metadata of the selected item. Metadata for items can be set using [method set_item_metadata].
func get_selected_metadata() -> Variant:
	pass;

#desc Returns [code]true[/code] if this button contains at least one item which is not disabled, or marked as a separator.
func has_selectable_items() -> bool:
	pass;

#desc Returns [code]true[/code] if the item at index [param idx] is disabled.
func is_item_disabled(idx: int) -> bool:
	pass;

#desc Returns [code]true[/code] if the item at index [param idx] is marked as a separator.
func is_item_separator(idx: int) -> bool:
	pass;

#desc Removes the item at index [param idx].
func remove_item(idx: int) -> void:
	pass;

#desc Selects an item by index and makes it the current item. This will work even if the item is disabled.
#desc Passing [code]-1[/code] as the index deselects any currently selected item.
func select(idx: int) -> void:
	pass;

#desc Sets whether the item at index [param idx] is disabled.
#desc Disabled items are drawn differently in the dropdown and are not selectable by the user. If the current selected item is set as disabled, it will remain selected.
func set_item_disabled(idx: int, disabled: bool) -> void:
	pass;

#desc Sets the icon of the item at index [param idx].
func set_item_icon(idx: int, texture: Texture2D) -> void:
	pass;

#desc Sets the ID of the item at index [param idx].
func set_item_id(idx: int, id: int) -> void:
	pass;

#desc Sets the metadata of an item. Metadata may be of any type and can be used to store extra information about an item, such as an external string ID.
func set_item_metadata(idx: int, metadata: Variant) -> void:
	pass;

#desc Sets the text of the item at index [param idx].
func set_item_text(idx: int, text: String) -> void:
	pass;

#desc Sets the tooltip of the item at index [param idx].
func set_item_tooltip(idx: int, tooltip: String) -> void:
	pass;

#desc Adjusts popup position and sizing for the [OptionButton], then shows the [PopupMenu]. Prefer this over using [code]get_popup().popup()[/code].
func show_popup() -> void:
	pass;


func get_action_mode() -> int:
	return action_mode

func set_action_mode(value: int) -> void:
	action_mode = value

func get_text_alignment() -> int:
	return alignment

func set_text_alignment(value: int) -> void:
	alignment = value

func is_fit_to_longest_item() -> bool:
	return fit_to_longest_item

func set_fit_to_longest_item(value: bool) -> void:
	fit_to_longest_item = value

func get_item_count() -> int:
	return item_count

func set_item_count(value: int) -> void:
	item_count = value

func get_selected() -> int:
	return selected

func _select_int(value: int) -> void:
	selected = value

func is_toggle_mode() -> bool:
	return toggle_mode

func set_toggle_mode(value: bool) -> void:
	toggle_mode = value

