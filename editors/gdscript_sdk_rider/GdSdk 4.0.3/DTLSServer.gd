extends RefCounted
#brief Helper class to implement a DTLS server.
#desc This class is used to store the state of a DTLS server. Upon [method setup] it converts connected [PacketPeerUDP] to [PacketPeerDTLS] accepting them via [method take_connection] as DTLS clients. Under the hood, this class is used to store the DTLS state and cookies of the server. The reason of why the state and cookies are needed is outside of the scope of this documentation.
#desc Below a small example of how to use it:
#desc [codeblocks]
#desc [gdscript]
#desc # server_node.gd
#desc extends Node
#desc 
#desc var dtls := DTLSServer.new()
#desc var server := UDPServer.new()
#desc var peers = []
#desc 
#desc func _ready():
#desc server.listen(4242)
#desc var key = load("key.key") # Your private key.
#desc var cert = load("cert.crt") # Your X509 certificate.
#desc dtls.setup(key, cert)
#desc 
#desc func _process(delta):
#desc while server.is_connection_available():
#desc var peer: PacketPeerUDP = server.take_connection()
#desc var dtls_peer: PacketPeerDTLS = dtls.take_connection(peer)
#desc if dtls_peer.get_status() != PacketPeerDTLS.STATUS_HANDSHAKING:
#desc continue # It is normal that 50% of the connections fails due to cookie exchange.
#desc print("Peer connected!")
#desc peers.append(dtls_peer)
#desc 
#desc for p in peers:
#desc p.poll() # Must poll to update the state.
#desc if p.get_status() == PacketPeerDTLS.STATUS_CONNECTED:
#desc while p.get_available_packet_count() > 0:
#desc print("Received message from client: %s" % p.get_packet().get_string_from_utf8())
#desc p.put_packet("Hello DTLS client".to_utf8_buffer())
#desc [/gdscript]
#desc [csharp]
#desc // ServerNode.cs
#desc using Godot;
#desc 
#desc public partial class ServerNode : Node
#desc {
#desc private DtlsServer _dtls = new DtlsServer();
#desc private UdpServer _server = new UdpServer();
#desc private Godot.Collections.Array<PacketPeerDTLS> _peers = new Godot.Collections.Array<PacketPeerDTLS>();
#desc 
#desc public override void _Ready()
#desc {
#desc _server.Listen(4242);
#desc var key = GD.Load<CryptoKey>("key.key"); // Your private key.
#desc var cert = GD.Load<X509Certificate>("cert.crt"); // Your X509 certificate.
#desc _dtls.Setup(key, cert);
#desc }
#desc 
#desc public override void _Process(double delta)
#desc {
#desc while (Server.IsConnectionAvailable())
#desc {
#desc PacketPeerUDP peer = _server.TakeConnection();
#desc PacketPeerDTLS dtlsPeer = _dtls.TakeConnection(peer);
#desc if (dtlsPeer.GetStatus() != PacketPeerDtls.Status.Handshaking)
#desc {
#desc continue; // It is normal that 50% of the connections fails due to cookie exchange.
#desc }
#desc GD.Print("Peer connected!");
#desc _peers.Add(dtlsPeer);
#desc }
#desc 
#desc foreach (var p in _peers)
#desc {
#desc p.Poll(); // Must poll to update the state.
#desc if (p.GetStatus() == PacketPeerDtls.Status.Connected)
#desc {
#desc while (p.GetAvailablePacketCount() > 0)
#desc {
#desc GD.Print($"Received Message From Client: {p.GetPacket().GetStringFromUtf8()}");
#desc p.PutPacket("Hello DTLS Client".ToUtf8Buffer());
#desc }
#desc }
#desc }
#desc }
#desc }
#desc [/csharp]
#desc [/codeblocks]
#desc [codeblocks]
#desc [gdscript]
#desc # client_node.gd
#desc extends Node
#desc 
#desc var dtls := PacketPeerDTLS.new()
#desc var udp := PacketPeerUDP.new()
#desc var connected = false
#desc 
#desc func _ready():
#desc udp.connect_to_host("127.0.0.1", 4242)
#desc dtls.connect_to_peer(udp, false) # Use true in production for certificate validation!
#desc 
#desc func _process(delta):
#desc dtls.poll()
#desc if dtls.get_status() == PacketPeerDTLS.STATUS_CONNECTED:
#desc if !connected:
#desc # Try to contact server
#desc dtls.put_packet("The answer is... 42!".to_utf8_buffer())
#desc while dtls.get_available_packet_count() > 0:
#desc print("Connected: %s" % dtls.get_packet().get_string_from_utf8())
#desc connected = true
#desc [/gdscript]
#desc [csharp]
#desc // ClientNode.cs
#desc using Godot;
#desc using System.Text;
#desc 
#desc public partial class ClientNode : Node
#desc {
#desc private PacketPeerDtls _dtls = new PacketPeerDtls();
#desc private PacketPeerUdp _udp = new PacketPeerUdp();
#desc private bool _connected = false;
#desc 
#desc public override void _Ready()
#desc {
#desc _udp.ConnectToHost("127.0.0.1", 4242);
#desc _dtls.ConnectToPeer(_udp, validateCerts: false); // Use true in production for certificate validation!
#desc }
#desc 
#desc public override void _Process(double delta)
#desc {
#desc _dtls.Poll();
#desc if (_dtls.GetStatus() == PacketPeerDtls.Status.Connected)
#desc {
#desc if (!_connected)
#desc {
#desc // Try to contact server
#desc _dtls.PutPacket("The Answer Is..42!".ToUtf8Buffer());
#desc }
#desc while (_dtls.GetAvailablePacketCount() > 0)
#desc {
#desc GD.Print($"Connected: {_dtls.GetPacket().GetStringFromUtf8()}");
#desc _connected = true;
#desc }
#desc }
#desc }
#desc }
#desc [/csharp]
#desc [/codeblocks]
class_name DTLSServer




#desc Setup the DTLS server to use the given [param server_options]. See [method TLSOptions.server].
func setup(server_options: TLSOptions) -> int:
	pass;

#desc Try to initiate the DTLS handshake with the given [param udp_peer] which must be already connected (see [method PacketPeerUDP.connect_to_host]).
#desc [b]Note:[/b] You must check that the state of the return PacketPeerUDP is [constant PacketPeerDTLS.STATUS_HANDSHAKING], as it is normal that 50% of the new connections will be invalid due to cookie exchange.
func take_connection(udp_peer: PacketPeerUDP) -> PacketPeerDTLS:
	pass;


