extends AudioEffect
#brief Adds a panner audio effect to an audio bus. Pans sound left or right.
#desc Determines how much of an audio signal is sent to the left and right buses.
#tutorial [Audio buses] https://docs.godotengine.org/en/stable/tutorials/audio/audio_buses.html
class_name AudioEffectPanner


#desc Pan position. Value can range from -1 (fully left) to 1 (fully right).
var pan: float:
	get = get_pan, set = set_pan




func get_pan() -> float:
	return pan

func set_pan(value: float) -> void:
	pan = value

