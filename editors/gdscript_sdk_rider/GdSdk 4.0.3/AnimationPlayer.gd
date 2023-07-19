extends Node
#brief Player of [Animation] resources.
#desc An animation player is used for general-purpose playback of [Animation] resources. It contains a dictionary of [AnimationLibrary] resources and custom blend times between animation transitions.
#desc Some methods and properties use a single key to reference an animation directly. These keys are formatted as the key for the library, followed by a forward slash, then the key for the animation within the library, for example [code]"movement/run"[/code]. If the library's key is an empty string (known as the default library), the forward slash is omitted, being the same key used by the library.
#desc [AnimationPlayer] is more suited than [Tween] for animations where you know the final values in advance. For example, fading a screen in and out is more easily done with an [AnimationPlayer] node thanks to the animation tools provided by the editor. That particular example can also be implemented with a [Tween], but it requires doing everything by code.
#desc Updating the target properties of animations occurs at process time.
#tutorial [2D Sprite animation] https://docs.godotengine.org/en/stable/tutorials/2d/2d_sprite_animation.html
#tutorial [Animation documentation index] https://docs.godotengine.org/en/stable/tutorials/animation/index.html
#tutorial [Third Person Shooter Demo] https://godotengine.org/asset-library/asset/678
class_name AnimationPlayer

#desc Emitted when a queued animation plays after the previous animation finished. See [method queue].
#desc [b]Note:[/b] The signal is not emitted when the animation is changed via [method play] or by an [AnimationTree].
signal animation_changed(old_name: StringName, new_name: StringName)
#desc Notifies when an animation finished playing.
#desc [b]Note:[/b] This signal is not emitted if an animation is looping.
signal animation_finished(anim_name: StringName)
#desc Notifies when the animation libraries have changed.
signal animation_libraries_updated
#desc Notifies when an animation list is changed.
signal animation_list_changed
#desc Notifies when an animation starts playing.
signal animation_started(anim_name: StringName)
#desc Notifies when the caches have been cleared, either automatically, or manually via [method clear_caches].
signal caches_cleared
#desc Process animation during the physics process. This is especially useful when animating physics bodies.
#desc Process animation during the idle process.
#desc Do not process animation. Use [method advance] to process the animation manually.
#desc Batch method calls during the animation process, then do the calls after events are processed. This avoids bugs involving deleting nodes or modifying the AnimationPlayer while playing.
#desc Make method calls immediately when reached in the animation.

#enum AnimationProcessCallback
enum {
    ANIMATION_PROCESS_PHYSICS = 0,
    ANIMATION_PROCESS_IDLE = 1,
    ANIMATION_PROCESS_MANUAL = 2,
}
#enum AnimationMethodCallMode
enum {
    ANIMATION_METHOD_CALL_DEFERRED = 0,
    ANIMATION_METHOD_CALL_IMMEDIATE = 1,
}
#desc If playing, the current animation's key, otherwise, the animation last played. When set, this changes the animation, but will not play it unless already playing. See also [member current_animation].
var assigned_animation: String:
	get = get_assigned_animation, set = set_assigned_animation

#desc The number of possible simultaneous sounds for each of the assigned AudioStreamPlayers.
#desc For example, if this value is [code]32[/code] and the animation has two audio tracks, the two [AudioStreamPlayer]s assigned can play simultaneously up to [code]32[/code] voices each.
var audio_max_polyphony: int:
	get = get_audio_max_polyphony, set = set_audio_max_polyphony

#desc The key of the animation to play when the scene loads.
var autoplay: String:
	get = get_autoplay, set = set_autoplay

#desc The key of the currently playing animation. If no animation is playing, the property's value is an empty string. Changing this value does not restart the animation. See [method play] for more information on playing animations.
#desc [b]Note:[/b] While this property appears in the Inspector, it's not meant to be edited, and it's not saved in the scene. This property is mainly used to get the currently playing animation, and internally for animation playback tracks. For more information, see [Animation].
var current_animation: String:
	get = get_current_animation, set = set_current_animation

#desc The length (in seconds) of the currently playing animation.
var current_animation_length: float:
	get = get_current_animation_length

#desc The position (in seconds) of the currently playing animation.
var current_animation_position: float:
	get = get_current_animation_position

#desc The call mode to use for Call Method tracks.
var method_call_mode: int:
	get = get_method_call_mode, set = set_method_call_mode

#desc If [code]true[/code] and the engine is running in Movie Maker mode (see [MovieWriter]), exits the engine with [method SceneTree.quit] as soon as an animation is done playing in this [AnimationPlayer]. A message is printed when the engine quits for this reason.
#desc [b]Note:[/b] This obeys the same logic as the [signal animation_finished] signal, so it will not quit the engine if the animation is set to be looping.
var movie_quit_on_finish: bool:
	get = is_movie_quit_on_finish_enabled, set = set_movie_quit_on_finish_enabled

