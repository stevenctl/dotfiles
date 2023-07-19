extends AudioEffectInstance
class_name AudioEffectSpectrumAnalyzerInstance

#desc Use the average value as magnitude.
#desc Use the maximum value as magnitude.

#enum MagnitudeMode
enum {
    MAGNITUDE_AVERAGE = 0,
    MAGNITUDE_MAX = 1,
}


func get_magnitude_for_frequency_range(from_hz: float, to_hz: float, mode: int = 1) -> Vector2:
	pass;


