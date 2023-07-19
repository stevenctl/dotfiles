extends AudioStream
#brief An audio stream with utilities for procedural sound generation.
#desc [AudioStreamGenerator] is a type of audio stream that does not play back sounds on its own; instead, it expects a script to generate audio data for it. See also [AudioStreamGeneratorPlayback].
#desc Here's a sample on how to use it to generate a sine wave:
#desc [codeblock]
#desc var playback # Will hold the AudioStreamGeneratorPlayback.
#desc @onready var sample_hz = $AudioStreamPlayer.stream.mix_rate
#desc var pulse_hz = 440.0 # The frequency of the sound wave.
#desc 
#desc func _ready():
#desc $AudioStreamPlayer.play()
#desc playback = $AudioStreamPlayer.get_stream_playback()
#desc fill_buffer()
#desc 
#desc func fill_buffer():
#desc var phase = 0.0
#desc var increment = pulse_hz / sample_hz
#desc var frames_available = playback.get_frames_available()
#desc 
#desc for i in range(frames_available):
#desc playback.push_frame(Vector2.ONE * sin(phase * TAU))
#desc phase = fmod(phase + increment, 1.0)
#desc [/codeblock]
#desc In the example above, the "AudioStreamPlayer" node must use an [AudioStreamGenerator] as its stream. The [code]fill_buffer[/code] function provides audio data for approximating a sine wave.
#desc See also [AudioEffectSpectrumAnalyzer] for performing real-time audio spectrum analysis.
#desc [b]Note:[/b] Due to performance constraints, this class is best used from C# or from a compiled language via GDExtension. If you still want to use this class from GDScript, consider using a lower [member mix_rate] such as 11,025 Hz or 22,050 Hz.
#tutorial [Audio Generator Demo] https://godotengine.org/asset-library/asset/526
class_name AudioStreamGenerator


#desc The length of the buffer to generate (in seconds). Lower values result in less latency, but require the script to generate audio data faster, resulting in increased CPU usage and more risk for audio cracking if the CPU can't keep up.
var buffer_length: float:
	get = get_buffer_length, set = set_buffer_length

#desc The sample rate to use (in Hz). Higher values are more demanding for the CPU to generate, but result in better quality.
#desc In games, common sample rates in use are [code]11025[/code], [code]16000[/code], [code]22050[/code], [code]32000[/code], [code]44100[/code], and [code]48000[/code].
#desc According to the [url=https://en.wikipedia.org/wiki/Nyquist%E2%80%93Shannon_sampling_theorem]Nyquist-Shannon sampling theorem[/url], there is no quality difference to human hearing when going past 40,000 Hz (since most humans can only hear up to ~20,000 Hz, often less). If you are generating lower-pitched sounds such as voices, lower sample rates such as [code]32000[/code] or [code]22050[/code] may be usable with no loss in quality.
var mix_rate: float:
	get = get_mix_rate, set = set_mix_rate




func get_buffer_length() -> float:
	return buffer_length

func set_buffer_length(value: float) -> void:
	buffer_length = value

func get_mix_rate() -> float:
	return mix_rate

func set_mix_rate(value: float) -> void:
	mix_rate = value

