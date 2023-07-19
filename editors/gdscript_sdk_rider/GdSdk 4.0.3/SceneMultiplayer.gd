extends MultiplayerAPI
#brief High-level multiplayer API implementation.
#desc This class is the default implementation of [MultiplayerAPI], used to provide multiplayer functionalities in Godot Engine.
#desc This implementation supports RPCs via [method Node.rpc] and [method Node.rpc_id] and requires [method MultiplayerAPI.rpc] to be passed a [Node] (it will fail for other object types).
#desc This implementation additionally provide [SceneTree] replication via the [MultiplayerSpawner] and [MultiplayerSynchronizer] nodes, and the [SceneReplicationConfig] resource.
#desc [b]Note:[/b] The high-level multiplayer API protocol is an implementation detail and isn't meant to be used by non-Godot servers. It may change without notice.
#desc [b]Note:[/b] When exporting to Android, make sure to enable the [code]INTERNET[/code] permission in the Android export preset before exporting the project or using one-click deploy. Otherwise, network communication of any kind will be blocked by Android.
class_name SceneMultiplayer

#desc Emitted when this MultiplayerAPI's [member MultiplayerAPI.multiplayer_peer] connects to a new peer and a valid [member auth_callback] is set. In this case, the [signal MultiplayerAPI.peer_connected] will not be emitted until [method complete_auth] is called with given peer [param id]. While in this state, the peer will not be included in the list returned by [method MultiplayerAPI.get_peers] (but in the one returned by [method get_authenticating_peers]), and only authentication data will be sent or received. See [method send_auth] for sending authentication data.
signal peer_authenticating(id: int)
#desc Emitted when this MultiplayerAPI's [member MultiplayerAPI.multiplayer_peer] disconnects from a peer for which authentication had not yet completed. See [signal peer_authenticating].
signal peer_authentication_failed(id: int)
#desc Emitted when this MultiplayerAPI's [member MultiplayerAPI.multiplayer_peer] receives a [code]packet[/code] with custom data (see [method send_bytes]). ID is the peer ID of the peer that sent the packet.
signal peer_packet(id: int, packet: PackedByteArray)

#desc If [code]true[/code], the MultiplayerAPI will allow encoding and decoding of object during RPCs.
#desc [b]Warning:[/b] Deserialized objects can contain code which gets executed. Do not use this option if the serialized object comes from untrusted sources to avoid potential security threat such as remote code execution.
var allow_object_decoding: bool:
	get = is_object_decoding_allowed, set = set_allow_object_decoding

#desc The callback to execute when when receiving authentication data sent via [method send_auth]. If the [Callable] is empty (default), peers will be automatically accepted as soon as they connect.
var auth_callback: Callable:
	get = get_auth_callback, set = set_auth_callback

#desc If set to a value greater than [code]0.0[/code], the maximum amount of time peers can stay in the authenticating state, after which the authentication will automatically fail. See the [signal peer_authenticating] and [signal peer_authentication_failed] signals.
var auth_timeout: float:
	get = get_auth_timeout, set = set_auth_timeout

#desc If [code]true[/code], the MultiplayerAPI's [member MultiplayerAPI.multiplayer_peer] refuses new incoming connections.
var refuse_new_connections: bool:
	get = is_refusing_new_connections, set = set_refuse_new_connections

#desc The root path to use for RPCs and replication. Instead of an absolute path, a relative path will be used to find the node upon which the RPC should be executed.
#desc This effectively allows to have different branches of the scene tree to be managed by different MultiplayerAPI, allowing for example to run both client and server in the same scene.
var root_path: NodePath:
	get = get_root_path, set = set_root_path

#desc Enable or disable the server feature that notifies clients of other peers' connection/disconnection, and relays messages between them. When this option is [code]false[/code], clients won't be automatically notified of other peers and won't be able to send them packets through the server.
#desc [b]Note:[/b] Changing this option while other peers are connected may lead to unexpected behaviors.
#desc [b]Note:[/b] Support for this feature may depend on the current [MultiplayerPeer] configuration. See [method MultiplayerPeer.is_server_relay_supported].
var server_relay: bool:
	get = is_server_relay_enabled, set = set_server_relay_enabled



#desc Clears the current SceneMultiplayer network state (you shouldn't call this unless you know what you are doing).
func clear() -> void:
	pass;

#desc Mark the authentication step as completed for the remote peer identified by [param id]. The [signal MultiplayerAPI.peer_connected] signal will be emitted for this peer once the remote side also completes the authentication. No further authentication messages are expected to be received from this peer.
#desc If a peer disconnects before completing authentication, either due to a network issue, the [member auth_timeout] expiring, or manually calling [method disconnect_peer], the [signal peer_authentication_failed] signal will be emitted instead of [signal MultiplayerAPI.peer_disconnected].
func complete_auth(id: int) -> int:
	pass;

#desc Disconnects the peer identified by [param id], removing it from the list of connected peers, and closing the underlying connection with it.
func disconnect_peer(id: int) -> void:
	pass;

#desc Returns the IDs of the peers currently trying to authenticate with this [MultiplayerAPI].
func get_authenticating_peers() -> PackedInt32Array:
	pass;

#desc Sends the specified [param data] to the remote peer identified by [param id] as part of an authentication message. This can be used to authenticate peers, and control when [signal MultiplayerAPI.peer_connected] is emitted (and the remote peer accepted as one of the connected peers).
func send_auth(id: int, data: PackedByteArray) -> int:
	pass;

#desc Sends the given raw [code]bytes[/code] to a specific peer identified by [code]id[/code] (see [method MultiplayerPeer.set_target_peer]). Default ID is [code]0[/code], i.e. broadcast to all peers.
func send_bytes(bytes: PackedByteArray, id: int = 0, mode: int = 2, channel: int = 0) -> int:
	pass;


func is_object_decoding_allowed() -> bool:
	return allow_object_decoding

func set_allow_object_decoding(value: bool) -> void:
	allow_object_decoding = value

func get_auth_callback() -> Callable:
	return auth_callback

func set_auth_callback(value: Callable) -> void:
	auth_callback = value

func get_auth_timeout() -> float:
	return auth_timeout

func set_auth_timeout(value: float) -> void:
	auth_timeout = value

func is_refusing_new_connections() -> bool:
	return refuse_new_connections

func set_refuse_new_connections(value: bool) -> void:
	refuse_new_connections = value

func get_root_path() -> NodePath:
	return root_path

func set_root_path(value: NodePath) -> void:
	root_path = value

func is_server_relay_enabled() -> bool:
	return server_relay

func set_server_relay_enabled(value: bool) -> void:
	server_relay = value

