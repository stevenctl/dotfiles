extends Node3D
#brief Node supporting finger tracking in OpenXR.
#desc This node enables OpenXR's hand tracking functionality. The node should be a child node of an [XROrigin3D] node, tracking will update its position to where the player's actual hand is positioned. This node also updates the skeleton of a properly skinned hand model. The hand mesh should be a child node of this node.
class_name OpenXRHand

#desc Tracking the player's left hand.
#desc Tracking the player's right hand.
#desc Maximum supported hands.
#desc When player grips, hand skeleton will form a full fist.
#desc When player grips, hand skeleton conforms to the controller the player is holding.
#desc Maximum supported motion ranges.

#enum Hands
enum {
    HAND_LEFT = 0,
    HAND_RIGHT = 1,
    HAND_MAX = 2,
}
#enum MotionRange
enum {
    MOTION_RANGE_UNOBSTRUCTED = 0,
    MOTION_RANGE_CONFORM_TO_CONTROLLER = 1,
    MOTION_RANGE_MAX = 2,
}
#desc Specifies whether this node tracks the left or right hand of the player.
var hand: int:
	get = get_hand, set = set_hand

#desc Set a [Skeleton3D] node for which the pose positions will be updated.
var hand_skeleton: NodePath:
	get = get_hand_skeleton, set = set_hand_skeleton

#desc Set the motion range (if supported) limiting the hand motion.
var motion_range: int:
	get = get_motion_range, set = set_motion_range




func get_hand() -> int:
	return hand

func set_hand(value: int) -> void:
	hand = value

func get_hand_skeleton() -> NodePath:
	return hand_skeleton

func set_hand_skeleton(value: NodePath) -> void:
	hand_skeleton = value

func get_motion_range() -> int:
	return motion_range

func set_motion_range(value: int) -> void:
	motion_range = value

