extends Resource
#brief Container for [Animation] resources.
#desc An animation library stores a set of animations accessible through [StringName] keys, for use with [AnimationPlayer] nodes.
#tutorial [Animation tutorial index] https://docs.godotengine.org/en/stable/tutorials/animation/index.html
class_name AnimationLibrary

#desc Emitted when an [Animation] is added, under the key [param name].
signal animation_added(name: StringName)
#desc Emitted when there's a change in one of the animations, e.g. tracks are added, moved or have changed paths. [param name] is the key of the animation that was changed.
#desc See also [signal Resource.changed], which this acts as a relay for.
signal animation_changed(name: StringName)
#desc Emitted when an [Animation] stored with the key [param name] is removed.
signal animation_removed(name: StringName)
#desc Emitted when the key for an [Animation] is changed, from [param name] to [param to_name].
signal animation_renamed(name: StringName, to_name: StringName)

var _data: Dictionary:
	get = _get_data, set = _set_data



#desc Adds the [param animation] to the library, accessible by the key [param name].
func add_animation(name: StringName, animation: Animation) -> int:
	pass;

#desc Returns the [Animation] with the key [param name]. If the animation does not exist, [code]null[/code] is returned and an error is logged.
func get_animation(name: StringName) -> Animation:
	pass;

#desc Returns the keys for the [Animation]s stored in the library.
func get_animation_list() -> Array[StringName]:
	pass;

#desc Returns [code]true[/code] if the library stores an [Animation] with [param name] as the key.
func has_animation(name: StringName) -> bool:
	pass;

#desc Removes the [Animation] with the key [param name].
func remove_animation(name: StringName) -> void:
	pass;

#desc Changes the key of the [Animation] associated with the key [param name] to [param newname].
func rename_animation(name: StringName, newname: StringName) -> void:
	pass;


func _get_data() -> Dictionary:
	return _data

func _set_data(value: Dictionary) -> void:
	_data = value

