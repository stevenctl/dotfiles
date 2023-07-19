extends Control
#brief Control for playing video streams.
#desc Control node for playing video streams using [VideoStream] resources.
#desc Supported video formats are [url=https://www.theora.org/]Ogg Theora[/url] ([code].ogv[/code], [VideoStreamTheora]) and any format exposed via a GDExtension plugin.
#desc [b]Note:[/b] Due to a bug, VideoStreamPlayer does not support localization remapping yet.
#desc [b]Warning:[/b] On Web, video playback [i]will[/i] perform poorly due to missing architecture-specific assembly optimizations.
class_name VideoStreamPlayer

#desc Emitted when playback is finished.
signal finished

#desc The embedded audio track to play.
var audio_track: int:
	get = get_audio_track, set = set_audio_track

#desc If [code]true[/code], playback starts when the scene loads.
var autoplay: bool:
	get = has_autoplay, set = set_autoplay

#desc Amount of time in milliseconds to store in buffer while playing.
var buffering_msec: int:
	get = get_buffering_msec, set = set_buffering_msec

#desc Audio bus to use for sound playback.
var bus: StringName:
	get = get_bus, set = set_bus

#desc If [code]true[/code], the video scales to the control size. Otherwise, the control minimum size will be automatically adjusted to match the video stream's dimensions.
var expand: bool:
	get = has_expand, set = set_expand

#desc If [code]true[/code], the video is paused.
var paused: bool:
	get = is_paused, set = set_paused

#desc The assigned video stream. See description for supported formats.
var stream: VideoStream:
	get = get_stream, set = set_stream

#desc The current position of the stream, in seconds.
#desc [b]Note:[/b] Changing this value won't have any effect as seeking is not implemented yet, except in video formats implemented by a GDExtension add-on.
var stream_position: float:
	get = get_stream_position, set = set_stream_position

#desc Audio volume as a linear value.
var volume: float:
	get = get_volume, set = set_volume

#desc Audio volume in dB.
var volume_db: float:
	get = get_volume_db, set = set_volume_db



#desc Returns the video stream's name, or [code]"<No Stream>"[/code] if no video stream is assigned.
func get_stream_name() -> String:
	pass;

#desc Returns the current frame as a [Texture2D].
func get_video_texture() -> Texture2D:
	pass;

#desc Returns [code]true[/code] if the video is playing.
#desc [b]Note:[/b] The video is still considered playing if paused during playback.
func is_playing() -> bool:
	pass;

#desc Starts the video playback from the beginning. If the video is paused, this will not unpause the video.
func play() -> void:
	pass;

#desc Stops the video playback and sets the stream position to 0.
#desc [b]Note:[/b] Although the stream position will be set to 0, the first frame of the video stream won't become the current frame.
func stop() -> void:
	pass;


func get_audio_track() -> int:
	return audio_track

func set_audio_track(value: int) -> void:
	audio_track = value

func has_autoplay() -> bool:
	return autoplay

func set_autoplay(value: bool) -> void:
	autoplay = value

func get_buffering_msec() -> int:
	return buffering_msec

func set_buffering_msec(value: int) -> void:
	buffering_msec = value

func get_bus() -> StringName:
	return bus

func set_bus(value: StringName) -> void:
	bus = value

func has_expand() -> bool:
	return expand

func set_expand(value: bool) -> void:
	expand = value

func is_paused() -> bool:
	return paused

func set_paused(value: bool) -> void:
	paused = value

func get_stream() -> VideoStream:
	return stream

func set_stream(value: VideoStream) -> void:
	stream = value

func get_stream_position() -> float:
	return stream_position

func set_stream_position(value: float) -> void:
	stream_position = value

func get_volume() -> float:
	return volume

func set_volume(value: float) -> void:
	volume = value

func get_volume_db() -> float:
	return volume_db

func set_volume_db(value: float) -> void:
	volume_db = value

