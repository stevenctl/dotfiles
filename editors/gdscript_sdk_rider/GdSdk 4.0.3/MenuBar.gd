extends Control
#brief A horizontal menu bar, which displays [PopupMenu]s or system global menu.
#desc New items can be created by adding [PopupMenu] nodes to this node.
class_name MenuBar


#desc Flat [MenuBar] don't display item decoration.
var flat: bool:
	get = is_flat, set = set_flat

#desc Language code used for line-breaking and text shaping algorithms, if left empty current locale is used instead.
var language: String:
	get = get_language, set = set_language

#desc If [code]true[/code], [MenuBar] will use system global menu when supported.
var prefer_global_menu: bool:
	get = is_prefer_global_menu, set = set_prefer_global_menu

#desc Position in the global menu to insert first [MenuBar] item at.
var start_index: int:
	get = get_start_index, set = set_start_index

#desc If [code]true[/code], when the cursor hovers above menu item, it will close the current [PopupMenu] and open the other one.
var switch_on_hover: bool:
	get = is_switch_on_hover, set = set_switch_on_hover

#desc Base text writing direction.
var text_direction: int:
	get = get_text_direction, set = set_text_direction



#desc Returns number of menu items.
func get_menu_count() -> int:
	pass;

#desc Returns [PopupMenu] associated with menu item.
func get_menu_popup(menu: int) -> PopupMenu:
	pass;

#desc Returns menu item title.
func get_menu_title(menu: int) -> String:
	pass;

#desc Returns menu item tooltip.
func get_menu_tooltip(menu: int) -> String:
	pass;

#desc Returns [code]true[/code], if menu item is disabled.
func is_menu_disabled(menu: int) -> bool:
	pass;

#desc Returns [code]true[/code], if menu item is hidden.
func is_menu_hidden(menu: int) -> bool:
	pass;

#desc Returns [code]true[/code], if system global menu is supported and used by this [MenuBar].
func is_native_menu() -> bool:
	pass;

#desc If [code]true[/code], shortcuts are disabled and cannot be used to trigger the button.
func set_disable_shortcuts(disabled: bool) -> void:
	pass;

#desc If [code]true[/code], menu item is disabled.
func set_menu_disabled(menu: int, disabled: bool) -> void:
	pass;

#desc If [code]true[/code], menu item is hidden.
func set_menu_hidden(menu: int, hidden: bool) -> void:
	pass;

#desc Sets menu item title.
func set_menu_title(menu: int, title: String) -> void:
	pass;

#desc Sets menu item tooltip.
func set_menu_tooltip(menu: int, tooltip: String) -> void:
	pass;


func is_flat() -> bool:
	return flat

func set_flat(value: bool) -> void:
	flat = value

func get_language() -> String:
	return language

func set_language(value: String) -> void:
	language = value

func is_prefer_global_menu() -> bool:
	return prefer_global_menu

func set_prefer_global_menu(value: bool) -> void:
	prefer_global_menu = value

func get_start_index() -> int:
	return start_index

func set_start_index(value: int) -> void:
	start_index = value

func is_switch_on_hover() -> bool:
	return switch_on_hover

func set_switch_on_hover(value: bool) -> void:
	switch_on_hover = value

func get_text_direction() -> int:
	return text_direction

func set_text_direction(value: int) -> void:
	text_direction = value

