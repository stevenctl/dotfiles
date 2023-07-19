extends RefCounted
#brief A wrapper class for an [url=http://enet.bespin.org/group__host.html]ENetHost[/url].
#desc ENet's purpose is to provide a relatively thin, simple and robust network communication layer on top of UDP (User Datagram Protocol).
#tutorial [API documentation on the ENet website] http://enet.bespin.org/usergroup0.html
class_name ENetConnection

#desc No compression. This uses the most bandwidth, but has the upside of requiring the fewest CPU resources. This option may also be used to make network debugging using tools like Wireshark easier.
#desc ENet's built-in range encoding. Works well on small packets, but is not the most efficient algorithm on packets larger than 4 KB.
#desc [url=https://fastlz.org/]FastLZ[/url] compression. This option uses less CPU resources compared to [constant COMPRESS_ZLIB], at the expense of using more bandwidth.
#desc [url=https://www.zlib.net/]Zlib[/url] compression. This option uses less bandwidth compared to [constant COMPRESS_FASTLZ], at the expense of using more CPU resources.
#desc [url=https://facebook.github.io/zstd/]Zstandard[/url] compression. Note that this algorithm is not very efficient on packets smaller than 4 KB. Therefore, it's recommended to use other compression algorithms in most cases.
#desc An error occurred during [method service]. You will likely need to [method destroy] the host and recreate it.
#desc No event occurred within the specified time limit.
#desc A connection request initiated by enet_host_connect has completed. The array will contain the peer which successfully connected.
#desc A peer has disconnected. This event is generated on a successful completion of a disconnect initiated by [method ENetPacketPeer.peer_disconnect], if a peer has timed out, or if a connection request initialized by [method connect_to_host] has timed out. The array will contain the peer which disconnected. The data field contains user supplied data describing the disconnection, or 0, if none is available.
#desc A packet has been received from a peer. The array will contain the peer which sent the packet, the channel number upon which the packet was received, and the received packet.
#desc Total data sent.
#desc Total UDP packets sent.
#desc Total data received.
#desc Total UDP packets received.

#enum CompressionMode
enum {
    COMPRESS_NONE = 0,
    COMPRESS_RANGE_CODER = 1,
    COMPRESS_FASTLZ = 2,
    COMPRESS_ZLIB = 3,
    COMPRESS_ZSTD = 4,
}
#enum EventType
enum {
    EVENT_ERROR = -1,
    EVENT_NONE = 0,
    EVENT_CONNECT = 1,
    EVENT_DISCONNECT = 2,
    EVENT_RECEIVE = 3,
}
#enum HostStatistic
enum {
    HOST_TOTAL_SENT_DATA = 0,
    HOST_TOTAL_SENT_PACKETS = 1,
    HOST_TOTAL_RECEIVED_DATA = 2,
    HOST_TOTAL_RECEIVED_PACKETS = 3,
}


#desc Adjusts the bandwidth limits of a host.
func bandwidth_limit(in_bandwidth: int = 0, out_bandwidth: int = 0) -> void:
	pass;

#desc Queues a [code]packet[/code] to be sent to all peers associated with the host over the specified [code]channel[/code]. See [ENetPacketPeer] [code]FLAG_*[/code] constants for available packet flags.
func broadcast(channel: int, packet: PackedByteArray, flags: int) -> void:
	pass;

#desc Limits the maximum allowed channels of future incoming connections.
func channel_limit(limit: int) -> void:
	pass;

#desc Sets the compression method used for network packets. These have different tradeoffs of compression speed versus bandwidth, you may need to test which one works best for your use case if you use compression at all.
#desc [b]Note:[/b] Most games' network design involve sending many small packets frequently (smaller than 4 KB each). If in doubt, it is recommended to keep the default compression algorithm as it works best on these small packets.
#desc [b]Note:[/b] The compression mode must be set to the same value on both the server and all its clients. Clients will fail to connect if the compression mode set on the client differs from the one set on the server.
func compress(mode: int) -> void:
	pass;

#desc Initiates a connection to a foreign [code]address[/code] using the specified [code]port[/code] and allocating the requested [code]channels[/code]. Optional [code]data[/code] can be passed during connection in the form of a 32 bit integer.
#desc [b]Note:[/b] You must call either [method create_host] or [method create_host_bound] before calling this method.
func connect_to_host(address: String, port: int, channels: int = 0, data: int = 0) -> ENetPacketPeer:
	pass;

#desc Create an ENetHost that will allow up to [code]max_peers[/code] connected peers, each allocating up to [code]max_channels[/code] channels, optionally limiting bandwidth to [code]in_bandwidth[/code] and [code]out_bandwidth[/code].
func create_host(max_peers: int = 32, max_channels: int = 0, in_bandwidth: int = 0, out_bandwidth: int = 0) -> int:
	pass;

#desc Create an ENetHost like [method create_host] which is also bound to the given [code]bind_address[/code] and [code]bind_port[/code].
func create_host_bound(bind_address: String, bind_port: int, max_peers: int = 32, max_channels: int = 0, in_bandwidth: int = 0, out_bandwidth: int = 0) -> int:
	pass;

#desc Destroys the host and all resources associated with it.
func destroy() -> void:
	pass;

#desc Configure this ENetHost to use the custom Godot extension allowing DTLS encryption for ENet clients. Call this before [method connect_to_host] to have ENet connect using DTLS validating the server certificate against [code]hostname[/code]. You can pass the optional [param client_options] parameter to customize the trusted certification authorities, or disable the common name verification. See [method TLSOptions.client] and [method TLSOptions.client_unsafe].
func dtls_client_setup(hostname: String, client_options: TLSOptions = null) -> int:
	pass;

#desc Configure this ENetHost to use the custom Godot extension allowing DTLS encryption for ENet servers. Call this right after [method create_host_bound] to have ENet expect peers to connect using DTLS. See [method TLSOptions.server].
func dtls_server_setup(server_options: TLSOptions) -> int:
	pass;

#desc Sends any queued packets on the host specified to its designated peers.
func flush() -> void:
	pass;

#desc Returns the local port to which this peer is bound.
func get_local_port() -> int:
	pass;

#desc Returns the maximum number of channels allowed for connected peers.
func get_max_channels() -> int:
	pass;

#desc Returns the list of peers associated with this host.
#desc [b]Note:[/b] This list might include some peers that are not fully connected or are still being disconnected.
func get_peers() -> Array[ENetPacketPeer]:
	pass;

#desc Returns and resets host statistics. See [enum HostStatistic] for more info.
func pop_statistic(statistic: int) -> float:
	pass;

#desc Configures the DTLS server to automatically drop new connections.
#desc [b]Note:[/b] This method is only relevant after calling [method dtls_server_setup].
func refuse_new_connections(refuse: bool) -> void:
	pass;

#desc Waits for events on the host specified and shuttles packets between the host and its peers. The returned [Array] will have 4 elements. An [enum EventType], the [ENetPacketPeer] which generated the event, the event associated data (if any), the event associated channel (if any). If the generated event is [constant EVENT_RECEIVE], the received packet will be queued to the associated [ENetPacketPeer].
#desc Call this function regularly to handle connections, disconnections, and to receive new packets.
func service(timeout: int = 0) -> Array:
	pass;


