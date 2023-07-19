extends RefCounted
#brief Saves a specific resource type to a file.
#desc The engine can save resources when you do it from the editor, or when you use the [ResourceSaver] singleton. This is accomplished thanks to multiple [ResourceFormatSaver]s, each handling its own format and called automatically by the engine.
#desc By default, Godot saves resources as [code].tres[/code] (text-based), [code].res[/code] (binary) or another built-in format, but you can choose to create your own format by extending this class. Be sure to respect the documented return types and values. You should give it a global class name with [code]class_name[/code] for it to be registered. Like built-in ResourceFormatSavers, it will be called automatically when saving resources of its recognized type(s). You may also implement a [ResourceFormatLoader].
class_name ResourceFormatSaver




#desc Returns the list of extensions available for saving the resource object, provided it is recognized (see [method _recognize]).
func _get_recognized_extensions(resource: Resource) -> PackedStringArray:
	pass;

#desc Returns whether the given resource object can be saved by this saver.
func _recognize(resource: Resource) -> bool:
	pass;

#desc Returns [code]true[/code] if this saver handles a given save path and [code]false[/code] otherwise.
#desc If this method is not implemented, the default behavior returns whether the path's extension is within the ones provided by [method _get_recognized_extensions].
func _recognize_path(resource: Resource, path: String) -> bool:
	pass;

#desc Saves the given resource object to a file at the target [param path]. [param flags] is a bitmask composed with [enum ResourceSaver.SaverFlags] constants.
#desc Returns [constant OK] on success, or an [enum Error] constant in case of failure.
func _save(resource: Resource, path: String, flags: int) -> int:
	pass;

#desc Sets a new UID for the resource at the given [param path]. Returns [constant OK] on success, or an [enum Error] constant in case of failure.
func _set_uid(path: String, uid: int) -> int:
	pass;


