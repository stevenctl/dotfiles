extends AnimationNodeSync
#brief Plays an animation once in [AnimationNodeBlendTree].
#desc A resource to add to an [AnimationNodeBlendTree]. This node will execute a sub-animation and return once it finishes. Blend times for fading in and out can be customized, as well as filters.
#desc After setting the request and changing the animation playback, the one-shot node automatically clears the request on the next process frame by setting its [code]request[/code] value to [constant ONE_SHOT_REQUEST_NONE].
#desc [codeblocks]
#desc [gdscript]
#desc # Play child animation connected to "shot" port.
#desc animation_tree.set("parameters/OneShot/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
#desc # Alternative syntax (same result as above).
#desc animation_tree["parameters/OneShot/request"] = AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE
#desc 
#desc # Abort child animation connected to "shot" port.
#desc animation_tree.set("parameters/OneShot/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_ABORT)
#desc # Alternative syntax (same result as above).
#desc animation_tree["parameters/OneShot/request"] = AnimationNodeOneShot.ONE_SHOT_REQUEST_ABORT
#desc 
#desc # Get current state (read-only).
#desc animation_tree.get("parameters/OneShot/active"))
#desc # Alternative syntax (same result as above).
#desc animation_tree["parameters/OneShot/active"]
#desc [/gdscript]
#desc [csharp]
#desc // Play child animation connected to "shot" port.
#desc animationTree.Set("parameters/OneShot/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE);
#desc 
#desc // Abort child animation connected to "shot" port.
#desc animationTree.Set("parameters/OneShot/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_ABORT);
#desc 
#desc // Get current state (read-only).
#desc animationTree.Get("parameters/OneShot/active");
#desc [/csharp]
#desc [/codeblocks]
#tutorial [AnimationTree] https://docs.godotengine.org/en/stable/tutorials/animation/animation_tree.html
#tutorial [Third Person Shooter Demo] https://godotengine.org/asset-library/asset/678
class_name AnimationNodeOneShot

#desc The default state of the request. Nothing is done.
#desc The request to play the animation connected to "shot" port.
#desc The request to stop the animation connected to "shot" port.
#desc Blends two animations. See also [AnimationNodeBlend2].
#desc Blends two animations additively. See also [AnimationNodeAdd2].

#enum OneShotRequest
enum {
    ONE_SHOT_REQUEST_NONE = 0,
    ONE_SHOT_REQUEST_FIRE = 1,
    ONE_SHOT_REQUEST_ABORT = 2,
}
#enum MixMode
enum {
    MIX_MODE_BLEND = 0,
    MIX_MODE_ADD = 1,
}
#desc If [code]true[/code], the sub-animation will restart automatically after finishing.
#desc In other words, to start auto restarting, the animation must be played once with the [constant ONE_SHOT_REQUEST_FIRE] request. The [constant ONE_SHOT_REQUEST_ABORT] request stops the auto restarting, but it does not disable the [member autorestart] itself. So, the [constant ONE_SHOT_REQUEST_FIRE] request will start auto restarting again.
var autorestart: bool:
	get = has_autorestart, set = set_autorestart

#desc The delay after which the automatic restart is triggered, in seconds.
var autorestart_delay: float:
	get = get_autorestart_delay, set = set_autorestart_delay

#desc If [member autorestart] is [code]true[/code], a random additional delay (in seconds) between 0 and this value will be added to [member autorestart_delay].
var autorestart_random_delay: float:
	get = get_autorestart_random_delay, set = set_autorestart_random_delay

#desc The fade-in duration. For example, setting this to [code]1.0[/code] for a 5 second length animation will produce a crossfade that starts at 0 second and ends at 1 second during the animation.
var fadein_time: float:
	get = get_fadein_time, set = set_fadein_time

#desc The fade-out duration. For example, setting this to [code]1.0[/code] for a 5 second length animation will produce a crossfade that starts at 4 second and ends at 5 second during the animation.
var fadeout_time: float:
	get = get_fadeout_time, set = set_fadeout_time

#desc The blend type.
var mix_mode: int:
	get = get_mix_mode, set = set_mix_mode




func has_autorestart() -> bool:
	return autorestart

func set_autorestart(value: bool) -> void:
	autorestart = value

func get_autorestart_delay() -> float:
	return autorestart_delay

func set_autorestart_delay(value: float) -> void:
	autorestart_delay = value

func get_autorestart_random_delay() -> float:
	return autorestart_random_delay

func set_autorestart_random_delay(value: float) -> void:
	autorestart_random_delay = value

func get_fadein_time() -> float:
	return fadein_time

func set_fadein_time(value: float) -> void:
	fadein_time = value

func get_fadeout_time() -> float:
	return fadeout_time

func set_fadeout_time(value: float) -> void:
	fadeout_time = value

func get_mix_mode() -> int:
	return mix_mode

func set_mix_mode(value: int) -> void:
	mix_mode = value

