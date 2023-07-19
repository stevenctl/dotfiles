extends StreamPeer
#brief TLS stream peer.
#desc TLS stream peer. This object can be used to connect to a TLS server or accept a single TLS client connection.
#desc [b]Note:[/b] When exporting to Android, make sure to enable the [code]INTERNET[/code] permission in the Android export preset before exporting the project or using one-click deploy. Otherwise, network communication of any kind will be blocked by Android.
#tutorial [TLS certificates] https://docs.godotengine.org/en/stable/tutorials/networking/ssl_certificates.html
class_name StreamPeerTLS

#desc A status representing a [StreamPeerTLS] that is disconnected.
#desc A status representing a [StreamPeerTLS] during handshaking.
#desc A status representing a [StreamPeerTLS] that is connected to a host.
#desc A status representing a [StreamPeerTLS] in error state.
#desc An error status that shows a mismatch in the TLS certificate domain presented by the host and the domain requested for validation.

#enum Status
enum {
    STATUS_DISCONNECTED = 0,
    STATUS_HANDSHAKING = 1,
    STATUS_CONNECTED = 2,
    STATUS_ERROR = 3,
    STATUS_ERROR_HOSTNAME_MISMATCH = 4,
}


#desc Accepts a peer connection as a server using the given [param server_options]. See [method TLSOptions.server].
func accept_stream(stream: StreamPeer, server_options: TLSOptions) -> int:
	pass;

#desc Connects to a peer using an underlying [StreamPeer] [param stream] and verifying the remote certificate is correctly signed for the given [param common_name]. You can pass the optional [param client_options] parameter to customize the trusted certification authorities, or disable the common name verification. See [method TLSOptions.client] and [method TLSOptions.client_unsafe].
func connect_to_stream(stream: StreamPeer, common_name: String, client_options: TLSOptions = null) -> int:
	pass;

#desc Disconnects from host.
func disconnect_from_stream() -> void:
	pass;

#desc Returns the status of the connection. See [enum Status] for values.
func get_status() -> int:
	pass;

#desc Returns the underlying [StreamPeer] connection, used in [method accept_stream] or [method connect_to_stream].
func get_stream() -> StreamPeer:
	pass;

#desc Poll the connection to check for incoming bytes. Call this right before [method StreamPeer.get_available_bytes] for it to work properly.
func poll() -> void:
	pass;


