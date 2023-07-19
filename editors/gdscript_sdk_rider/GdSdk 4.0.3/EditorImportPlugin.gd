extends ResourceImporter
#brief Registers a custom resource importer in the editor. Use the class to parse any file and import it as a new resource type.
#desc [EditorImportPlugin]s provide a way to extend the editor's resource import functionality. Use them to import resources from custom files or to provide alternatives to the editor's existing importers.
#desc EditorImportPlugins work by associating with specific file extensions and a resource type. See [method _get_recognized_extensions] and [method _get_resource_type]. They may optionally specify some import presets that affect the import process. EditorImportPlugins are responsible for creating the resources and saving them in the [code].godot/imported[/code] directory (see [member ProjectSettings.application/config/use_hidden_project_data_directory]).
#desc Below is an example EditorImportPlugin that imports a [Mesh] from a file with the extension ".special" or ".spec":
#desc [codeblocks]
#desc [gdscript]
#desc @tool
#desc extends EditorImportPlugin
#desc 
#desc func _get_importer_name():
#desc return "my.special.plugin"
#desc 
#desc func _get_visible_name():
#desc return "Special Mesh"
#desc 
#desc func _get_recognized_extensions():
#desc return ["special", "spec"]
#desc 
#desc func _get_save_extension():
#desc return "mesh"
#desc 
#desc func _get_resource_type():
#desc return "Mesh"
#desc 
#desc func _get_preset_count():
#desc return 1
#desc 
#desc func _get_preset_name(i):
#desc return "Default"
#desc 
#desc func _get_import_options(i):
#desc return [{"name": "my_option", "default_value": false}]
#desc 
#desc func _import(source_file, save_path, options, platform_variants, gen_files):
#desc var file = FileAccess.open(source_file, FileAccess.READ)
#desc if file == null:
#desc return FAILED
#desc var mesh = ArrayMesh.new()
#desc # Fill the Mesh with data read in "file", left as an exercise to the reader.
#desc 
#desc var filename = save_path + "." + _get_save_extension()
#desc return ResourceSaver.save(mesh, filename)
#desc [/gdscript]
#desc [csharp]
#desc using Godot;
#desc 
#desc public partial class MySpecialPlugin : EditorImportPlugin
#desc {
#desc public override string _GetImporterName()
#desc {
#desc return "my.special.plugin";
#desc }
#desc 
#desc public override string _GetVisibleName()
#desc {
#desc return "Special Mesh";
#desc }
#desc 
#desc public override string[] _GetRecognizedExtensions()
#desc {
#desc return new string[] { "special", "spec" };
#desc }
#desc 
#desc public override string _GetSaveExtension()
#desc {
#desc return "mesh";
#desc }
#desc 
#desc public override string _GetResourceType()
#desc {
#desc return "Mesh";
#desc }
#desc 
#desc public override int _GetPresetCount()
#desc {
#desc return 1;
#desc }
#desc 
#desc public override string _GetPresetName(int presetIndex)
#desc {
#desc return "Default";
#desc }
#desc 
#desc public override Godot.Collections.Array<Godot.Collections.Dictionary> _GetImportOptions(string path, int presetIndex)
#desc {
#desc return new Godot.Collections.Array<Godot.Collections.Dictionary>
#desc {
#desc new Godot.Collections.Dictionary
#desc {
#desc { "name", "myOption" },
#desc { "defaultValue", false },
#desc }
#desc };
#desc }
#desc 
#desc public override int _Import(string sourceFile, string savePath, Godot.Collections.Dictionary options, Godot.Collections.Array<string> platformVariants, Godot.Collections.Array<string> genFiles)
#desc {
#desc using var file = FileAccess.Open(sourceFile, FileAccess.ModeFlags.Read);
#desc if (file.GetError() != Error.Ok)
#desc {
#desc return (int)Error.Failed;
#desc }
#desc 
#desc var mesh = new ArrayMesh();
#desc // Fill the Mesh with data read in "file", left as an exercise to the reader.
#desc string filename = $"{savePath}.{_GetSaveExtension()}";
#desc return (int)ResourceSaver.Save(mesh, filename);
#desc }
#desc }
#desc [/csharp]
#desc [/codeblocks]
#desc To use [EditorImportPlugin], register it using the [method EditorPlugin.add_import_plugin] method first.
#tutorial [Import plugins] https://docs.godotengine.org/en/stable/tutorials/plugins/editor/import_plugins.html
class_name EditorImportPlugin




