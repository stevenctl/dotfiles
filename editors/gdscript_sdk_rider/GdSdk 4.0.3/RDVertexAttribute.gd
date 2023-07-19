extends RefCounted
#brief Vertex attribute (used by [RenderingDevice]).
#desc This object is used by [RenderingDevice].
class_name RDVertexAttribute


var format: int:
	get = get_format, set = set_format

var frequency: int:
	get = get_frequency, set = set_frequency

var location: int:
	get = get_location, set = set_location

var offset: int:
	get = get_offset, set = set_offset

var stride: int:
	get = get_stride, set = set_stride




func get_format() -> int:
	return format

func set_format(value: int) -> void:
	format = value

func get_frequency() -> int:
	return frequency

func set_frequency(value: int) -> void:
	frequency = value

func get_location() -> int:
	return location

func set_location(value: int) -> void:
	location = value

func get_offset() -> int:
	return offset

func set_offset(value: int) -> void:
	offset = value

func get_stride() -> int:
	return stride

func set_stride(value: int) -> void:
	stride = value

