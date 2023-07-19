extends Object
#brief Contains global variables accessible from everywhere.
#desc Contains global variables accessible from everywhere. Use [method get_setting], [method set_setting] or [method has_setting] to access them. Variables stored in [code]project.godot[/code] are also loaded into ProjectSettings, making this object very useful for reading custom game configuration options.
#desc When naming a Project Settings property, use the full path to the setting including the category. For example, [code]"application/config/name"[/code] for the project name. Category and property names can be viewed in the Project Settings dialog.
#desc [b]Feature tags:[/b] Project settings can be overridden for specific platforms and configurations (debug, release, ...) using [url=$DOCS_URL/tutorials/export/feature_tags.html]feature tags[/url].
#desc [b]Overriding:[/b] Any project setting can be overridden by creating a file named [code]override.cfg[/code] in the project's root directory. This can also be used in exported projects by placing this file in the same directory as the project binary. Overriding will still take the base project settings' [url=$DOCS_URL/tutorials/export/feature_tags.html]feature tags[/url] in account. Therefore, make sure to [i]also[/i] override the setting with the desired feature tags if you want them to override base project settings on all platforms and configurations.
#tutorial [3D Physics Tests Demo] https://godotengine.org/asset-library/asset/675
#tutorial [3D Platformer Demo] https://godotengine.org/asset-library/asset/125
#tutorial [OS Test Demo] https://godotengine.org/asset-library/asset/677
class_name ProjectSettings



#desc Adds a custom property info to a property. The dictionary must contain:
#desc - [code]name[/code]: [String] (the property's name)
#desc - [code]type[/code]: [int] (see [enum Variant.Type])
#desc - optionally [code]hint[/code]: [int] (see [enum PropertyHint]) and [code]hint_string[/code]: [String]
#desc [b]Example:[/b]
#desc [codeblocks]
#desc [gdscript]
#desc ProjectSettings.set("category/property_name", 0)
#desc 
#desc var property_info = {
#desc "name": "category/property_name",
#desc "type": TYPE_INT,
#desc "hint": PROPERTY_HINT_ENUM,
#desc "hint_string": "one,two,three"
#desc }
#desc 
#desc ProjectSettings.add_property_info(property_info)
#desc [/gdscript]
#desc [csharp]
#desc ProjectSettings.Singleton.Set("category/property_name", 0);
#desc 
#desc var propertyInfo = new Godot.Collections.Dictionary
#desc {
#desc {"name", "category/propertyName"},
#desc {"type", Variant.Type.Int},
#desc {"hint", PropertyHint.Enum},
#desc {"hint_string", "one,two,three"},
#desc };
#desc 
#desc ProjectSettings.AddPropertyInfo(propertyInfo);
#desc [/csharp]
#desc [/codeblocks]
func add_property_info(hint: Dictionary) -> void:
	pass;

#desc Clears the whole configuration (not recommended, may break things).
func clear(name: String) -> void:
	pass;

#desc Returns an [Array] of registered global classes. Each global class is represented as a [Dictionary] that contains the following entries:
#desc - [code]base[/code] is a name of the base class;
#desc - [code]class[/code] is a name of the registered global class;
#desc - [code]icon[/code] is a path to a custom icon of the global class, if it has any;
#desc - [code]language[/code] is a name of a programming language in which the global class is written;
#desc - [code]path[/code] is a path to a file containing the global class.
#desc [b]Note:[/b] Both the script and the icon paths are local to the project filesystem, i.e. they start with [code]res://[/code].
func get_global_class_list() -> Array[Dictionary]:
	pass;

#desc Returns the order of a configuration value (influences when saved to the config file).
func get_order(name: String) -> int:
	pass;

#desc Returns the value of the setting identified by [param name]. If the setting doesn't exist and [param default_value] is specified, the value of [param default_value] is returned. Otherwise, [code]null[/code] is returned.
#desc [b]Example:[/b]
#desc [codeblocks]
#desc [gdscript]
#desc print(ProjectSettings.get_setting("application/config/name"))
#desc print(ProjectSettings.get_setting("application/config/custom_description", "No description specified."))
#desc [/gdscript]
#desc [csharp]
#desc GD.Print(ProjectSettings.GetSetting("application/config/name"));
#desc GD.Print(ProjectSettings.GetSetting("application/config/custom_description", "No description specified."));
#desc [/csharp]
#desc [/codeblocks]
#desc [b]Note:[/b] This method doesn't take potential feature overrides into account automatically. Use [method get_setting_with_override] to handle seamlessly.
func get_setting(name: String, default_value: Variant = null) -> Variant:
	pass;

