extends AudioEffect
#brief Adds a soft-clip limiter audio effect to an Audio bus.
#desc A limiter is similar to a compressor, but it's less flexible and designed to disallow sound going over a given dB threshold. Adding one in the Master bus is always recommended to reduce the effects of clipping.
#desc Soft clipping starts to reduce the peaks a little below the threshold level and progressively increases its effect as the input level increases such that the threshold is never exceeded.
#tutorial [Audio buses] https://docs.godotengine.org/en/stable/tutorials/audio/audio_buses.html
class_name AudioEffectLimiter


#desc The waveform's maximum allowed value, in decibels. Value can range from -20 to -0.1.
var ceiling_db: float:
	get = get_ceiling_db, set = set_ceiling_db

#desc Applies a gain to the limited waves, in decibels. Value can range from 0 to 6.
var soft_clip_db: float:
	get = get_soft_clip_db, set = set_soft_clip_db

var soft_clip_ratio: float:
	get = get_soft_clip_ratio, set = set_soft_clip_ratio

#desc Threshold from which the limiter begins to be active, in decibels. Value can range from -30 to 0.
var threshold_db: float:
	get = get_threshold_db, set = set_threshold_db




func get_ceiling_db() -> float:
	return ceiling_db

func set_ceiling_db(value: float) -> void:
	ceiling_db = value

func get_soft_clip_db() -> float:
	return soft_clip_db

func set_soft_clip_db(value: float) -> void:
	soft_clip_db = value

func get_soft_clip_ratio() -> float:
	return soft_clip_ratio

func set_soft_clip_ratio(value: float) -> void:
	soft_clip_ratio = value

func get_threshold_db() -> float:
	return threshold_db

func set_threshold_db(value: float) -> void:
	threshold_db = value

