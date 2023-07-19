extends ConfirmationDialog
#brief The Editor's popup dialog for creating new [Script] files.
#desc The [ScriptCreateDialog] creates script files according to a given template for a given scripting language. The standard use is to configure its fields prior to calling one of the [method Window.popup] methods.
#desc [codeblocks]
#desc [gdscript]
#desc func _ready():
#desc var dialog = ScriptCreateDialog.new();
#desc dialog.config("Node", "res://new_node.gd") # For in-engine types.
#desc dialog.config("\"res://base_node.gd\"", "res://derived_node.gd") # For script types.
#desc dialog.popup_centered()
#desc [/gdscript]
#desc [csharp]
#desc public override void _Ready()
#desc {
#desc var dialog = new ScriptCreateDialog();
#desc dialog.Config("Node", "res://NewNode.cs"); // For in-engine types.
#desc dialog.Config("\"res://BaseNode.cs\"", "res://DerivedNode.cs"); // For script types.
#desc dialog.PopupCentered();
#desc }
#desc [/csharp]
#desc [/codeblocks]
class_name ScriptCreateDialog

#desc Emitted when the user clicks the OK button.
signal script_created(script: Script)

var dialog_hide_on_ok: bool:
	get = get_hide_on_ok, set = set_hide_on_ok

var ok_button_text: String:
	get = get_ok_button_text, set = set_ok_button_text

var title: String:
	get = get_title, set = set_title



#desc Prefills required fields to configure the ScriptCreateDialog for use.
func config(inherits: String, path: String, built_in_enabled: bool = true, load_enabled: bool = true) -> void:
	pass;


func get_hide_on_ok() -> bool:
	return dialog_hide_on_ok

func set_hide_on_ok(value: bool) -> void:
	dialog_hide_on_ok = value

func get_ok_button_text() -> String:
	return ok_button_text

func set_ok_button_text(value: String) -> void:
	ok_button_text = value

func get_title() -> String:
	return title

func set_title(value: String) -> void:
	title = value

