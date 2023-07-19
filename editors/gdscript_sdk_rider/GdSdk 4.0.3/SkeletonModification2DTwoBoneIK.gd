extends SkeletonModification2D
#brief A modification that rotates two bones using the law of cosigns to reach the target.
#desc This [SkeletonModification2D] uses an algorithm typically called TwoBoneIK. This algorithm works by leveraging the law of cosigns and the lengths of the bones to figure out what rotation the bones currently have, and what rotation they need to make a complete triangle, where the first bone, the second bone, and the target form the three vertices of the triangle. Because the algorithm works by making a triangle, it can only operate on two bones.
#desc TwoBoneIK is great for arms, legs, and really any joints that can be represented by just two bones that bend to reach a target. This solver is more lightweight than [SkeletonModification2DFABRIK], but gives similar, natural looking results.
class_name SkeletonModification2DTwoBoneIK


#desc If [code]true[/code], the bones in the modification will blend outward as opposed to inwards when contracting. If [code]false[/code], the bones will bend inwards when contracting.
var flip_bend_direction: bool:
	get = get_flip_bend_direction, set = set_flip_bend_direction

#desc The maximum distance the target can be at. If the target is farther than this distance, the modification will solve as if it's at this maximum distance. When set to [code]0[/code], the modification will solve without distance constraints.
var target_maximum_distance: float:
	get = get_target_maximum_distance, set = set_target_maximum_distance

#desc The minimum distance the target can be at. If the target is closer than this distance, the modification will solve as if it's at this minimum distance. When set to [code]0[/code], the modification will solve without distance constraints.
var target_minimum_distance: float:
	get = get_target_minimum_distance, set = set_target_minimum_distance

#desc The NodePath to the node that is the target for the TwoBoneIK modification. This node is what the modification will use when bending the [Bone2D] nodes.
var target_nodepath: NodePath:
	get = get_target_node, set = set_target_node



#desc Returns the [Bone2D] node that is being used as the first bone in the TwoBoneIK modification.
func get_joint_one_bone2d_node() -> NodePath:
	pass;

#desc Returns the index of the [Bone2D] node that is being used as the first bone in the TwoBoneIK modification.
func get_joint_one_bone_idx() -> int:
	pass;

#desc Returns the [Bone2D] node that is being used as the second bone in the TwoBoneIK modification.
func get_joint_two_bone2d_node() -> NodePath:
	pass;

#desc Returns the index of the [Bone2D] node that is being used as the second bone in the TwoBoneIK modification.
func get_joint_two_bone_idx() -> int:
	pass;

#desc Sets the [Bone2D] node that is being used as the first bone in the TwoBoneIK modification.
func set_joint_one_bone2d_node(bone2d_node: NodePath) -> void:
	pass;

#desc Sets the index of the [Bone2D] node that is being used as the first bone in the TwoBoneIK modification.
func set_joint_one_bone_idx(bone_idx: int) -> void:
	pass;

#desc Sets the [Bone2D] node that is being used as the second bone in the TwoBoneIK modification.
func set_joint_two_bone2d_node(bone2d_node: NodePath) -> void:
	pass;

#desc Sets the index of the [Bone2D] node that is being used as the second bone in the TwoBoneIK modification.
func set_joint_two_bone_idx(bone_idx: int) -> void:
	pass;


func get_flip_bend_direction() -> bool:
	return flip_bend_direction

func set_flip_bend_direction(value: bool) -> void:
	flip_bend_direction = value

func get_target_maximum_distance() -> float:
	return target_maximum_distance

func set_target_maximum_distance(value: float) -> void:
	target_maximum_distance = value

func get_target_minimum_distance() -> float:
	return target_minimum_distance

func set_target_minimum_distance(value: float) -> void:
	target_minimum_distance = value

func get_target_node() -> NodePath:
	return target_nodepath

func set_target_node(value: NodePath) -> void:
	target_nodepath = value

