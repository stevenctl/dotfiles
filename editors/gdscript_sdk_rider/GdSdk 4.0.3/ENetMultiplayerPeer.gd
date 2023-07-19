extends MultiplayerPeer
#brief A MultiplayerPeer implementation using the [url=http://enet.bespin.org/index.html]ENet[/url] library.
#desc A MultiplayerPeer implementation that should be passed to [member MultiplayerAPI.multiplayer_peer] after being initialized as either a client, server, or mesh. Events can then be handled by connecting to [MultiplayerAPI] signals. See [ENetConnection] for more information on the ENet library wrapper.
#desc [b]Note:[/b] ENet only uses UDP, not TCP. When forwarding the server port to make your server accessible on the public Internet, you only need to forward the server port in UDP. You can use the [UPNP] class to try to forward the server port automatically when starting the server.
#tutorial [High-level multiplayer] https://docs.godotengine.org/en/stable/tutorials/networking/high_level_multiplayer.html
#tutorial [API documentation on the ENet website] http://enet.bespin.org/usergroup0.html
class_name ENetMultiplayerPeer


#desc The underlying [ENetConnection] created after [method create_client] and [method create_server].
var host: ENetConnection:
	get = get_host



#desc Add a new remote peer with the given [code]peer_id[/code] connected to the given [code]host[/code].
#desc [b]Note:[/b] The [code]host[/code] must have exactly one peer in the [constant ENetPacketPeer.STATE_CONNECTED] state.
func add_mesh_peer(peer_id: int, host: ENetConnection) -> int:
	pass;

#desc Create client that connects to a server at [code]address[/code] using specified [code]port[/code]. The given address needs to be either a fully qualified domain name (e.g. [code]"www.example.com"[/code]) or an IP address in IPv4 or IPv6 format (e.g. [code]"192.168.1.1"[/code]). The [code]port[/code] is the port the server is listening on. The [code]channel_count[/code] parameter can be used to specify the number of ENet channels allocated for the connection. The [code]in_bandwidth[/code] and [code]out_bandwidth[/code] parameters can be used to limit the incoming and outgoing bandwidth to the given number of bytes per second. The default of 0 means unlimited bandwidth. Note that ENet will strategically drop packets on specific sides of a connection between peers to ensure the peer's bandwidth is not overwhelmed. The bandwidth parameters also determine the window size of a connection which limits the amount of reliable packets that may be in transit at any given time. Returns [constant OK] if a client was created, [constant ERR_ALREADY_IN_USE] if this ENetMultiplayerPeer instance already has an open connection (in which case you need to call [method MultiplayerPeer.close] first) or [constant ERR_CANT_CREATE] if the client could not be created. If [code]local_port[/code] is specified, the client will also listen to the given port; this is useful for some NAT traversal techniques.
func create_client(address: String, port: int, channel_count: int = 0, in_bandwidth: int = 0, out_bandwidth: int = 0, local_port: int = 0) -> int:
	pass;

#desc Initialize this [MultiplayerPeer] in mesh mode. The provided [code]unique_id[/code] will be used as the local peer network unique ID once assigned as the [member MultiplayerAPI.multiplayer_peer]. In the mesh configuration you will need to set up each new peer manually using [ENetConnection] before calling [method add_mesh_peer]. While this technique is more advanced, it allows for better control over the connection process (e.g. when dealing with NAT punch-through) and for better distribution of the network load (which would otherwise be more taxing on the server).
func create_mesh(unique_id: int) -> int:
	pass;

#desc Create server that listens to connections via [code]port[/code]. The port needs to be an available, unused port between 0 and 65535. Note that ports below 1024 are privileged and may require elevated permissions depending on the platform. To change the interface the server listens on, use [method set_bind_ip]. The default IP is the wildcard [code]"*"[/code], which listens on all available interfaces. [code]max_clients[/code] is the maximum number of clients that are allowed at once, any number up to 4095 may be used, although the achievable number of simultaneous clients may be far lower and depends on the application. For additional details on the bandwidth parameters, see [method create_client]. Returns [constant OK] if a server was created, [constant ERR_ALREADY_IN_USE] if this ENetMultiplayerPeer instance already has an open connection (in which case you need to call [method MultiplayerPeer.close] first) or [constant ERR_CANT_CREATE] if the server could not be created.
func create_server(port: int, max_clients: int = 32, max_channels: int = 0, in_bandwidth: int = 0, out_bandwidth: int = 0) -> int:
	pass;

#desc Returns the [ENetPacketPeer] associated to the given [code]id[/code].
func get_peer(id: int) -> ENetPacketPeer:
	pass;

#desc The IP used when creating a server. This is set to the wildcard [code]"*"[/code] by default, which binds to all available interfaces. The given IP needs to be in IPv4 or IPv6 address format, for example: [code]"192.168.1.1"[/code].
func set_bind_ip(ip: String) -> void:
	pass;


func get_host() -> ENetConnection:
	return host

