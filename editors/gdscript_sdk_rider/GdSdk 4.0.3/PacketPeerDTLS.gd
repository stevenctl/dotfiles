extends PacketPeer
#brief DTLS packet peer.
#desc This class represents a DTLS peer connection. It can be used to connect to a DTLS server, and is returned by [method DTLSServer.take_connection].
#desc [b]Note:[/b] When exporting to Android, make sure to enable the [code]INTERNET[/code] permission in the Android export preset before exporting the project or using one-click deploy. Otherwise, network communication of any kind will be blocked by Android.
#desc [b]Warning:[/b] TLS certificate revocation and certificate pinning are currently not supported. Revoked certificates are accepted as long as they are otherwise valid. If this is a concern, you may want to use automatically managed certificates with a short validity period.
class_name PacketPeerDTLS

#desc A status representing a [PacketPeerDTLS] that is disconnected.
#desc A status representing a [PacketPeerDTLS] that is currently performing the handshake with a remote peer.
#desc A status representing a [PacketPeerDTLS] that is connected to a remote peer.
#desc A status representing a [PacketPeerDTLS] in a generic error state.
#desc An error status that shows a mismatch in the DTLS certificate domain presented by the host and the domain requested for validation.

#enum Status
enum {
    STATUS_DISCONNECTED = 0,
    STATUS_HANDSHAKING = 1,
    STATUS_CONNECTED = 2,
    STATUS_ERROR = 3,
    STATUS_ERROR_HOSTNAME_MISMATCH = 4,
}


#desc Connects a [param packet_peer] beginning the DTLS handshake using the underlying [PacketPeerUDP] which must be connected (see [method PacketPeerUDP.connect_to_host]). You can optionally specify the [param client_options] to be used while verifying the TLS connections. See [method TLSOptions.client] and [method TLSOptions.client_unsafe].
func connect_to_peer(packet_peer: PacketPeerUDP, hostname: String, client_options: TLSOptions = null) -> int:
	pass;

#desc Disconnects this peer, terminating the DTLS session.
func disconnect_from_peer() -> void:
	pass;

#desc Returns the status of the connection. See [enum Status] for values.
func get_status() -> int:
	pass;

#desc Poll the connection to check for incoming packets. Call this frequently to update the status and keep the connection working.
func poll() -> void:
	pass;


