extends Node3D
#brief Plays positional sound in 3D space.
#desc Plays audio with positional sound effects, based on the relative position of the audio listener. Positional effects include distance attenuation, directionality, and the Doppler effect. For greater realism, a low-pass filter is applied to distant sounds. This can be disabled by setting [member attenuation_filter_cutoff_hz] to [code]20500[/code].
#desc By default, audio is heard from the camera position. This can be changed by adding an [AudioListener3D] node to the scene and enabling it by calling [method AudioListener3D.make_current] on it.
#desc See also [AudioStreamPlayer] to play a sound non-positionally.
#desc [b]Note:[/b] Hiding an [AudioStreamPlayer3D] node does not disable its audio output. To temporarily disable an [AudioStreamPlayer3D]'s audio output, set [member volume_db] to a very low value like [code]-100[/code] (which isn't audible to human hearing).
#tutorial [Audio streams] https://docs.godotengine.org/en/stable/tutorials/audio/audio_streams.html
class_name AudioStreamPlayer3D

#desc Emitted when the audio stops playing.
signal finished
#desc Attenuation of loudness according to linear distance.
#desc Attenuation of loudness according to squared distance.
#desc Attenuation of loudness according to logarithmic distance.
#desc No attenuation of loudness according to distance. The sound will still be heard positionally, unlike an [AudioStreamPlayer]. [constant ATTENUATION_DISABLED] can be combined with a [member max_distance] value greater than [code]0.0[/code] to achieve linear attenuation clamped to a sphere of a defined size.
#desc Disables doppler tracking.
#desc Executes doppler tracking in idle step.
#desc Executes doppler tracking in physics step.

#enum AttenuationModel
enum {
    ATTENUATION_INVERSE_DISTANCE = 0,
    ATTENUATION_INVERSE_SQUARE_DISTANCE = 1,
    ATTENUATION_LOGARITHMIC = 2,
    ATTENUATION_DISABLED = 3,
}
#enum DopplerTracking
enum {
    DOPPLER_TRACKING_DISABLED = 0,
    DOPPLER_TRACKING_IDLE_STEP = 1,
    DOPPLER_TRACKING_PHYSICS_STEP = 2,
}
#desc Determines which [Area3D] layers affect the sound for reverb and audio bus effects. Areas can be used to redirect [AudioStream]s so that they play in a certain audio bus. An example of how you might use this is making a "water" area so that sounds played in the water are redirected through an audio bus to make them sound like they are being played underwater.
var area_mask: int:
	get = get_area_mask, set = set_area_mask

#desc The cutoff frequency of the attenuation low-pass filter, in Hz. A sound above this frequency is attenuated more than a sound below this frequency. To disable this effect, set this to [code]20500[/code] as this frequency is above the human hearing limit.
var attenuation_filter_cutoff_hz: float:
	get = get_attenuation_filter_cutoff_hz, set = set_attenuation_filter_cutoff_hz

#desc Amount how much the filter affects the loudness, in decibels.
var attenuation_filter_db: float:
	get = get_attenuation_filter_db, set = set_attenuation_filter_db

#desc Decides if audio should get quieter with distance linearly, quadratically, logarithmically, or not be affected by distance, effectively disabling attenuation.
var attenuation_model: int:
	get = get_attenuation_model, set = set_attenuation_model

#desc If [code]true[/code], audio plays when the AudioStreamPlayer3D node is added to scene tree.
var autoplay: bool:
	get = is_autoplay_enabled, set = set_autoplay

#desc The bus on which this audio is playing.
#desc [b]Note:[/b] When setting this property, keep in mind that no validation is performed to see if the given name matches an existing bus. This is because audio bus layouts might be loaded after this property is set. If this given name can't be resolved at runtime, it will fall back to [code]"Master"[/code].
var bus: StringName:
	get = get_bus, set = set_bus

#desc Decides in which step the Doppler effect should be calculated.
var doppler_tracking: int:
	get = get_doppler_tracking, set = set_doppler_tracking

#desc The angle in which the audio reaches a listener unattenuated.
var emission_angle_degrees: float:
	get = get_emission_angle, set = set_emission_angle

#desc If [code]true[/code], the audio should be attenuated according to the direction of the sound.
var emission_angle_enabled: bool:
	get = is_emission_angle_enabled, set = set_emission_angle_enabled

