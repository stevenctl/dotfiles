extends ScriptLanguage
class_name ScriptLanguageExtension

#desc The option is local to the location of the code completion query - e.g. a local variable.
#desc The option is from the containing class or a parent class, relative to the location of the code completion query. Perform a bitwise OR with the class depth (e.g. 0 for the local class, 1 for the parent, 2 for the grandparent, etc) to store the depth of an option in the class or a parent class.
#desc The option is from user code which is not local and not in a derived class (e.g. Autoload Singletons).
#desc The option is from other engine code, not covered by the other enum constants - e.g. built-in classes.

#enum LookupResultType
enum {
    LOOKUP_RESULT_SCRIPT_LOCATION = 0,
    LOOKUP_RESULT_CLASS = 1,
    LOOKUP_RESULT_CLASS_CONSTANT = 2,
    LOOKUP_RESULT_CLASS_PROPERTY = 3,
    LOOKUP_RESULT_CLASS_METHOD = 4,
    LOOKUP_RESULT_CLASS_SIGNAL = 5,
    LOOKUP_RESULT_CLASS_ENUM = 6,
    LOOKUP_RESULT_CLASS_TBD_GLOBALSCOPE = 7,
    LOOKUP_RESULT_CLASS_ANNOTATION = 8,
    LOOKUP_RESULT_MAX = 9,
}
#enum CodeCompletionLocation
enum {
    LOCATION_LOCAL = 0,
    LOCATION_PARENT_MASK = 256,
    LOCATION_OTHER_USER_CODE = 512,
    LOCATION_OTHER = 1024,
}
#enum CodeCompletionKind
enum {
    CODE_COMPLETION_KIND_CLASS = 0,
    CODE_COMPLETION_KIND_FUNCTION = 1,
    CODE_COMPLETION_KIND_SIGNAL = 2,
    CODE_COMPLETION_KIND_VARIABLE = 3,
    CODE_COMPLETION_KIND_MEMBER = 4,
    CODE_COMPLETION_KIND_ENUM = 5,
    CODE_COMPLETION_KIND_CONSTANT = 6,
    CODE_COMPLETION_KIND_NODE_PATH = 7,
    CODE_COMPLETION_KIND_FILE_PATH = 8,
    CODE_COMPLETION_KIND_PLAIN_TEXT = 9,
    CODE_COMPLETION_KIND_MAX = 10,
}


func _add_global_constant(name: StringName, value: Variant) -> void:
	pass;

func _add_named_global_constant(name: StringName, value: Variant) -> void:
	pass;

func _auto_indent_code(code: String, from_line: int, to_line: int) -> String:
	pass;

func _can_inherit_from_file() -> bool:
	pass;

func _complete_code(code: String, path: String, owner: Object) -> Dictionary:
	pass;

func _create_script() -> Object:
	pass;

func _debug_get_current_stack_info() -> Array[Dictionary]:
	pass;

func _debug_get_error() -> String:
	pass;

func _debug_get_globals(max_subitems: int, max_depth: int) -> Dictionary:
	pass;

func _debug_get_stack_level_count() -> int:
	pass;

func _debug_get_stack_level_function(level: int) -> String:
	pass;

func _debug_get_stack_level_instance(level: int) -> void*:
	pass;

func _debug_get_stack_level_line(level: int) -> int:
	pass;

func _debug_get_stack_level_locals(level: int, max_subitems: int, max_depth: int) -> Dictionary:
	pass;

func _debug_get_stack_level_members(level: int, max_subitems: int, max_depth: int) -> Dictionary:
	pass;

func _debug_parse_stack_level_expression(level: int, expression: String, max_subitems: int, max_depth: int) -> String:
	pass;

func _find_function(class_name: String, function_name: String) -> int:
	pass;

func _finish() -> void:
	pass;

func _frame() -> void:
	pass;

func _get_built_in_templates(object: StringName) -> Array[Dictionary]:
	pass;

func _get_comment_delimiters() -> PackedStringArray:
	pass;

func _get_extension() -> String:
	pass;

func _get_global_class_name(path: String) -> Dictionary:
	pass;

func _get_name() -> String:
	pass;

func _get_public_annotations() -> Array[Dictionary]:
	pass;

func _get_public_constants() -> Dictionary:
	pass;

func _get_public_functions() -> Array[Dictionary]:
	pass;

func _get_recognized_extensions() -> PackedStringArray:
	pass;

func _get_reserved_words() -> PackedStringArray:
	pass;

func _get_string_delimiters() -> PackedStringArray:
	pass;

func _get_type() -> String:
	pass;

func _handles_global_class_type(type: String) -> bool:
	pass;

func _has_named_classes() -> bool:
	pass;

func _init() -> void:
	pass;

func _is_control_flow_keyword(keyword: String) -> bool:
	pass;

func _is_using_templates() -> bool:
	pass;

func _lookup_code(code: String, symbol: String, path: String, owner: Object) -> Dictionary:
	pass;

func _make_function(class_name: String, function_name: String, function_args: PackedStringArray) -> String:
	pass;

func _make_template(template: String, class_name: String, base_class_name: String) -> Script:
	pass;

func _open_in_external_editor(script: Script, line: int, column: int) -> int:
	pass;

func _overrides_external_editor() -> bool:
	pass;

func _profiling_get_accumulated_data(info_array: ScriptLanguageExtensionProfilingInfo*, info_max: int) -> int:
	pass;

func _profiling_get_frame_data(info_array: ScriptLanguageExtensionProfilingInfo*, info_max: int) -> int:
	pass;

func _profiling_start() -> void:
	pass;

func _profiling_stop() -> void:
	pass;

func _reload_all_scripts() -> void:
	pass;

func _reload_tool_script(script: Script, soft_reload: bool) -> void:
	pass;

func _remove_named_global_constant(name: StringName) -> void:
	pass;

func _supports_builtin_mode() -> bool:
	pass;

func _supports_documentation() -> bool:
	pass;

func _thread_enter() -> void:
	pass;

func _thread_exit() -> void:
	pass;

func _validate(script: String, path: String, validate_functions: bool, validate_errors: bool, validate_warnings: bool, validate_safe_lines: bool) -> Dictionary:
	pass;

func _validate_path(path: String) -> String:
	pass;


