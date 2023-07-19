extends MultiplayerPeer
#brief Base class for WebSocket server and client.
#desc Base class for WebSocket server and client, allowing them to be used as multiplayer peer for the [MultiplayerAPI].
#desc [b]Note:[/b] When exporting to Android, make sure to enable the [code]INTERNET[/code] permission in the Android export preset before exporting the project or using one-click deploy. Otherwise, network communication of any kind will be blocked by Android.
class_name WebSocketMultiplayerPeer


#desc The extra headers to use during handshake. See [member WebSocketPeer.handshake_headers] for more details.
var handshake_headers: PackedStringArray:
	get = get_handshake_headers, set = set_handshake_headers

#desc The maximum time each peer can stay in a connecting state before being dropped.
var handshake_timeout: float:
	get = get_handshake_timeout, set = set_handshake_timeout

#desc The inbound buffer size for connected peers. See [member WebSocketPeer.inbound_buffer_size] for more details.
var inbound_buffer_size: int:
	get = get_inbound_buffer_size, set = set_inbound_buffer_size

#desc The maximum number of queued packets for connected peers. See [member WebSocketPeer.max_queued_packets] for more details.
var max_queued_packets: int:
	get = get_max_queued_packets, set = set_max_queued_packets

#desc The outbound buffer size for connected peers. See [member WebSocketPeer.outbound_buffer_size] for more details.
var outbound_buffer_size: int:
	get = get_outbound_buffer_size, set = set_outbound_buffer_size

#desc The supported WebSocket sub-protocols. See [member WebSocketPeer.supported_protocols] for more details.
var supported_protocols: PackedStringArray:
	get = get_supported_protocols, set = set_supported_protocols



#desc Starts a new multiplayer client connecting to the given [param url]. TLS certificates will be verified against the hostname when connecting using the [code]wss://[/code] protocol. You can pass the optional [param tls_client_options] parameter to customize the trusted certification authorities, or disable the common name verification. See [method TLSOptions.client] and [method TLSOptions.client_unsafe].
#desc [b]Note:[/b] It is recommended to specify the scheme part of the URL, i.e. the [param url] should start with either [code]ws://[/code] or [code]wss://[/code].
func create_client(url: String, tls_client_options: TLSOptions = null) -> int:
	pass;

#desc Starts a new multiplayer server listening on the given [param port]. You can optionally specify a [param bind_address], and provide valid [param tls_server_options] to use TLS. See [method TLSOptions.server].
func create_server(port: int, bind_address: String = "*", tls_server_options: TLSOptions = null) -> int:
	pass;

#desc Returns the [WebSocketPeer] associated to the given [code]peer_id[/code].
func get_peer(peer_id: int) -> WebSocketPeer:
	pass;

#desc Returns the IP address of the given peer.
func get_peer_address(id: int) -> String:
	pass;

#desc Returns the remote port of the given peer.
func get_peer_port(id: int) -> int:
	pass;


func get_handshake_headers() -> PackedStringArray:
	return handshake_headers

func set_handshake_headers(value: PackedStringArray) -> void:
	handshake_headers = value

func get_handshake_timeout() -> float:
	return handshake_timeout

func set_handshake_timeout(value: float) -> void:
	handshake_timeout = value

func get_inbound_buffer_size() -> int:
	return inbound_buffer_size

func set_inbound_buffer_size(value: int) -> void:
	inbound_buffer_size = value

func get_max_queued_packets() -> int:
	return max_queued_packets

func set_max_queued_packets(value: int) -> void:
	max_queued_packets = value

func get_outbound_buffer_size() -> int:
	return outbound_buffer_size

func set_outbound_buffer_size(value: int) -> void:
	outbound_buffer_size = value

func get_supported_protocols() -> PackedStringArray:
	return supported_protocols

func set_supported_protocols(value: PackedStringArray) -> void:
	supported_protocols = value

