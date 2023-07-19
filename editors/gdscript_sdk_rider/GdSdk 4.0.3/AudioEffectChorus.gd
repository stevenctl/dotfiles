extends AudioEffect
#brief Adds a chorus audio effect.
#desc Adds a chorus audio effect. The effect applies a filter with voices to duplicate the audio source and manipulate it through the filter.
#tutorial [Audio buses] https://docs.godotengine.org/en/stable/tutorials/audio/audio_buses.html
class_name AudioEffectChorus


#desc The effect's raw signal.
var dry: float:
	get = get_dry, set = set_dry

#desc The voice's cutoff frequency.
var voice/1/cutoff_hz: float:
	get = get_voice_cutoff_hz, set = set_voice_cutoff_hz

#desc The voice's signal delay.
var voice/1/delay_ms: float:
	get = get_voice_delay_ms, set = set_voice_delay_ms

#desc The voice filter's depth.
var voice/1/depth_ms: float:
	get = get_voice_depth_ms, set = set_voice_depth_ms

#desc The voice's volume.
var voice/1/level_db: float:
	get = get_voice_level_db, set = set_voice_level_db

#desc The voice's pan level.
var voice/1/pan: float:
	get = get_voice_pan, set = set_voice_pan

#desc The voice's filter rate.
var voice/1/rate_hz: float:
	get = get_voice_rate_hz, set = set_voice_rate_hz

#desc The voice's cutoff frequency.
var voice/2/cutoff_hz: float:
	get = get_voice_cutoff_hz, set = set_voice_cutoff_hz

#desc The voice's signal delay.
var voice/2/delay_ms: float:
	get = get_voice_delay_ms, set = set_voice_delay_ms

#desc The voice filter's depth.
var voice/2/depth_ms: float:
	get = get_voice_depth_ms, set = set_voice_depth_ms

#desc The voice's volume.
var voice/2/level_db: float:
	get = get_voice_level_db, set = set_voice_level_db

#desc The voice's pan level.
var voice/2/pan: float:
	get = get_voice_pan, set = set_voice_pan

#desc The voice's filter rate.
var voice/2/rate_hz: float:
	get = get_voice_rate_hz, set = set_voice_rate_hz

#desc The voice's cutoff frequency.
var voice/3/cutoff_hz: float:
	get = get_voice_cutoff_hz, set = set_voice_cutoff_hz

#desc The voice's signal delay.
var voice/3/delay_ms: float:
	get = get_voice_delay_ms, set = set_voice_delay_ms

#desc The voice filter's depth.
var voice/3/depth_ms: float:
	get = get_voice_depth_ms, set = set_voice_depth_ms

#desc The voice's volume.
var voice/3/level_db: float:
	get = get_voice_level_db, set = set_voice_level_db

#desc The voice's pan level.
var voice/3/pan: float:
	get = get_voice_pan, set = set_voice_pan

#desc The voice's filter rate.
var voice/3/rate_hz: float:
	get = get_voice_rate_hz, set = set_voice_rate_hz

#desc The voice's cutoff frequency.
var voice/4/cutoff_hz: float:
	get = get_voice_cutoff_hz, set = set_voice_cutoff_hz

#desc The voice's signal delay.
var voice/4/delay_ms: float:
	get = get_voice_delay_ms, set = set_voice_delay_ms

#desc The voice filter's depth.
var voice/4/depth_ms: float:
	get = get_voice_depth_ms, set = set_voice_depth_ms

#desc The voice's volume.
var voice/4/level_db: float:
	get = get_voice_level_db, set = set_voice_level_db

#desc The voice's pan level.
var voice/4/pan: float:
	get = get_voice_pan, set = set_voice_pan

#desc The voice's filter rate.
var voice/4/rate_hz: float:
	get = get_voice_rate_hz, set = set_voice_rate_hz

#desc The number of voices in the effect.
var voice_count: int:
	get = get_voice_count, set = set_voice_count

#desc The effect's processed signal.
var wet: float:
	get = get_wet, set = set_wet



func get_voice_cutoff_hz(voice_idx: int) -> float:
	pass;

func get_voice_delay_ms(voice_idx: int) -> float:
	pass;

func get_voice_depth_ms(voice_idx: int) -> float:
	pass;

func get_voice_level_db(voice_idx: int) -> float:
	pass;

func get_voice_pan(voice_idx: int) -> float:
	pass;

func get_voice_rate_hz(voice_idx: int) -> float:
	pass;

func set_voice_cutoff_hz(voice_idx: int, cutoff_hz: float) -> void:
	pass;

