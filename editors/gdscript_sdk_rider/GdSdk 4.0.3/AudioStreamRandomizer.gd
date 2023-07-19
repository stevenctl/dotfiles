extends AudioStream
#brief Wraps a pool of audio streams with pitch and volume shifting.
#desc Picks a random AudioStream from the pool, depending on the playback mode, and applies random pitch shifting and volume shifting during playback.
class_name AudioStreamRandomizer

#desc Pick a stream at random according to the probability weights chosen for each stream, but avoid playing the same stream twice in a row whenever possible. If only 1 sound is present in the pool, the same sound will always play, effectively allowing repeats to occur.
#desc Pick a stream at random according to the probability weights chosen for each stream. If only 1 sound is present in the pool, the same sound will always play.
#desc Play streams in the order they appear in the stream pool. If only 1 sound is present in the pool, the same sound will always play.

#enum PlaybackMode
enum {
    PLAYBACK_RANDOM_NO_REPEATS = 0,
    PLAYBACK_RANDOM = 1,
    PLAYBACK_SEQUENTIAL = 2,
}
#desc Controls how this AudioStreamRandomizer picks which AudioStream to play next.
var playback_mode: int:
	get = get_playback_mode, set = set_playback_mode

#desc The intensity of random pitch variation. A value of 1 means no variation.
var random_pitch: float:
	get = get_random_pitch, set = set_random_pitch

#desc The intensity of random volume variation. A value of 0 means no variation.
var random_volume_offset_db: float:
	get = get_random_volume_offset_db, set = set_random_volume_offset_db

#desc The number of streams in the stream pool.
var streams_count: int:
	get = get_streams_count, set = set_streams_count



#desc Insert a stream at the specified index. If the index is less than zero, the insertion occurs at the end of the underlying pool.
func add_stream(index: int, stream: AudioStream, weight: float = 1.0) -> void:
	pass;

#desc Returns the stream at the specified index.
func get_stream(index: int) -> AudioStream:
	pass;

#desc Returns the probability weight associated with the stream at the given index.
func get_stream_probability_weight(index: int) -> float:
	pass;

#desc Move a stream from one index to another.
func move_stream(index_from: int, index_to: int) -> void:
	pass;

#desc Remove the stream at the specified index.
func remove_stream(index: int) -> void:
	pass;

#desc Set the AudioStream at the specified index.
func set_stream(index: int, stream: AudioStream) -> void:
	pass;

#desc Set the probability weight of the stream at the specified index. The higher this value, the more likely that the randomizer will choose this stream during random playback modes.
func set_stream_probability_weight(index: int, weight: float) -> void:
	pass;


func get_playback_mode() -> int:
	return playback_mode

func set_playback_mode(value: int) -> void:
	playback_mode = value

func get_random_pitch() -> float:
	return random_pitch

func set_random_pitch(value: float) -> void:
	random_pitch = value

func get_random_volume_offset_db() -> float:
	return random_volume_offset_db

func set_random_volume_offset_db(value: float) -> void:
	random_volume_offset_db = value

func get_streams_count() -> int:
	return streams_count

func set_streams_count(value: int) -> void:
	streams_count = value

