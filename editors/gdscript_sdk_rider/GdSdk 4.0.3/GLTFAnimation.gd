extends Resource
class_name GLTFAnimation


var loop: bool:
	get = get_loop, set = set_loop




func get_loop() -> bool:
	return loop

func set_loop(value: bool) -> void:
	loop = value