#desc Gets the options and default values for the preset at this index. Returns an Array of Dictionaries with the following keys: [code]name[/code], [code]default_value[/code], [code]property_hint[/code] (optional), [code]hint_string[/code] (optional), [code]usage[/code] (optional).
func _get_import_options(path: String, preset_index: int) -> Array[Dictionary]:
	pass;

#desc Gets the order of this importer to be run when importing resources. Importers with [i]lower[/i] import orders will be called first, and higher values will be called later. Use this to ensure the importer runs after the dependencies are already imported. The default import order is [code]0[/code] unless overridden by a specific importer. See [enum ResourceImporter.ImportOrder] for some predefined values.
func _get_import_order() -> int:
	pass;

#desc Gets the unique name of the importer.
func _get_importer_name() -> String:
	pass;

#desc This method can be overridden to hide specific import options if conditions are met. This is mainly useful for hiding options that depend on others if one of them is disabled. For example:
#desc [codeblocks]
#desc [gdscript]
#desc func _get_option_visibility(option, options):
#desc # Only show the lossy quality setting if the compression mode is set to "Lossy".
#desc if option == "compress/lossy_quality" and options.has("compress/mode"):
#desc return int(options["compress/mode"]) == COMPRESS_LOSSY # This is a constant that you set
#desc 
#desc return true
#desc [/gdscript]
#desc [csharp]
#desc public void GetOptionVisibility(string option, Godot.Collections.Dictionary options)
#desc {
#desc // Only show the lossy quality setting if the compression mode is set to "Lossy".
#desc if (option == "compress/lossyQuality" && options.Contains("compress/mode"))
#desc {
#desc return (int)options["compress/mode"] == COMPRESS_LOSSY; // This is a constant you set
#desc }
#desc 
#desc return true;
#desc }
#desc [/csharp]
#desc [/codeblocks]
#desc Returns [code]true[/code] to make all options always visible.
func _get_option_visibility(path: String, option_name: StringName, options: Dictionary) -> bool:
	pass;

#desc Gets the number of initial presets defined by the plugin. Use [method _get_import_options] to get the default options for the preset and [method _get_preset_name] to get the name of the preset.
func _get_preset_count() -> int:
	pass;

#desc Gets the name of the options preset at this index.
func _get_preset_name(preset_index: int) -> String:
	pass;

#desc Gets the priority of this plugin for the recognized extension. Higher priority plugins will be preferred. The default priority is [code]1.0[/code].
func _get_priority() -> float:
	pass;

#desc Gets the list of file extensions to associate with this loader (case-insensitive). e.g. [code]["obj"][/code].
func _get_recognized_extensions() -> PackedStringArray:
	pass;

#desc Gets the Godot resource type associated with this loader. e.g. [code]"Mesh"[/code] or [code]"Animation"[/code].
func _get_resource_type() -> String:
	pass;

#desc Gets the extension used to save this resource in the [code].godot/imported[/code] directory (see [member ProjectSettings.application/config/use_hidden_project_data_directory]).
func _get_save_extension() -> String:
	pass;

#desc Gets the name to display in the import window. You should choose this name as a continuation to "Import as", e.g. "Import as Special Mesh".
func _get_visible_name() -> String:
	pass;

#desc Imports [param source_file] into [param save_path] with the import [param options] specified. The [param platform_variants] and [param gen_files] arrays will be modified by this function.
#desc This method must be overridden to do the actual importing work. See this class' description for an example of overriding this method.
func _import(source_file: String, save_path: String, options: Dictionary, platform_variants: String[], gen_files: String[]) -> int:
	pass;

#desc This function can only be called during the [method _import] callback and it allows manually importing resources from it. This is useful when the imported file generates external resources that require importing (as example, images). Custom parameters for the ".import" file can be passed via the [param custom_options]. Additionally, in cases where multiple importers can handle a file, the [param custom_importer] ca be specified to force a specific one. This function performs a resource import and returns immediately with a success or error code. [param generator_parameters] defines optional extra metadata which will be stored as [code]generator_parameters[/code] in the [code]remap[/code] section of the [code].import[/code] file, for example to store a md5 hash of the source data.
func append_import_external_resource(path: String, custom_options: Dictionary = {}, custom_importer: String = "", generator_parameters: Variant = null) -> int:
	pass;


