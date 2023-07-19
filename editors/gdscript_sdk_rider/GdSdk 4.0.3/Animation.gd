extends Resource
#brief Contains data used to animate everything in the engine.
#desc An Animation resource contains data used to animate everything in the engine. Animations are divided into tracks, and each track must be linked to a node. The state of that node can be changed through time, by adding timed keys (events) to the track.
#desc [codeblocks]
#desc [gdscript]
#desc # This creates an animation that makes the node "Enemy" move to the right by
#desc # 100 pixels in 0.5 seconds.
#desc var animation = Animation.new()
#desc var track_index = animation.add_track(Animation.TYPE_VALUE)
#desc animation.track_set_path(track_index, "Enemy:position:x")
#desc animation.track_insert_key(track_index, 0.0, 0)
#desc animation.track_insert_key(track_index, 0.5, 100)
#desc [/gdscript]
#desc [csharp]
#desc // This creates an animation that makes the node "Enemy" move to the right by
#desc // 100 pixels in 0.5 seconds.
#desc var animation = new Animation();
#desc int trackIndex = animation.AddTrack(Animation.TrackType.Value);
#desc animation.TrackSetPath(trackIndex, "Enemy:position:x");
#desc animation.TrackInsertKey(trackIndex, 0.0f, 0);
#desc animation.TrackInsertKey(trackIndex, 0.5f, 100);
#desc [/csharp]
#desc [/codeblocks]
#desc Animations are just data containers, and must be added to nodes such as an [AnimationPlayer] to be played back. Animation tracks have different types, each with its own set of dedicated methods. Check [enum TrackType] to see available types.
#desc [b]Note:[/b] For 3D position/rotation/scale, using the dedicated [constant TYPE_POSITION_3D], [constant TYPE_ROTATION_3D] and [constant TYPE_SCALE_3D] track types instead of [constant TYPE_VALUE] is recommended for performance reasons.
#tutorial [Animation documentation index] https://docs.godotengine.org/en/stable/tutorials/animation/index.html
class_name Animation

#desc Value tracks set values in node properties, but only those which can be interpolated. For 3D position/rotation/scale, using the dedicated [constant TYPE_POSITION_3D], [constant TYPE_ROTATION_3D] and [constant TYPE_SCALE_3D] track types instead of [constant TYPE_VALUE] is recommended for performance reasons.
#desc 3D position track (values are stored in [Vector3]s).
#desc 3D rotation track (values are stored in [Quaternion]s).
#desc 3D scale track (values are stored in [Vector3]s).
#desc Blend shape track.
#desc Method tracks call functions with given arguments per key.
#desc Bezier tracks are used to interpolate a value using custom curves. They can also be used to animate sub-properties of vectors and colors (e.g. alpha value of a [Color]).
#desc Audio tracks are used to play an audio stream with either type of [AudioStreamPlayer]. The stream can be trimmed and previewed in the animation.
#desc Animation tracks play animations in other [AnimationPlayer] nodes.
#desc No interpolation (nearest value).
#desc Linear interpolation.
#desc Cubic interpolation. This looks smoother than linear interpolation, but is more expensive to interpolate. Stick to [constant INTERPOLATION_LINEAR] for complex 3D animations imported from external software, even if it requires using a higher animation framerate in return.
#desc Linear interpolation with shortest path rotation.
#desc [b]Note:[/b] The result value is always normalized and may not match the key value.
#desc Cubic interpolation with shortest path rotation.
#desc [b]Note:[/b] The result value is always normalized and may not match the key value.
#desc Update between keyframes and hold the value.
#desc Update at the keyframes.
#desc Same as linear interpolation, but also interpolates from the current value (i.e. dynamically at runtime) if the first key isn't at 0 seconds.
#desc At both ends of the animation, the animation will stop playing.
#desc At both ends of the animation, the animation will be repeated without changing the playback direction.
#desc Repeats playback and reverse playback at both ends of the animation.
#desc This flag indicates that the animation proceeds without any looping.
#desc This flag indicates that the animation has reached the end of the animation and just after loop processed.
#desc This flag indicates that the animation has reached the start of the animation and just after loop processed.
#desc Finds the nearest time key.
#desc Finds only the key with approximating the time.
#desc Finds only the key with matching the time.

