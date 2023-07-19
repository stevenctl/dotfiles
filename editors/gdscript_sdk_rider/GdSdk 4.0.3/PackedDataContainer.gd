extends Resource
class_name PackedDataContainer


var __data__: PackedByteArray:
	get = _get_data, set = _set_data



func pack(value: Variant) -> int:
	pass;

func size() -> int:
	pass;


func _get_data() -> PackedByteArray:
	return __data__

func _set_data(value: PackedByteArray) -> void:
	__data__ = value

