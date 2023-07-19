extends AudioEffect
#brief Adds a reverberation audio effect to an Audio bus.
#desc Simulates the sound of acoustic environments such as rooms, concert halls, caverns, or an open spaces.
#tutorial [Audio buses] https://docs.godotengine.org/en/stable/tutorials/audio/audio_buses.html
#tutorial [Third Person Shooter Demo] https://godotengine.org/asset-library/asset/678
class_name AudioEffectReverb


#desc Defines how reflective the imaginary room's walls are. Value can range from 0 to 1.
var damping: float:
	get = get_damping, set = set_damping

#desc Output percent of original sound. At 0, only modified sound is outputted. Value can range from 0 to 1.
var dry: float:
	get = get_dry, set = set_dry

#desc High-pass filter passes signals with a frequency higher than a certain cutoff frequency and attenuates signals with frequencies lower than the cutoff frequency. Value can range from 0 to 1.
var hipass: float:
	get = get_hpf, set = set_hpf

#desc Output percent of predelay. Value can range from 0 to 1.
var predelay_feedback: float:
	get = get_predelay_feedback, set = set_predelay_feedback

#desc Time between the original signal and the early reflections of the reverb signal, in milliseconds.
var predelay_msec: float:
	get = get_predelay_msec, set = set_predelay_msec

#desc Dimensions of simulated room. Bigger means more echoes. Value can range from 0 to 1.
var room_size: float:
	get = get_room_size, set = set_room_size

#desc Widens or narrows the stereo image of the reverb tail. 1 means fully widens. Value can range from 0 to 1.
var spread: float:
	get = get_spread, set = set_spread

#desc Output percent of modified sound. At 0, only original sound is outputted. Value can range from 0 to 1.
var wet: float:
	get = get_wet, set = set_wet




func get_damping() -> float:
	return damping

func set_damping(value: float) -> void:
	damping = value

func get_dry() -> float:
	return dry

func set_dry(value: float) -> void:
	dry = value

func get_hpf() -> float:
	return hipass

func set_hpf(value: float) -> void:
	hipass = value

func get_predelay_feedback() -> float:
	return predelay_feedback

func set_predelay_feedback(value: float) -> void:
	predelay_feedback = value

func get_predelay_msec() -> float:
	return predelay_msec

func set_predelay_msec(value: float) -> void:
	predelay_msec = value

func get_room_size() -> float:
	return room_size

func set_room_size(value: float) -> void:
	room_size = value

func get_spread() -> float:
	return spread

func set_spread(value: float) -> void:
	spread = value

func get_wet() -> float:
	return wet

func set_wet(value: float) -> void:
	wet = value

