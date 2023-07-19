extends Resource
#brief Sprite frame library for AnimatedSprite2D and AnimatedSprite3D.
#desc Sprite frame library for an [AnimatedSprite2D] or [AnimatedSprite3D] node. Contains frames and animation data for playback.
class_name SpriteFrames




#desc Adds a new [param anim] animation to the library.
func add_animation(anim: StringName) -> void:
	pass;

#desc Adds a frame to the [param anim] animation. If [param at_position] is [code]-1[/code], the frame will be added to the end of the animation.
func add_frame(anim: StringName, texture: Texture2D, duration: float = 1.0, at_position: int = -1) -> void:
	pass;

#desc Removes all frames from the [param anim] animation.
func clear(anim: StringName) -> void:
	pass;

#desc Removes all animations. An empty [code]default[/code] animation will be created.
func clear_all() -> void:
	pass;

#desc Returns [code]true[/code] if the given animation is configured to loop when it finishes playing. Otherwise, returns [code]false[/code].
func get_animation_loop(anim: StringName) -> bool:
	pass;

#desc Returns an array containing the names associated to each animation. Values are placed in alphabetical order.
func get_animation_names() -> PackedStringArray:
	pass;

#desc Returns the speed in frames per second for the [param anim] animation.
func get_animation_speed(anim: StringName) -> float:
	pass;

#desc Returns the number of frames for the [param anim] animation.
func get_frame_count(anim: StringName) -> int:
	pass;

#desc Returns a relative duration of the frame [param idx] in the [param anim] animation (defaults to [code]1.0[/code]). For example, a frame with a duration of [code]2.0[/code] is displayed twice as long as a frame with a duration of [code]1.0[/code]. You can calculate the absolute duration (in seconds) of a frame using the following formula:
#desc [codeblock]
#desc absolute_duration = relative_duration / (animation_fps * abs(playing_speed))
#desc [/codeblock]
#desc In this example, [code]playing_speed[/code] refers to either [method AnimatedSprite2D.get_playing_speed] or [method AnimatedSprite3D.get_playing_speed].
func get_frame_duration(anim: StringName, idx: int) -> float:
	pass;

#desc Returns the texture of the frame [param idx] in the [param anim] animation.
func get_frame_texture(anim: StringName, idx: int) -> Texture2D:
	pass;

#desc Returns [code]true[/code] if the [param anim] animation exists.
func has_animation(anim: StringName) -> bool:
	pass;

#desc Removes the [param anim] animation.
func remove_animation(anim: StringName) -> void:
	pass;

#desc Removes the [param anim] animation's frame [param idx].
func remove_frame(anim: StringName, idx: int) -> void:
	pass;

#desc Changes the [param anim] animation's name to [param newname].
func rename_animation(anim: StringName, newname: StringName) -> void:
	pass;

#desc If [param loop] is [code]true[/code], the [param anim] animation will loop when it reaches the end, or the start if it is played in reverse.
func set_animation_loop(anim: StringName, loop: bool) -> void:
	pass;

#desc Sets the speed for the [param anim] animation in frames per second.
func set_animation_speed(anim: StringName, fps: float) -> void:
	pass;

#desc Sets the [param texture] and the [param duration] of the frame [param idx] in the [param anim] animation.
func set_frame(anim: StringName, idx: int, texture: Texture2D, duration: float = 1.0) -> void:
	pass;


