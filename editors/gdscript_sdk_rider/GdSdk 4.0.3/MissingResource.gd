extends Resource
#brief This is an internal editor class intended for keeping data of resources of unknown type.
#desc This is an internal editor class intended for keeping data of resources of unknown type (most likely this type was supplied by an extension that is no longer loaded). It can't be manually instantiated or placed in the scene. Ignore it if you don't know what it is.
class_name MissingResource


var original_class: String:
	get = get_original_class, set = set_original_class

var recording_properties: bool:
	get = is_recording_properties, set = set_recording_properties




func get_original_class() -> String:
	return original_class

func set_original_class(value: String) -> void:
	original_class = value

func is_recording_properties() -> bool:
	return recording_properties

func set_recording_properties(value: bool) -> void:
	recording_properties = value

