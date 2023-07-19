extends ConfirmationDialog
#brief A modified version of [FileDialog] used by the editor.
#desc [EditorFileDialog] is an enhanced version of [FileDialog] available only to editor plugins. Additional features include list of favorited/recent files and ability to see files as thumbnails grid instead of list.
class_name EditorFileDialog

#desc Emitted when a directory is selected.
signal dir_selected(dir: String)
#desc Emitted when a file is selected.
signal file_selected(path: String)
#desc Emitted when multiple files are selected.
signal files_selected(paths: PackedStringArray)
#desc The [EditorFileDialog] can select only one file. Accepting the window will open the file.
#desc The [EditorFileDialog] can select multiple files. Accepting the window will open all files.
#desc The [EditorFileDialog] can select only one directory. Accepting the window will open the directory.
#desc The [EditorFileDialog] can select a file or directory. Accepting the window will open it.
#desc The [EditorFileDialog] can select only one file. Accepting the window will save the file.
#desc The [EditorFileDialog] can only view [code]res://[/code] directory contents.
#desc The [EditorFileDialog] can only view [code]user://[/code] directory contents.
#desc The [EditorFileDialog] can view the entire local file system.
#desc The [EditorFileDialog] displays resources as thumbnails.
#desc The [EditorFileDialog] displays resources as a list of filenames.

#enum FileMode
enum {
    FILE_MODE_OPEN_FILE = 0,
    FILE_MODE_OPEN_FILES = 1,
    FILE_MODE_OPEN_DIR = 2,
    FILE_MODE_OPEN_ANY = 3,
    FILE_MODE_SAVE_FILE = 4,
}
#enum Access
enum {
    ACCESS_RESOURCES = 0,
    ACCESS_USERDATA = 1,
    ACCESS_FILESYSTEM = 2,
}
#enum DisplayMode
enum {
    DISPLAY_THUMBNAILS = 0,
    DISPLAY_LIST = 1,
}
#desc The location from which the user may select a file, including [code]res://[/code], [code]user://[/code], and the local file system.
var access: int:
	get = get_access, set = set_access

#desc The currently occupied directory.
var current_dir: String:
	get = get_current_dir, set = set_current_dir

#desc The currently selected file.
var current_file: String:
	get = get_current_file, set = set_current_file

#desc The file system path in the address bar.
var current_path: String:
	get = get_current_path, set = set_current_path

var dialog_hide_on_ok: bool:
	get = get_hide_on_ok, set = set_hide_on_ok

#desc If [code]true[/code], the [EditorFileDialog] will not warn the user before overwriting files.
var disable_overwrite_warning: bool:
	get = is_overwrite_warning_disabled, set = set_disable_overwrite_warning

#desc The view format in which the [EditorFileDialog] displays resources to the user.
var display_mode: int:
	get = get_display_mode, set = set_display_mode

#desc The dialog's open or save mode, which affects the selection behavior. See [enum FileMode].
var file_mode: int:
	get = get_file_mode, set = set_file_mode

#desc The available file type filters. For example, this shows only [code].png[/code] and [code].gd[/code] files: [code]set_filters(PackedStringArray(["*.png ; PNG Images","*.gd ; GDScript Files"]))[/code]. Multiple file types can also be specified in a single filter. [code]"*.png, *.jpg, *.jpeg ; Supported Images"[/code] will show both PNG and JPEG files when selected.
var filters: PackedStringArray:
	get = get_filters, set = set_filters

#desc If [code]true[/code], hidden files and directories will be visible in the [EditorFileDialog]. This property is synchronized with [member EditorSettings.filesystem/file_dialog/show_hidden_files].
var show_hidden_files: bool:
	get = is_showing_hidden_files, set = set_show_hidden_files

var title: String:
	get = get_title, set = set_title



#desc Adds a comma-delimited file name [param filter] option to the [EditorFileDialog] with an optional [param description], which restricts what files can be picked.
#desc A [param filter] should be of the form [code]"filename.extension"[/code], where filename and extension can be [code]*[/code] to match any string. Filters starting with [code].[/code] (i.e. empty filenames) are not allowed.
#desc For example, a [param filter] of [code]"*.tscn, *.scn"[/code] and a [param description] of [code]"Scenes"[/code] results in filter text "Scenes (*.tscn, *.scn)".
func add_filter(filter: String, description: String = "") -> void:
	pass;

#desc Removes all filters except for "All Files (*)".
func clear_filters() -> void:
	pass;

#desc Returns the LineEdit for the selected file.
#desc [b]Warning:[/b] This is a required internal node, removing and freeing it may cause a crash. If you wish to hide it or any of its children, use their [member CanvasItem.visible] property.
func get_line_edit() -> LineEdit:
	pass;

#desc Returns the [code]VBoxContainer[/code] used to display the file system.
#desc [b]Warning:[/b] This is a required internal node, removing and freeing it may cause a crash. If you wish to hide it or any of its children, use their [member CanvasItem.visible] property.
func get_vbox() -> VBoxContainer:
	pass;

#desc Notify the [EditorFileDialog] that its view of the data is no longer accurate. Updates the view contents on next view update.
func invalidate() -> void:
	pass;


func get_access() -> int:
	return access

func set_access(value: int) -> void:
	access = value

func get_current_dir() -> String:
	return current_dir

func set_current_dir(value: String) -> void:
	current_dir = value

func get_current_file() -> String:
	return current_file

func set_current_file(value: String) -> void:
	current_file = value

func get_current_path() -> String:
	return current_path

func set_current_path(value: String) -> void:
	current_path = value

func get_hide_on_ok() -> bool:
	return dialog_hide_on_ok

func set_hide_on_ok(value: bool) -> void:
	dialog_hide_on_ok = value

func is_overwrite_warning_disabled() -> bool:
	return disable_overwrite_warning

func set_disable_overwrite_warning(value: bool) -> void:
	disable_overwrite_warning = value

func get_display_mode() -> int:
	return display_mode

func set_display_mode(value: int) -> void:
	display_mode = value

func get_file_mode() -> int:
	return file_mode

func set_file_mode(value: int) -> void:
	file_mode = value

func get_filters() -> PackedStringArray:
	return filters

func set_filters(value: PackedStringArray) -> void:
	filters = value

func is_showing_hidden_files() -> bool:
	return show_hidden_files

func set_show_hidden_files(value: bool) -> void:
	show_hidden_files = value

func get_title() -> String:
	return title

func set_title(value: String) -> void:
	title = value

