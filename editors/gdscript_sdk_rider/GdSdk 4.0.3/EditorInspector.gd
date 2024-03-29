extends ScrollContainer
#brief A control used to edit properties of an object.
#desc This is the control that implements property editing in the editor's Settings dialogs, the Inspector dock, etc. To get the [EditorInspector] used in the editor's Inspector dock, use [method EditorInterface.get_inspector].
#desc [EditorInspector] will show properties in the same order as the array returned by [method Object.get_property_list].
#desc If a property's name is path-like (i.e. if it contains forward slashes), [EditorInspector] will create nested sections for "directories" along the path. For example, if a property is named [code]highlighting/gdscript/node_path_color[/code], it will be shown as "Node Path Color" inside the "GDScript" section nested inside the "Highlighting" section.
#desc If a property has [constant PROPERTY_USAGE_GROUP] usage, it will group subsequent properties whose name starts with the property's hint string. The group ends when a property does not start with that hint string or when a new group starts. An empty group name effectively ends the current group. [EditorInspector] will create a top-level section for each group. For example, if a property with group usage is named [code]Collide With[/code] and its hint string is [code]collide_with_[/code], a subsequent [code]collide_with_area[/code] property will be shown as "Area" inside the "Collide With" section. There is also a special case: when the hint string contains the name of a property, that property is grouped too. This is mainly to help grouping properties like [code]font[/code], [code]font_color[/code] and [code]font_size[/code] (using the hint string [code]font_[/code]).
#desc If a property has [constant PROPERTY_USAGE_SUBGROUP] usage, a subgroup will be created in the same way as a group, and a second-level section will be created for each subgroup.
#desc [b]Note:[/b] Unlike sections created from path-like property names, [EditorInspector] won't capitalize the name for sections created from groups. So properties with group usage usually use capitalized names instead of snake_cased names.
class_name EditorInspector

#desc Emitted when the object being edited by the inspector has changed.
signal edited_object_changed
#desc Emitted when the Edit button of an [Object] has been pressed in the inspector. This is mainly used in the remote scene tree Inspector.
signal object_id_selected(id: int)
#desc Emitted when a property is removed from the inspector.
signal property_deleted(property: String)
#desc Emitted when a property is edited in the inspector.
signal property_edited(property: String)
#desc Emitted when a property is keyed in the inspector. Properties can be keyed by clicking the "key" icon next to a property when the Animation panel is toggled.
signal property_keyed(property: String, value: Variant, advance: bool)
#desc Emitted when a property is selected in the inspector.
signal property_selected(property: String)
#desc Emitted when a boolean property is toggled in the inspector.
#desc [b]Note:[/b] This signal is never emitted if the internal [code]autoclear[/code] property enabled. Since this property is always enabled in the editor inspector, this signal is never emitted by the editor itself.
signal property_toggled(property: String, checked: bool)
#desc Emitted when a resource is selected in the inspector.
signal resource_selected(resource: Resource, path: String)
#desc Emitted when a property that requires a restart to be applied is edited in the inspector. This is only used in the Project Settings and Editor Settings.
signal restart_requested

var horizontal_scroll_mode: int:
	get = get_horizontal_scroll_mode, set = set_horizontal_scroll_mode



#desc Gets the path of the currently selected property.
func get_selected_path() -> String:
	pass;


func get_horizontal_scroll_mode() -> int:
	return horizontal_scroll_mode

func set_horizontal_scroll_mode(value: int) -> void:
	horizontal_scroll_mode = value

