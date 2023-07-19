extends Node
#brief SkeletonIK3D is used to place the end bone of a [Skeleton3D] bone chain at a certain point in 3D by rotating all bones in the chain accordingly.
#desc SkeletonIK3D is used to place the end bone of a [Skeleton3D] bone chain at a certain point in 3D by rotating all bones in the chain accordingly. A typical scenario for IK in games is to place a characters feet on the ground or a characters hands on a currently hold object. SkeletonIK uses FabrikInverseKinematic internally to solve the bone chain and applies the results to the [Skeleton3D] [code]bones_global_pose_override[/code] property for all affected bones in the chain. If fully applied this overwrites any bone transform from [Animation]s or bone custom poses set by users. The applied amount can be controlled with the [code]interpolation[/code] property.
#desc [codeblock]
#desc # Apply IK effect automatically on every new frame (not the current)
#desc skeleton_ik_node.start()
#desc 
#desc # Apply IK effect only on the current frame
#desc skeleton_ik_node.start(true)
#desc 
#desc # Stop IK effect and reset bones_global_pose_override on Skeleton
#desc skeleton_ik_node.stop()
#desc 
#desc # Apply full IK effect
#desc skeleton_ik_node.set_interpolation(1.0)
#desc 
#desc # Apply half IK effect
#desc skeleton_ik_node.set_interpolation(0.5)
#desc 
#desc # Apply zero IK effect (a value at or below 0.01 also removes bones_global_pose_override on Skeleton)
#desc skeleton_ik_node.set_interpolation(0.0)
#desc [/codeblock]
#tutorial [3D Inverse Kinematics Demo] https://godotengine.org/asset-library/asset/523
class_name SkeletonIK3D


#desc Interpolation value for how much the IK results are applied to the current skeleton bone chain. A value of [code]1.0[/code] will overwrite all skeleton bone transforms completely while a value of [code]0.0[/code] will visually disable the SkeletonIK. A value at or below [code]0.01[/code] also calls [method Skeleton3D.clear_bones_global_pose_override].
var interpolation: float:
	get = get_interpolation, set = set_interpolation

#desc Secondary target position (first is [member target] property or [member target_node]) for the IK chain. Use magnet position (pole target) to control the bending of the IK chain. Only works if the bone chain has more than 2 bones. The middle chain bone position will be linearly interpolated with the magnet position.
var magnet: Vector3:
	get = get_magnet_position, set = set_magnet_position

#desc Number of iteration loops used by the IK solver to produce more accurate (and elegant) bone chain results.
var max_iterations: int:
	get = get_max_iterations, set = set_max_iterations

#desc The minimum distance between bone and goal target. If the distance is below this value, the IK solver stops further iterations.
var min_distance: float:
	get = get_min_distance, set = set_min_distance

#desc If [code]true[/code] overwrites the rotation of the tip bone with the rotation of the [member target] (or [member target_node] if defined).
var override_tip_basis: bool:
	get = is_override_tip_basis, set = set_override_tip_basis

#desc The name of the current root bone, the first bone in the IK chain.
var root_bone: StringName:
	get = get_root_bone, set = set_root_bone

#desc First target of the IK chain where the tip bone is placed and, if [member override_tip_basis] is [code]true[/code], how the tip bone is rotated. If a [member target_node] path is available the nodes transform is used instead and this property is ignored.
var target: Transform3D:
	get = get_target_transform, set = set_target_transform

#desc Target node [NodePath] for the IK chain. If available, the node's current [Transform3D] is used instead of the [member target] property.
var target_node: NodePath:
	get = get_target_node, set = set_target_node

#desc The name of the current tip bone, the last bone in the IK chain placed at the [member target] transform (or [member target_node] if defined).
var tip_bone: StringName:
	get = get_tip_bone, set = set_tip_bone

#desc If [code]true[/code], instructs the IK solver to consider the secondary magnet target (pole target) when calculating the bone chain. Use the magnet position (pole target) to control the bending of the IK chain.
var use_magnet: bool:
	get = is_using_magnet, set = set_use_magnet



#desc Returns the parent [Skeleton3D] Node that was present when SkeletonIK entered the [SceneTree]. Returns null if the parent node was not a [Skeleton3D] Node when SkeletonIK3D entered the [SceneTree].
func get_parent_skeleton() -> Skeleton3D:
	pass;

#desc Returns [code]true[/code] if SkeletonIK is applying IK effects on continues frames to the [Skeleton3D] bones. Returns [code]false[/code] if SkeletonIK is stopped or [method start] was used with the [code]one_time[/code] parameter set to [code]true[/code].
func is_running() -> bool:
	pass;

#desc Starts applying IK effects on each frame to the [Skeleton3D] bones but will only take effect starting on the next frame. If [code]one_time[/code] is [code]true[/code], this will take effect immediately but also reset on the next frame.
func start(one_time: bool = false) -> void:
	pass;

#desc Stops applying IK effects on each frame to the [Skeleton3D] bones and also calls [method Skeleton3D.clear_bones_global_pose_override] to remove existing overrides on all bones.
func stop() -> void:
	pass;


func get_interpolation() -> float:
	return interpolation

func set_interpolation(value: float) -> void:
	interpolation = value

func get_magnet_position() -> Vector3:
	return magnet

func set_magnet_position(value: Vector3) -> void:
	magnet = value

func get_max_iterations() -> int:
	return max_iterations

func set_max_iterations(value: int) -> void:
	max_iterations = value

func get_min_distance() -> float:
	return min_distance

func set_min_distance(value: float) -> void:
	min_distance = value

func is_override_tip_basis() -> bool:
	return override_tip_basis

func set_override_tip_basis(value: bool) -> void:
	override_tip_basis = value

func get_root_bone() -> StringName:
	return root_bone

func set_root_bone(value: StringName) -> void:
	root_bone = value

func get_target_transform() -> Transform3D:
	return target

func set_target_transform(value: Transform3D) -> void:
	target = value

func get_target_node() -> NodePath:
	return target_node

func set_target_node(value: NodePath) -> void:
	target_node = value

func get_tip_bone() -> StringName:
	return tip_bone

func set_tip_bone(value: StringName) -> void:
	tip_bone = value

func is_using_magnet() -> bool:
	return use_magnet

func set_use_magnet(value: bool) -> void:
	use_magnet = value

