extends Resource
#brief A resource to connect each node to make a path for [AnimationNodeStateMachine].
#desc The path generated when using [method AnimationNodeStateMachinePlayback.travel] is limited to the nodes connected by [AnimationNodeStateMachineTransition].
#desc You can set the timing and conditions of the transition in detail.
#tutorial [AnimationTree] https://docs.godotengine.org/en/stable/tutorials/animation/animation_tree.html
class_name AnimationNodeStateMachineTransition

#desc Emitted when [member advance_condition] is changed.
signal advance_condition_changed
#desc Switch to the next state immediately. The current state will end and blend into the beginning of the new one.
#desc Switch to the next state immediately, but will seek the new state to the playback position of the old state.
#desc Wait for the current state playback to end, then switch to the beginning of the next state animation.
#desc Don't use this transition.
#desc Only use this transition during [method AnimationNodeStateMachinePlayback.travel].
#desc Automatically use this transition if the [member advance_condition] and [member advance_expression] checks are true (if assigned).

#enum SwitchMode
enum {
    SWITCH_MODE_IMMEDIATE = 0,
    SWITCH_MODE_SYNC = 1,
    SWITCH_MODE_AT_END = 2,
}
#enum AdvanceMode
enum {
    ADVANCE_MODE_DISABLED = 0,
    ADVANCE_MODE_ENABLED = 1,
    ADVANCE_MODE_AUTO = 2,
}
#desc Turn on auto advance when this condition is set. The provided name will become a boolean parameter on the [AnimationTree] that can be controlled from code (see [url=$DOCS_URL/tutorials/animation/animation_tree.html#controlling-from-code]Using AnimationTree[/url]). For example, if [member AnimationTree.tree_root] is an [AnimationNodeStateMachine] and [member advance_condition] is set to [code]"idle"[/code]:
#desc [codeblocks]
#desc [gdscript]
#desc $animation_tree.set("parameters/conditions/idle", is_on_floor and (linear_velocity.x == 0))
#desc [/gdscript]
#desc [csharp]
#desc GetNode<AnimationTree>("animation_tree").Set("parameters/conditions/idle", IsOnFloor && (LinearVelocity.X == 0));
#desc [/csharp]
#desc [/codeblocks]
var advance_condition: StringName:
	get = get_advance_condition, set = set_advance_condition

#desc Use an expression as a condition for state machine transitions. It is possible to create complex animation advance conditions for switching between states and gives much greater flexibility for creating complex state machines by directly interfacing with the script code.
var advance_expression: String:
	get = get_advance_expression, set = set_advance_expression

#desc Determines whether the transition should disabled, enabled when using [method AnimationNodeStateMachinePlayback.travel], or traversed automatically if the [member advance_condition] and [member advance_expression] checks are true (if assigned).
var advance_mode: int:
	get = get_advance_mode, set = set_advance_mode

#desc Lower priority transitions are preferred when travelling through the tree via [method AnimationNodeStateMachinePlayback.travel] or [member advance_mode] is set to [constant ADVANCE_MODE_AUTO].
var priority: int:
	get = get_priority, set = set_priority

#desc If [code]true[/code], the destination animation is played back from the beginning when switched.
var reset: bool:
	get = is_reset, set = set_reset

#desc The transition type.
var switch_mode: int:
	get = get_switch_mode, set = set_switch_mode

#desc Ease curve for better control over cross-fade between this state and the next.
var xfade_curve: Curve:
	get = get_xfade_curve, set = set_xfade_curve

#desc The time to cross-fade between this state and the next.
var xfade_time: float:
	get = get_xfade_time, set = set_xfade_time




func get_advance_condition() -> StringName:
	return advance_condition

func set_advance_condition(value: StringName) -> void:
	advance_condition = value

func get_advance_expression() -> String:
	return advance_expression

func set_advance_expression(value: String) -> void:
	advance_expression = value

func get_advance_mode() -> int:
	return advance_mode

func set_advance_mode(value: int) -> void:
	advance_mode = value

func get_priority() -> int:
	return priority

func set_priority(value: int) -> void:
	priority = value

func is_reset() -> bool:
	return reset

func set_reset(value: bool) -> void:
	reset = value

func get_switch_mode() -> int:
	return switch_mode

func set_switch_mode(value: int) -> void:
	switch_mode = value

func get_xfade_curve() -> Curve:
	return xfade_curve

func set_xfade_curve(value: Curve) -> void:
	xfade_curve = value

func get_xfade_time() -> float:
	return xfade_time

func set_xfade_time(value: float) -> void:
	xfade_time = value

