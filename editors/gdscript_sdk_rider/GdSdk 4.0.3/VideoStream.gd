extends Resource
#brief Base resource for video streams.
#desc Base resource type for all video streams. Classes that derive from [VideoStream] can all be used as resource types to play back videos in [VideoStreamPlayer].
class_name VideoStream


#desc The video file path or URI that this [VideoStream] resource handles.
#desc For [VideoStreamTheora], this filename should be an Ogg Theora video file with the [code].ogv[/code] extension.
var file: String:
	get = get_file, set = set_file



#desc Called when the video starts playing, to initialize and return a subclass of [VideoStreamPlayback].
func _instantiate_playback() -> VideoStreamPlayback:
	pass;


func get_file() -> String:
	return file

func set_file(value: String) -> void:
	file = value

