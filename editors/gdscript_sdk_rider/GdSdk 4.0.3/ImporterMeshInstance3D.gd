extends Node3D
class_name ImporterMeshInstance3D


var mesh: ImporterMesh:
	get = get_mesh, set = set_mesh

var skeleton_path: NodePath:
	get = get_skeleton_path, set = set_skeleton_path

var skin: Skin:
	get = get_skin, set = set_skin




func get_mesh() -> ImporterMesh:
	return mesh

func set_mesh(value: ImporterMesh) -> void:
	mesh = value

func get_skeleton_path() -> NodePath:
	return skeleton_path

func set_skeleton_path(value: NodePath) -> void:
	skeleton_path = value

func get_skin() -> Skin:
	return skin

func set_skin(value: Skin) -> void:
	skin = value

