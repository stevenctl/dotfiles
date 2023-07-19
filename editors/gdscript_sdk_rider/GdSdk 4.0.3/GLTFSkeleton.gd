extends Resource
class_name GLTFSkeleton


var joints: PackedInt32Array:
	get = get_joints, set = set_joints

var roots: PackedInt32Array:
	get = get_roots, set = set_roots



func get_bone_attachment(idx: int) -> BoneAttachment3D:
	pass;

func get_bone_attachment_count() -> int:
	pass;

func get_godot_bone_node() -> Dictionary:
	pass;

func get_godot_skeleton() -> Skeleton3D:
	pass;

func get_unique_names() -> Array[String]:
	pass;

func set_godot_bone_node(godot_bone_node: Dictionary) -> void:
	pass;

func set_unique_names(unique_names: String[]) -> void:
	pass;


func get_joints() -> PackedInt32Array:
	return joints

func set_joints(value: PackedInt32Array) -> void:
	joints = value

func get_roots() -> PackedInt32Array:
	return roots

func set_roots(value: PackedInt32Array) -> void:
	roots = value

