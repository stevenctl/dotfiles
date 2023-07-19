extends Node
#brief A node to be used for advanced animation transitions in an [AnimationPlayer].
#desc A node to be used for advanced animation transitions in an [AnimationPlayer].
#desc [b]Note:[/b] When linked with an [AnimationPlayer], several properties and methods of the corresponding [AnimationPlayer] will not function as expected. Playback and transitions should be handled using only the [AnimationTree] and its constituent [AnimationNode](s). The [AnimationPlayer] node should be used solely for adding, deleting, and editing animations.
#tutorial [Using AnimationTree] https://docs.godotengine.org/en/stable/tutorials/animation/animation_tree.html
#tutorial [Third Person Shooter Demo] https://godotengine.org/asset-library/asset/678
class_name AnimationTree

#desc Notifies when an animation finished playing.
#desc [b]Note:[/b] This signal is not emitted if an animation is looping or aborted. Also be aware of the possibility of unseen playback by sync and xfade.
signal animation_finished(anim_name: StringName)
#desc Emitted when the [member anim_player] is changed.
signal animation_player_changed
#desc Notifies when an animation starts playing.
#desc [b]Note:[/b] This signal is not emitted if an animation is looping or playbacked from the middle. Also be aware of the possibility of unseen playback by sync and xfade.
signal animation_started(anim_name: StringName)
#desc The animations will progress during the physics frame (i.e. [method Node._physics_process]).
#desc The animations will progress during the idle frame (i.e. [method Node._process]).
#desc The animations will only progress manually (see [method advance]).

#enum AnimationProcessCallback
enum {
    ANIMATION_PROCESS_PHYSICS = 0,
    ANIMATION_PROCESS_IDLE = 1,
    ANIMATION_PROCESS_MANUAL = 2,
}
#desc If [code]true[/code], the [AnimationTree] will be processing.
var active: bool:
	get = is_active, set = set_active

#desc The path to the [Node] used to evaluate the AnimationNode [Expression] if one is not explicitly specified internally.
var advance_expression_base_node: NodePath:
	get = get_advance_expression_base_node, set = set_advance_expression_base_node

#desc The path to the [AnimationPlayer] used for animating.
var anim_player: NodePath:
	get = get_animation_player, set = set_animation_player

#desc The number of possible simultaneous sounds for each of the assigned AudioStreamPlayers.
#desc For example, if this value is [code]32[/code] and the animation has two audio tracks, the two [AudioStreamPlayer]s assigned can play simultaneously up to [code]32[/code] voices each.
var audio_max_polyphony: int:
	get = get_audio_max_polyphony, set = set_audio_max_polyphony

#desc The process mode of this [AnimationTree]. See [enum AnimationProcessCallback] for available modes.
var process_callback: int:
	get = get_process_callback, set = set_process_callback

#desc The path to the Animation track used for root motion. Paths must be valid scene-tree paths to a node, and must be specified starting from the parent node of the node that will reproduce the animation. To specify a track that controls properties or bones, append its name after the path, separated by [code]":"[/code]. For example, [code]"character/skeleton:ankle"[/code] or [code]"character/mesh:transform/local"[/code].
#desc If the track has type [constant Animation.TYPE_POSITION_3D], [constant Animation.TYPE_ROTATION_3D] or [constant Animation.TYPE_SCALE_3D] the transformation will be canceled visually, and the animation will appear to stay in place. See also [method get_root_motion_position], [method get_root_motion_rotation], [method get_root_motion_scale] and [RootMotionView].
var root_motion_track: NodePath:
	get = get_root_motion_track, set = set_root_motion_track

#desc The root animation node of this [AnimationTree]. See [AnimationNode].
var tree_root: AnimationNode:
	get = get_tree_root, set = set_tree_root



#desc A virtual function for processing after key getting during playback.
func _post_process_key_value(animation: Animation, track: int, value: Variant, object: Object, object_idx: int) -> Variant:
	pass;

#desc Manually advance the animations by the specified time (in seconds).
func advance(delta: float) -> void:
	pass;

