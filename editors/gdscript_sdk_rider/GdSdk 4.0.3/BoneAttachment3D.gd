extends Node3D
#brief A node that will attach to a bone.
#desc This node will allow you to select a bone for this node to attach to. The BoneAttachment3D node can copy the transform of the select bone, or can override the transform of the selected bone.
#desc The BoneAttachment3D node must either be a child of a [Skeleton3D] node or be given an external [Skeleton3D] to use in order to function properly.
class_name BoneAttachment3D


#desc The index of the attached bone.
var bone_idx: int:
	get = get_bone_idx, set = set_bone_idx

#desc The name of the attached bone.
var bone_name: String:
	get = get_bone_name, set = set_bone_name

#desc Whether the BoneAttachment3D node will override the bone pose of the bone it is attached to. When set to [code]true[/code], the BoneAttachment3D node can change the pose of the bone. When set to [code]false[/code], the BoneAttachment3D will always be set to the bone's transform.
var override_pose: bool:
	get = get_override_pose, set = set_override_pose



#desc Returns the [NodePath] to the external [Skeleton3D] node, if one has been set.
func get_external_skeleton() -> NodePath:
	pass;

#desc Returns whether the BoneAttachment3D node is using an external [Skeleton3D] rather than attempting to use its parent node as the [Skeleton3D].
func get_use_external_skeleton() -> bool:
	pass;

#desc A function that is called automatically when the [Skeleton3D] the BoneAttachment3D node is using has a bone that has changed its pose. This function is where the BoneAttachment3D node updates its position so it is correctly bound when it is [i]not[/i] set to override the bone pose.
func on_bone_pose_update(bone_index: int) -> void:
	pass;

#desc Sets the [NodePath] to the external skeleton that the BoneAttachment3D node should use. See [method set_use_external_skeleton] to enable the external [Skeleton3D] node.
func set_external_skeleton(external_skeleton: NodePath) -> void:
	pass;

#desc Sets whether the BoneAttachment3D node will use an extenral [Skeleton3D] node rather than attenpting to use its parent node as the [Skeleton3D]. When set to [code]true[/code], the BoneAttachment3D node will use the external [Skeleton3D] node set in [method set_external_skeleton].
func set_use_external_skeleton(use_external_skeleton: bool) -> void:
	pass;


func get_bone_idx() -> int:
	return bone_idx

func set_bone_idx(value: int) -> void:
	bone_idx = value

func get_bone_name() -> String:
	return bone_name

func set_bone_name(value: String) -> void:
	bone_name = value

func get_override_pose() -> bool:
	return override_pose

func set_override_pose(value: bool) -> void:
	override_pose = value

