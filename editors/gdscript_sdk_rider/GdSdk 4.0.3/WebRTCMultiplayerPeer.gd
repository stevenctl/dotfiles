extends MultiplayerPeer
#brief A simple interface to create a peer-to-peer mesh network composed of [WebRTCPeerConnection] that is compatible with the [MultiplayerAPI].
#desc This class constructs a full mesh of [WebRTCPeerConnection] (one connection for each peer) that can be used as a [member MultiplayerAPI.multiplayer_peer].
#desc You can add each [WebRTCPeerConnection] via [method add_peer] or remove them via [method remove_peer]. Peers must be added in [constant WebRTCPeerConnection.STATE_NEW] state to allow it to create the appropriate channels. This class will not create offers nor set descriptions, it will only poll them, and notify connections and disconnections.
#desc When creating the peer via [method create_client] or [method create_server] the [method MultiplayerPeer.is_server_relay_supported] method will return [code]true[/code] enabling peer exchange and packet relaying when supported by the [MultiplayerAPI] implementation.
#desc [b]Note:[/b] When exporting to Android, make sure to enable the [code]INTERNET[/code] permission in the Android export preset before exporting the project or using one-click deploy. Otherwise, network communication of any kind will be blocked by Android.
class_name WebRTCMultiplayerPeer




#desc Add a new peer to the mesh with the given [code]peer_id[/code]. The [WebRTCPeerConnection] must be in state [constant WebRTCPeerConnection.STATE_NEW].
#desc Three channels will be created for reliable, unreliable, and ordered transport. The value of [code]unreliable_lifetime[/code] will be passed to the [code]maxPacketLifetime[/code] option when creating unreliable and ordered channels (see [method WebRTCPeerConnection.create_data_channel]).
func add_peer(peer: WebRTCPeerConnection, peer_id: int, unreliable_lifetime: int = 1) -> int:
	pass;

#desc Initialize the multiplayer peer as a client with the given [code]peer_id[/code] (must be between 2 and 2147483647). In this mode, you should only call [method add_peer] once and with [code]peer_id[/code] of [code]1[/code]. This mode enables [method MultiplayerPeer.is_server_relay_supported], allowing the upper [MultiplayerAPI] layer to perform peer exchange and packet relaying.
#desc You can optionally specify a [code]channels_config[/code] array of [enum MultiplayerPeer.TransferMode] which will be used to create extra channels (WebRTC only supports one transfer mode per channel).
func create_client(peer_id: int, channels_config: Array = []) -> int:
	pass;

#desc Initialize the multiplayer peer as a mesh (i.e. all peers connect to each other) with the given [code]peer_id[/code] (must be between 1 and 2147483647).
func create_mesh(peer_id: int, channels_config: Array = []) -> int:
	pass;

#desc Initialize the multiplayer peer as a server (with unique ID of [code]1[/code]). This mode enables [method MultiplayerPeer.is_server_relay_supported], allowing the upper [MultiplayerAPI] layer to perform peer exchange and packet relaying.
#desc You can optionally specify a [code]channels_config[/code] array of [enum MultiplayerPeer.TransferMode] which will be used to create extra channels (WebRTC only supports one transfer mode per channel).
func create_server(channels_config: Array = []) -> int:
	pass;

#desc Returns a dictionary representation of the peer with given [code]peer_id[/code] with three keys. [code]connection[/code] containing the [WebRTCPeerConnection] to this peer, [code]channels[/code] an array of three [WebRTCDataChannel], and [code]connected[/code] a boolean representing if the peer connection is currently connected (all three channels are open).
func get_peer(peer_id: int) -> Dictionary:
	pass;

#desc Returns a dictionary which keys are the peer ids and values the peer representation as in [method get_peer].
func get_peers() -> Dictionary:
	pass;

#desc Returns [code]true[/code] if the given [code]peer_id[/code] is in the peers map (it might not be connected though).
func has_peer(peer_id: int) -> bool:
	pass;

#desc Remove the peer with given [code]peer_id[/code] from the mesh. If the peer was connected, and [signal MultiplayerPeer.peer_connected] was emitted for it, then [signal MultiplayerPeer.peer_disconnected] will be emitted.
func remove_peer(peer_id: int) -> void:
	pass;


