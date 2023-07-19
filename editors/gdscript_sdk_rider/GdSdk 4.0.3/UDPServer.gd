extends RefCounted
#brief Helper class to implement a UDP server.
#desc A simple server that opens a UDP socket and returns connected [PacketPeerUDP] upon receiving new packets. See also [method PacketPeerUDP.connect_to_host].
#desc After starting the server ([method listen]), you will need to [method poll] it at regular intervals (e.g. inside [method Node._process]) for it to process new packets, delivering them to the appropriate [PacketPeerUDP], and taking new connections.
#desc Below a small example of how it can be used:
#desc [codeblocks]
#desc [gdscript]
#desc # server_node.gd
#desc class_name ServerNode
#desc extends Node
#desc 
#desc var server := UDPServer.new()
#desc var peers = []
#desc 
#desc func _ready():
#desc server.listen(4242)
#desc 
#desc func _process(delta):
#desc server.poll() # Important!
#desc if server.is_connection_available():
#desc var peer: PacketPeerUDP = server.take_connection()
#desc var packet = peer.get_packet()
#desc print("Accepted peer: %s:%s" % [peer.get_packet_ip(), peer.get_packet_port()])
#desc print("Received data: %s" % [packet.get_string_from_utf8()])
#desc # Reply so it knows we received the message.
#desc peer.put_packet(packet)
#desc # Keep a reference so we can keep contacting the remote peer.
#desc peers.append(peer)
#desc 
#desc for i in range(0, peers.size()):
#desc pass # Do something with the connected peers.
#desc [/gdscript]
#desc [csharp]
#desc // ServerNode.cs
#desc using Godot;
#desc using System.Collections.Generic;
#desc 
#desc public partial class ServerNode : Node
#desc {
#desc private UdpServer _server = new UdpServer();
#desc private List<PacketPeerUdp> _peers  = new List<PacketPeerUdp>();
#desc 
#desc public override void _Ready()
#desc {
#desc _server.Listen(4242);
#desc }
#desc 
#desc public override void _Process(double delta)
#desc {
#desc _server.Poll(); // Important!
#desc if (_server.IsConnectionAvailable())
#desc {
#desc PacketPeerUdp peer = _server.TakeConnection();
#desc byte[] packet = peer.GetPacket();
#desc GD.Print($"Accepted Peer: {peer.GetPacketIP()}:{peer.GetPacketPort()}");
#desc GD.Print($"Received Data: {packet.GetStringFromUtf8()}");
#desc // Reply so it knows we received the message.
#desc peer.PutPacket(packet);
#desc // Keep a reference so we can keep contacting the remote peer.
#desc _peers.Add(peer);
#desc }
#desc foreach (var peer in _peers)
#desc {
#desc // Do something with the peers.
#desc }
#desc }
#desc }
#desc [/csharp]
#desc [/codeblocks]
#desc [codeblocks]
#desc [gdscript]
#desc # client_node.gd
#desc class_name ClientNode
#desc extends Node
#desc 
#desc var udp := PacketPeerUDP.new()
#desc var connected = false
#desc 
#desc func _ready():
#desc udp.connect_to_host("127.0.0.1", 4242)
#desc 
#desc func _process(delta):
#desc if !connected:
#desc # Try to contact server
#desc udp.put_packet("The answer is... 42!".to_utf8_buffer())
#desc if udp.get_available_packet_count() > 0:
#desc print("Connected: %s" % udp.get_packet().get_string_from_utf8())
#desc connected = true
#desc [/gdscript]
#desc [csharp]
#desc // ClientNode.cs
#desc using Godot;
#desc 
#desc public partial class ClientNode : Node
#desc {
#desc private PacketPeerUdp _udp = new PacketPeerUdp();
#desc private bool _connected = false;
#desc 
#desc public override void _Ready()
#desc {
#desc _udp.ConnectToHost("127.0.0.1", 4242);
#desc }
#desc 
#desc public override void _Process(double delta)
#desc {
#desc if (!_connected)
#desc {
#desc // Try to contact server
#desc _udp.PutPacket("The Answer Is..42!".ToUtf8Buffer());
#desc }
#desc if (_udp.GetAvailablePacketCount() > 0)
#desc {
#desc GD.Print($"Connected: {_udp.GetPacket().GetStringFromUtf8()}");
#desc _connected = true;
#desc }
#desc }
#desc }
#desc [/csharp]
#desc [/codeblocks]
class_name UDPServer


#desc Define the maximum number of pending connections, during [method poll], any new pending connection exceeding that value will be automatically dropped. Setting this value to [code]0[/code] effectively prevents any new pending connection to be accepted (e.g. when all your players have connected).
var max_pending_connections: int:
	get = get_max_pending_connections, set = set_max_pending_connections



#desc Returns the local port this server is listening to.
func get_local_port() -> int:
	pass;

#desc Returns [code]true[/code] if a packet with a new address/port combination was received on the socket.
func is_connection_available() -> bool:
	pass;

#desc Returns [code]true[/code] if the socket is open and listening on a port.
func is_listening() -> bool:
	pass;

#desc Starts the server by opening a UDP socket listening on the given [param port]. You can optionally specify a [param bind_address] to only listen for packets sent to that address. See also [method PacketPeerUDP.bind].
func listen(port: int, bind_address: String = "*") -> int:
	pass;

#desc Call this method at regular intervals (e.g. inside [method Node._process]) to process new packets. And packet from known address/port pair will be delivered to the appropriate [PacketPeerUDP], any packet received from an unknown address/port pair will be added as a pending connection (see [method is_connection_available], [method take_connection]). The maximum number of pending connection is defined via [member max_pending_connections].
func poll() -> int:
	pass;

#desc Stops the server, closing the UDP socket if open. Will close all connected [PacketPeerUDP] accepted via [method take_connection] (remote peers will not be notified).
func stop() -> void:
	pass;

#desc Returns the first pending connection (connected to the appropriate address/port). Will return [code]null[/code] if no new connection is available. See also [method is_connection_available], [method PacketPeerUDP.connect_to_host].
func take_connection() -> PacketPeerUDP:
	pass;


func get_max_pending_connections() -> int:
	return max_pending_connections

func set_max_pending_connections(value: int) -> void:
	max_pending_connections = value

