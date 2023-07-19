extends Resource
#brief Internal class used by [VideoStream] to manage playback state when played from a [VideoStreamPlayer].
#desc This class is intended to be overridden by video decoder extensions with custom implementations of [VideoStream].
class_name VideoStreamPlayback




#desc Returns the number of audio channels.
func _get_channels() -> int:
	pass;

#desc Returns the video duration in seconds, if known, or 0 if unknown.
func _get_length() -> float:
	pass;

#desc Returns the audio sample rate used for mixing.
func _get_mix_rate() -> int:
	pass;

#desc Return the current playback timestamp. Called in response to the [member VideoStreamPlayer.stream_position] getter.
func _get_playback_position() -> float:
	pass;

#desc Allocates a [Texture2D] in which decoded video frames will be drawn.
func _get_texture() -> Texture2D:
	pass;

#desc Returns the paused status, as set by [method _set_paused].
func _is_paused() -> bool:
	pass;

#desc Returns the playback state, as determined by calls to [method _play] and [method _stop].
func _is_playing() -> bool:
	pass;

#desc Called in response to [member VideoStreamPlayer.autoplay] or [method VideoStreamPlayer.play]. Note that manual playback may also invoke [method _stop] multiple times before this method is called. [method _is_playing] should return true once playing.
func _play() -> void:
	pass;

#desc Seeks to [code]time[/code] seconds. Called in response to the [member VideoStreamPlayer.stream_position] setter.
func _seek(time: float) -> void:
	pass;

#desc Select the audio track [code]idx[/code]. Called when playback starts, and in response to the [member VideoStreamPlayer.audio_track] setter.
func _set_audio_track(idx: int) -> void:
	pass;

#desc Set the paused status of video playback. [method _is_paused] must return [code]paused[/code]. Called in response to the [member VideoStreamPlayer.paused] setter.
func _set_paused(paused: bool) -> void:
	pass;

#desc Stops playback. May be called multiple times before [method _play], or in response to [method VideoStreamPlayer.stop]. [method _is_playing] should return false once stopped.
func _stop() -> void:
	pass;

#desc Ticks video playback for [code]delta[/code] seconds. Called every frame as long as [method _is_paused] and [method _is_playing] return true.
func _update(delta: float) -> void:
	pass;

#desc Render [code]num_frames[/code] audio frames (of [method _get_channels] floats each) from [code]buffer[/code], starting from index [code]offset[/code] in the array. Returns the number of audio frames rendered, or -1 on error.
func mix_audio(num_frames: int, buffer: PackedFloat32Array = PackedFloat32Array(), offset: int = 0) -> int:
	pass;


