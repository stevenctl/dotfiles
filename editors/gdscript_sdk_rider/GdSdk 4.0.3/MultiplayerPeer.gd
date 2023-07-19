extends PacketPeer
#brief Abstract class for specialized [PacketPeer]s used by the [MultiplayerAPI].
#desc Manages the connection with one or more remote peers acting as server or client and assigning unique IDs to each of them. See also [MultiplayerAPI].
#desc [b]Note:[/b] The [MultiplayerAPI] protocol is an implementation detail and isn't meant to be used by non-Godot servers. It may change without notice.
#desc [b]Note:[/b] When exporting to Android, make sure to enable the [code]INTERNET[/code] permission in the Android export preset before exporting the project or using one-click deploy. Otherwise, network communication of any kind will be blocked by Android.
#tutorial [High-level multiplayer] https://docs.godotengine.org/en/stable/tutorials/networking/high_level_multiplayer.html
#tutorial [WebRTC Signaling Demo] https://godotengine.org/asset-library/asset/537
class_name MultiplayerPeer

#desc Emitted when a remote peer connects.
signal peer_connected(id: int)
#desc Emitted when a remote peer has disconnected.
signal peer_disconnected(id: int)
#desc The MultiplayerPeer is disconnected.
#desc The MultiplayerPeer is currently connecting to a server.
#desc This MultiplayerPeer is connected.
#desc Packets are sent to all connected peers.
const TARGET_PEER_BROADCAST = 0;

#desc Packets are sent to the remote peer acting as server.
const TARGET_PEER_SERVER = 1;

#desc Packets are not acknowledged, no resend attempts are made for lost packets. Packets may arrive in any order. Potentially faster than [constant TRANSFER_MODE_UNRELIABLE_ORDERED]. Use for non-critical data, and always consider whether the order matters.
#desc Packets are not acknowledged, no resend attempts are made for lost packets. Packets are received in the order they were sent in. Potentially faster than [constant TRANSFER_MODE_RELIABLE]. Use for non-critical data or data that would be outdated if received late due to resend attempt(s) anyway, for example movement and positional data.
#desc Packets must be received and resend attempts should be made until the packets are acknowledged. Packets must be received in the order they were sent in. Most reliable transfer mode, but potentially the slowest due to the overhead. Use for critical data that must be transmitted and arrive in order, for example an ability being triggered or a chat message. Consider carefully if the information really is critical, and use sparingly.

#enum ConnectionStatus
enum {
    CONNECTION_DISCONNECTED = 0,
    CONNECTION_CONNECTING = 1,
    CONNECTION_CONNECTED = 2,
}
#enum TransferMode
enum {
    TRANSFER_MODE_UNRELIABLE = 0,
    TRANSFER_MODE_UNRELIABLE_ORDERED = 1,
    TRANSFER_MODE_RELIABLE = 2,
}
#desc If [code]true[/code], this [MultiplayerPeer] refuses new connections.
var refuse_new_connections: bool:
	get = is_refusing_new_connections, set = set_refuse_new_connections

#desc The channel to use to send packets. Many network APIs such as ENet and WebRTC allow the creation of multiple independent channels which behaves, in a way, like separate connections. This means that reliable data will only block delivery of other packets on that channel, and ordering will only be in respect to the channel the packet is being sent on. Using different channels to send [b]different and independent[/b] state updates is a common way to optimize network usage and decrease latency in fast-paced games.
#desc [b]Note:[/b] The default channel ([code]0[/code]) actually works as 3 separate channels (one for each [enum TransferMode]) so that [constant TRANSFER_MODE_RELIABLE] and [constant TRANSFER_MODE_UNRELIABLE_ORDERED] does not interact with each other by default. Refer to the specific network API documentation (e.g. ENet or WebRTC) to learn how to set up channels correctly.
var transfer_channel: int:
	get = get_transfer_channel, set = set_transfer_channel

#desc The manner in which to send packets to the target peer. See [enum TransferMode], and the [method set_target_peer] method.
var transfer_mode: int:
	get = get_transfer_mode, set = set_transfer_mode



#desc Immediately close the multiplayer peer returning to the state [constant CONNECTION_DISCONNECTED]. Connected peers will be dropped without emitting [signal peer_disconnected].
func close() -> void:
	pass;

#desc Disconnects the given [param peer] from this host. If [param force] is [code]true[/code] the [signal peer_disconnected] signal will not be emitted for this peer.
func disconnect_peer(peer: int, force: bool = false) -> void:
	pass;

#desc Returns a randomly generated integer that can be used as a network unique ID.
func generate_unique_id() -> int:
	pass;

#desc Returns the current state of the connection. See [enum ConnectionStatus].
func get_connection_status() -> int:
	pass;

#desc Returns the channel over which the next available packet was received. See [method PacketPeer.get_available_packet_count].
func get_packet_channel() -> int:
	pass;

#desc Returns the [enum MultiplayerPeer.TransferMode] the remote peer used to send the next available packet. See [method PacketPeer.get_available_packet_count].
func get_packet_mode() -> int:
	pass;

#desc Returns the ID of the [MultiplayerPeer] who sent the next available packet. See [method PacketPeer.get_available_packet_count].
func get_packet_peer() -> int:
	pass;

#desc Returns the ID of this [MultiplayerPeer].
func get_unique_id() -> int:
	pass;

#desc Returns true if the server can act as a relay in the current configuration (i.e. if the higher level [MultiplayerAPI] should notify connected clients of other peers, and implement a relay protocol to allow communication between them).
func is_server_relay_supported() -> bool:
	pass;

#desc Waits up to 1 second to receive a new network event.
func poll() -> void:
	pass;

#desc Sets the peer to which packets will be sent.
#desc The [param id] can be one of: [constant TARGET_PEER_BROADCAST] to send to all connected peers, [constant TARGET_PEER_SERVER] to send to the peer acting as server, a valid peer ID to send to that specific peer, a negative peer ID to send to all peers except that one. By default, the target peer is [constant TARGET_PEER_BROADCAST].
func set_target_peer(id: int) -> void:
	pass;


func is_refusing_new_connections() -> bool:
	return refuse_new_connections

func set_refuse_new_connections(value: bool) -> void:
	refuse_new_connections = value

func get_transfer_channel() -> int:
	return transfer_channel

func set_transfer_channel(value: int) -> void:
	transfer_channel = value

func get_transfer_mode() -> int:
	return transfer_mode

func set_transfer_mode(value: int) -> void:
	transfer_mode = value