#enum TrackType
enum {
    TYPE_VALUE = 0,
    TYPE_POSITION_3D = 1,
    TYPE_ROTATION_3D = 2,
    TYPE_SCALE_3D = 3,
    TYPE_BLEND_SHAPE = 4,
    TYPE_METHOD = 5,
    TYPE_BEZIER = 6,
    TYPE_AUDIO = 7,
    TYPE_ANIMATION = 8,
}
#enum InterpolationType
enum {
    INTERPOLATION_NEAREST = 0,
    INTERPOLATION_LINEAR = 1,
    INTERPOLATION_CUBIC = 2,
    INTERPOLATION_LINEAR_ANGLE = 3,
    INTERPOLATION_CUBIC_ANGLE = 4,
}
#enum UpdateMode
enum {
    UPDATE_CONTINUOUS = 0,
    UPDATE_DISCRETE = 1,
    UPDATE_CAPTURE = 2,
}
#enum LoopMode
enum {
    LOOP_NONE = 0,
    LOOP_LINEAR = 1,
    LOOP_PINGPONG = 2,
}
#enum LoopedFlag
enum {
    LOOPED_FLAG_NONE = 0,
    LOOPED_FLAG_END = 1,
    LOOPED_FLAG_START = 2,
}
#enum FindMode
enum {
    FIND_MODE_NEAREST = 0,
    FIND_MODE_APPROX = 1,
    FIND_MODE_EXACT = 2,
}
#desc The total length of the animation (in seconds).
#desc [b]Note:[/b] Length is not delimited by the last key, as this one may be before or after the end to ensure correct interpolation and looping.
var length: float:
	get = get_length, set = set_length

#desc Determines the behavior of both ends of the animation timeline during animation playback. This is used for correct interpolation of animation cycles, and for hinting the player that it must restart the animation.
var loop_mode: int:
	get = get_loop_mode, set = set_loop_mode

#desc The animation step value.
var step: float:
	get = get_step, set = set_step



#desc Adds a track to the Animation.
func add_track(type: int, at_position: int = -1) -> int:
	pass;

#desc Returns the animation name at the key identified by [param key_idx]. The [param track_idx] must be the index of an Animation Track.
func animation_track_get_key_animation(track_idx: int, key_idx: int) -> StringName:
	pass;

#desc Inserts a key with value [param animation] at the given [param time] (in seconds). The [param track_idx] must be the index of an Animation Track.
func animation_track_insert_key(track_idx: int, time: float, animation: StringName) -> int:
	pass;

#desc Sets the key identified by [param key_idx] to value [param animation]. The [param track_idx] must be the index of an Animation Track.
func animation_track_set_key_animation(track_idx: int, key_idx: int, animation: StringName) -> void:
	pass;

#desc Returns the end offset of the key identified by [param key_idx]. The [param track_idx] must be the index of an Audio Track.
#desc End offset is the number of seconds cut off at the ending of the audio stream.
func audio_track_get_key_end_offset(track_idx: int, key_idx: int) -> float:
	pass;

#desc Returns the start offset of the key identified by [param key_idx]. The [param track_idx] must be the index of an Audio Track.
#desc Start offset is the number of seconds cut off at the beginning of the audio stream.
func audio_track_get_key_start_offset(track_idx: int, key_idx: int) -> float:
	pass;

#desc Returns the audio stream of the key identified by [param key_idx]. The [param track_idx] must be the index of an Audio Track.
func audio_track_get_key_stream(track_idx: int, key_idx: int) -> Resource:
	pass;

#desc Inserts an Audio Track key at the given [param time] in seconds. The [param track_idx] must be the index of an Audio Track.
#desc [param stream] is the [AudioStream] resource to play. [param start_offset] is the number of seconds cut off at the beginning of the audio stream, while [param end_offset] is at the ending.
func audio_track_insert_key(track_idx: int, time: float, stream: Resource, start_offset: float = 0, end_offset: float = 0) -> int:
	pass;

#desc Returns [code]true[/code] if the track at [param track_idx] will be blended with other animations.
func audio_track_is_use_blend(track_idx: int) -> bool:
	pass;

#desc Sets the end offset of the key identified by [param key_idx] to value [param offset]. The [param track_idx] must be the index of an Audio Track.
func audio_track_set_key_end_offset(track_idx: int, key_idx: int, offset: float) -> void:
	pass;

#desc Sets the start offset of the key identified by [param key_idx] to value [param offset]. The [param track_idx] must be the index of an Audio Track.
func audio_track_set_key_start_offset(track_idx: int, key_idx: int, offset: float) -> void:
	pass;

#desc Sets the stream of the key identified by [param key_idx] to value [param stream]. The [param track_idx] must be the index of an Audio Track.
func audio_track_set_key_stream(track_idx: int, key_idx: int, stream: Resource) -> void:
	pass;

#desc Sets whether the track will be blended with other animations. If [code]true[/code], the audio playback volume changes depending on the blend value.
func audio_track_set_use_blend(track_idx: int, enable: bool) -> void:
	pass;

