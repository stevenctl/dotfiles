extends Node3D
#brief RemoteTransform3D pushes its own [Transform3D] to another [Node3D] derived Node in the scene.
#desc RemoteTransform3D pushes its own [Transform3D] to another [Node3D] derived Node (called the remote node) in the scene.
#desc It can be set to update another Node's position, rotation and/or scale. It can use either global or local coordinates.
class_name RemoteTransform3D


#desc The [NodePath] to the remote node, relative to the RemoteTransform3D's position in the scene.
var remote_path: NodePath:
	get = get_remote_node, set = set_remote_node

#desc If [code]true[/code], the remote node's position is updated.
var update_position: bool:
	get = get_update_position, set = set_update_position

#desc If [code]true[/code], the remote node's rotation is updated.
var update_rotation: bool:
	get = get_update_rotation, set = set_update_rotation

#desc If [code]true[/code], the remote node's scale is updated.
var update_scale: bool:
	get = get_update_scale, set = set_update_scale

#desc If [code]true[/code], global coordinates are used. If [code]false[/code], local coordinates are used.
var use_global_coordinates: bool:
	get = get_use_global_coordinates, set = set_use_global_coordinates



#desc [RemoteTransform3D] caches the remote node. It may not notice if the remote node disappears; [method force_update_cache] forces it to update the cache again.
func force_update_cache() -> void:
	pass;


func get_remote_node() -> NodePath:
	return remote_path

func set_remote_node(value: NodePath) -> void:
	remote_path = value

func get_update_position() -> bool:
	return update_position

func set_update_position(value: bool) -> void:
	update_position = value

func get_update_rotation() -> bool:
	return update_rotation

func set_update_rotation(value: bool) -> void:
	update_rotation = value

func get_update_scale() -> bool:
	return update_scale

func set_update_scale(value: bool) -> void:
	update_scale = value

func get_use_global_coordinates() -> bool:
	return use_global_coordinates

func set_use_global_coordinates(value: bool) -> void:
	use_global_coordinates = value

