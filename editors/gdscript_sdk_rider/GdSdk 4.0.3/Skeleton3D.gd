extends Node3D
#brief Skeleton for characters and animated objects.
#desc Skeleton3D provides a hierarchical interface for managing bones, including pose, rest and animation (see [Animation]). It can also use ragdoll physics.
#desc The overall transform of a bone with respect to the skeleton is determined by the following hierarchical order: rest pose, custom pose and pose.
#desc Note that "global pose" below refers to the overall transform of the bone with respect to skeleton, so it not the actual global/world transform of the bone.
#desc To setup different types of inverse kinematics, consider using [SkeletonIK3D], or add a custom IK implementation in [method Node._process] as a child node.
#tutorial [3D Inverse Kinematics Demo] https://godotengine.org/asset-library/asset/523
#tutorial [Third Person Shooter Demo] https://godotengine.org/asset-library/asset/678
class_name Skeleton3D

signal bone_enabled_changed(bone_idx: int)
#desc This signal is emitted when one of the bones in the Skeleton3D node have changed their pose. This is used to inform nodes that rely on bone positions that one of the bones in the Skeleton3D have changed their transform/pose.
signal bone_pose_changed(bone_idx: int)
signal pose_updated
signal show_rest_only_changed
const NOTIFICATION_UPDATE_SKELETON = 50;


var animate_physical_bones: bool:
	get = get_animate_physical_bones, set = set_animate_physical_bones

#desc Multiplies the position 3D track animation.
#desc [b]Note:[/b] Unless this value is [code]1.0[/code], the key value in animation will not match the actual position value.
var motion_scale: float:
	get = get_motion_scale, set = set_motion_scale

var show_rest_only: bool:
	get = is_show_rest_only, set = set_show_rest_only



#desc Adds a bone, with name [param name]. [method get_bone_count] will become the bone index.
func add_bone(name: String) -> void:
	pass;

#desc Clear all the bones in this skeleton.
func clear_bones() -> void:
	pass;

#desc Removes the global pose override on all bones in the skeleton.
func clear_bones_global_pose_override() -> void:
	pass;

func create_skin_from_rest_transforms() -> Skin:
	pass;

#desc Returns the bone index that matches [param name] as its name.
func find_bone(name: String) -> int:
	pass;

#desc Force updates the bone transforms/poses for all bones in the skeleton.
func force_update_all_bone_transforms() -> void:
	pass;

#desc Force updates the bone transform for the bone at [param bone_idx] and all of its children.
func force_update_bone_child_transform(bone_idx: int) -> void:
	pass;

#desc Returns an array containing the bone indexes of all the children node of the passed in bone, [param bone_idx].
func get_bone_children(bone_idx: int) -> PackedInt32Array:
	pass;

#desc Returns the number of bones in the skeleton.
func get_bone_count() -> int:
	pass;

#desc Returns the overall transform of the specified bone, with respect to the skeleton. Being relative to the skeleton frame, this is not the actual "global" transform of the bone.
func get_bone_global_pose(bone_idx: int) -> Transform3D:
	pass;

#desc Returns the overall transform of the specified bone, with respect to the skeleton, but without any global pose overrides. Being relative to the skeleton frame, this is not the actual "global" transform of the bone.
func get_bone_global_pose_no_override(bone_idx: int) -> Transform3D:
	pass;

#desc Returns the global pose override transform for [param bone_idx].
func get_bone_global_pose_override(bone_idx: int) -> Transform3D:
	pass;

#desc Returns the global rest transform for [param bone_idx].
func get_bone_global_rest(bone_idx: int) -> Transform3D:
	pass;

#desc Returns the name of the bone at index [param bone_idx].
func get_bone_name(bone_idx: int) -> String:
	pass;

#desc Returns the bone index which is the parent of the bone at [param bone_idx]. If -1, then bone has no parent.
#desc [b]Note:[/b] The parent bone returned will always be less than [param bone_idx].
func get_bone_parent(bone_idx: int) -> int:
	pass;

#desc Returns the pose transform of the specified bone. Pose is applied on top of the custom pose, which is applied on top the rest pose.
func get_bone_pose(bone_idx: int) -> Transform3D:
	pass;

func get_bone_pose_position(bone_idx: int) -> Vector3:
	pass;

func get_bone_pose_rotation(bone_idx: int) -> Quaternion:
	pass;

