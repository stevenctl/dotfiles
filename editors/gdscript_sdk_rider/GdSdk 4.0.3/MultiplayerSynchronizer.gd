extends Node
#brief Synchronizes properties from the multiplayer authority to the remote peers.
#desc By default, [MultiplayerSynchronizer] synchronizes configured properties to all peers.
#desc Visibility can be handled directly with [method set_visibility_for] or as-needed with [method add_visibility_filter] and [method update_visibility].
#desc [MultiplayerSpawner]s will handle nodes according to visibility of synchronizers as long as the node at [member root_path] was spawned by one.
#desc Internally, [MultiplayerSynchronizer] uses [method MultiplayerAPI.object_configuration_add] to notify synchronization start passing the [Node] at [member root_path] as the [code]object[/code] and itself as the [code]configuration[/code], and uses [method MultiplayerAPI.object_configuration_remove] to notify synchronization end in a similar way.
class_name MultiplayerSynchronizer

#desc Emitted when a new synchronization state is received by this synchronizer after the variables have been updated.
signal synchronized
#desc Emitted when visibility of [code]for_peer[/code] is updated. See [method update_visibility].
signal visibility_changed(for_peer: int)
#desc Visibility filters are updated every idle process frame.
#desc Visibility filters are updated every physics process frame.
#desc Visibility filters are not updated automatically, and must be updated manually by calling [method update_visibility].

#enum VisibilityUpdateMode
enum {
    VISIBILITY_PROCESS_IDLE = 0,
    VISIBILITY_PROCESS_PHYSICS = 1,
    VISIBILITY_PROCESS_NONE = 2,
}
#desc Whether synchronization should be visible to all peers by default. See [method set_visibility_for] and [method add_visibility_filter] for ways of configuring fine-grained visibility options.
var public_visibility: bool:
	get = is_visibility_public, set = set_visibility_public

#desc Resource containing which properties to synchronize.
var replication_config: SceneReplicationConfig:
	get = get_replication_config, set = set_replication_config

#desc Time interval between synchronizes. When set to [code]0.0[/code] (the default), synchronizes happen every network process frame.
var replication_interval: float:
	get = get_replication_interval, set = set_replication_interval

#desc Node path that replicated properties are relative to.
#desc If [member root_path] was spawned by a [MultiplayerSpawner], the node will be also be spawned and despawned based on this synchronizer visibility options.
var root_path: NodePath:
	get = get_root_path, set = set_root_path

#desc Specifies when visibility filters are updated (see [enum VisibilityUpdateMode] for options).
var visibility_update_mode: int:
	get = get_visibility_update_mode, set = set_visibility_update_mode



#desc Adds a peer visibility filter for this synchronizer.
#desc [code]filter[/code] should take a peer ID [int] and return a [bool].
func add_visibility_filter(filter: Callable) -> void:
	pass;

#desc Queries the current visibility for peer [code]peer[/code].
func get_visibility_for(peer: int) -> bool:
	pass;

#desc Removes a peer visibility filter from this synchronizer.
func remove_visibility_filter(filter: Callable) -> void:
	pass;

#desc Sets the visibility of [code]peer[/code] to [code]visible[/code]. If [code]peer[/code] is [code]0[/code], the value of [member public_visibility] will be updated instead.
func set_visibility_for(peer: int, visible: bool) -> void:
	pass;

#desc Updates the visibility of [code]peer[/code] according to visibility filters. If [code]peer[/code] is [code]0[/code] (the default), all peers' visibilties are updated.
func update_visibility(for_peer: int = 0) -> void:
	pass;


func is_visibility_public() -> bool:
	return public_visibility

func set_visibility_public(value: bool) -> void:
	public_visibility = value

func get_replication_config() -> SceneReplicationConfig:
	return replication_config

func set_replication_config(value: SceneReplicationConfig) -> void:
	replication_config = value

func get_replication_interval() -> float:
	return replication_interval

func set_replication_interval(value: float) -> void:
	replication_interval = value

func get_root_path() -> NodePath:
	return root_path

func set_root_path(value: NodePath) -> void:
	root_path = value

func get_visibility_update_mode() -> int:
	return visibility_update_mode

func set_visibility_update_mode(value: int) -> void:
	visibility_update_mode = value

