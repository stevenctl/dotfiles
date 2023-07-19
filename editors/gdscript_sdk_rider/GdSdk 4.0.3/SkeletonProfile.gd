extends Resource
#brief Profile of a virtual skeleton used as a target for retargeting.
#desc This resource is used in [EditorScenePostImport]. Some parameters are referring to bones in [Skeleton3D], [Skin], [Animation], and some other nodes are rewritten based on the parameters of [SkeletonProfile].
#desc [b]Note:[/b] These parameters need to be set only when creating a custom profile. In [SkeletonProfileHumanoid], they are defined internally as read-only values.
#tutorial [Retargeting 3D Skeletons] https://docs.godotengine.org/en/stable/tutorials/assets_pipeline/retargeting_3d_skeletons.html
class_name SkeletonProfile

#desc This signal is emitted when change the value in profile. This is used to update key name in the [BoneMap] and to redraw the [BoneMap] editor.
#desc [b]Note:[/b] This signal is not connected directly to editor to simplify the reference, instead it is passed on to editor through the [BoneMap].
signal profile_updated
#desc Direction to the average coordinates of bone children.
#desc Direction to the coordinates of specified bone child.
#desc Direction is not calculated.

#enum TailDirection
enum {
    TAIL_DIRECTION_AVERAGE_CHILDREN = 0,
    TAIL_DIRECTION_SPECIFIC_CHILD = 1,
    TAIL_DIRECTION_END = 2,
}
#desc The amount of bones in retargeting section's [BoneMap] editor. For example, [SkeletonProfileHumanoid] has 56 bones.
#desc The size of elements in [BoneMap] updates when changing this property in it's assigned [SkeletonProfile].
var bone_size: int:
	get = get_bone_size, set = set_bone_size

#desc The amount of groups of bones in retargeting section's [BoneMap] editor. For example, [SkeletonProfileHumanoid] has 4 groups.
#desc This property exists to separate the bone list into several sections in the editor.
var group_size: int:
	get = get_group_size, set = set_group_size

#desc A bone name that will be used as the root bone in [AnimationTree]. This should be the bone of the parent of hips that exists at the world origin.
var root_bone: StringName:
	get = get_root_bone, set = set_root_bone

#desc A bone name which will use model's height as the coefficient for normalization. For example, [SkeletonProfileHumanoid] defines it as [code]Hips[/code].
var scale_base_bone: StringName:
	get = get_scale_base_bone, set = set_scale_base_bone



#desc Returns the bone index that matches [param bone_name] as its name.
func find_bone(bone_name: StringName) -> int:
	pass;

#desc Returns the name of the bone at [param bone_idx] that will be the key name in the [BoneMap].
#desc In the retargeting process, the returned bone name is the bone name of the target skeleton.
func get_bone_name(bone_idx: int) -> StringName:
	pass;

#desc Returns the name of the bone which is the parent to the bone at [param bone_idx]. The result is empty if the bone has no parent.
func get_bone_parent(bone_idx: int) -> StringName:
	pass;

#desc Returns the name of the bone which is the tail of the bone at [param bone_idx].
func get_bone_tail(bone_idx: int) -> StringName:
	pass;

#desc Returns the group of the bone at [param bone_idx].
func get_group(bone_idx: int) -> StringName:
	pass;

#desc Returns the name of the group at [param group_idx] that will be the drawing group in the [BoneMap] editor.
func get_group_name(group_idx: int) -> StringName:
	pass;

#desc Returns the offset of the bone at [param bone_idx] that will be the button position in the [BoneMap] editor.
#desc This is the offset with origin at the top left corner of the square.
func get_handle_offset(bone_idx: int) -> Vector2:
	pass;

#desc Returns the reference pose transform for bone [param bone_idx].
func get_reference_pose(bone_idx: int) -> Transform3D:
	pass;

#desc Returns the tail direction of the bone at [param bone_idx].
func get_tail_direction(bone_idx: int) -> int:
	pass;

#desc Returns the texture of the group at [param group_idx] that will be the drawing group background image in the [BoneMap] editor.
func get_texture(group_idx: int) -> Texture2D:
	pass;

#desc Sets the name of the bone at [param bone_idx] that will be the key name in the [BoneMap].
#desc In the retargeting process, the setting bone name is the bone name of the target skeleton.
func set_bone_name(bone_idx: int, bone_name: StringName) -> void:
	pass;

#desc Sets the bone with name [param bone_parent] as the parent of the bone at [param bone_idx]. If an empty string is passed, then the bone has no parent.
func set_bone_parent(bone_idx: int, bone_parent: StringName) -> void:
	pass;

#desc Sets the bone with name [param bone_tail] as the tail of the bone at [param bone_idx].
func set_bone_tail(bone_idx: int, bone_tail: StringName) -> void:
	pass;

#desc Sets the group of the bone at [param bone_idx].
func set_group(bone_idx: int, group: StringName) -> void:
	pass;

#desc Sets the name of the group at [param group_idx] that will be the drawing group in the [BoneMap] editor.
func set_group_name(group_idx: int, group_name: StringName) -> void:
	pass;

#desc Sets the offset of the bone at [param bone_idx] that will be the button position in the [BoneMap] editor.
#desc This is the offset with origin at the top left corner of the square.
func set_handle_offset(bone_idx: int, handle_offset: Vector2) -> void:
	pass;

#desc Sets the reference pose transform for bone [param bone_idx].
func set_reference_pose(bone_idx: int, bone_name: Transform3D) -> void:
	pass;

#desc Sets the tail direction of the bone at [param bone_idx].
#desc [b]Note:[/b] This only specifies the method of calculation. The actual coordinates required should be stored in an external skeleton, so the calculation itself needs to be done externally.
func set_tail_direction(bone_idx: int, tail_direction: int) -> void:
	pass;

#desc Sets the texture of the group at [param group_idx] that will be the drawing group background image in the [BoneMap] editor.
func set_texture(group_idx: int, texture: Texture2D) -> void:
	pass;


func get_bone_size() -> int:
	return bone_size

func set_bone_size(value: int) -> void:
	bone_size = value

func get_group_size() -> int:
	return group_size

func set_group_size(value: int) -> void:
	group_size = value

func get_root_bone() -> StringName:
	return root_bone

func set_root_bone(value: StringName) -> void:
	root_bone = value

func get_scale_base_bone() -> StringName:
	return scale_base_bone

func set_scale_base_bone(value: StringName) -> void:
	scale_base_bone = value

