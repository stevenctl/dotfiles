extends AnimationNodeSync
#brief A generic animation transition node for [AnimationTree].
#desc Simple state machine for cases which don't require a more advanced [AnimationNodeStateMachine]. Animations can be connected to the inputs and transition times can be specified.
#desc After setting the request and changing the animation playback, the transition node automatically clears the request on the next process frame by setting its [code]transition_request[/code] value to empty.
#desc [b]Note:[/b] When using a cross-fade, [code]current_state[/code] and [code]current_index[/code] change to the next state immediately after the cross-fade begins.
#desc [codeblocks]
#desc [gdscript]
#desc # Play child animation connected to "state_2" port.
#desc animation_tree.set("parameters/Transition/transition_request", "state_2")
#desc # Alternative syntax (same result as above).
#desc animation_tree["parameters/Transition/transition_request"] = "state_2"
#desc 
#desc # Get current state name (read-only).
#desc animation_tree.get("parameters/Transition/current_state")
#desc # Alternative syntax (same result as above).
#desc animation_tree["parameters/Transition/current_state"]
#desc 
#desc # Get current state index (read-only).
#desc animation_tree.get("parameters/Transition/current_index"))
#desc # Alternative syntax (same result as above).
#desc animation_tree["parameters/Transition/current_index"]
#desc [/gdscript]
#desc [csharp]
#desc // Play child animation connected to "state_2" port.
#desc animationTree.Set("parameters/Transition/transition_request", "state_2");
#desc 
#desc // Get current state name (read-only).
#desc animationTree.Get("parameters/Transition/current_state");
#desc 
#desc // Get current state index (read-only).
#desc animationTree.Get("parameters/Transition/current_index");
#desc [/csharp]
#desc [/codeblocks]
#tutorial [AnimationTree] https://docs.godotengine.org/en/stable/tutorials/animation/animation_tree.html
#tutorial [3D Platformer Demo] https://godotengine.org/asset-library/asset/125
#tutorial [Third Person Shooter Demo] https://godotengine.org/asset-library/asset/678
class_name AnimationNodeTransition


#desc If [code]true[/code], allows transition to the self state. When the reset option is enabled in input, the animation is restarted. If [code]false[/code], nothing happens on the transition to the self state.
var allow_transition_to_self: bool:
	get = is_allow_transition_to_self, set = set_allow_transition_to_self

#desc The number of enabled input ports for this node.
var input_count: int:
	get = get_input_count, set = set_input_count

#desc Determines how cross-fading between animations is eased. If empty, the transition will be linear.
var xfade_curve: Curve:
	get = get_xfade_curve, set = set_xfade_curve

#desc Cross-fading time (in seconds) between each animation connected to the inputs.
var xfade_time: float:
	get = get_xfade_time, set = set_xfade_time



#desc Returns whether the animation restarts when the animation transitions from the other animation.
func is_input_reset(input: int) -> bool:
	pass;

#desc Returns [code]true[/code] if auto-advance is enabled for the given [param input] index.
func is_input_set_as_auto_advance(input: int) -> bool:
	pass;

#desc Enables or disables auto-advance for the given [param input] index. If enabled, state changes to the next input after playing the animation once. If enabled for the last input state, it loops to the first.
func set_input_as_auto_advance(input: int, enable: bool) -> void:
	pass;

#desc If [code]true[/code], the destination animation is restarted when the animation transitions.
func set_input_reset(input: int, enable: bool) -> void:
	pass;


func is_allow_transition_to_self() -> bool:
	return allow_transition_to_self

func set_allow_transition_to_self(value: bool) -> void:
	allow_transition_to_self = value

func get_input_count() -> int:
	return input_count

func set_input_count(value: int) -> void:
	input_count = value

func get_xfade_curve() -> Curve:
	return xfade_curve

func set_xfade_curve(value: Curve) -> void:
	xfade_curve = value

func get_xfade_time() -> float:
	return xfade_time

func set_xfade_time(value: float) -> void:
	xfade_time = value

