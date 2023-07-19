extends AudioEffect
#brief Adds a filter to the audio bus.
#desc Allows frequencies other than the [member cutoff_hz] to pass.
#tutorial [Audio buses] https://docs.godotengine.org/en/stable/tutorials/audio/audio_buses.html
class_name AudioEffectFilter


#enum FilterDB
enum {
    FILTER_6DB = 0,
    FILTER_12DB = 1,
    FILTER_18DB = 2,
    FILTER_24DB = 3,
}
#desc Threshold frequency for the filter, in Hz.
var cutoff_hz: float:
	get = get_cutoff, set = set_cutoff

var db: int:
	get = get_db, set = set_db

#desc Gain amount of the frequencies after the filter.
var gain: float:
	get = get_gain, set = set_gain

#desc Amount of boost in the frequency range near the cutoff frequency.
var resonance: float:
	get = get_resonance, set = set_resonance




func get_cutoff() -> float:
	return cutoff_hz

func set_cutoff(value: float) -> void:
	cutoff_hz = value

func get_db() -> int:
	return db

func set_db(value: int) -> void:
	db = value

func get_gain() -> float:
	return gain

func set_gain(value: float) -> void:
	gain = value

func get_resonance() -> float:
	return resonance

func set_resonance(value: float) -> void:
	resonance = value

