extends AudioStream
#brief AudioStream that lets the user play custom streams at any time from code, simultaneously using a single player.
#desc AudioStream that lets the user play custom streams at any time from code, simultaneously using a single player.
#desc Playback control is done via the [AudioStreamPlaybackPolyphonic] instance set inside the player, which can be obtained via [method AudioStreamPlayer.get_stream_playback], [method AudioStreamPlayer2D.get_stream_playback] or [method AudioStreamPlayer3D.get_stream_playback] methods. Obtaining the playback instance is only valid after the [code]stream[/code] property is set as an [AudioStreamPolyphonic] in those players.
class_name AudioStreamPolyphonic


#desc Maximum amount of simultaneous streams that can be played.
var polyphony: int:
	get = get_polyphony, set = set_polyphony




func get_polyphony() -> int:
	return polyphony

func set_polyphony(value: int) -> void:
	polyphony = value

