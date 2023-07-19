extends PacketPeer
#brief A wrapper class for an [url=http://enet.bespin.org/group__peer.html]ENetPeer[/url].
#desc A PacketPeer implementation representing a peer of an [ENetConnection].
#desc This class cannot be instantiated directly but can be retrieved during [method ENetConnection.service] or via [method ENetConnection.get_peers].
#desc [b]Note:[/b] When exporting to Android, make sure to enable the [code]INTERNET[/code] permission in the Android export preset before exporting the project or using one-click deploy. Otherwise, network communication of any kind will be blocked by Android.
#tutorial [API documentation on the ENet website] http://enet.bespin.org/usergroup0.html
class_name ENetPacketPeer

#desc The peer is disconnected.
#desc The peer is currently attempting to connect.
#desc The peer has acknowledged the connection request.
#desc The peer is currently connecting.
#desc The peer has successfully connected, but is not ready to communicate with yet ([constant STATE_CONNECTED]).
#desc The peer is currently connected and ready to communicate with.
#desc The peer is slated to disconnect after it has no more outgoing packets to send.
#desc The peer is currently disconnecting.
#desc The peer has acknowledged the disconnection request.
#desc The peer has lost connection, but is not considered truly disconnected (as the peer didn't acknowledge the disconnection request).
#desc Mean packet loss of reliable packets as a ratio with respect to the [constant PACKET_LOSS_SCALE].
#desc Packet loss variance.
#desc The time at which packet loss statistics were last updated (in milliseconds since the connection started). The interval for packet loss statistics updates is 10 seconds, and at least one packet must have been sent since the last statistics update.
#desc Mean packet round trip time for reliable packets.
#desc Variance of the mean round trip time.
#desc Last recorded round trip time for a reliable packet.
#desc Variance of the last trip time recorded.
#desc The peer's current throttle status.
#desc The maximum number of unreliable packets that should not be dropped. This value is always greater than or equal to [code]1[/code]. The initial value is equal to [constant PACKET_THROTTLE_SCALE].
#desc Internal value used to increment the packet throttle counter. The value is hardcoded to [code]7[/code] and cannot be changed. You probably want to look at [constant PEER_PACKET_THROTTLE_ACCELERATION] instead.
#desc The time at which throttle statistics were last updated (in milliseconds since the connection started). The interval for throttle statistics updates is [constant PEER_PACKET_THROTTLE_INTERVAL].
#desc The throttle's acceleration factor. Higher values will make ENet adapt to fluctuating network conditions faster, causing unrelaible packets to be sent [i]more[/i] often. The default value is [code]2[/code].
#desc The throttle's deceleration factor. Higher values will make ENet adapt to fluctuating network conditions faster, causing unrelaible packets to be sent [i]less[/i] often. The default value is [code]2[/code].
#desc The interval over which the lowest mean round trip time should be measured for use by the throttle mechanism (in milliseconds). The default value is [code]5000[/code].
#desc The reference scale for packet loss. See [method get_statistic] and [constant PEER_PACKET_LOSS].
const PACKET_LOSS_SCALE = 65536;

#desc The reference value for throttle configuration. The default value is [code]32[/code]. See [method throttle_configure].
const PACKET_THROTTLE_SCALE = 32;

#desc Mark the packet to be sent as reliable.
const FLAG_RELIABLE = 1;

#desc Mark the packet to be sent unsequenced (unreliable).
const FLAG_UNSEQUENCED = 2;

#desc Mark the packet to be sent unreliable even if the packet is too big and needs fragmentation (increasing the chance of it being dropped).
const FLAG_UNRELIABLE_FRAGMENT = 8;


#enum PeerState
enum {
    STATE_DISCONNECTED = 0,
    STATE_CONNECTING = 1,
    STATE_ACKNOWLEDGING_CONNECT = 2,
    STATE_CONNECTION_PENDING = 3,
    STATE_CONNECTION_SUCCEEDED = 4,
    STATE_CONNECTED = 5,
    STATE_DISCONNECT_LATER = 6,
    STATE_DISCONNECTING = 7,
    STATE_ACKNOWLEDGING_DISCONNECT = 8,
    STATE_ZOMBIE = 9,
}
#enum PeerStatistic
enum {
    PEER_PACKET_LOSS = 0,
    PEER_PACKET_LOSS_VARIANCE = 1,
    PEER_PACKET_LOSS_EPOCH = 2,
    PEER_ROUND_TRIP_TIME = 3,
    PEER_ROUND_TRIP_TIME_VARIANCE = 4,
    PEER_LAST_ROUND_TRIP_TIME = 5,
    PEER_LAST_ROUND_TRIP_TIME_VARIANCE = 6,
    PEER_PACKET_THROTTLE = 7,
    PEER_PACKET_THROTTLE_LIMIT = 8,
    PEER_PACKET_THROTTLE_COUNTER = 9,
    PEER_PACKET_THROTTLE_EPOCH = 10,
    PEER_PACKET_THROTTLE_ACCELERATION = 11,
    PEER_PACKET_THROTTLE_DECELERATION = 12,
    PEER_PACKET_THROTTLE_INTERVAL = 13,
}


