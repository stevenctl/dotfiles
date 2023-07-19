extends Node2D
#brief Sprite node that contains multiple textures as frames to play for animation.
#desc [AnimatedSprite2D] is similar to the [Sprite2D] node, except it carries multiple textures as animation frames. Animations are created using a [SpriteFrames] resource, which allows you to import image files (or a folder containing said files) to provide the animation frames for the sprite. The [SpriteFrames] resource can be configured in the editor via the SpriteFrames bottom panel.
#tutorial [2D Sprite animation] https://docs.godotengine.org/en/stable/tutorials/2d/2d_sprite_animation.html
#tutorial [2D Dodge The Creeps Demo] https://godotengine.org/asset-library/asset/515
class_name AnimatedSprite2D

#desc Emitted when [member animation] changes.
signal animation_changed
#desc Emitted when the animation reaches the end, or the start if it is played in reverse. When the animation finishes, it pauses the playback.
signal animation_finished
#desc Emitted when the animation loops.
signal animation_looped
#desc Emitted when [member frame] changes.
signal frame_changed
#desc Emitted when [member sprite_frames] changes.
signal sprite_frames_changed

#desc The current animation from the [member sprite_frames] resource. If this value is changed, the [member frame] counter and the [member frame_progress] are reset.
var animation: StringName:
	get = get_animation, set = set_animation

#desc The key of the animation to play when the scene loads.
var autoplay: String:
	get = get_autoplay, set = set_autoplay

#desc If [code]true[/code], texture will be centered.
var centered: bool:
	get = is_centered, set = set_centered

#desc If [code]true[/code], texture is flipped horizontally.
var flip_h: bool:
	get = is_flipped_h, set = set_flip_h

#desc If [code]true[/code], texture is flipped vertically.
var flip_v: bool:
	get = is_flipped_v, set = set_flip_v

#desc The displayed animation frame's index. Setting this property also resets [member frame_progress]. If this is not desired, use [method set_frame_and_progress].
var frame: int:
	get = get_frame, set = set_frame

#desc The progress value between [code]0.0[/code] and [code]1.0[/code] until the current frame transitions to the next frame. If the animation is playing backwards, the value transitions from [code]1.0[/code] to [code]0.0[/code].
var frame_progress: float:
	get = get_frame_progress, set = set_frame_progress

#desc The texture's drawing offset.
var offset: Vector2:
	get = get_offset, set = set_offset

#desc The speed scaling ratio. For example, if this value is [code]1[/code], then the animation plays at normal speed. If it's [code]0.5[/code], then it plays at half speed. If it's [code]2[/code], then it plays at double speed.
#desc If set to a negative value, the animation is played in reverse. If set to [code]0[/code], the animation will not advance.
var speed_scale: float:
	get = get_speed_scale, set = set_speed_scale

#desc The [SpriteFrames] resource containing the animation(s). Allows you the option to load, edit, clear, make unique and save the states of the [SpriteFrames] resource.
var sprite_frames: SpriteFrames:
	get = get_sprite_frames, set = set_sprite_frames



#desc Returns the actual playing speed of current animation or [code]0[/code] if not playing. This speed is the [member speed_scale] property multiplied by [code]custom_speed[/code] argument specified when calling the [method play] method.
#desc Returns a negative value if the current animation is playing backwards.
func get_playing_speed() -> float:
	pass;

#desc Returns [code]true[/code] if an animation is currently playing (even if [member speed_scale] and/or [code]custom_speed[/code] are [code]0[/code]).
func is_playing() -> bool:
	pass;

#desc Pauses the currently playing animation. The [member frame] and [member frame_progress] will be kept and calling [method play] or [method play_backwards] without arguments will resume the animation from the current playback position.
#desc See also [method stop].
func pause() -> void:
	pass;

#desc Plays the animation with key [param name]. If [param custom_speed] is negative and [param from_end] is [code]true[/code], the animation will play backwards (which is equivalent to calling [method play_backwards]).
#desc If this method is called with that same animation [param name], or with no [param name] parameter, the assigned animation will resume playing if it was paused.
func play(name: StringName = &"", custom_speed: float = 1.0, from_end: bool = false) -> void:
	pass;

#desc Plays the animation with key [param name] in reverse.
#desc This method is a shorthand for [method play] with [code]custom_speed = -1.0[/code] and [code]from_end = true[/code], so see its description for more information.
func play_backwards(name: StringName = &"") -> void:
	pass;

#desc The setter of [member frame] resets the [member frame_progress] to [code]0.0[/code] implicitly, but this method avoids that.
#desc This is useful when you want to carry over the current [member frame_progress] to another [member frame].
#desc [b]Example:[/b]
#desc [codeblocks]
#desc [gdscript]
#desc # Change the animation with keeping the frame index and progress.
#desc var current_frame = animated_sprite.get_frame()
#desc var current_progress = animated_sprite.get_frame_progress()
#desc animated_sprite.play("walk_another_skin")
#desc animated_sprite.set_frame_and_progress(current_frame, current_progress)
#desc [/gdscript]
#desc [/codeblocks]
func set_frame_and_progress(frame: int, progress: float) -> void:
	pass;

#desc Stops the currently playing animation. The animation position is reset to [code]0[/code] and the [code]custom_speed[/code] is reset to [code]1.0[/code]. See also [method pause].
func stop() -> void:
	pass;


func get_animation() -> StringName:
	return animation

func set_animation(value: StringName) -> void:
	animation = value

func get_autoplay() -> String:
	return autoplay

func set_autoplay(value: String) -> void:
	autoplay = value

func is_centered() -> bool:
	return centered

func set_centered(value: bool) -> void:
	centered = value

func is_flipped_h() -> bool:
	return flip_h

func set_flip_h(value: bool) -> void:
	flip_h = value

func is_flipped_v() -> bool:
	return flip_v

func set_flip_v(value: bool) -> void:
	flip_v = value

func get_frame() -> int:
	return frame

func set_frame(value: int) -> void:
	frame = value

func get_frame_progress() -> float:
	return frame_progress

func set_frame_progress(value: float) -> void:
	frame_progress = value

func get_offset() -> Vector2:
	return offset

func set_offset(value: Vector2) -> void:
	offset = value

func get_speed_scale() -> float:
	return speed_scale

func set_speed_scale(value: float) -> void:
	speed_scale = value

func get_sprite_frames() -> SpriteFrames:
	return sprite_frames

func set_sprite_frames(value: SpriteFrames) -> void:
	sprite_frames = value

