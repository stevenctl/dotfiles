extends Resource
class_name GLTFSkin


var godot_skin: Skin:
	get = get_godot_skin, set = set_godot_skin

var joints: PackedInt32Array:
	get = get_joints, set = set_joints

var joints_original: PackedInt32Array:
	get = get_joints_original, set = set_joints_original

var non_joints: PackedInt32Array:
	get = get_non_joints, set = set_non_joints

var roots: PackedInt32Array:
	get = get_roots, set = set_roots

var skeleton: int:
	get = get_skeleton, set = set_skeleton

var skin_root: int:
	get = get_skin_root, set = set_skin_root



func get_inverse_binds() -> Array[Transform3D]:
	pass;

func get_joint_i_to_bone_i() -> Dictionary:
	pass;

func get_joint_i_to_name() -> Dictionary:
	pass;

func set_inverse_binds(inverse_binds: Transform3D[]) -> void:
	pass;

func set_joint_i_to_bone_i(joint_i_to_bone_i: Dictionary) -> void:
	pass;

func set_joint_i_to_name(joint_i_to_name: Dictionary) -> void:
	pass;


func get_godot_skin() -> Skin:
	return godot_skin

func set_godot_skin(value: Skin) -> void:
	godot_skin = value

func get_joints() -> PackedInt32Array:
	return joints

func set_joints(value: PackedInt32Array) -> void:
	joints = value

func get_joints_original() -> PackedInt32Array:
	return joints_original

func set_joints_original(value: PackedInt32Array) -> void:
	joints_original = value

func get_non_joints() -> PackedInt32Array:
	return non_joints

func set_non_joints(value: PackedInt32Array) -> void:
	non_joints = value

func get_roots() -> PackedInt32Array:
	return roots

func set_roots(value: PackedInt32Array) -> void:
	roots = value

func get_skeleton() -> int:
	return skeleton

func set_skeleton(value: int) -> void:
	skeleton = value

func get_skin_root() -> int:
	return skin_root

func set_skin_root(value: int) -> void:
	skin_root = value