#desc Attenuation factor used if listener is outside of [member emission_angle_degrees] and [member emission_angle_enabled] is set, in decibels.
var emission_angle_filter_attenuation_db: float:
	get = get_emission_angle_filter_attenuation_db, set = set_emission_angle_filter_attenuation_db

#desc Sets the absolute maximum of the soundlevel, in decibels.
var max_db: float:
	get = get_max_db, set = set_max_db

#desc The distance past which the sound can no longer be heard at all. Only has an effect if set to a value greater than [code]0.0[/code]. [member max_distance] works in tandem with [member unit_size]. However, unlike [member unit_size] whose behavior depends on the [member attenuation_model], [member max_distance] always works in a linear fashion. This can be used to prevent the [AudioStreamPlayer3D] from requiring audio mixing when the listener is far away, which saves CPU resources.
var max_distance: float:
	get = get_max_distance, set = set_max_distance

#desc The maximum number of sounds this node can play at the same time. Playing additional sounds after this value is reached will cut off the oldest sounds.
var max_polyphony: int:
	get = get_max_polyphony, set = set_max_polyphony

#desc Scales the panning strength for this node by multiplying the base [member ProjectSettings.audio/general/3d_panning_strength] with this factor. Higher values will pan audio from left to right more dramatically than lower values.
var panning_strength: float:
	get = get_panning_strength, set = set_panning_strength

#desc The pitch and the tempo of the audio, as a multiplier of the audio sample's sample rate.
var pitch_scale: float:
	get = get_pitch_scale, set = set_pitch_scale

#desc If [code]true[/code], audio is playing or is queued to be played (see [method play]).
var playing: bool:
	get = is_playing, set = _set_playing

#desc The [AudioStream] resource to be played.
var stream: AudioStream:
	get = get_stream, set = set_stream

#desc If [code]true[/code], the playback is paused. You can resume it by setting [member stream_paused] to [code]false[/code].
var stream_paused: bool:
	get = get_stream_paused, set = set_stream_paused

#desc The factor for the attenuation effect. Higher values make the sound audible over a larger distance.
var unit_size: float:
	get = get_unit_size, set = set_unit_size

#desc The base sound level before attenuation, in decibels.
var volume_db: float:
	get = get_volume_db, set = set_volume_db



#desc Returns the position in the [AudioStream].
func get_playback_position() -> float:
	pass;

#desc Returns the [AudioStreamPlayback] object associated with this [AudioStreamPlayer3D].
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

func get_attenuation_filter_cutoff_hz() -> float:
	return attenuation_filter_cutoff_hz

func set_attenuation_filter_cutoff_hz(value: float) -> void:
	attenuation_filter_cutoff_hz = value

func get_attenuation_filter_db() -> float:
	return attenuation_filter_db

func set_attenuation_filter_db(value: float) -> void:
	attenuation_filter_db = value

func get_attenuation_model() -> int:
	return attenuation_model

func set_attenuation_model(value: int) -> void:
	attenuation_model = value

func is_autoplay_enabled() -> bool:
	return autoplay

func set_autoplay(value: bool) -> void:
	autoplay = value

func get_bus() -> StringName:
	return bus

func set_bus(value: StringName) -> void:
	bus = value

func get_doppler_tracking() -> int:
	return doppler_tracking

func set_doppler_tracking(value: int) -> void:
	doppler_tracking = value

func get_emission_angle() -> float:
	return emission_angle_degrees

func set_emission_angle(value: float) -> void:
	emission_angle_degrees = value

func is_emission_angle_enabled() -> bool:
	return emission_angle_enabled

func set_emission_angle_enabled(value: bool) -> void:
	emission_angle_enabled = value

func get_emission_angle_filter_attenuation_db() -> float:
	return emission_angle_filter_attenuation_db

func set_emission_angle_filter_attenuation_db(value: float) -> void:
	emission_angle_filter_attenuation_db = value

func get_max_db() -> float:
	return max_db

func set_max_db(value: float) -> void:
	max_db = value

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

func get_unit_size() -> float:
	return unit_size

func set_unit_size(value: float) -> void:
	unit_size = value

func get_volume_db() -> float:
	return volume_db

func set_volume_db(value: float) -> void:
	volume_db = value

