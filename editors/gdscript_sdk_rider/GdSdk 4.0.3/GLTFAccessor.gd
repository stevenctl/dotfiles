extends Resource
class_name GLTFAccessor


var buffer_view: int:
	get = get_buffer_view, set = set_buffer_view

var byte_offset: int:
	get = get_byte_offset, set = set_byte_offset

var component_type: int:
	get = get_component_type, set = set_component_type

var count: int:
	get = get_count, set = set_count

var max: PackedFloat64Array:
	get = get_max, set = set_max

var min: PackedFloat64Array:
	get = get_min, set = set_min

var normalized: bool:
	get = get_normalized, set = set_normalized

var sparse_count: int:
	get = get_sparse_count, set = set_sparse_count

var sparse_indices_buffer_view: int:
	get = get_sparse_indices_buffer_view, set = set_sparse_indices_buffer_view

var sparse_indices_byte_offset: int:
	get = get_sparse_indices_byte_offset, set = set_sparse_indices_byte_offset

var sparse_indices_component_type: int:
	get = get_sparse_indices_component_type, set = set_sparse_indices_component_type

var sparse_values_buffer_view: int:
	get = get_sparse_values_buffer_view, set = set_sparse_values_buffer_view

var sparse_values_byte_offset: int:
	get = get_sparse_values_byte_offset, set = set_sparse_values_byte_offset

var type: int:
	get = get_type, set = set_type




func get_buffer_view() -> int:
	return buffer_view

func set_buffer_view(value: int) -> void:
	buffer_view = value

func get_byte_offset() -> int:
	return byte_offset

func set_byte_offset(value: int) -> void:
	byte_offset = value

func get_component_type() -> int:
	return component_type

func set_component_type(value: int) -> void:
	component_type = value

func get_count() -> int:
	return count

func set_count(value: int) -> void:
	count = value

func get_max() -> PackedFloat64Array:
	return max

func set_max(value: PackedFloat64Array) -> void:
	max = value

func get_min() -> PackedFloat64Array:
	return min

func set_min(value: PackedFloat64Array) -> void:
	min = value

func get_normalized() -> bool:
	return normalized

func set_normalized(value: bool) -> void:
	normalized = value

func get_sparse_count() -> int:
	return sparse_count

func set_sparse_count(value: int) -> void:
	sparse_count = value

func get_sparse_indices_buffer_view() -> int:
	return sparse_indices_buffer_view

func set_sparse_indices_buffer_view(value: int) -> void:
	sparse_indices_buffer_view = value

func get_sparse_indices_byte_offset() -> int:
	return sparse_indices_byte_offset

func set_sparse_indices_byte_offset(value: int) -> void:
	sparse_indices_byte_offset = value

func get_sparse_indices_component_type() -> int:
	return sparse_indices_component_type

func set_sparse_indices_component_type(value: int) -> void:
	sparse_indices_component_type = value

func get_sparse_values_buffer_view() -> int:
	return sparse_values_buffer_view

func set_sparse_values_buffer_view(value: int) -> void:
	sparse_values_buffer_view = value

func get_sparse_values_byte_offset() -> int:
	return sparse_values_byte_offset

func set_sparse_values_byte_offset(value: int) -> void:
	sparse_values_byte_offset = value

func get_type() -> int:
	return type

func set_type(value: int) -> void:
	type = value

