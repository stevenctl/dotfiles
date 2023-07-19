extends AudioEffect
#brief Adds an amplifying audio effect to an audio bus.
#desc Increases or decreases the volume being routed through the audio bus.
#tutorial [Audio buses] https://docs.godotengine.org/en/stable/tutorials/audio/audio_buses.html
class_name AudioEffectAmplify


#desc Amount of amplification in decibels. Positive values make the sound louder, negative values make it quieter. Value can range from -80 to 24.
var volume_db: float:
	get = get_volume_db, set = set_volume_db




func get_volume_db() -> float:
	return volume_db

func set_volume_db(value: float) -> void:
	volume_db = value