func set_voice_delay_ms(voice_idx: int, delay_ms: float) -> void:
	pass;

func set_voice_depth_ms(voice_idx: int, depth_ms: float) -> void:
	pass;

func set_voice_level_db(voice_idx: int, level_db: float) -> void:
	pass;

func set_voice_pan(voice_idx: int, pan: float) -> void:
	pass;

func set_voice_rate_hz(voice_idx: int, rate_hz: float) -> void:
	pass;


func get_dry() -> float:
	return dry

func set_dry(value: float) -> void:
	dry = value

func get_voice_cutoff_hz() -> float:
	return voice/1/cutoff_hz

func set_voice_cutoff_hz(value: float) -> void:
	voice/1/cutoff_hz = value

func get_voice_delay_ms() -> float:
	return voice/1/delay_ms

func set_voice_delay_ms(value: float) -> void:
	voice/1/delay_ms = value

func get_voice_depth_ms() -> float:
	return voice/1/depth_ms

func set_voice_depth_ms(value: float) -> void:
	voice/1/depth_ms = value

func get_voice_level_db() -> float:
	return voice/1/level_db

func set_voice_level_db(value: float) -> void:
	voice/1/level_db = value

func get_voice_pan() -> float:
	return voice/1/pan

func set_voice_pan(value: float) -> void:
	voice/1/pan = value

func get_voice_rate_hz() -> float:
	return voice/1/rate_hz

func set_voice_rate_hz(value: float) -> void:
	voice/1/rate_hz = value

func get_voice_cutoff_hz() -> float:
	return voice/2/cutoff_hz

func set_voice_cutoff_hz(value: float) -> void:
	voice/2/cutoff_hz = value

func get_voice_delay_ms() -> float:
	return voice/2/delay_ms

func set_voice_delay_ms(value: float) -> void:
	voice/2/delay_ms = value

func get_voice_depth_ms() -> float:
	return voice/2/depth_ms

func set_voice_depth_ms(value: float) -> void:
	voice/2/depth_ms = value

func get_voice_level_db() -> float:
	return voice/2/level_db

func set_voice_level_db(value: float) -> void:
	voice/2/level_db = value

func get_voice_pan() -> float:
	return voice/2/pan

func set_voice_pan(value: float) -> void:
	voice/2/pan = value

func get_voice_rate_hz() -> float:
	return voice/2/rate_hz

func set_voice_rate_hz(value: float) -> void:
	voice/2/rate_hz = value

func get_voice_cutoff_hz() -> float:
	return voice/3/cutoff_hz

func set_voice_cutoff_hz(value: float) -> void:
	voice/3/cutoff_hz = value

func get_voice_delay_ms() -> float:
	return voice/3/delay_ms

func set_voice_delay_ms(value: float) -> void:
	voice/3/delay_ms = value

func get_voice_depth_ms() -> float:
	return voice/3/depth_ms

func set_voice_depth_ms(value: float) -> void:
	voice/3/depth_ms = value

func get_voice_level_db() -> float:
	return voice/3/level_db

func set_voice_level_db(value: float) -> void:
	voice/3/level_db = value

func get_voice_pan() -> float:
	return voice/3/pan

func set_voice_pan(value: float) -> void:
	voice/3/pan = value

func get_voice_rate_hz() -> float:
	return voice/3/rate_hz

func set_voice_rate_hz(value: float) -> void:
	voice/3/rate_hz = value

func get_voice_cutoff_hz() -> float:
	return voice/4/cutoff_hz

func set_voice_cutoff_hz(value: float) -> void:
	voice/4/cutoff_hz = value

func get_voice_delay_ms() -> float:
	return voice/4/delay_ms

func set_voice_delay_ms(value: float) -> void:
	voice/4/delay_ms = value

func get_voice_depth_ms() -> float:
	return voice/4/depth_ms

func set_voice_depth_ms(value: float) -> void:
	voice/4/depth_ms = value

func get_voice_level_db() -> float:
	return voice/4/level_db

func set_voice_level_db(value: float) -> void:
	voice/4/level_db = value

func get_voice_pan() -> float:
	return voice/4/pan

func set_voice_pan(value: float) -> void:
	voice/4/pan = value

func get_voice_rate_hz() -> float:
	return voice/4/rate_hz

func set_voice_rate_hz(value: float) -> void:
	voice/4/rate_hz = value

func get_voice_count() -> int:
	return voice_count

func set_voice_count(value: int) -> void:
	voice_count = value

func get_wet() -> float:
	return wet

func set_wet(value: float) -> void:
	wet = value

