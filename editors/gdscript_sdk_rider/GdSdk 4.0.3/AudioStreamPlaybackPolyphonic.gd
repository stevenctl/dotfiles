extends AudioStreamPlayback
#brief Playback instance for [AudioStreamPolyphonic].
#desc Playback instance for [AudioStreamPolyphonic]. After setting the [code]stream[/code] property of [AudioStreamPlayer], [AudioStreamPlayer2D], or [AudioStreamPlayer3D], the playback instance can be obtained by calling [method AudioStreamPlayer.get_stream_playback], [method AudioStreamPlayer2D.get_stream_playback] or [method AudioStreamPlayer3D.get_stream_playback] methods.
class_name AudioStreamPlaybackPolyphonic

#desc Returned by [method play_stream] in case it could not allocate a stream for playback.
const INVALID_ID = -1;




#desc Return true whether the stream associated with an integer ID is still playing. Check [method play_stream] for information on when this ID becomes invalid.
func is_stream_playing(stream: int) -> bool:
	pass;

#desc Play an [AudioStream] at a given offset, volume and pitch scale. Playback starts immediately.
#desc The return value is an unique integer ID that is associated to this playback stream and which can be used to control it.
#desc This ID becomes invalid when the stream ends (if it does not loop), when the [AudioStreamPlaybackPolyphonic] is stopped, or when [method stop_stream] is called.
#desc This function returns [constant INVALID_ID] if the amount of streams currently playing equals [member AudioStreamPolyphonic.polyphony]. If you need a higher amount of maximum polyphony, raise this value.
func play_stream(stream: AudioStream, from_offset: float = 0, volume_db: float = 0, pitch_scale: float = 1.0) -> int:
	pass;

#desc Change the stream pitch scale. The [param stream] argument is an integer ID returned by [method play_stream].
func set_stream_pitch_scale(stream: int, pitch_scale: float) -> void:
	pass;

#desc Change the stream volume (in db). The [param stream] argument is an integer ID returned by [method play_stream].
func set_stream_volume(stream: int, volume_db: float) -> void:
	pass;

#desc Stop a stream. The [param stream] argument is an integer ID returned by [method play_stream], which becomes invalid after calling this function.
func stop_stream(stream: int) -> void:
	pass;


