extends PacketPeer
#brief A WebSocket connection.
#desc This class represents WebSocket connection, and can be used as a WebSocket client (RFC 6455-compliant) or as a remote peer of a WebSocket server.
#desc You can send WebSocket binary frames using [method PacketPeer.put_packet], and WebSocket text frames using [method send] (prefer text frames when interacting with text-based API). You can check the frame type of the last packet via [method was_string_packet].
#desc To start a WebSocket client, first call [method connect_to_url], then regularly call [method poll] (e.g. during [Node] process). You can query the socket state via [method get_ready_state], get the number of pending packets using [method PacketPeer.get_available_packet_count], and retrieve them via [method PacketPeer.get_packet].
#desc [codeblocks]
#desc [gdscript]
#desc extends Node
#desc 
#desc var socket = WebSocketPeer.new()
#desc 
#desc func _ready():
#desc socket.connect_to_url("wss://example.com")
#desc 
#desc func _process(delta):
#desc socket.poll()
#desc var state = socket.get_ready_state()
#desc if state == WebSocketPeer.STATE_OPEN:
#desc while socket.get_available_packet_count():
#desc print("Packet: ", socket.get_packet())
#desc elif state == WebSocketPeer.STATE_CLOSING:
#desc # Keep polling to achieve proper close.
#desc pass
#desc elif state == WebSocketPeer.STATE_CLOSED:
#desc var code = socket.get_close_code()
#desc var reason = socket.get_close_reason()
#desc print("WebSocket closed with code: %d, reason %s. Clean: %s" % [code, reason, code != -1])
#desc set_process(false) # Stop processing.
#desc [/gdscript]
#desc [/codeblocks]
#desc To use the peer as part of a WebSocket server refer to [method accept_stream] and the online tutorial.
class_name WebSocketPeer

#desc Specifies that WebSockets messages should be transferred as text payload (only valid UTF-8 is allowed).
#desc Specifies that WebSockets messages should be transferred as binary payload (any byte combination is allowed).
#desc Socket has been created. The connection is not yet open.
#desc The connection is open and ready to communicate.
#desc The connection is in the process of closing. This means a close request has been sent to the remote peer but confirmation has not been received.
#desc The connection is closed or couldn't be opened.

#enum WriteMode
enum {
    WRITE_MODE_TEXT = 0,
    WRITE_MODE_BINARY = 1,
}
#enum State
enum {
    STATE_CONNECTING = 0,
    STATE_OPEN = 1,
    STATE_CLOSING = 2,
    STATE_CLOSED = 3,
}
#desc The extra HTTP headers to be sent during the WebSocket handshake.
#desc [b]Note:[/b] Not supported in Web exports due to browsers' restrictions.
var handshake_headers: PackedStringArray:
	get = get_handshake_headers, set = set_handshake_headers

#desc The size of the input buffer in bytes (roughly the maximum amount of memory that will be allocated for the inbound packets).
var inbound_buffer_size: int:
	get = get_inbound_buffer_size, set = set_inbound_buffer_size

#desc The maximum amount of packets that will be allowed in the queues (both inbound and outbound).
var max_queued_packets: int:
	get = get_max_queued_packets, set = set_max_queued_packets

#desc The size of the input buffer in bytes (roughly the maximum amount of memory that will be allocated for the outbound packets).
var outbound_buffer_size: int:
	get = get_outbound_buffer_size, set = set_outbound_buffer_size

#desc The WebSocket sub-protocols allowed during the WebSocket handshake.
var supported_protocols: PackedStringArray:
	get = get_supported_protocols, set = set_supported_protocols



#desc Accepts a peer connection performing the HTTP handshake as a WebSocket server. The [param stream] must be a valid TCP stream retrieved via [method TCPServer.take_connection], or a TLS stream accepted via [method StreamPeerTLS.accept_stream].
#desc [b]Note:[/b] Not supported in Web exports due to browsers' restrictions.
func accept_stream(stream: StreamPeer) -> int:
	pass;

