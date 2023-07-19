extends HBoxContainer
#brief Godot editor's control for selecting [Resource] type properties.
#desc This [Control] node is used in the editor's Inspector dock to allow editing of [Resource] type properties. It provides options for creating, loading, saving and converting resources. Can be used with [EditorInspectorPlugin] to recreate the same behavior.
#desc [b]Note:[/b] This [Control] does not include any editor for the resource, as editing is controlled by the Inspector dock itself or sub-Inspectors.
class_name EditorResourcePicker

#desc Emitted when the value of the edited resource was changed.
signal resource_changed(resource: Resource)
#desc Emitted when the resource value was set and user clicked to edit it. When [param inspect] is [code]true[/code], the signal was caused by the context menu "Edit" or "Inspect" option.
signal resource_selected(resource: Resource, inspect: bool)

#desc The base type of allowed resource types. Can be a comma-separated list of several options.
var base_type: String:
	get = get_base_type, set = set_base_type

#desc If [code]true[/code], the value can be selected and edited.
var editable: bool:
	get = is_editable, set = set_editable

#desc The edited resource value.
var edited_resource: Resource:
	get = get_edited_resource, set = set_edited_resource

#desc If [code]true[/code], the main button with the resource preview works in the toggle mode. Use [method set_toggle_pressed] to manually set the state.
var toggle_mode: bool:
	get = is_toggle_mode, set = set_toggle_mode



#desc This virtual method can be implemented to handle context menu items not handled by default. See [method _set_create_options].
func _handle_menu_selected(id: int) -> bool:
	pass;

#desc This virtual method is called when updating the context menu of [EditorResourcePicker]. Implement this method to override the "New ..." items with your own options. [param menu_node] is a reference to the [PopupMenu] node.
#desc [b]Note:[/b] Implement [method _handle_menu_selected] to handle these custom items.
func _set_create_options(menu_node: Object) -> void:
	pass;

#desc Returns a list of all allowed types and subtypes corresponding to the [member base_type]. If the [member base_type] is empty, an empty list is returned.
func get_allowed_types() -> PackedStringArray:
	pass;

#desc Sets the toggle mode state for the main button. Works only if [member toggle_mode] is set to [code]true[/code].
func set_toggle_pressed(pressed: bool) -> void:
	pass;


func get_base_type() -> String:
	return base_type

func set_base_type(value: String) -> void:
	base_type = value

func is_editable() -> bool:
	return editable

func set_editable(value: bool) -> void:
	editable = value

func get_edited_resource() -> Resource:
	return edited_resource

func set_edited_resource(value: Resource) -> void:
	edited_resource = value

func is_toggle_mode() -> bool:
	return toggle_mode

func set_toggle_mode(value: bool) -> void:
	toggle_mode = value

