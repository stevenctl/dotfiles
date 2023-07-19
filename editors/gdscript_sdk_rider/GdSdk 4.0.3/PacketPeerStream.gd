extends PacketPeer
#brief Wrapper to use a PacketPeer over a StreamPeer.
#desc PacketStreamPeer provides a wrapper for working using packets over a stream. This allows for using packet based code with StreamPeers. PacketPeerStream implements a custom protocol over the StreamPeer, so the user should not read or write to the wrapped StreamPeer directly.
#desc [b]Note:[/b] When exporting to Android, make sure to enable the [code]INTERNET[/code] permission in the Android export preset before exporting the project or using one-click deploy. Otherwise, network communication of any kind will be blocked by Android.
class_name PacketPeerStream


var input_buffer_max_size: int:
	get = get_input_buffer_max_size, set = set_input_buffer_max_size

var output_buffer_max_size: int:
	get = get_output_buffer_max_size, set = set_output_buffer_max_size

#desc The wrapped [StreamPeer] object.
var stream_peer: StreamPeer:
	get = get_stream_peer, set = set_stream_peer




func get_input_buffer_max_size() -> int:
	return input_buffer_max_size

func set_input_buffer_max_size(value: int) -> void:
	input_buffer_max_size = value

func get_output_buffer_max_size() -> int:
	return output_buffer_max_size

func set_output_buffer_max_size(value: int) -> void:
	output_buffer_max_size = value

func get_stream_peer() -> StreamPeer:
	return stream_peer

func set_stream_peer(value: StreamPeer) -> void:
	stream_peer = value

