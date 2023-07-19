extends AudioEffect
#brief An audio effect that can be used to adjust the intensity of stereo panning.
#desc An audio effect that can be used to adjust the intensity of stereo panning.
#tutorial [Audio buses] https://docs.godotengine.org/en/stable/tutorials/audio/audio_buses.html
class_name AudioEffectStereoEnhance


#desc Values greater than 1.0 increase intensity of any panning on audio passing through this effect, whereas values less than 1.0 will decrease the panning intensity. A value of 0.0 will downmix audio to mono.
var pan_pullout: float:
	get = get_pan_pullout, set = set_pan_pullout

var surround: float:
	get = get_surround, set = set_surround

var time_pullout_ms: float:
	get = get_time_pullout, set = set_time_pullout




func get_pan_pullout() -> float:
	return pan_pullout

func set_pan_pullout(value: float) -> void:
	pan_pullout = value

func get_surround() -> float:
	return surround

func set_surround(value: float) -> void:
	surround = value

func get_time_pullout() -> float:
	return time_pullout_ms

func set_time_pullout(value: float) -> void:
	time_pullout_ms = value

