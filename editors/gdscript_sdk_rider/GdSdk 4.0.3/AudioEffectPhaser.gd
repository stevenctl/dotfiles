extends AudioEffect
#brief Adds a phaser audio effect to an audio bus.
#brief Combines the original signal with a copy that is slightly out of phase with the original.
#desc Combines phase-shifted signals with the original signal. The movement of the phase-shifted signals is controlled using a low-frequency oscillator.
#tutorial [Audio buses] https://docs.godotengine.org/en/stable/tutorials/audio/audio_buses.html
class_name AudioEffectPhaser


#desc Governs how high the filter frequencies sweep. Low value will primarily affect bass frequencies. High value can sweep high into the treble. Value can range from 0.1 to 4.
var depth: float:
	get = get_depth, set = set_depth

#desc Output percent of modified sound. Value can range from 0.1 to 0.9.
var feedback: float:
	get = get_feedback, set = set_feedback

#desc Determines the maximum frequency affected by the LFO modulations, in Hz. Value can range from 10 to 10000.
var range_max_hz: float:
	get = get_range_max_hz, set = set_range_max_hz

#desc Determines the minimum frequency affected by the LFO modulations, in Hz. Value can range from 10 to 10000.
var range_min_hz: float:
	get = get_range_min_hz, set = set_range_min_hz

#desc Adjusts the rate in Hz at which the effect sweeps up and down across the frequency range.
var rate_hz: float:
	get = get_rate_hz, set = set_rate_hz




func get_depth() -> float:
	return depth

func set_depth(value: float) -> void:
	depth = value

func get_feedback() -> float:
	return feedback

func set_feedback(value: float) -> void:
	feedback = value

func get_range_max_hz() -> float:
	return range_max_hz

func set_range_max_hz(value: float) -> void:
	range_max_hz = value

func get_range_min_hz() -> float:
	return range_min_hz

func set_range_min_hz(value: float) -> void:
	range_min_hz = value

func get_rate_hz() -> float:
	return rate_hz

func set_rate_hz(value: float) -> void:
	rate_hz = value

