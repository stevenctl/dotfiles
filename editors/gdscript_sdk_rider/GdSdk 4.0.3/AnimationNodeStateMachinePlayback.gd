extends Resource
#brief Playback control for [AnimationNodeStateMachine].
#desc Allows control of [AnimationTree] state machines created with [AnimationNodeStateMachine]. Retrieve with [code]$AnimationTree.get("parameters/playback")[/code].
#desc [b]Example:[/b]
#desc [codeblocks]
#desc [gdscript]
#desc var state_machine = $AnimationTree.get("parameters/playback")
#desc state_machine.travel("some_state")
#desc [/gdscript]
#desc [csharp]
#desc var stateMachine = GetNode<AnimationTree>("AnimationTree").Get("parameters/playback") as AnimationNodeStateMachinePlayback;
#desc stateMachine.Travel("some_state");
#desc [/csharp]
#desc [/codeblocks]
#tutorial [AnimationTree] https://docs.godotengine.org/en/stable/tutorials/animation/animation_tree.html
class_name AnimationNodeStateMachinePlayback


var resource_local_to_scene: bool:
	get = is_local_to_scene, set = set_local_to_scene



#desc Returns the current state length.
#desc [b]Note:[/b] It is possible that any [AnimationRootNode] can be nodes as well as animations. This means that there can be multiple animations within a single state. Which animation length has priority depends on the nodes connected inside it. Also, if a transition does not reset, the remaining length at that point will be returned.
func get_current_length() -> float:
	pass;

#desc Returns the currently playing animation state.
#desc [b]Note:[/b] When using a cross-fade, the current state changes to the next state immediately after the cross-fade begins.
func get_current_node() -> StringName:
	pass;

#desc Returns the playback position within the current animation state.
func get_current_play_position() -> float:
	pass;

#desc Returns the starting state of currently fading animation.
func get_fading_from_node() -> StringName:
	pass;

#desc Returns the current travel path as computed internally by the A* algorithm.
func get_travel_path() -> PackedStringArray:
	pass;

#desc Returns [code]true[/code] if an animation is playing.
func is_playing() -> bool:
	pass;

#desc If there is a next path by travel or auto advance, immediately transitions from the current state to the next state.
func next() -> void:
	pass;

#desc Starts playing the given animation.
#desc If [param reset] is [code]true[/code], the animation is played from the beginning.
func start(node: StringName, reset: bool = true) -> void:
	pass;

#desc Stops the currently playing animation.
func stop() -> void:
	pass;

#desc Transitions from the current state to another one, following the shortest path.
#desc If the path does not connect from the current state, the animation will play after the state teleports.
#desc If [param reset_on_teleport] is [code]true[/code], the animation is played from the beginning when the travel cause a teleportation.
func travel(to_node: StringName, reset_on_teleport: bool = true) -> void:
	pass;


func is_local_to_scene() -> bool:
	return resource_local_to_scene

func set_local_to_scene(value: bool) -> void:
	resource_local_to_scene = value

