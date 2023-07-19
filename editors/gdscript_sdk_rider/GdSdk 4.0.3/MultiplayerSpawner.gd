extends Node
#brief Automatically replicates spawnable nodes from the authority to other multiplayer peers.
#desc Spawnable scenes can be configured in the editor or through code (see [method add_spawnable_scene]).
#desc Also supports custom node spawns through [method spawn], calling [member spawn_function] on all peers.
#desc Internally, [MultiplayerSpawner] uses [method MultiplayerAPI.object_configuration_add] to notify spawns passing the spawned node as the [code]object[/code] and itself as the [code]configuration[/code], and [method MultiplayerAPI.object_configuration_remove] to notify despawns in a similar way.
class_name MultiplayerSpawner

#desc Emitted when a spawnable scene or custom spawn was despawned by the multiplayer authority. Only called on puppets.
signal despawned(node: Node)
#desc Emitted when a spawnable scene or custom spawn was spawned by the multiplayer authority. Only called on puppets.
signal spawned(node: Node)

#desc Method called on all peers when for every custom [method spawn] requested by the authority. Will receive the [code]data[/code] parameter, and should return a [Node] that is not in the scene tree.
#desc [b]Note:[/b] The returned node should [b]not[/b] be added to the scene with [method Node.add_child]. This is done automatically.
var spawn_function: Callable:
	get = get_spawn_function, set = set_spawn_function

#desc Maximum nodes that is allowed to be spawned by this spawner. Includes both spawnable scenes and custom spawns.
#desc When set to [code]0[/code] (the default), there is no limit.
var spawn_limit: int:
	get = get_spawn_limit, set = set_spawn_limit

#desc Path to the spawn root. Spawnable scenes that are added as direct children are replicated to other peers.
var spawn_path: NodePath:
	get = get_spawn_path, set = set_spawn_path



#desc Adds a scene path to spawnable scenes, making it automatically replicated from the multiplayer authority to other peers when added as children of the node pointed by [member spawn_path].
func add_spawnable_scene(path: String) -> void:
	pass;

#desc Clears all spawnable scenes. Does not despawn existing instances on remote peers.
func clear_spawnable_scenes() -> void:
	pass;

#desc Returns the spawnable scene path by index.
func get_spawnable_scene(index: int) -> String:
	pass;

#desc Returns the count of spawnable scene paths.
func get_spawnable_scene_count() -> int:
	pass;

#desc Requests a custom spawn, with [code]data[/code] passed to [member spawn_function] on all peers. Returns the locally spawned node instance already inside the scene tree, and added as a child of the node pointed by [member spawn_path].
#desc [b]Note:[/b] Spawnable scenes are spawned automatically. [method spawn] is only needed for custom spawns.
func spawn(data: Variant = null) -> Node:
	pass;


func get_spawn_function() -> Callable:
	return spawn_function

func set_spawn_function(value: Callable) -> void:
	spawn_function = value

func get_spawn_limit() -> int:
	return spawn_limit

func set_spawn_limit(value: int) -> void:
	spawn_limit = value

func get_spawn_path() -> NodePath:
	return spawn_path

func set_spawn_path(value: NodePath) -> void:
	spawn_path = value

