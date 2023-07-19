extends RefCounted
#brief Shader uniform (used by [RenderingDevice]).
#desc This object is used by [RenderingDevice].
class_name RDUniform


#desc The uniform's binding.
var binding: int:
	get = get_binding, set = set_binding

#desc The uniform's data type.
var uniform_type: int:
	get = get_uniform_type, set = set_uniform_type



func add_id(id: RID) -> void:
	pass;

func clear_ids() -> void:
	pass;

func get_ids() -> Array[RID]:
	pass;


func get_binding() -> int:
	return binding

func set_binding(value: int) -> void:
	binding = value

func get_uniform_type() -> int:
	return uniform_type

func set_uniform_type(value: int) -> void:
	uniform_type = value

