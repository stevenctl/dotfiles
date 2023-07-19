extends RefCounted
#brief Plugin to control and modifying the process of importing a scene.
#desc This plugin type exists to modify the process of importing scenes, allowing to change the content as well as add importer options at every stage of the process.
class_name EditorScenePostImportPlugin


#enum InternalImportCategory
enum {
    INTERNAL_IMPORT_CATEGORY_NODE = 0,
    INTERNAL_IMPORT_CATEGORY_MESH_3D_NODE = 1,
    INTERNAL_IMPORT_CATEGORY_MESH = 2,
    INTERNAL_IMPORT_CATEGORY_MATERIAL = 3,
    INTERNAL_IMPORT_CATEGORY_ANIMATION = 4,
    INTERNAL_IMPORT_CATEGORY_ANIMATION_NODE = 5,
    INTERNAL_IMPORT_CATEGORY_SKELETON_3D_NODE = 6,
    INTERNAL_IMPORT_CATEGORY_MAX = 7,
}


#desc Override to add general import options. These will appear in the main import dock on the editor. Add options via [method add_import_option] and [method add_import_option_advanced].
func _get_import_options(path: String) -> void:
	pass;

#desc Override to add internal import options. These will appear in the 3D scene import dialog. Add options via [method add_import_option] and [method add_import_option_advanced].
func _get_internal_import_options(category: int) -> void:
	pass;

#desc Return true whether updating the 3D view of the import dialog needs to be updated if an option has changed.
func _get_internal_option_update_view_required(category: int, option: String) -> Variant:
	pass;

#desc Return true or false whether a given option should be visible. Return null to ignore.
func _get_internal_option_visibility(category: int, for_animation: bool, option: String) -> Variant:
	pass;

#desc Return true or false whether a given option should be visible. Return null to ignore.
func _get_option_visibility(path: String, for_animation: bool, option: String) -> Variant:
	pass;

#desc Process a specific node or resource for a given category.
func _internal_process(category: int, base_node: Node, node: Node, resource: Resource) -> void:
	pass;

#desc Post process the scene. This function is called after the final scene has been configured.
func _post_process(scene: Node) -> void:
	pass;

#desc Pre Process the scene. This function is called right after the scene format loader loaded the scene and no changes have been made.
func _pre_process(scene: Node) -> void:
	pass;

#desc Add a specific import option (name and default value only). This function can only be called from [method _get_import_options] and [method _get_internal_import_options].
func add_import_option(name: String, value: Variant) -> void:
	pass;

#desc Add a specific import option. This function can only be called from [method _get_import_options] and [method _get_internal_import_options].
func add_import_option_advanced(type: int, name: String, default_value: Variant, hint: int = 0, hint_string: String = "", usage_flags: int = 6) -> void:
	pass;

#desc Query the value of an option. This function can only be called from those querying visibility, or processing.
func get_option_value(name: StringName) -> Variant:
	pass;