#desc If [code]true[/code], updates animations in response to process-related notifications.
var playback_active: bool:
	get = is_active, set = set_active

#desc The default time in which to blend animations. Ranges from 0 to 4096 with 0.01 precision.
var playback_default_blend_time: float:
	get = get_default_blend_time, set = set_default_blend_time

#desc The process notification in which to update animations.
var playback_process_mode: int:
	get = get_process_callback, set = set_process_callback

#desc This is used by the editor. If set to [code]true[/code], the scene will be saved with the effects of the reset animation (the animation with the key [code]"RESET"[/code]) applied as if it had been seeked to time 0, with the editor keeping the values that the scene had before saving.
#desc This makes it more convenient to preview and edit animations in the editor, as changes to the scene will not be saved as long as they are set in the reset animation.
var reset_on_save: bool:
	get = is_reset_on_save_enabled, set = set_reset_on_save_enabled

#desc The node from which node path references will travel.
var root_node: NodePath:
	get = get_root, set = set_root

#desc The speed scaling ratio. For example, if this value is [code]1[/code], then the animation plays at normal speed. If it's [code]0.5[/code], then it plays at half speed. If it's [code]2[/code], then it plays at double speed.
#desc If set to a negative value, the animation is played in reverse. If set to [code]0[/code], the animation will not advance.
var speed_scale: float:
	get = get_speed_scale, set = set_speed_scale



#desc A virtual function for processing after key getting during playback.
func _post_process_key_value(animation: Animation, track: int, value: Variant, object: Object, object_idx: int) -> Variant:
	pass;

#desc Adds [param library] to the animation player, under the key [param name].
func add_animation_library(name: StringName, library: AnimationLibrary) -> int:
	pass;

#desc Shifts position in the animation timeline and immediately updates the animation. [param delta] is the time in seconds to shift. Events between the current frame and [param delta] are handled.
func advance(delta: float) -> void:
	pass;

#desc Returns the key of the animation which is queued to play after the [param anim_from] animation.
func animation_get_next(anim_from: StringName) -> StringName:
	pass;

#desc Triggers the [param anim_to] animation when the [param anim_from] animation completes.
func animation_set_next(anim_from: StringName, anim_to: StringName) -> void:
	pass;

#desc [AnimationPlayer] caches animated nodes. It may not notice if a node disappears; [method clear_caches] forces it to update the cache again.
func clear_caches() -> void:
	pass;

#desc Clears all queued, unplayed animations.
func clear_queue() -> void:
	pass;

#desc Returns the key of [param animation] or an empty [StringName] if not found.
func find_animation(animation: Animation) -> StringName:
	pass;

#desc Returns the key for the [AnimationLibrary] that contains [param animation] or an empty [StringName] if not found.
func find_animation_library(animation: Animation) -> StringName:
	pass;

#desc Returns the [Animation] with the key [param name]. If the animation does not exist, [code]null[/code] is returned and an error is logged.
func get_animation(name: StringName) -> Animation:
	pass;

#desc Returns the first [AnimationLibrary] with key [param name] or [code]null[/code] if not found.
func get_animation_library(name: StringName) -> AnimationLibrary:
	pass;

#desc Returns the list of stored library keys.
func get_animation_library_list() -> Array[StringName]:
	pass;

#desc Returns the list of stored animation keys.
func get_animation_list() -> PackedStringArray:
	pass;

#desc Returns the blend time (in seconds) between two animations, referenced by their keys.
func get_blend_time(anim_from: StringName, anim_to: StringName) -> float:
	pass;

#desc Returns the actual playing speed of current animation or [code]0[/code] if not playing. This speed is the [member speed_scale] property multiplied by [code]custom_speed[/code] argument specified when calling the [method play] method.
#desc Returns a negative value if the current animation is playing backwards.
func get_playing_speed() -> float:
	pass;

#desc Returns a list of the animation keys that are currently queued to play.
func get_queue() -> PackedStringArray:
	pass;

#desc Returns [code]true[/code] if the [AnimationPlayer] stores an [Animation] with key [param name].
func has_animation(name: StringName) -> bool:
	pass;

#desc Returns [code]true[/code] if the [AnimationPlayer] stores an [AnimationLibrary] with key [param name].
func has_animation_library(name: StringName) -> bool:
	pass;

#desc Returns [code]true[/code] if an animation is currently playing (even if [member speed_scale] and/or [code]custom_speed[/code] are [code]0[/code]).
func is_playing() -> bool:
	pass;

