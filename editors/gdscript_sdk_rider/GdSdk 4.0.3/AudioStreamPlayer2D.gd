extends Node2D
#brief Plays positional sound in 2D space.
#desc Plays audio that is attenuated with distance to the listener.
#desc By default, audio is heard from the screen center. This can be changed by adding an [AudioListener2D] node to the scene and enabling it by calling [method AudioListener2D.make_current] on it.
#desc See also [AudioStreamPlayer] to play a sound non-positionally.
#desc [b]Note:[/b] Hiding an [AudioStreamPlayer2D] node does not disable its audio output. To temporarily disable an [AudioStreamPlayer2D]'s audio output, set [member volume_db] to a very low value like [code]-100[/code] (which isn't audible to human hearing).
#tutorial [Audio streams] https://docs.godotengine.org/en/stable/tutorials/audio/audio_streams.html
class_name AudioStreamPlayer2D

#desc Emitted when the audio stops playing.
signal finished

#desc Determines which [Area2D] layers affect the sound for reverb and audio bus effects. Areas can be used to redirect [AudioStream]s so that they play in a certain audio bus. An example of how you might use this is making a "water" area so that sounds played in the water are redirected through an audio bus to make them sound like they are being played underwater.
var area_mask: int:
	get = get_area_mask, set = set_area_mask

#desc The volume is attenuated over distance with this as an exponent.
var attenuation: float:
	get = get_attenuation, set = set_attenuation

#desc If [code]true[/code], audio plays when added to scene tree.
var autoplay: bool:
	get = is_autoplay_enabled, set = set_autoplay

#desc Bus on which this audio is playing.
#desc [b]Note:[/b] When setting this property, keep in mind that no validation is performed to see if the given name matches an existing bus. This is because audio bus layouts might be loaded after this property is set. If this given name can't be resolved at runtime, it will fall back to [code]"Master"[/code].
var bus: StringName:
	get = get_bus, set = set_bus

#desc Maximum distance from which audio is still hearable.
var max_distance: float:
	get = get_max_distance, set = set_max_distance

#desc The maximum number of sounds this node can play at the same time. Playing additional sounds after this value is reached will cut off the oldest sounds.
var max_polyphony: int:
	get = get_max_polyphony, set = set_max_polyphony

#desc Scales the panning strength for this node by multiplying the base [member ProjectSettings.audio/general/2d_panning_strength] with this factor. Higher values will pan audio from left to right more dramatically than lower values.
var panning_strength: float:
	get = get_panning_strength, set = set_panning_strength

#desc The pitch and the tempo of the audio, as a multiplier of the audio sample's sample rate.
var pitch_scale: float:
	get = get_pitch_scale, set = set_pitch_scale

#desc If [code]true[/code], audio is playing or is queued to be played (see [method play]).
var playing: bool:
	get = is_playing, set = _set_playing

#desc The [AudioStream] object to be played.
var stream: AudioStream:
	get = get_stream, set = set_stream

#desc If [code]true[/code], the playback is paused. You can resume it by setting [code]stream_paused[/code] to [code]false[/code].
var stream_paused: bool:
	get = get_stream_paused, set = set_stream_paused

#desc Base volume before attenuation.
var volume_db: float:
	get = get_volume_db, set = set_volume_db



#desc Returns the position in the [AudioStream].
func get_playback_position() -> float:
	pass;

#desc Returns the [AudioStreamPlayback] object associated with this [AudioStreamPlayer2D].
func get_stream_playback() -> AudioStreamPlayback:
	pass;

#desc Returns whether the [AudioStreamPlayer] can return the [AudioStreamPlayback] object or not.
func has_stream_playback() -> bool:
	pass;

#desc Queues the audio to play on the next physics frame, from the given position [param from_position], in seconds.
func play(from_position: float = 0.0) -> void:
	pass;

#desc Sets the position from which audio will be played, in seconds.
func seek(to_position: float) -> void:
	pass;

#desc Stops the audio.
func stop() -> void:
	pass;


func get_area_mask() -> int:
	return area_mask

func set_area_mask(value: int) -> void:
	area_mask = value

func get_attenuation() -> float:
	return attenuation

func set_attenuation(value: float) -> void:
	attenuation = value

func is_autoplay_enabled() -> bool:
	return autoplay

func set_autoplay(value: bool) -> void:
	autoplay = value

func get_bus() -> StringName:
	return bus

func set_bus(value: StringName) -> void:
	bus = value

func get_max_distance() -> float:
	return max_distance

func set_max_distance(value: float) -> void:
	max_distance = value

func get_max_polyphony() -> int:
	return max_polyphony

func set_max_polyphony(value: int) -> void:
	max_polyphony = value

func get_panning_strength() -> float:
	return panning_strength

func set_panning_strength(value: float) -> void:
	panning_strength = value

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

