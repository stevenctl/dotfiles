extends Texture2D
#brief Proxy texture for simple frame-based animations.
#desc [AnimatedTexture] is a resource format for frame-based animations, where multiple textures can be chained automatically with a predefined delay for each frame. Unlike [AnimationPlayer] or [AnimatedSprite2D], it isn't a [Node], but has the advantage of being usable anywhere a [Texture2D] resource can be used, e.g. in a [TileSet].
#desc The playback of the animation is controlled by the [member speed_scale] property, as well as each frame's duration (see [method set_frame_duration]). The animation loops, i.e. it will restart at frame 0 automatically after playing the last frame.
#desc [AnimatedTexture] currently requires all frame textures to have the same size, otherwise the bigger ones will be cropped to match the smallest one.
#desc [b]Note:[/b] AnimatedTexture doesn't support using [AtlasTexture]s. Each frame needs to be a separate [Texture2D].
#desc [b]Warning:[/b] AnimatedTexture is deprecated, and might be removed in a future release. Its current implementation is not efficient for the modern renderers.
class_name AnimatedTexture

#desc The maximum number of frames supported by [AnimatedTexture]. If you need more frames in your animation, use [AnimationPlayer] or [AnimatedSprite2D].
const MAX_FRAMES = 256;


#desc Sets the currently visible frame of the texture. Setting this frame while playing resets the current frame time, so the newly selected frame plays for its whole configured frame duration.
var current_frame: int:
	get = get_current_frame, set = set_current_frame

#desc Number of frames to use in the animation. While you can create the frames independently with [method set_frame_texture], you need to set this value for the animation to take new frames into account. The maximum number of frames is [constant MAX_FRAMES].
var frames: int:
	get = get_frames, set = set_frames

#desc If [code]true[/code], the animation will only play once and will not loop back to the first frame after reaching the end. Note that reaching the end will not set [member pause] to [code]true[/code].
var one_shot: bool:
	get = get_one_shot, set = set_one_shot

#desc If [code]true[/code], the animation will pause where it currently is (i.e. at [member current_frame]). The animation will continue from where it was paused when changing this property to [code]false[/code].
var pause: bool:
	get = get_pause, set = set_pause

var resource_local_to_scene: bool:
	get = is_local_to_scene, set = set_local_to_scene

#desc The animation speed is multiplied by this value. If set to a negative value, the animation is played in reverse.
var speed_scale: float:
	get = get_speed_scale, set = set_speed_scale



#desc Returns the given [param frame]'s duration, in seconds.
func get_frame_duration(frame: int) -> float:
	pass;

#desc Returns the given frame's [Texture2D].
func get_frame_texture(frame: int) -> Texture2D:
	pass;

#desc Sets the duration of any given [param frame]. The final duration is affected by the [member speed_scale]. If set to [code]0[/code], the frame is skipped during playback.
func set_frame_duration(frame: int, duration: float) -> void:
	pass;

#desc Assigns a [Texture2D] to the given frame. Frame IDs start at 0, so the first frame has ID 0, and the last frame of the animation has ID [member frames] - 1.
#desc You can define any number of textures up to [constant MAX_FRAMES], but keep in mind that only frames from 0 to [member frames] - 1 will be part of the animation.
func set_frame_texture(frame: int, texture: Texture2D) -> void:
	pass;


func get_current_frame() -> int:
	return current_frame

func set_current_frame(value: int) -> void:
	current_frame = value

func get_frames() -> int:
	return frames

func set_frames(value: int) -> void:
	frames = value

func get_one_shot() -> bool:
	return one_shot

func set_one_shot(value: bool) -> void:
	one_shot = value

func get_pause() -> bool:
	return pause

func set_pause(value: bool) -> void:
	pause = value

func is_local_to_scene() -> bool:
	return resource_local_to_scene

func set_local_to_scene(value: bool) -> void:
	resource_local_to_scene = value

func get_speed_scale() -> float:
	return speed_scale

func set_speed_scale(value: float) -> void:
	speed_scale = value