#desc Retrieve the motion delta of position with the [member root_motion_track] as a [Vector3] that can be used elsewhere.
#desc If [member root_motion_track] is not a path to a track of type [constant Animation.TYPE_POSITION_3D], returns [code]Vector3(0, 0, 0)[/code].
#desc See also [member root_motion_track] and [RootMotionView].
#desc The most basic example is applying position to [CharacterBody3D]:
#desc [codeblocks]
#desc [gdscript]
#desc var current_rotation: Quaternion
#desc 
#desc func _process(delta):
#desc if Input.is_action_just_pressed("animate"):
#desc current_rotation = get_quaternion()
#desc state_machine.travel("Animate")
#desc var velocity: Vector3 = current_rotation * animation_tree.get_root_motion_position() / delta
#desc set_velocity(velocity)
#desc move_and_slide()
#desc [/gdscript]
#desc [/codeblocks]
#desc By using this in combination with [method get_root_motion_position_accumulator], you can apply the root motion position more correctly to account for the rotation of the node.
#desc [codeblocks]
#desc [gdscript]
#desc func _process(delta):
#desc if Input.is_action_just_pressed("animate"):
#desc state_machine.travel("Animate")
#desc set_quaternion(get_quaternion() * animation_tree.get_root_motion_rotation())
#desc var velocity: Vector3 = (animation_tree.get_root_motion_rotation_accumulator().inverse() * get_quaternion()) * animation_tree.get_root_motion_position() / delta
#desc set_velocity(velocity)
#desc move_and_slide()
#desc [/gdscript]
#desc [/codeblocks]
func get_root_motion_position() -> Vector3:
	pass;

#desc Retrieve the blended value of the position tracks with the [member root_motion_track] as a [Vector3] that can be used elsewhere.
#desc This is useful in cases where you want to respect the initial key values of the animation.
#desc For example, if an animation with only one key [code]Vector3(0, 0, 0)[/code] is played in the previous frame and then an animation with only one key [code]Vector3(1, 0, 1)[/code] is played in the next frame, the difference can be calculated as follows:
#desc [codeblocks]
#desc [gdscript]
#desc var prev_root_motion_position_accumulator: Vector3
#desc 
#desc func _process(delta):
#desc if Input.is_action_just_pressed("animate"):
#desc state_machine.travel("Animate")
#desc var current_root_motion_position_accumulator: Vector3 = animation_tree.get_root_motion_position_accumulator()
#desc var difference: Vector3 = current_root_motion_position_accumulator - prev_root_motion_position_accumulator
#desc prev_root_motion_position_accumulator = current_root_motion_position_accumulator
#desc transform.origin += difference
#desc [/gdscript]
#desc [/codeblocks]
#desc However, if the animation loops, an unintended discrete change may occur, so this is only useful for some simple use cases.
func get_root_motion_position_accumulator() -> Vector3:
	pass;

#desc Retrieve the motion delta of rotation with the [member root_motion_track] as a [Quaternion] that can be used elsewhere.
#desc If [member root_motion_track] is not a path to a track of type [constant Animation.TYPE_ROTATION_3D], returns [code]Quaternion(0, 0, 0, 1)[/code].
#desc See also [member root_motion_track] and [RootMotionView].
#desc The most basic example is applying rotation to [CharacterBody3D]:
#desc [codeblocks]
#desc [gdscript]
#desc func _process(delta):
#desc if Input.is_action_just_pressed("animate"):
#desc state_machine.travel("Animate")
#desc set_quaternion(get_quaternion() * animation_tree.get_root_motion_rotation())
#desc [/gdscript]
#desc [/codeblocks]
func get_root_motion_rotation() -> Quaternion:
	pass;