#desc Pauses the currently playing animation. The [member current_animation_position] will be kept and calling [method play] or [method play_backwards] without arguments or with the same animation name as [member assigned_animation] will resume the animation.
#desc See also [method stop].
func pause() -> void:
	pass;

#desc Plays the animation with key [param name]. Custom blend times and speed can be set. If [param custom_speed] is negative and [param from_end] is [code]true[/code], the animation will play backwards (which is equivalent to calling [method play_backwards]).
#desc The [AnimationPlayer] keeps track of its current or last played animation with [member assigned_animation]. If this method is called with that same animation [param name], or with no [param name] parameter, the assigned animation will resume playing if it was paused.
#desc [b]Note:[/b] The animation will be updated the next time the [AnimationPlayer] is processed. If other variables are updated at the same time this is called, they may be updated too early. To perform the update immediately, call [code]advance(0)[/code].
func play(name: StringName = "", custom_blend: float = -1, custom_speed: float = 1.0, from_end: bool = false) -> void:
	pass;

#desc Plays the animation with key [param name] in reverse.
#desc This method is a shorthand for [method play] with [code]custom_speed = -1.0[/code] and [code]from_end = true[/code], so see its description for more information.
func play_backwards(name: StringName = "", custom_blend: float = -1) -> void:
	pass;

#desc Queues an animation for playback once the current one is done.
#desc [b]Note:[/b] If a looped animation is currently playing, the queued animation will never play unless the looped animation is stopped somehow.
func queue(name: StringName) -> void:
	pass;

#desc Removes the [AnimationLibrary] associated with the key [param name].
func remove_animation_library(name: StringName) -> void:
	pass;

#desc Moves the [AnimationLibrary] associated with the key [param name] to the key [param newname].
func rename_animation_library(name: StringName, newname: StringName) -> void:
	pass;

#desc Seeks the animation to the [param seconds] point in time (in seconds). If [param update] is [code]true[/code], the animation updates too, otherwise it updates at process time. Events between the current frame and [param seconds] are skipped.
#desc [b]Note:[/b] Seeking to the end of the animation doesn't emit [signal animation_finished]. If you want to skip animation and emit the signal, use [method advance].
func seek(seconds: float, update: bool = false) -> void:
	pass;

#desc Specifies a blend time (in seconds) between two animations, referenced by their keys.
func set_blend_time(anim_from: StringName, anim_to: StringName, sec: float) -> void:
	pass;

#desc Stops the currently playing animation. The animation position is reset to [code]0[/code] and the [code]custom_speed[/code] is reset to [code]1.0[/code]. See also [method pause].
#desc If [param keep_state] is [code]true[/code], the animation state is not updated visually.
#desc [b]Note:[/b] The method / audio / animation playback tracks will not be processed by this method.
func stop(keep_state: bool = false) -> void:
	pass;


func get_assigned_animation() -> String:
	return assigned_animation

func set_assigned_animation(value: String) -> void:
	assigned_animation = value

func get_audio_max_polyphony() -> int:
	return audio_max_polyphony

func set_audio_max_polyphony(value: int) -> void:
	audio_max_polyphony = value

func get_autoplay() -> String:
	return autoplay

func set_autoplay(value: String) -> void:
	autoplay = value

func get_current_animation() -> String:
	return current_animation

func set_current_animation(value: String) -> void:
	current_animation = value

func get_current_animation_length() -> float:
	return current_animation_length

func get_current_animation_position() -> float:
	return current_animation_position

func get_method_call_mode() -> int:
	return method_call_mode

func set_method_call_mode(value: int) -> void:
	method_call_mode = value

func is_movie_quit_on_finish_enabled() -> bool:
	return movie_quit_on_finish

func set_movie_quit_on_finish_enabled(value: bool) -> void:
	movie_quit_on_finish = value

func is_active() -> bool:
	return playback_active

func set_active(value: bool) -> void:
	playback_active = value

func get_default_blend_time() -> float:
	return playback_default_blend_time

func set_default_blend_time(value: float) -> void:
	playback_default_blend_time = value

func get_process_callback() -> int:
	return playback_process_mode

func set_process_callback(value: int) -> void:
	playback_process_mode = value

func is_reset_on_save_enabled() -> bool:
	return reset_on_save

func set_reset_on_save_enabled(value: bool) -> void:
	reset_on_save = value

func get_root() -> NodePath:
	return root_node

func set_root(value: NodePath) -> void:
	root_node = value

func get_speed_scale() -> float:
	return speed_scale

func set_speed_scale(value: float) -> void:
	speed_scale = value

