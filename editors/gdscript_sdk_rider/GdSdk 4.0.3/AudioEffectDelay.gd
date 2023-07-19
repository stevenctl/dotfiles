extends AudioEffect
#brief Adds a delay audio effect to an audio bus. Plays input signal back after a period of time.
#brief Two tap delay and feedback options.
#desc Plays input signal back after a period of time. The delayed signal may be played back multiple times to create the sound of a repeating, decaying echo. Delay effects range from a subtle echo effect to a pronounced blending of previous sounds with new sounds.
#tutorial [Audio buses] https://docs.godotengine.org/en/stable/tutorials/audio/audio_buses.html
class_name AudioEffectDelay


#desc Output percent of original sound. At 0, only delayed sounds are output. Value can range from 0 to 1.
var dry: float:
	get = get_dry, set = set_dry

#desc If [code]true[/code], feedback is enabled.
var feedback_active: bool:
	get = is_feedback_active, set = set_feedback_active

#desc Feedback delay time in milliseconds.
var feedback_delay_ms: float:
	get = get_feedback_delay_ms, set = set_feedback_delay_ms

#desc Sound level for [code]tap1[/code].
var feedback_level_db: float:
	get = get_feedback_level_db, set = set_feedback_level_db

#desc Low-pass filter for feedback, in Hz. Frequencies below this value are filtered out of the source signal.
var feedback_lowpass: float:
	get = get_feedback_lowpass, set = set_feedback_lowpass

#desc If [code]true[/code], [code]tap1[/code] will be enabled.
var tap1_active: bool:
	get = is_tap1_active, set = set_tap1_active

#desc [code]tap1[/code] delay time in milliseconds.
var tap1_delay_ms: float:
	get = get_tap1_delay_ms, set = set_tap1_delay_ms

#desc Sound level for [code]tap1[/code].
var tap1_level_db: float:
	get = get_tap1_level_db, set = set_tap1_level_db

#desc Pan position for [code]tap1[/code]. Value can range from -1 (fully left) to 1 (fully right).
var tap1_pan: float:
	get = get_tap1_pan, set = set_tap1_pan

#desc If [code]true[/code], [code]tap2[/code] will be enabled.
var tap2_active: bool:
	get = is_tap2_active, set = set_tap2_active

#desc [b]Tap2[/b] delay time in milliseconds.
var tap2_delay_ms: float:
	get = get_tap2_delay_ms, set = set_tap2_delay_ms

#desc Sound level for [code]tap2[/code].
var tap2_level_db: float:
	get = get_tap2_level_db, set = set_tap2_level_db

#desc Pan position for [code]tap2[/code]. Value can range from -1 (fully left) to 1 (fully right).
var tap2_pan: float:
	get = get_tap2_pan, set = set_tap2_pan




func get_dry() -> float:
	return dry

func set_dry(value: float) -> void:
	dry = value

func is_feedback_active() -> bool:
	return feedback_active

func set_feedback_active(value: bool) -> void:
	feedback_active = value

func get_feedback_delay_ms() -> float:
	return feedback_delay_ms

func set_feedback_delay_ms(value: float) -> void:
	feedback_delay_ms = value

func get_feedback_level_db() -> float:
	return feedback_level_db

func set_feedback_level_db(value: float) -> void:
	feedback_level_db = value

func get_feedback_lowpass() -> float:
	return feedback_lowpass

func set_feedback_lowpass(value: float) -> void:
	feedback_lowpass = value

func is_tap1_active() -> bool:
	return tap1_active

func set_tap1_active(value: bool) -> void:
	tap1_active = value

func get_tap1_delay_ms() -> float:
	return tap1_delay_ms

func set_tap1_delay_ms(value: float) -> void:
	tap1_delay_ms = value

func get_tap1_level_db() -> float:
	return tap1_level_db

func set_tap1_level_db(value: float) -> void:
	tap1_level_db = value

func get_tap1_pan() -> float:
	return tap1_pan

func set_tap1_pan(value: float) -> void:
	tap1_pan = value

func is_tap2_active() -> bool:
	return tap2_active

func set_tap2_active(value: bool) -> void:
	tap2_active = value

func get_tap2_delay_ms() -> float:
	return tap2_delay_ms

func set_tap2_delay_ms(value: float) -> void:
	tap2_delay_ms = value

func get_tap2_level_db() -> float:
	return tap2_level_db

func set_tap2_level_db(value: float) -> void:
	tap2_level_db = value

func get_tap2_pan() -> float:
	return tap2_pan

func set_tap2_pan(value: float) -> void:
	tap2_pan = value