#desc Similar to [method get_setting], but applies feature tag overrides if any exists and is valid.
#desc [b]Example:[/b]
#desc If the following setting override exists "application/config/name.windows", and the following code is executed:
#desc [codeblocks]
#desc [gdscript]
#desc print(ProjectSettings.get_setting_with_override("application/config/name"))
#desc [/gdscript]
#desc [csharp]
#desc GD.Print(ProjectSettings.GetSettingWithOverride("application/config/name"));
#desc [/csharp]
#desc [/codeblocks]
#desc Then the overridden setting will be returned instead if the project is running on the [i]Windows[/i] operating system.
func get_setting_with_override(name: StringName) -> Variant:
	pass;

#desc Returns the absolute, native OS path corresponding to the localized [param path] (starting with [code]res://[/code] or [code]user://[/code]). The returned path will vary depending on the operating system and user preferences. See [url=$DOCS_URL/tutorials/io/data_paths.html]File paths in Godot projects[/url] to see what those paths convert to. See also [method localize_path].
#desc [b]Note:[/b] [method globalize_path] with [code]res://[/code] will not work in an exported project. Instead, prepend the executable's base directory to the path when running from an exported project:
#desc [codeblock]
#desc var path = ""
#desc if OS.has_feature("editor"):
#desc # Running from an editor binary.
#desc # `path` will contain the absolute path to `hello.txt` located in the project root.
#desc path = ProjectSettings.globalize_path("res://hello.txt")
#desc else:
#desc # Running from an exported project.
#desc # `path` will contain the absolute path to `hello.txt` next to the executable.
#desc # This is *not* identical to using `ProjectSettings.globalize_path()` with a `res://` path,
#desc # but is close enough in spirit.
#desc path = OS.get_executable_path().get_base_dir().path_join("hello.txt")
#desc [/codeblock]
func globalize_path(path: String) -> String:
	pass;

#desc Returns [code]true[/code] if a configuration value is present.
func has_setting(name: String) -> bool:
	pass;

#desc Loads the contents of the .pck or .zip file specified by [param pack] into the resource filesystem ([code]res://[/code]). Returns [code]true[/code] on success.
#desc [b]Note:[/b] If a file from [param pack] shares the same path as a file already in the resource filesystem, any attempts to load that file will use the file from [param pack] unless [param replace_files] is set to [code]false[/code].
#desc [b]Note:[/b] The optional [param offset] parameter can be used to specify the offset in bytes to the start of the resource pack. This is only supported for .pck files.
func load_resource_pack(pack: String, replace_files: bool = true, offset: int = 0) -> bool:
	pass;

#desc Returns the localized path (starting with [code]res://[/code]) corresponding to the absolute, native OS [param path]. See also [method globalize_path].
func localize_path(path: String) -> String:
	pass;

#desc Saves the configuration to the [code]project.godot[/code] file.
#desc [b]Note:[/b] This method is intended to be used by editor plugins, as modified [ProjectSettings] can't be loaded back in the running app. If you want to change project settings in exported projects, use [method save_custom] to save [code]override.cfg[/code] file.
func save() -> int:
	pass;

#desc Saves the configuration to a custom file. The file extension must be [code].godot[/code] (to save in text-based [ConfigFile] format) or [code].binary[/code] (to save in binary format). You can also save [code]override.cfg[/code] file, which is also text, but can be used in exported projects unlike other formats.
func save_custom(file: String) -> int:
	pass;

#desc Sets the specified property's initial value. This is the value the property reverts to.
func set_initial_value(name: String, value: Variant) -> void:
	pass;

#desc Sets the order of a configuration value (influences when saved to the config file).
func set_order(name: String, position: int) -> void:
	pass;

#desc Sets whether a setting requires restarting the editor to properly take effect.
#desc [b]Note:[/b] This is just a hint to display to the user that the editor must be restarted for changes to take effect. Enabling [method set_restart_if_changed] does [i]not[/i] delay the setting being set when changed.
func set_restart_if_changed(name: String, restart: bool) -> void:
	pass;

#desc Sets the value of a setting.
#desc [b]Example:[/b]
#desc [codeblocks]
#desc [gdscript]
#desc ProjectSettings.set_setting("application/config/name", "Example")
#desc [/gdscript]
#desc [csharp]
#desc ProjectSettings.SetSetting("application/config/name", "Example");
#desc [/csharp]
#desc [/codeblocks]
#desc This can also be used to erase custom project settings. To do this change the setting value to [code]null[/code].
func set_setting(name: String, value: Variant) -> void:
	pass;


