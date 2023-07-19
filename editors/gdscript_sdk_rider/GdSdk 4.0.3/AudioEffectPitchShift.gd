extends AudioEffect
#brief Adds a pitch-shifting audio effect to an audio bus.
#brief Raises or lowers the pitch of original sound.
#desc Allows modulation of pitch independently of tempo. All frequencies can be increased/decreased with minimal effect on transients.
#tutorial [Audio buses] https://docs.godotengine.org/en/stable/tutorials/audio/audio_buses.html
class_name AudioEffectPitchShift

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
#desc The size of the [url=https://en.wikipedia.org/wiki/Fast_Fourier_transform]Fast Fourier transform[/url] buffer. Higher values smooth out the effect over time, but have greater latency. The effects of this higher latency are especially noticeable on sounds that have sudden amplitude changes.
var fft_size: int:
	get = get_fft_size, set = set_fft_size

#desc The oversampling factor to use. Higher values result in better quality, but are more demanding on the CPU and may cause audio cracking if the CPU can't keep up.
var oversampling: int:
	get = get_oversampling, set = set_oversampling

#desc The pitch scale to use. [code]1.0[/code] is the default pitch and plays sounds unaltered. [member pitch_scale] can range from [code]0.0[/code] (infinitely low pitch, inaudible) to [code]16[/code] (16 times higher than the initial pitch).
var pitch_scale: float:
	get = get_pitch_scale, set = set_pitch_scale




func get_fft_size() -> int:
	return fft_size

func set_fft_size(value: int) -> void:
	fft_size = value

func get_oversampling() -> int:
	return oversampling

func set_oversampling(value: int) -> void:
	oversampling = value

func get_pitch_scale() -> float:
	return pitch_scale

func set_pitch_scale(value: float) -> void:
	pitch_scale = value

