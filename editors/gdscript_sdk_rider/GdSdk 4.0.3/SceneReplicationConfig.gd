extends Resource
#brief Configuration for properties to synchronize with a [MultiplayerSynchronizer].
class_name SceneReplicationConfig




#desc Adds the property identified by the given [code]path[/code] to the list of the properties being synchronized, optionally passing an [code]index[/code].
func add_property(path: NodePath, index: int = -1) -> void:
	pass;

#desc Returns a list of synchronized property [NodePath]s.
func get_properties() -> Array[NodePath]:
	pass;

#desc Returns whether the given [code]path[/code] is configured for synchronization.
func has_property(path: NodePath) -> bool:
	pass;

#desc Finds the index of the given [code]path[/code].
func property_get_index(path: NodePath) -> int:
	pass;

#desc Returns whether the property identified by the given [code]path[/code] is configured to be synchronized on spawn.
func property_get_spawn(path: NodePath) -> bool:
	pass;

#desc Returns whether the property identified by the given [code]path[/code] is configured to be synchronized on process.
func property_get_sync(path: NodePath) -> bool:
	pass;

#desc Sets whether the property identified by the given [code]path[/code] is configured to be synchronized on spawn.
func property_set_spawn(path: NodePath, enabled: bool) -> void:
	pass;

#desc Sets whether the property identified by the given [code]path[/code] is configured to be synchronized on process.
func property_set_sync(path: NodePath, enabled: bool) -> void:
	pass;

#desc Removes the property identified by the given [code]path[/code] from the configuration.
func remove_property(path: NodePath) -> void:
	pass;


