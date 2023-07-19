extends Object
class_name GDExtensionManager


#enum LoadStatus
enum {
    LOAD_STATUS_OK = 0,
    LOAD_STATUS_FAILED = 1,
    LOAD_STATUS_ALREADY_LOADED = 2,
    LOAD_STATUS_NOT_LOADED = 3,
    LOAD_STATUS_NEEDS_RESTART = 4,
}


func get_extension(path: String) -> GDExtension:
	pass;

func get_loaded_extensions() -> PackedStringArray:
	pass;

func is_extension_loaded(path: String) -> bool:
	pass;

func load_extension(path: String) -> int:
	pass;

func reload_extension(path: String) -> int:
	pass;

func unload_extension(path: String) -> int:
	pass;


