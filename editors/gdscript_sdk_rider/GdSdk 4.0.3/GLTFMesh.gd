extends Resource
class_name GLTFMesh


var blend_weights: PackedFloat32Array:
	get = get_blend_weights, set = set_blend_weights

var instance_materials: Array[Material]:
	get = get_instance_materials, set = set_instance_materials

var mesh: ImporterMesh:
	get = get_mesh, set = set_mesh




func get_blend_weights() -> PackedFloat32Array:
	return blend_weights

func set_blend_weights(value: PackedFloat32Array) -> void:
	blend_weights = value

func get_instance_materials() -> Array[Material]:
	return instance_materials

func set_instance_materials(value: Array[Material]) -> void:
	instance_materials = value

func get_mesh() -> ImporterMesh:
	return mesh

func set_mesh(value: ImporterMesh) -> void:
	mesh = value