#desc Returns the number of channels allocated for communication with peer.
func get_channels() -> int:
	pass;

#desc Returns the IP address of this peer.
func get_remote_address() -> String:
	pass;

#desc Returns the remote port of this peer.
func get_remote_port() -> int:
	pass;

#desc Returns the current peer state. See [enum PeerState].
func get_state() -> int:
	pass;

#desc Returns the requested [code]statistic[/code] for this peer. See [enum PeerStatistic].
func get_statistic(statistic: int) -> float:
	pass;

#desc Returns [code]true[/code] if the peer is currently active (i.e. the associated [ENetConnection] is still valid).
func is_active() -> bool:
	pass;

#desc Request a disconnection from a peer. An [constant ENetConnection.EVENT_DISCONNECT] will be generated during [method ENetConnection.service] once the disconnection is complete.
func peer_disconnect(data: int = 0) -> void:
	pass;

#desc Request a disconnection from a peer, but only after all queued outgoing packets are sent. An [constant ENetConnection.EVENT_DISCONNECT] will be generated during [method ENetConnection.service] once the disconnection is complete.
func peer_disconnect_later(data: int = 0) -> void:
	pass;

#desc Force an immediate disconnection from a peer. No [constant ENetConnection.EVENT_DISCONNECT] will be generated. The foreign peer is not guaranteed to receive the disconnect notification, and is reset immediately upon return from this function.
func peer_disconnect_now(data: int = 0) -> void:
	pass;

#desc Sends a ping request to a peer. ENet automatically pings all connected peers at regular intervals, however, this function may be called to ensure more frequent ping requests.
func ping() -> void:
	pass;

#desc Sets the [code]ping_interval[/code] in milliseconds at which pings will be sent to a peer. Pings are used both to monitor the liveness of the connection and also to dynamically adjust the throttle during periods of low traffic so that the throttle has reasonable responsiveness during traffic spikes. The default ping interval is [code]500[/code] milliseconds.
func ping_interval(ping_interval: int) -> void:
	pass;

#desc Forcefully disconnects a peer. The foreign host represented by the peer is not notified of the disconnection and will timeout on its connection to the local host.
func reset() -> void:
	pass;

#desc Queues a [code]packet[/code] to be sent over the specified [code]channel[/code]. See [code]FLAG_*[/code] constants for available packet flags.
func send(channel: int, packet: PackedByteArray, flags: int) -> int:
	pass;

#desc Sets the timeout parameters for a peer. The timeout parameters control how and when a peer will timeout from a failure to acknowledge reliable traffic. Timeout values are expressed in milliseconds.
#desc The [code]timeout_limit[/code] is a factor that, multiplied by a value based on the average round trip time, will determine the timeout limit for a reliable packet. When that limit is reached, the timeout will be doubled, and the peer will be disconnected if that limit has reached [code]timeout_min[/code]. The [code]timeout_max[/code] parameter, on the other hand, defines a fixed timeout for which any packet must be acknowledged or the peer will be dropped.
func set_timeout(timeout: int, timeout_min: int, timeout_max: int) -> void:
	pass;

#desc Configures throttle parameter for a peer.
#desc Unreliable packets are dropped by ENet in response to the varying conditions of the Internet connection to the peer. The throttle represents a probability that an unreliable packet should not be dropped and thus sent by ENet to the peer. By measuring fluctuations in round trip times of reliable packets over the specified [code]interval[/code], ENet will either increase the probability by the amount specified in the [code]acceleration[/code] parameter, or decrease it by the amount specified in the [code]deceleration[/code] parameter (both are ratios to [constant PACKET_THROTTLE_SCALE]).
#desc When the throttle has a value of [constant PACKET_THROTTLE_SCALE], no unreliable packets are dropped by ENet, and so 100% of all unreliable packets will be sent.
#desc When the throttle has a value of [code]0[/code], all unreliable packets are dropped by ENet, and so 0% of all unreliable packets will be sent.
#desc Intermediate values for the throttle represent intermediate probabilities between 0% and 100% of unreliable packets being sent. The bandwidth limits of the local and foreign hosts are taken into account to determine a sensible limit for the throttle probability above which it should not raise even in the best of conditions.
func throttle_configure(interval: int, acceleration: int, deceleration: int) -> void:
	pass;