#desc Closes this WebSocket connection. [param code] is the status code for the closure (see RFC 6455 section 7.4 for a list of valid status codes). [param reason] is the human readable reason for closing the connection (can be any UTF-8 string that's smaller than 123 bytes). If [param code] is negative, the connection will be closed immediately without notifying the remote peer.
#desc [b]Note:[/b] To achieve a clean close, you will need to keep polling until [constant STATE_CLOSED] is reached.
#desc [b]Note:[/b] The Web export might not support all status codes. Please refer to browser-specific documentation for more details.
func close(code: int = 1000, reason: String = "") -> void:
	pass;

#desc Connects to the given URL. TLS certificates will be verified against the hostname when connecting using the [code]wss://[/code] protocol. You can pass the optional [param tls_client_options] parameter to customize the trusted certification authorities, or disable the common name verification. See [method TLSOptions.client] and [method TLSOptions.client_unsafe].
#desc [b]Note:[/b] To avoid mixed content warnings or errors in Web, you may have to use a [code]url[/code] that starts with [code]wss://[/code] (secure) instead of [code]ws://[/code]. When doing so, make sure to use the fully qualified domain name that matches the one defined in the server's TLS certificate. Do not connect directly via the IP address for [code]wss://[/code] connections, as it won't match with the TLS certificate.
func connect_to_url(url: String, tls_client_options: TLSOptions = null) -> int:
	pass;

#desc Returns the received WebSocket close frame status code, or [code]-1[/code] when the connection was not cleanly closed. Only call this method when [method get_ready_state] returns [constant STATE_CLOSED].
func get_close_code() -> int:
	pass;

#desc Returns the received WebSocket close frame status reason string. Only call this method when [method get_ready_state] returns [constant STATE_CLOSED].
func get_close_reason() -> String:
	pass;

#desc Returns the IP address of the connected peer.
#desc [b]Note:[/b] Not available in the Web export.
func get_connected_host() -> String:
	pass;

#desc Returns the remote port of the connected peer.
#desc [b]Note:[/b] Not available in the Web export.
func get_connected_port() -> int:
	pass;

#desc Returns the current amount of data in the outbound websocket buffer. [b]Note:[/b] Web exports use WebSocket.bufferedAmount, while other platforms use an internal buffer.
func get_current_outbound_buffered_amount() -> int:
	pass;

#desc Returns the ready state of the connection. See [enum State].
func get_ready_state() -> int:
	pass;

#desc Returns the URL requested by this peer. The URL is derived from the [code]url[/code] passed to [method connect_to_url] or from the HTTP headers when acting as server (i.e. when using [method accept_stream]).
func get_requested_url() -> String:
	pass;

#desc Returns the selected WebSocket sub-protocol for this connection or an empty string if the sub-protocol has not been selected yet.
func get_selected_protocol() -> String:
	pass;

#desc Updates the connection state and receive incoming packets. Call this function regularly to keep it in a clean state.
func poll() -> void:
	pass;

#desc Sends the given [param message] using the desired [param write_mode]. When sending a [String], prefer using [method send_text].
func send(message: PackedByteArray, write_mode: int = 1) -> int:
	pass;

#desc Sends the given [param message] using WebSocket text mode. Prefer this method over [method PacketPeer.put_packet] when interacting with third-party text-based API (e.g. when using [JSON] formatted messages).
func send_text(message: String) -> int:
	pass;

#desc Disable Nagle's algorithm on the underling TCP socket (default). See [method StreamPeerTCP.set_no_delay] for more information.
#desc [b]Note:[/b] Not available in the Web export.
func set_no_delay(enabled: bool) -> void:
	pass;

#desc Returns [code]true[/code] if the last received packet was sent as a text payload. See [enum WriteMode].
func was_string_packet() -> bool:
	pass;


func get_handshake_headers() -> PackedStringArray:
	return handshake_headers

func set_handshake_headers(value: PackedStringArray) -> void:
	handshake_headers = value

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

