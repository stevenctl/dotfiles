extends PacketPeer
class_name WebRTCDataChannel

#desc Tells the channel to send data over this channel as text. An external peer (non-Godot) would receive this as a string.
#desc Tells the channel to send data over this channel as binary. An external peer (non-Godot) would receive this as array buffer or blob.
#desc The channel was created, but it's still trying to connect.
#desc The channel is currently open, and data can flow over it.
#desc The channel is being closed, no new messages will be accepted, but those already in queue will be flushed.
#desc The channel was closed, or connection failed.

#enum WriteMode
enum {
    WRITE_MODE_TEXT = 0,
    WRITE_MODE_BINARY = 1,
}
#enum ChannelState
enum {
    STATE_CONNECTING = 0,
    STATE_OPEN = 1,
    STATE_CLOSING = 2,
    STATE_CLOSED = 3,
}
#desc The transfer mode to use when sending outgoing packet. Either text or binary.
var write_mode: int:
	get = get_write_mode, set = set_write_mode



#desc Closes this data channel, notifying the other peer.
func close() -> void:
	pass;

#desc Returns the number of bytes currently queued to be sent over this channel.
func get_buffered_amount() -> int:
	pass;

#desc Returns the ID assigned to this channel during creation (or auto-assigned during negotiation).
#desc If the channel is not negotiated out-of-band the ID will only be available after the connection is established (will return [code]65535[/code] until then).
func get_id() -> int:
	pass;

#desc Returns the label assigned to this channel during creation.
func get_label() -> String:
	pass;

#desc Returns the [code]maxPacketLifeTime[/code] value assigned to this channel during creation.
#desc Will be [code]65535[/code] if not specified.
func get_max_packet_life_time() -> int:
	pass;

#desc Returns the [code]maxRetransmits[/code] value assigned to this channel during creation.
#desc Will be [code]65535[/code] if not specified.
func get_max_retransmits() -> int:
	pass;

#desc Returns the sub-protocol assigned to this channel during creation. An empty string if not specified.
func get_protocol() -> String:
	pass;

#desc Returns the current state of this channel, see [enum ChannelState].
func get_ready_state() -> int:
	pass;

#desc Returns [code]true[/code] if this channel was created with out-of-band configuration.
func is_negotiated() -> bool:
	pass;

#desc Returns [code]true[/code] if this channel was created with ordering enabled (default).
func is_ordered() -> bool:
	pass;

#desc Reserved, but not used for now.
func poll() -> int:
	pass;

#desc Returns [code]true[/code] if the last received packet was transferred as text. See [member write_mode].
func was_string_packet() -> bool:
	pass;


func get_write_mode() -> int:
	return write_mode

func set_write_mode(value: int) -> void:
	write_mode = value

