extends AnimationRootNode
#brief Input animation to use in an [AnimationNodeBlendTree].
#desc A resource to add to an [AnimationNodeBlendTree]. Only features one output set using the [member animation] property. Use it as an input for [AnimationNode] that blend animations together.
#tutorial [AnimationTree] https://docs.godotengine.org/en/stable/tutorials/animation/animation_tree.html
#tutorial [3D Platformer Demo] https://godotengine.org/asset-library/asset/125
#tutorial [Third Person Shooter Demo] https://godotengine.org/asset-library/asset/678
class_name AnimationNodeAnimation

#desc Plays animation in forward direction.
#desc Plays animation in backward direction.

#enum PlayMode
enum {
    PLAY_MODE_FORWARD = 0,
    PLAY_MODE_BACKWARD = 1,
}
#desc Animation to use as an output. It is one of the animations provided by [member AnimationTree.anim_player].
var animation: StringName:
	get = get_animation, set = set_animation

#desc Determines the playback direction of the animation.
var play_mode: int:
	get = get_play_mode, set = set_play_mode




func get_animation() -> StringName:
	return animation

func set_animation(value: StringName) -> void:
	animation = value

func get_play_mode() -> int:
	return play_mode

func set_play_mode(value: int) -> void:
	play_mode = value

