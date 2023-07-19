extends AudioEffect
#brief Audio effect that can be used for real-time audio visualizations.
#desc This audio effect does not affect sound output, but can be used for real-time audio visualizations.
#desc See also [AudioStreamGenerator] for procedurally generating sounds.
#tutorial [Audio Spectrum Demo] https://godotengine.org/asset-library/asset/528
#tutorial [Godot 3.2 will get new audio features] https://godotengine.org/article/godot-32-will-get-new-audio-features
class_name AudioEffectSpectrumAnalyzer

#desc Use a buffer of 256 samples for the Fast Fourier transform. Lowest latency, but least stable over time.
#desc Use a buffer of 512 samples for the Fast Fourier transform. Low latency, but less stable over time.
#desc Use a buffer of 1024 samples for the Fast Fourier transform. This is a compromise between latency and stability over time.
#desc Use a buffer of 2048 samples for the Fast Fourier transform. High latency, but stable over time.
#desc Use a buffer of 4096 samples for the Fast Fourier transform. Highest latency, but most stable over time.
#desc Represents the size of the [enum FFTSize] enum.

#enum FFTSize
enum {
    FFT_SIZE_256 = 0,
    FFT_SIZE_512 = 1,
    FFT_SIZE_1024 = 2,
    FFT_SIZE_2048 = 3,
    FFT_SIZE_4096 = 4,
    FFT_SIZE_MAX = 5,
}
#desc The length of the buffer to keep (in seconds). Higher values keep data around for longer, but require more memory.
var buffer_length: float:
	get = get_buffer_length, set = set_buffer_length

#desc The size of the [url=https://en.wikipedia.org/wiki/Fast_Fourier_transform]Fast Fourier transform[/url] buffer. Higher values smooth out the spectrum analysis over time, but have greater latency. The effects of this higher latency are especially noticeable with sudden amplitude changes.
var fft_size: int:
	get = get_fft_size, set = set_fft_size

var tap_back_pos: float:
	get = get_tap_back_pos, set = set_tap_back_pos




func get_buffer_length() -> float:
	return buffer_length

func set_buffer_length(value: float) -> void:
	buffer_length = value

func get_fft_size() -> int:
	return fft_size

func set_fft_size(value: int) -> void:
	fft_size = value

func get_tap_back_pos() -> float:
	return tap_back_pos

func set_tap_back_pos(value: float) -> void:
	tap_back_pos = value

