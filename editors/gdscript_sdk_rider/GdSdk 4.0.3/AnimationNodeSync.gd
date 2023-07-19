extends AnimationNode
#brief The base class for [AnimationNode] which has more than two input ports and needs to synchronize them.
class_name AnimationNodeSync


#desc If [code]false[/code], the blended animations' frame are stopped when the blend value is [code]0[/code].
#desc If [code]true[/code], forcing the blended animations to advance frame.
var sync: bool:
	get = is_using_sync, set = set_use_sync




func is_using_sync() -> bool:
	return sync

func set_use_sync(value: bool) -> void:
	sync = value