func get_bone_pose_scale(bone_idx: int) -> Vector3:
	pass;

#desc Returns the rest transform for a bone [param bone_idx].
func get_bone_rest(bone_idx: int) -> Transform3D:
	pass;

#desc Returns an array with all of the bones that are parentless. Another way to look at this is that it returns the indexes of all the bones that are not dependent or modified by other bones in the Skeleton.
func get_parentless_bones() -> PackedInt32Array:
	pass;

#desc Returns the number of times the bone hierarchy has changed within this skeleton, including renames.
#desc The Skeleton version is not serialized: only use within a single instance of Skeleton3D.
#desc Use for invalidating caches in IK solvers and other nodes which process bones.
func get_version() -> int:
	pass;

#desc Returns whether the bone pose for the bone at [param bone_idx] is enabled.
func is_bone_enabled(bone_idx: int) -> bool:
	pass;

#desc Returns all bones in the skeleton to their rest poses.
func localize_rests() -> void:
	pass;

#desc Adds a collision exception to the physical bone.
#desc Works just like the [RigidBody3D] node.
func physical_bones_add_collision_exception(exception: RID) -> void:
	pass;

#desc Removes a collision exception to the physical bone.
#desc Works just like the [RigidBody3D] node.
func physical_bones_remove_collision_exception(exception: RID) -> void:
	pass;

#desc Tells the [PhysicalBone3D] nodes in the Skeleton to start simulating and reacting to the physics world.
#desc Optionally, a list of bone names can be passed-in, allowing only the passed-in bones to be simulated.
func physical_bones_start_simulation(bones: StringName[] = []) -> void:
	pass;

#desc Tells the [PhysicalBone3D] nodes in the Skeleton to stop simulating.
func physical_bones_stop_simulation() -> void:
	pass;

#desc Binds the given Skin to the Skeleton.
func register_skin(skin: Skin) -> SkinReference:
	pass;

#desc Sets the bone pose to rest for [param bone_idx].
func reset_bone_pose(bone_idx: int) -> void:
	pass;

#desc Sets all bone poses to rests.
func reset_bone_poses() -> void:
	pass;

#desc Disables the pose for the bone at [param bone_idx] if [code]false[/code], enables the bone pose if [code]true[/code].
func set_bone_enabled(bone_idx: int, enabled: bool = true) -> void:
	pass;

#desc Sets the global pose transform, [param pose], for the bone at [param bone_idx].
#desc [param amount] is the interpolation strength that will be used when applying the pose, and [param persistent] determines if the applied pose will remain.
#desc [b]Note:[/b] The pose transform needs to be a global pose! To convert a world transform from a [Node3D] to a global bone pose, multiply the [method Transform3D.affine_inverse] of the node's [member Node3D.global_transform] by the desired world transform.
func set_bone_global_pose_override(bone_idx: int, pose: Transform3D, amount: float, persistent: bool = false) -> void:
	pass;

func set_bone_name(bone_idx: int, name: String) -> void:
	pass;

#desc Sets the bone index [param parent_idx] as the parent of the bone at [param bone_idx]. If -1, then bone has no parent.
#desc [b]Note:[/b] [param parent_idx] must be less than [param bone_idx].
func set_bone_parent(bone_idx: int, parent_idx: int) -> void:
	pass;

func set_bone_pose_position(bone_idx: int, position: Vector3) -> void:
	pass;

func set_bone_pose_rotation(bone_idx: int, rotation: Quaternion) -> void:
	pass;

func set_bone_pose_scale(bone_idx: int, scale: Vector3) -> void:
	pass;

#desc Sets the rest transform for bone [param bone_idx].
func set_bone_rest(bone_idx: int, rest: Transform3D) -> void:
	pass;

#desc Unparents the bone at [param bone_idx] and sets its rest position to that of its parent prior to being reset.
func unparent_bone_and_rest(bone_idx: int) -> void:
	pass;


func get_animate_physical_bones() -> bool:
	return animate_physical_bones

func set_animate_physical_bones(value: bool) -> void:
	animate_physical_bones = value

func get_motion_scale() -> float:
	return motion_scale

func set_motion_scale(value: float) -> void:
	motion_scale = value

func is_show_rest_only() -> bool:
	return show_rest_only

func set_show_rest_only(value: bool) -> void:
	show_rest_only = value