#desc Returns the in handle of the key identified by [param key_idx]. The [param track_idx] must be the index of a Bezier Track.
func bezier_track_get_key_in_handle(track_idx: int, key_idx: int) -> Vector2:
	pass;

#desc Returns the out handle of the key identified by [param key_idx]. The [param track_idx] must be the index of a Bezier Track.
func bezier_track_get_key_out_handle(track_idx: int, key_idx: int) -> Vector2:
	pass;

#desc Returns the value of the key identified by [param key_idx]. The [param track_idx] must be the index of a Bezier Track.
func bezier_track_get_key_value(track_idx: int, key_idx: int) -> float:
	pass;

#desc Inserts a Bezier Track key at the given [param time] in seconds. The [param track_idx] must be the index of a Bezier Track.
#desc [param in_handle] is the left-side weight of the added Bezier curve point, [param out_handle] is the right-side one, while [param value] is the actual value at this point.
func bezier_track_insert_key(track_idx: int, time: float, value: float, in_handle: Vector2 = Vector2(0, 0), out_handle: Vector2 = Vector2(0, 0)) -> int:
	pass;

#desc Returns the interpolated value at the given [param time] (in seconds). The [param track_idx] must be the index of a Bezier Track.
func bezier_track_interpolate(track_idx: int, time: float) -> float:
	pass;

#desc Sets the in handle of the key identified by [param key_idx] to value [param in_handle]. The [param track_idx] must be the index of a Bezier Track.
func bezier_track_set_key_in_handle(track_idx: int, key_idx: int, in_handle: Vector2, balanced_value_time_ratio: float = 1.0) -> void:
	pass;

#desc Sets the out handle of the key identified by [param key_idx] to value [param out_handle]. The [param track_idx] must be the index of a Bezier Track.
func bezier_track_set_key_out_handle(track_idx: int, key_idx: int, out_handle: Vector2, balanced_value_time_ratio: float = 1.0) -> void:
	pass;

#desc Sets the value of the key identified by [param key_idx] to the given value. The [param track_idx] must be the index of a Bezier Track.
func bezier_track_set_key_value(track_idx: int, key_idx: int, value: float) -> void:
	pass;

#desc Inserts a key in a given blend shape track. Returns the key index.
func blend_shape_track_insert_key(track_idx: int, time: float, amount: float) -> int:
	pass;

#desc Clear the animation (clear all tracks and reset all).
func clear() -> void:
	pass;

#desc Compress the animation and all its tracks in-place. This will make [method track_is_compressed] return [code]true[/code] once called on this [Animation]. Compressed tracks require less memory to be played, and are designed to be used for complex 3D animations (such as cutscenes) imported from external 3D software. Compression is lossy, but the difference is usually not noticeable in real world conditions.
#desc [b]Note:[/b] Compressed tracks have various limitations (such as not being editable from the editor), so only use compressed animations if you actually need them.
func compress(page_size: int = 8192, fps: int = 120, split_tolerance: float = 4.0) -> void:
	pass;

#desc Adds a new track that is a copy of the given track from [param to_animation].
func copy_track(track_idx: int, to_animation: Animation) -> void:
	pass;

#desc Returns the index of the specified track. If the track is not found, return -1.
func find_track(path: NodePath, type: int) -> int:
	pass;

#desc Returns the amount of tracks in the animation.
func get_track_count() -> int:
	pass;

#desc Returns the method name of a method track.
func method_track_get_name(track_idx: int, key_idx: int) -> StringName:
	pass;

#desc Returns the arguments values to be called on a method track for a given key in a given track.
func method_track_get_params(track_idx: int, key_idx: int) -> Array:
	pass;

#desc Inserts a key in a given 3D position track. Returns the key index.
func position_track_insert_key(track_idx: int, time: float, position: Vector3) -> int:
	pass;

#desc Removes a track by specifying the track index.
func remove_track(track_idx: int) -> void:
	pass;

#desc Inserts a key in a given 3D rotation track. Returns the key index.
func rotation_track_insert_key(track_idx: int, time: float, rotation: Quaternion) -> int:
	pass;

#desc Inserts a key in a given 3D scale track. Returns the key index.
func scale_track_insert_key(track_idx: int, time: float, scale: Vector3) -> int:
	pass;

#desc Finds the key index by time in a given track. Optionally, only find it if the approx/exact time is given.
func track_find_key(track_idx: int, time: float, find_mode: int = 0) -> int:
	pass;

#desc Returns [code]true[/code] if the track at [param track_idx] wraps the interpolation loop. New tracks wrap the interpolation loop by default.
func track_get_interpolation_loop_wrap(track_idx: int) -> bool:
	pass;

