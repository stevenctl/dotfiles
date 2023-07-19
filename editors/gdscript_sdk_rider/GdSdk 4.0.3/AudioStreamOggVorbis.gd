extends AudioStream
class_name AudioStreamOggVorbis


var bar_beats: int:
	get = get_bar_beats, set = set_bar_beats

var beat_count: int:
	get = get_beat_count, set = set_beat_count

var bpm: float:
	get = get_bpm, set = set_bpm

#desc If [code]true[/code], the stream will automatically loop when it reaches the end.
var loop: bool:
	get = has_loop, set = set_loop

#desc Time in seconds at which the stream starts after being looped.
var loop_offset: float:
	get = get_loop_offset, set = set_loop_offset

#desc Contains the raw Ogg data for this stream.
var packet_sequence: OggPacketSequence:
	get = get_packet_sequence, set = set_packet_sequence




func get_bar_beats() -> int:
	return bar_beats

func set_bar_beats(value: int) -> void:
	bar_beats = value

func get_beat_count() -> int:
	return beat_count

func set_beat_count(value: int) -> void:
	beat_count = value

func get_bpm() -> float:
	return bpm

func set_bpm(value: float) -> void:
	bpm = value

func has_loop() -> bool:
	return loop

func set_loop(value: bool) -> void:
	loop = value

func get_loop_offset() -> float:
	return loop_offset

func set_loop_offset(value: float) -> void:
	loop_offset = value

func get_packet_sequence() -> OggPacketSequence:
	return packet_sequence

func set_packet_sequence(value: OggPacketSequence) -> void:
	packet_sequence = value

