extends AudioEffect
#brief Adds a distortion audio effect to an Audio bus.
#brief Modifies the sound to make it distorted.
#desc Different types are available: clip, tan, lo-fi (bit crushing), overdrive, or waveshape.
#desc By distorting the waveform the frequency content changes, which will often make the sound "crunchy" or "abrasive". For games, it can simulate sound coming from some saturated device or speaker very efficiently.
#tutorial [Audio buses] https://docs.godotengine.org/en/stable/tutorials/audio/audio_buses.html
class_name AudioEffectDistortion

#desc Digital distortion effect which cuts off peaks at the top and bottom of the waveform.
#desc Low-resolution digital distortion effect (bit depth reduction). You can use it to emulate the sound of early digital audio devices.
#desc Emulates the warm distortion produced by a field effect transistor, which is commonly used in solid-state musical instrument amplifiers. The [member drive] property has no effect in this mode.
#desc Waveshaper distortions are used mainly by electronic musicians to achieve an extra-abrasive sound.

#enum Mode
enum {
    MODE_CLIP = 0,
    MODE_ATAN = 1,
    MODE_LOFI = 2,
    MODE_OVERDRIVE = 3,
    MODE_WAVESHAPE = 4,
}
#desc Distortion power. Value can range from 0 to 1.
var drive: float:
	get = get_drive, set = set_drive

#desc High-pass filter, in Hz. Frequencies higher than this value will not be affected by the distortion. Value can range from 1 to 20000.
var keep_hf_hz: float:
	get = get_keep_hf_hz, set = set_keep_hf_hz

#desc Distortion type.
var mode: int:
	get = get_mode, set = set_mode

#desc Increases or decreases the volume after the effect, in decibels. Value can range from -80 to 24.
var post_gain: float:
	get = get_post_gain, set = set_post_gain

#desc Increases or decreases the volume before the effect, in decibels. Value can range from -60 to 60.
var pre_gain: float:
	get = get_pre_gain, set = set_pre_gain




func get_drive() -> float:
	return drive

func set_drive(value: float) -> void:
	drive = value

func get_keep_hf_hz() -> float:
	return keep_hf_hz

func set_keep_hf_hz(value: float) -> void:
	keep_hf_hz = value

func get_mode() -> int:
	return mode

func set_mode(value: int) -> void:
	mode = value

func get_post_gain() -> float:
	return post_gain

func set_post_gain(value: float) -> void:
	post_gain = value

func get_pre_gain() -> float:
	return pre_gain

func set_pre_gain(value: float) -> void:
	pre_gain = value