#desc Retrieve the blended value of the rotation tracks with the [member root_motion_track] as a [Quaternion] that can be used elsewhere.
#desc This is necessary to apply the root motion position correctly, taking rotation into account. See also [method get_root_motion_position].
#desc Also, this is useful in cases where you want to respect the initial key values of the animation.
#desc For example, if an animation with only one key [code]Quaternion(0, 0, 0, 1)[/code] is played in the previous frame and then an animation with only one key [code]Quaternion(0, 0.707, 0, 0.707)[/code] is played in the next frame, the difference can be calculated as follows:
#desc [codeblocks]
#desc [gdscript]
#desc var prev_root_motion_rotation_accumulator: Quaternion
#desc 
#desc func _process(delta):
#desc if Input.is_action_just_pressed("animate"):
#desc state_machine.travel("Animate")
#desc var current_root_motion_rotation_accumulator: Quaternion = animation_tree.get_root_motion_Quaternion_accumulator()
#desc var difference: Quaternion = prev_root_motion_rotation_accumulator.inverse() * current_root_motion_rotation_accumulator
#desc prev_root_motion_rotation_accumulator = current_root_motion_rotation_accumulator
#desc transform.basis *= difference
#desc [/gdscript]
#desc [/codeblocks]
#desc However, if the animation loops, an unintended discrete change may occur, so this is only useful for some simple use cases.
func get_root_motion_rotation_accumulator() -> Quaternion:
	pass;

#desc Retrieve the motion delta of scale with the [member root_motion_track] as a [Vector3] that can be used elsewhere.
#desc If [member root_motion_track] is not a path to a track of type [constant Animation.TYPE_SCALE_3D], returns [code]Vector3(0, 0, 0)[/code].
#desc See also [member root_motion_track] and [RootMotionView].
#desc The most basic example is applying scale to [CharacterBody3D]:
#desc [codeblocks]
#desc [gdscript]
#desc var current_scale: Vector3 = Vector3(1, 1, 1)
#desc var scale_accum: Vector3 = Vector3(1, 1, 1)
#desc 
#desc func _process(delta):
#desc if Input.is_action_just_pressed("animate"):
#desc current_scale = get_scale()
#desc scale_accum = Vector3(1, 1, 1)
#desc state_machine.travel("Animate")
#desc scale_accum += animation_tree.get_root_motion_scale()
#desc set_scale(current_scale * scale_accum)
#desc [/gdscript]
#desc [/codeblocks]
func get_root_motion_scale() -> Vector3:
	pass;

#desc Retrieve the blended value of the scale tracks with the [member root_motion_track] as a [Vector3] that can be used elsewhere.
#desc For example, if an animation with only one key [code]Vector3(1, 1, 1)[/code] is played in the previous frame and then an animation with only one key [code]Vector3(2, 2, 2)[/code] is played in the next frame, the difference can be calculated as follows:
#desc [codeblocks]
#desc [gdscript]
#desc var prev_root_motion_scale_accumulator: Vector3
#desc 
#desc func _process(delta):
#desc if Input.is_action_just_pressed("animate"):
#desc state_machine.travel("Animate")
#desc var current_root_motion_scale_accumulator: Vector3 = animation_tree.get_root_motion_scale_accumulator()
#desc var difference: Vector3 = current_root_motion_scale_accumulator - prev_root_motion_scale_accumulator
#desc prev_root_motion_scale_accumulator = current_root_motion_scale_accumulator
#desc transform.basis = transform.basis.scaled(difference)
#desc [/gdscript]
#desc [/codeblocks]
#desc However, if the animation loops, an unintended discrete change may occur, so this is only useful for some simple use cases.
func get_root_motion_scale_accumulator() -> Vector3:
	pass;


func is_active() -> bool:
	return active

func set_active(value: bool) -> void:
	active = value

func get_advance_expression_base_node() -> NodePath:
	return advance_expression_base_node

func set_advance_expression_base_node(value: NodePath) -> void:
	advance_expression_base_node = value

func get_animation_player() -> NodePath:
	return anim_player

func set_animation_player(value: NodePath) -> void:
	anim_player = value

func get_audio_max_polyphony() -> int:
	return audio_max_polyphony

func set_audio_max_polyphony(value: int) -> void:
	audio_max_polyphony = value

func get_process_callback() -> int:
	return process_callback

func set_process_callback(value: int) -> void:
	process_callback = value

func get_root_motion_track() -> NodePath:
	return root_motion_track

func set_root_motion_track(value: NodePath) -> void:
	root_motion_track = value

func get_tree_root() -> AnimationNode:
	return tree_root

func set_tree_root(value: AnimationNode) -> void:
	tree_root = value

