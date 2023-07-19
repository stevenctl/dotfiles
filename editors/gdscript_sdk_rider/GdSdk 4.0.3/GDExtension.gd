extends Resource
class_name GDExtension


#enum InitializationLevel
enum {
    INITIALIZATION_LEVEL_CORE = 0,
    INITIALIZATION_LEVEL_SERVERS = 1,
    INITIALIZATION_LEVEL_SCENE = 2,
    INITIALIZATION_LEVEL_EDITOR = 3,
}


func close_library() -> void:
	pass;

func get_minimum_library_initialization_level() -> int:
	pass;

func initialize_library(level: int) -> void:
	pass;

func is_library_open() -> bool:
	pass;

func open_library(path: String, entry_symbol: String) -> int:
	pass;


