extends AudioStreamPlaybackResampled
#brief Plays back audio generated using [AudioStreamGenerator].
#desc This class is meant to be used with [AudioStreamGenerator] to play back the generated audio in real-time.
#tutorial [Audio Generator Demo] https://godotengine.org/asset-library/asset/526
#tutorial [Godot 3.2 will get new audio features] https://godotengine.org/article/godot-32-will-get-new-audio-features
class_name AudioStreamGeneratorPlayback




#desc Returns [code]true[/code] if a buffer of the size [param amount] can be pushed to the audio sample data buffer without overflowing it, [code]false[/code] otherwise.
func can_push_buffer(amount: int) -> bool:
	pass;

#desc Clears the audio sample data buffer.
func clear_buffer() -> void:
	pass;

#desc Returns the number of frames that can be pushed to the audio sample data buffer without overflowing it. If the result is [code]0[/code], the buffer is full.
func get_frames_available() -> int:
	pass;

func get_skips() -> int:
	pass;

#desc Pushes several audio data frames to the buffer. This is usually more efficient than [method push_frame] in C# and compiled languages via GDExtension, but [method push_buffer] may be [i]less[/i] efficient in GDScript.
func push_buffer(frames: PackedVector2Array) -> bool:
	pass;

#desc Pushes a single audio data frame to the buffer. This is usually less efficient than [method push_buffer] in C# and compiled languages via GDExtension, but [method push_frame] may be [i]more[/i] efficient in GDScript.
func push_frame(frame: Vector2) -> bool:
	pass;


