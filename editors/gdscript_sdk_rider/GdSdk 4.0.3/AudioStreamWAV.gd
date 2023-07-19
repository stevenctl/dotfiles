extends AudioStream
#brief Stores audio data loaded from WAV files.
#desc AudioStreamWAV stores sound samples loaded from WAV files. To play the stored sound, use an [AudioStreamPlayer] (for non-positional audio) or [AudioStreamPlayer2D]/[AudioStreamPlayer3D] (for positional audio). The sound can be looped.
#desc This class can also be used to store dynamically-generated PCM audio data. See also [AudioStreamGenerator] for procedural audio generation.
class_name AudioStreamWAV

#desc 8-bit audio codec.
#desc 16-bit audio codec.
#desc Audio is compressed using IMA ADPCM.
#desc Audio does not loop.
#desc Audio loops the data between [member loop_begin] and [member loop_end], playing forward only.
#desc Audio loops the data between [member loop_begin] and [member loop_end], playing back and forth.
#desc Audio loops the data between [member loop_begin] and [member loop_end], playing backward only.

#enum Format
enum {
    FORMAT_8_BITS = 0,
    FORMAT_16_BITS = 1,
    FORMAT_IMA_ADPCM = 2,
}
#enum LoopMode
enum {
    LOOP_DISABLED = 0,
    LOOP_FORWARD = 1,
    LOOP_PINGPONG = 2,
    LOOP_BACKWARD = 3,
}
#desc Contains the audio data in bytes.
#desc [b]Note:[/b] This property expects signed PCM8 data. To convert unsigned PCM8 to signed PCM8, subtract 128 from each byte.
var data: PackedByteArray:
	get = get_data, set = set_data

#desc Audio format. See [enum Format] constants for values.
var format: int:
	get = get_format, set = set_format

#desc The loop start point (in number of samples, relative to the beginning of the sample). This information will be imported automatically from the WAV file if present.
var loop_begin: int:
	get = get_loop_begin, set = set_loop_begin

#desc The loop end point (in number of samples, relative to the beginning of the sample). This information will be imported automatically from the WAV file if present.
var loop_end: int:
	get = get_loop_end, set = set_loop_end

#desc The loop mode. This information will be imported automatically from the WAV file if present. See [enum LoopMode] constants for values.
var loop_mode: int:
	get = get_loop_mode, set = set_loop_mode

#desc The sample rate for mixing this audio. Higher values require more storage space, but result in better quality.
#desc In games, common sample rates in use are [code]11025[/code], [code]16000[/code], [code]22050[/code], [code]32000[/code], [code]44100[/code], and [code]48000[/code].
#desc According to the [url=https://en.wikipedia.org/wiki/Nyquist%E2%80%93Shannon_sampling_theorem]Nyquist-Shannon sampling theorem[/url], there is no quality difference to human hearing when going past 40,000 Hz (since most humans can only hear up to ~20,000 Hz, often less). If you are using lower-pitched sounds such as voices, lower sample rates such as [code]32000[/code] or [code]22050[/code] may be usable with no loss in quality.
var mix_rate: int:
	get = get_mix_rate, set = set_mix_rate

#desc If [code]true[/code], audio is stereo.
var stereo: bool:
	get = is_stereo, set = set_stereo



#desc Saves the AudioStreamWAV as a WAV file to [param path]. Samples with IMA ADPCM format can't be saved.
#desc [b]Note:[/b] A [code].wav[/code] extension is automatically appended to [param path] if it is missing.
func save_to_wav(path: String) -> int:
	pass;


func get_data() -> PackedByteArray:
	return data

func set_data(value: PackedByteArray) -> void:
	data = value

func get_format() -> int:
	return format

func set_format(value: int) -> void:
	format = value

func get_loop_begin() -> int:
	return loop_begin

func set_loop_begin(value: int) -> void:
	loop_begin = value

func get_loop_end() -> int:
	return loop_end

func set_loop_end(value: int) -> void:
	loop_end = value

func get_loop_mode() -> int:
	return loop_mode

func set_loop_mode(value: int) -> void:
	loop_mode = value

func get_mix_rate() -> int:
	return mix_rate

func set_mix_rate(value: int) -> void:
	mix_rate = value

func is_stereo() -> bool:
	return stereo

func set_stereo(value: bool) -> void:
	stereo = value

