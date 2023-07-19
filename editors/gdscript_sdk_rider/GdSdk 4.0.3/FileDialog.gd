extends ConfirmationDialog
#brief Dialog for selecting files or directories in the filesystem.
#desc FileDialog is a preset dialog used to choose files and directories in the filesystem. It supports filter masks. The FileDialog automatically sets its window title according to the [member file_mode]. If you want to use a custom title, disable this by setting [member mode_overrides_title] to [code]false[/code].
class_name FileDialog

#desc Emitted when the user selects a directory.
signal dir_selected(dir: String)
#desc Emitted when the user selects a file by double-clicking it or pressing the [b]OK[/b] button.
signal file_selected(path: String)
#desc Emitted when the user selects multiple files.
signal files_selected(paths: PackedStringArray)
#desc The dialog allows selecting one, and only one file.
#desc The dialog allows selecting multiple files.
#desc The dialog only allows selecting a directory, disallowing the selection of any file.
#desc The dialog allows selecting one file or directory.
#desc The dialog will warn when a file exists.
#desc The dialog only allows accessing files under the [Resource] path ([code]res://[/code]).
#desc The dialog only allows accessing files under user data path ([code]user://[/code]).
#desc The dialog allows accessing files on the whole file system.

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
#desc The file system access scope. See [enum Access] constants.
#desc [b]Warning:[/b] Currently, in sandboxed environments such as Web builds or sandboxed macOS apps, FileDialog cannot access the host file system. See [url=https://github.com/godotengine/godot-proposals/issues/1123]godot-proposals#1123[/url].
var access: int:
	get = get_access, set = set_access

#desc The current working directory of the file dialog.
var current_dir: String:
	get = get_current_dir, set = set_current_dir

#desc The currently selected file of the file dialog.
var current_file: String:
	get = get_current_file, set = set_current_file

#desc The currently selected file path of the file dialog.
var current_path: String:
	get = get_current_path, set = set_current_path

var dialog_hide_on_ok: bool:
	get = get_hide_on_ok, set = set_hide_on_ok

#desc The dialog's open or save mode, which affects the selection behavior. See [enum FileMode].
var file_mode: int:
	get = get_file_mode, set = set_file_mode

#desc The available file type filters. For example, this shows only [code].png[/code] and [code].gd[/code] files: [code]set_filters(PackedStringArray(["*.png ; PNG Images","*.gd ; GDScript Files"]))[/code]. Multiple file types can also be specified in a single filter. [code]"*.png, *.jpg, *.jpeg ; Supported Images"[/code] will show both PNG and JPEG files when selected.
var filters: PackedStringArray:
	get = get_filters, set = set_filters

#desc If [code]true[/code], changing the [member file_mode] property will set the window title accordingly (e.g. setting [member file_mode] to [constant FILE_MODE_OPEN_FILE] will change the window title to "Open a File").
var mode_overrides_title: bool:
	get = is_mode_overriding_title, set = set_mode_overrides_title

#desc If non-empty, the given sub-folder will be "root" of this [FileDialog], i.e. user won't be able to go to its parent directory.
var root_subfolder: String:
	get = get_root_subfolder, set = set_root_subfolder

#desc If [code]true[/code], the dialog will show hidden files.
var show_hidden_files: bool:
	get = is_showing_hidden_files, set = set_show_hidden_files

var title: String:
	get = get_title, set = set_title



#desc Adds a comma-delimited file name [param filter] option to the [FileDialog] with an optional [param description], which restricts what files can be picked.
#desc A [param filter] should be of the form [code]"filename.extension"[/code], where filename and extension can be [code]*[/code] to match any string. Filters starting with [code].[/code] (i.e. empty filenames) are not allowed.
#desc For example, a [param filter] of [code]"*.png, *.jpg"[/code] and a [param description] of [code]"Images"[/code] results in filter text "Images (*.png, *.jpg)".
func add_filter(filter: String, description: String = "") -> void:
	pass;

#desc Clear all the added filters in the dialog.
func clear_filters() -> void:
	pass;

#desc Clear all currently selected items in the dialog.
func deselect_all() -> void:
	pass;

#desc Returns the LineEdit for the selected file.
#desc [b]Warning:[/b] This is a required internal node, removing and freeing it may cause a crash. If you wish to hide it or any of its children, use their [member CanvasItem.visible] property.
func get_line_edit() -> LineEdit:
	pass;

#desc Returns the vertical box container of the dialog, custom controls can be added to it.
#desc [b]Warning:[/b] This is a required internal node, removing and freeing it may cause a crash. If you wish to hide it or any of its children, use their [member CanvasItem.visible] property.
func get_vbox() -> VBoxContainer:
	pass;

#desc Invalidate and update the current dialog content list.
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

func get_file_mode() -> int:
	return file_mode

func set_file_mode(value: int) -> void:
	file_mode = value

func get_filters() -> PackedStringArray:
	return filters

func set_filters(value: PackedStringArray) -> void:
	filters = value

func is_mode_overriding_title() -> bool:
	return mode_overrides_title

func set_mode_overrides_title(value: bool) -> void:
	mode_overrides_title = value

func get_root_subfolder() -> String:
	return root_subfolder

func set_root_subfolder(value: String) -> void:
	root_subfolder = value

func is_showing_hidden_files() -> bool:
	return show_hidden_files

func set_show_hidden_files(value: bool) -> void:
	show_hidden_files = value

func get_title() -> String:
	return title

func set_title(value: String) -> void:
	title = value

