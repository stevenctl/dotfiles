extends AudioStream
#brief MP3 audio stream driver.
#desc MP3 audio stream driver. See [member data] if you want to load an MP3 file at run-time.
class_name AudioStreamMP3


var bar_beats: int:
	get = get_bar_beats, set = set_bar_beats

var beat_count: int:
	get = get_beat_count, set = set_beat_count

var bpm: float:
	get = get_bpm, set = set_bpm

#desc Contains the audio data in bytes.
#desc You can load a file without having to import it beforehand using the code snippet below. Keep in mind that this snippet loads the whole file into memory and may not be ideal for huge files (hundreds of megabytes or more).
#desc [codeblocks]
#desc [gdscript]
#desc func load_mp3(path):
#desc var file = FileAccess.open(path, FileAccess.READ)
#desc var sound = AudioStreamMP3.new()
#desc sound.data = file.get_buffer(file.get_length())
#desc return sound
#desc [/gdscript]
#desc [csharp]
#desc public AudioStreamMP3 LoadMP3(string path)
#desc {
#desc using var file = FileAccess.Open(path, FileAccess.ModeFlags.Read);
#desc var sound = new AudioStreamMP3();
#desc sound.Data = file.GetBuffer(file.GetLength());
#desc return sound;
#desc }
#desc [/csharp]
#desc [/codeblocks]
var data: PackedByteArray:
	get = get_data, set = set_data

#desc If [code]true[/code], the stream will automatically loop when it reaches the end.
var loop: bool:
	get = has_loop, set = set_loop

#desc Time in seconds at which the stream starts after being looped.
var loop_offset: float:
	get = get_loop_offset, set = set_loop_offset




func get_bar_beats() -> int:
	return bar_beats

func set_bar_beats(value: int) -> void:
	bar_beats = value

func get_beat_count() -> int:
	return beat_count

func set_beat_count(value: int) -> void:
	beat_count = value

func get_bpm() -> float:
	return bpm

func set_bpm(value: float) -> void:
	bpm = value

func get_data() -> PackedByteArray:
	return data

func set_data(value: PackedByteArray) -> void:
	data = value

func has_loop() -> bool:
	return loop

func set_loop(value: bool) -> void:
	loop = value

func get_loop_offset() -> float:
	return loop_offset

func set_loop_offset(value: float) -> void:
	loop_offset = value

