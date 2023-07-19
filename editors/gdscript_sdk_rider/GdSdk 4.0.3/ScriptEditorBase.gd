extends VBoxContainer
#brief Base editor for editing scripts in the [ScriptEditor].
#desc Base editor for editing scripts in the [ScriptEditor], this does not include documentation items.
class_name ScriptEditorBase

#desc Emitted after script validation.
signal edited_script_changed
#desc Emitted when the user requests a specific documentation page.
signal go_to_help(what: String)
#desc Emitted when the user requests to view a specific method of a script, similar to [signal request_open_script_at_line].
signal go_to_method(script: Object, method: String)
#desc Emitted after script validation or when the edited resource has changed.
signal name_changed
#desc Emitted when the user request to find and replace text in the file system.
signal replace_in_files_requested(text: String)
#desc Emitted when the user requests contextual help.
signal request_help(topic: String)
#desc Emitted when the user requests to view a specific line of a script, similar to [signal go_to_method].
signal request_open_script_at_line(script: Object, line: int)
#desc Emitted when the user contextual goto and the item is in the same script.
signal request_save_history
#desc Emitted when the user request to search text in the file system.
signal search_in_files_requested(text: String)



#desc Adds a [EditorSyntaxHighlighter] to the open script.
func add_syntax_highlighter(highlighter: EditorSyntaxHighlighter) -> void:
	pass;

#desc Returns the underlying [Control] used for editing scripts. For text scripts, this is a [CodeEdit].
func get_base_editor() -> Control:
	pass;


