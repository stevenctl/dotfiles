extends Container
#brief Custom control to edit properties for adding into the inspector.
#desc This control allows property editing for one or multiple properties into [EditorInspector]. It is added via [EditorInspectorPlugin].
class_name EditorProperty

#desc Emit it if you want multiple properties modified at the same time. Do not use if added via [method EditorInspectorPlugin._parse_property].
signal multiple_properties_changed(properties: PackedStringArray, value: Array)
#desc Used by sub-inspectors. Emit it if what was selected was an Object ID.
signal object_id_selected(property: StringName, id: int)
#desc Emitted when the revertability (i.e., whether it has a non-default value and thus is displayed with a revert icon) of a property has changed.
signal property_can_revert_changed(property: StringName, can_revert: bool)
#desc Do not emit this manually, use the [method emit_changed] method instead.
signal property_changed(property: StringName, value: Variant, field: StringName, changing: bool)
#desc Emitted when a property was checked. Used internally.
signal property_checked(property: StringName, checked: bool)
#desc Emitted when a property was deleted. Used internally.
signal property_deleted(property: StringName)
#desc Emit it if you want to add this value as an animation key (check for keying being enabled first).
signal property_keyed(property: StringName)
#desc Emit it if you want to key a property with a single value.
signal property_keyed_with_value(property: StringName, value: Variant)
#desc Emit it if you want to mark (or unmark) the value of a property for being saved regardless of being equal to the default value.
#desc The default value is the one the property will get when the node is just instantiated and can come from an ancestor scene in the inheritance/instantiation chain, a script or a builtin class.
signal property_pinned(property: StringName, pinned: bool)
#desc If you want a sub-resource to be edited, emit this signal with the resource.
signal resource_selected(path: String, resource: Resource)
#desc Emitted when selected. Used internally.
signal selected(path: String, focusable_idx: int)

#desc Used by the inspector, set to [code]true[/code] when the property is checkable.
var checkable: bool:
	get = is_checkable, set = set_checkable

#desc Used by the inspector, set to [code]true[/code] when the property is checked.
var checked: bool:
	get = is_checked, set = set_checked

#desc Used by the inspector, set to [code]true[/code] when the property can be deleted by the user.
var deletable: bool:
	get = is_deletable, set = set_deletable

#desc Used by the inspector, set to [code]true[/code] when the property is drawn with the editor theme's warning color. This is used for editable children's properties.
var draw_warning: bool:
	get = is_draw_warning, set = set_draw_warning

#desc Used by the inspector, set to [code]true[/code] when the property can add keys for animation.
var keying: bool:
	get = is_keying, set = set_keying

#desc Set this property to change the label (if you want to show one).
var label: String:
	get = get_label, set = set_label

#desc Used by the inspector, set to [code]true[/code] when the property is read-only.
var read_only: bool:
	get = is_read_only, set = set_read_only



#desc Called when the read-only status of the property is changed. It may be used to change custom controls into a read-only or modifiable state.
func _set_read_only(read_only: bool) -> void:
	pass;

#desc When this virtual function is called, you must update your editor.
func _update_property() -> void:
	pass;

#desc If any of the controls added can gain keyboard focus, add it here. This ensures that focus will be restored if the inspector is refreshed.
func add_focusable(control: Control) -> void:
	pass;

#desc If one or several properties have changed, this must be called. [param field] is used in case your editor can modify fields separately (as an example, Vector3.x). The [param changing] argument avoids the editor requesting this property to be refreshed (leave as [code]false[/code] if unsure).
func emit_changed(property: StringName, value: Variant, field: StringName = &"", changing: bool = false) -> void:
	pass;

#desc Gets the edited object.
func get_edited_object() -> Object:
	pass;

#desc Gets the edited property. If your editor is for a single property (added via [method EditorInspectorPlugin._parse_property]), then this will return the property.
func get_edited_property() -> StringName:
	pass;

#desc Puts the [param editor] control below the property label. The control must be previously added using [method Node.add_child].
func set_bottom_editor(editor: Control) -> void:
	pass;

#desc Forces refresh of the property display.
func update_property() -> void:
	pass;


func is_checkable() -> bool:
	return checkable

func set_checkable(value: bool) -> void:
	checkable = value

func is_checked() -> bool:
	return checked

func set_checked(value: bool) -> void:
	checked = value

func is_deletable() -> bool:
	return deletable

func set_deletable(value: bool) -> void:
	deletable = value

func is_draw_warning() -> bool:
	return draw_warning

func set_draw_warning(value: bool) -> void:
	draw_warning = value

func is_keying() -> bool:
	return keying

func set_keying(value: bool) -> void:
	keying = value

func get_label() -> String:
	return label

func set_label(value: String) -> void:
	label = value

func is_read_only() -> bool:
	return read_only

func set_read_only(value: bool) -> void:
	read_only = value