#desc Returns the interpolation type of a given track.
func track_get_interpolation_type(track_idx: int) -> int:
	pass;

#desc Returns the number of keys in a given track.
func track_get_key_count(track_idx: int) -> int:
	pass;

#desc Returns the time at which the key is located.
func track_get_key_time(track_idx: int, key_idx: int) -> float:
	pass;

#desc Returns the transition curve (easing) for a specific key (see the built-in math function [method @GlobalScope.ease]).
func track_get_key_transition(track_idx: int, key_idx: int) -> float:
	pass;

#desc Returns the value of a given key in a given track.
func track_get_key_value(track_idx: int, key_idx: int) -> Variant:
	pass;

#desc Gets the path of a track. For more information on the path format, see [method track_set_path].
func track_get_path(track_idx: int) -> NodePath:
	pass;

#desc Gets the type of a track.
func track_get_type(track_idx: int) -> int:
	pass;

#desc Inserts a generic key in a given track. Returns the key index.
func track_insert_key(track_idx: int, time: float, key: Variant, transition: float = 1) -> int:
	pass;

#desc Returns [code]true[/code] if the track is compressed, [code]false[/code] otherwise. See also [method compress].
func track_is_compressed(track_idx: int) -> bool:
	pass;

#desc Returns [code]true[/code] if the track at index [param track_idx] is enabled.
func track_is_enabled(track_idx: int) -> bool:
	pass;

#desc Returns [code]true[/code] if the given track is imported. Else, return [code]false[/code].
func track_is_imported(track_idx: int) -> bool:
	pass;

#desc Moves a track down.
func track_move_down(track_idx: int) -> void:
	pass;

#desc Changes the index position of track [param track_idx] to the one defined in [param to_idx].
func track_move_to(track_idx: int, to_idx: int) -> void:
	pass;

#desc Moves a track up.
func track_move_up(track_idx: int) -> void:
	pass;

#desc Removes a key by index in a given track.
func track_remove_key(track_idx: int, key_idx: int) -> void:
	pass;

#desc Removes a key at [param time] in a given track.
func track_remove_key_at_time(track_idx: int, time: float) -> void:
	pass;

#desc Enables/disables the given track. Tracks are enabled by default.
func track_set_enabled(track_idx: int, enabled: bool) -> void:
	pass;

#desc Sets the given track as imported or not.
func track_set_imported(track_idx: int, imported: bool) -> void:
	pass;

#desc If [code]true[/code], the track at [param track_idx] wraps the interpolation loop.
func track_set_interpolation_loop_wrap(track_idx: int, interpolation: bool) -> void:
	pass;

#desc Sets the interpolation type of a given track.
func track_set_interpolation_type(track_idx: int, interpolation: int) -> void:
	pass;

#desc Sets the time of an existing key.
func track_set_key_time(track_idx: int, key_idx: int, time: float) -> void:
	pass;

#desc Sets the transition curve (easing) for a specific key (see the built-in math function [method @GlobalScope.ease]).
func track_set_key_transition(track_idx: int, key_idx: int, transition: float) -> void:
	pass;

#desc Sets the value of an existing key.
func track_set_key_value(track_idx: int, key: int, value: Variant) -> void:
	pass;

#desc Sets the path of a track. Paths must be valid scene-tree paths to a node and must be specified starting from the parent node of the node that will reproduce the animation. Tracks that control properties or bones must append their name after the path, separated by [code]":"[/code].
#desc For example, [code]"character/skeleton:ankle"[/code] or [code]"character/mesh:transform/local"[/code].
func track_set_path(track_idx: int, path: NodePath) -> void:
	pass;

#desc Swaps the track [param track_idx]'s index position with the track [param with_idx].
func track_swap(track_idx: int, with_idx: int) -> void:
	pass;

#desc Returns the update mode of a value track.
func value_track_get_update_mode(track_idx: int) -> int:
	pass;

#desc Returns the interpolated value at the given time (in seconds). The [param track_idx] must be the index of a value track.
func value_track_interpolate(track_idx: int, time_sec: float) -> Variant:
	pass;

#desc Sets the update mode (see [enum UpdateMode]) of a value track.
func value_track_set_update_mode(track_idx: int, mode: int) -> void:
	pass;


func get_length() -> float:
	return length

func set_length(value: float) -> void:
	length = value

func get_loop_mode() -> int:
	return loop_mode

func set_loop_mode(value: int) -> void:
	loop_mode = value

func get_step() -> float:
	return step

func set_step(value: float) -> void:
	step = value

