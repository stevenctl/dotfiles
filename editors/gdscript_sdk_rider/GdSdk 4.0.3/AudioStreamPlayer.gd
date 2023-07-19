extends Node
#brief Plays back audio non-positionally.
#desc Plays an audio stream non-positionally.
#desc To play audio positionally, use [AudioStreamPlayer2D] or [AudioStreamPlayer3D] instead of [AudioStreamPlayer].
#tutorial [Audio streams] https://docs.godotengine.org/en/stable/tutorials/audio/audio_streams.html
#tutorial [2D Dodge The Creeps Demo] https://godotengine.org/asset-library/asset/515
#tutorial [Audio Device Changer Demo] https://godotengine.org/asset-library/asset/525
#tutorial [Audio Generator Demo] https://godotengine.org/asset-library/asset/526
#tutorial [Audio Mic Record Demo] https://godotengine.org/asset-library/asset/527
#tutorial [Audio Spectrum Demo] https://godotengine.org/asset-library/asset/528
class_name AudioStreamPlayer

#desc Emitted when the audio stops playing.
signal finished
#desc The audio will be played only on the first channel.
#desc The audio will be played on all surround channels.
#desc The audio will be played on the second channel, which is usually the center.

#enum MixTarget
enum {
    MIX_TARGET_STEREO = 0,
    MIX_TARGET_SURROUND = 1,
    MIX_TARGET_CENTER = 2,
}
#desc If [code]true[/code], audio plays when added to scene tree.
var autoplay: bool:
	get = is_autoplay_enabled, set = set_autoplay

#desc Bus on which this audio is playing.
#desc [b]Note:[/b] When setting this property, keep in mind that no validation is performed to see if the given name matches an existing bus. This is because audio bus layouts might be loaded after this property is set. If this given name can't be resolved at runtime, it will fall back to [code]"Master"[/code].
var bus: StringName:
	get = get_bus, set = set_bus

#desc The maximum number of sounds this node can play at the same time. Playing additional sounds after this value is reached will cut off the oldest sounds.
var max_polyphony: int:
	get = get_max_polyphony, set = set_max_polyphony

#desc If the audio configuration has more than two speakers, this sets the target channels. See [enum MixTarget] constants.
var mix_target: int:
	get = get_mix_target, set = set_mix_target

#desc The pitch and the tempo of the audio, as a multiplier of the audio sample's sample rate.
var pitch_scale: float:
	get = get_pitch_scale, set = set_pitch_scale

#desc If [code]true[/code], audio is playing.
var playing: bool:
	get = is_playing, set = _set_playing

#desc The [AudioStream] object to be played.
var stream: AudioStream:
	get = get_stream, set = set_stream

#desc If [code]true[/code], the playback is paused. You can resume it by setting [code]stream_paused[/code] to [code]false[/code].
var stream_paused: bool:
	get = get_stream_paused, set = set_stream_paused

#desc Volume of sound, in dB.
var volume_db: float:
	get = get_volume_db, set = set_volume_db



#desc Returns the position in the [AudioStream] in seconds.
func get_playback_position() -> float:
	pass;

#desc Returns the [AudioStreamPlayback] object associated with this [AudioStreamPlayer].
func get_stream_playback() -> AudioStreamPlayback:
	pass;

#desc Returns whether the [AudioStreamPlayer] can return the [AudioStreamPlayback] object or not.
func has_stream_playback() -> bool:
	pass;

#desc Plays the audio from the given [param from_position], in seconds.
func play(from_position: float = 0.0) -> void:
	pass;

#desc Sets the position from which audio will be played, in seconds.
func seek(to_position: float) -> void:
	pass;

#desc Stops the audio.
func stop() -> void:
	pass;


func is_autoplay_enabled() -> bool:
	return autoplay

func set_autoplay(value: bool) -> void:
	autoplay = value

func get_bus() -> StringName:
	return bus

func set_bus(value: StringName) -> void:
	bus = value

func get_max_polyphony() -> int:
	return max_polyphony

func set_max_polyphony(value: int) -> void:
	max_polyphony = value

func get_mix_target() -> int:
	return mix_target

func set_mix_target(value: int) -> void:
	mix_target = value

func get_pitch_scale() -> float:
	return pitch_scale

func set_pitch_scale(value: float) -> void:
	pitch_scale = value

func is_playing() -> bool:
	return playing

func _set_playing(value: bool) -> void:
	playing = value

func get_stream() -> AudioStream:
	return stream

func set_stream(value: AudioStream) -> void:
	stream = value

func get_stream_paused() -> bool:
	return stream_paused

func set_stream_paused(value: bool) -> void:
	stream_paused = value

func get_volume_db() -> float:
	return volume_db

func set_volume_db(value: float) -> void:
	volume_db = value

