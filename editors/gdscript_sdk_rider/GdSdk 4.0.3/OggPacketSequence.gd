extends Resource
#brief A sequence of Ogg packets.
#desc A sequence of Ogg packets.
class_name OggPacketSequence


#desc Contains the granule positions for each page in this packet sequence.
var granule_positions: PackedInt64Array:
	get = get_packet_granule_positions, set = set_packet_granule_positions

#desc Contains the raw packets that make up this OggPacketSequence.
var packet_data: Array[Array]:
	get = get_packet_data, set = set_packet_data

#desc Holds sample rate information about this sequence. Must be set by another class that actually understands the codec.
var sampling_rate: float:
	get = get_sampling_rate, set = set_sampling_rate



#desc The length of this stream, in seconds.
func get_length() -> float:
	pass;


func get_packet_granule_positions() -> PackedInt64Array:
	return granule_positions

func set_packet_granule_positions(value: PackedInt64Array) -> void:
	granule_positions = value

func get_packet_data() -> Array[Array]:
	return packet_data

func set_packet_data(value: Array[Array]) -> void:
	packet_data = value

func get_sampling_rate() -> float:
	return sampling_rate

func set_sampling_rate(value: float) -> void:
	sampling_rate = value

