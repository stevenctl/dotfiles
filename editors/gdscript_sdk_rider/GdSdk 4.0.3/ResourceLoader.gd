extends Object
#brief Singleton used to load resource files.
#desc Singleton used to load resource files from the filesystem.
#desc It uses the many [ResourceFormatLoader] classes registered in the engine (either built-in or from a plugin) to load files into memory and convert them to a format that can be used by the engine.
#desc [b]Note:[/b] You have to import the files into the engine first to load them using [method load]. If you want to load [Image]s at run-time, you may use [method Image.load]. If you want to import audio files, you can use the snippet described in [member AudioStreamMP3.data].
#tutorial [OS Test Demo] https://godotengine.org/asset-library/asset/677
class_name ResourceLoader

#desc The resource is invalid, or has not been loaded with [method load_threaded_request].
#desc The resource is still being loaded.
#desc Some error occurred during loading and it failed.
#desc The resource was loaded successfully and can be accessed via [method load_threaded_get].

#enum ThreadLoadStatus
enum {
    THREAD_LOAD_INVALID_RESOURCE = 0,
    THREAD_LOAD_IN_PROGRESS = 1,
    THREAD_LOAD_FAILED = 2,
    THREAD_LOAD_LOADED = 3,
}
#enum CacheMode
enum {
    CACHE_MODE_IGNORE = 0,
    CACHE_MODE_REUSE = 1,
    CACHE_MODE_REPLACE = 2,
}


#desc Registers a new [ResourceFormatLoader]. The ResourceLoader will use the ResourceFormatLoader as described in [method load].
#desc This method is performed implicitly for ResourceFormatLoaders written in GDScript (see [ResourceFormatLoader] for more information).
func add_resource_format_loader(format_loader: ResourceFormatLoader, at_front: bool = false) -> void:
	pass;

#desc Returns whether a recognized resource exists for the given [param path].
#desc An optional [param type_hint] can be used to further specify the [Resource] type that should be handled by the [ResourceFormatLoader]. Anything that inherits from [Resource] can be used as a type hint, for example [Image].
func exists(path: String, type_hint: String = "") -> bool:
	pass;

#desc Returns the dependencies for the resource at the given [param path].
func get_dependencies(path: String) -> PackedStringArray:
	pass;

#desc Returns the list of recognized extensions for a resource type.
func get_recognized_extensions_for_type(type: String) -> PackedStringArray:
	pass;

#desc Returns the ID associated with a given resource path, or [code]-1[/code] when no such ID exists.
func get_resource_uid(path: String) -> int:
	pass;

#desc Returns whether a cached resource is available for the given [param path].
#desc Once a resource has been loaded by the engine, it is cached in memory for faster access, and future calls to the [method load] method will use the cached version. The cached resource can be overridden by using [method Resource.take_over_path] on a new resource for that same path.
func has_cached(path: String) -> bool:
	pass;

#desc Loads a resource at the given [param path], caching the result for further access.
#desc The registered [ResourceFormatLoader]s are queried sequentially to find the first one which can handle the file's extension, and then attempt loading. If loading fails, the remaining ResourceFormatLoaders are also attempted.
#desc An optional [param type_hint] can be used to further specify the [Resource] type that should be handled by the [ResourceFormatLoader]. Anything that inherits from [Resource] can be used as a type hint, for example [Image].
#desc The [param cache_mode] property defines whether and how the cache should be used or updated when loading the resource. See [enum CacheMode] for details.
#desc Returns an empty resource if no [ResourceFormatLoader] could handle the file.
#desc GDScript has a simplified [method @GDScript.load] built-in method which can be used in most situations, leaving the use of [ResourceLoader] for more advanced scenarios.
#desc [b]Note:[/b] If [member ProjectSettings.editor/export/convert_text_resources_to_binary] is [code]true[/code], [method @GDScript.load] will not be able to read converted files in an exported project. If you rely on run-time loading of files present within the PCK, set [member ProjectSettings.editor/export/convert_text_resources_to_binary] to [code]false[/code].
func load(path: String, type_hint: String = "", cache_mode: int = 1) -> Resource:
	pass;

#desc Returns the resource loaded by [method load_threaded_request].
#desc If this is called before the loading thread is done (i.e. [method load_threaded_get_status] is not [constant THREAD_LOAD_LOADED]), the calling thread will be blocked until the resource has finished loading.
func load_threaded_get(path: String) -> Resource:
	pass;

#desc Returns the status of a threaded loading operation started with [method load_threaded_request] for the resource at [param path]. See [enum ThreadLoadStatus] for possible return values.
#desc An array variable can optionally be passed via [param progress], and will return a one-element array containing the percentage of completion of the threaded loading.
func load_threaded_get_status(path: String, progress: Array = []) -> int:
	pass;

#desc Loads the resource using threads. If [param use_sub_threads] is [code]true[/code], multiple threads will be used to load the resource, which makes loading faster, but may affect the main thread (and thus cause game slowdowns).
#desc The [param cache_mode] property defines whether and how the cache should be used or updated when loading the resource. See [enum CacheMode] for details.
func load_threaded_request(path: String, type_hint: String = "", use_sub_threads: bool = false, cache_mode: int = 1) -> int:
	pass;

#desc Unregisters the given [ResourceFormatLoader].
func remove_resource_format_loader(format_loader: ResourceFormatLoader) -> void:
	pass;

#desc Changes the behavior on missing sub-resources. The default behavior is to abort loading.
func set_abort_on_missing_resources(abort: bool) -> void:
	pass;


