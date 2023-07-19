extends VBoxContainer
#brief Editor dock for managing files in the project.
#desc This class is available only in [EditorPlugin]s and can't be instantiated. You can access it using [method EditorInterface.get_file_system_dock].
#desc While FileSystemDock doesn't expose any methods for file manipulation, you can listen for various file-related signals.
class_name FileSystemDock

#desc Emitted when the user switches file display mode or split mode.
signal display_mode_changed
#desc Emitted when the given [param file] was removed.
signal file_removed(file: String)
#desc Emitted when a file is moved from [param old_file] path to [param new_file] path.
signal files_moved(old_file: String, new_file: String)
#desc Emitted when a folder is moved from [param old_folder] path to [param new_folder] path.
signal folder_moved(old_folder: String, new_folder: String)
#desc Emitted when the given [param folder] was removed.
signal folder_removed(folder: String)
#desc Emitted when a new scene is created that inherits the scene at [param file] path.
signal inherit(file: String)
#desc Emitted when the given scenes are being instantiated in the editor.
signal instantiate(files: PackedStringArray)
#desc Emitted when an external [param resource] had its file removed.
signal resource_removed(resource: Resource)



#desc Sets the given [param path] as currently selected, ensuring that the selected file/directory is visible.
func navigate_to_path(path: String) -> void:
	pass;


