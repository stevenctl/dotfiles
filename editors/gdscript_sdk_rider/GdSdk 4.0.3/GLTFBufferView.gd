extends Resource
class_name GLTFBufferView


var buffer: int:
	get = get_buffer, set = set_buffer

var byte_length: int:
	get = get_byte_length, set = set_byte_length

var byte_offset: int:
	get = get_byte_offset, set = set_byte_offset

var byte_stride: int:
	get = get_byte_stride, set = set_byte_stride

var indices: bool:
	get = get_indices, set = set_indices




func get_buffer() -> int:
	return buffer

func set_buffer(value: int) -> void:
	buffer = value

func get_byte_length() -> int:
	return byte_length

func set_byte_length(value: int) -> void:
	byte_length = value

func get_byte_offset() -> int:
	return byte_offset

func set_byte_offset(value: int) -> void:
	byte_offset = value

func get_byte_stride() -> int:
	return byte_stride

func set_byte_stride(value: int) -> void:
	byte_stride = value

func get_indices() -> bool:
	return indices

func set_indices(value: bool) -> void:
	indices = value

