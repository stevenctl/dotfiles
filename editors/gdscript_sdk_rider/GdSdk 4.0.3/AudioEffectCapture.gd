extends AudioEffect
#brief Captures audio from an audio bus in real-time.
#desc AudioEffectCapture is an AudioEffect which copies all audio frames from the attached audio effect bus into its internal ring buffer.
#desc Application code should consume these audio frames from this ring buffer using [method get_buffer] and process it as needed, for example to capture data from an [AudioStreamMicrophone], implement application-defined effects, or to transmit audio over the network. When capturing audio data from a microphone, the format of the samples will be stereo 32-bit floating point PCM.
#desc [b]Note:[/b] [member ProjectSettings.audio/driver/enable_input] must be [code]true[/code] for audio input to work. See also that setting's description for caveats related to permissions and operating system privacy settings.
#tutorial [Audio buses] https://docs.godotengine.org/en/stable/tutorials/audio/audio_buses.html
#tutorial [Audio Mic Record Demo] https://github.com/godotengine/godot-demo-projects/tree/master/audio/mic_record
class_name AudioEffectCapture


#desc Length of the internal ring buffer, in seconds. Setting the buffer length will have no effect if already initialized.
var buffer_length: float:
	get = get_buffer_length, set = set_buffer_length



#desc Returns [code]true[/code] if at least [param frames] audio frames are available to read in the internal ring buffer.
func can_get_buffer(frames: int) -> bool:
	pass;

#desc Clears the internal ring buffer.
func clear_buffer() -> void:
	pass;

#desc Gets the next [param frames] audio samples from the internal ring buffer.
#desc Returns a [PackedVector2Array] containing exactly [param frames] audio samples if available, or an empty [PackedVector2Array] if insufficient data was available.
func get_buffer(frames: int) -> PackedVector2Array:
	pass;

#desc Returns the total size of the internal ring buffer in frames.
func get_buffer_length_frames() -> int:
	pass;

#desc Returns the number of audio frames discarded from the audio bus due to full buffer.
func get_discarded_frames() -> int:
	pass;

#desc Returns the number of frames available to read using [method get_buffer].
func get_frames_available() -> int:
	pass;

#desc Returns the number of audio frames inserted from the audio bus.
func get_pushed_frames() -> int:
	pass;


func get_buffer_length() -> float:
	return buffer_length

func set_buffer_length(value: float) -> void:
	buffer_length = value

