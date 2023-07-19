extends RigidBody2D
#brief A 2D node that can be used for physically aware bones in 2D.
#desc The [code]PhysicalBone2D[/code] node is a [RigidBody2D]-based node that can be used to make [Bone2D] nodes in a [Skeleton2D] react to physics. This node is very similar to the [PhysicalBone3D] node, just for 2D instead of 3D.
#desc [b]Note:[/b] To have the Bone2D nodes visually follow the [code]PhysicalBone2D[/code] node, use a [SkeletonModification2DPhysicalBones] modification on the [Skeleton2D] node with the [Bone2D] nodes.
#desc [b]Note:[/b] The PhysicalBone2D node does not automatically create a [Joint2D] node to keep [code]PhysicalBone2D[/code] nodes together. You will need to create these manually. For most cases, you want to use a [PinJoint2D] node. The [code]PhysicalBone2D[/code] node can automatically configure the [Joint2D] node once it's been created as a child node.
class_name PhysicalBone2D


#desc If [code]true[/code], the [code]PhysicalBone2D[/code] node will automatically configure the first [Joint2D] child node. The automatic configuration is limited to setting up the node properties and positioning the [Joint2D].
var auto_configure_joint: bool:
	get = get_auto_configure_joint, set = set_auto_configure_joint

#desc The index of the [Bone2D] node that this [code]PhysicalBone2D[/code] node is supposed to be simulating.
var bone2d_index: int:
	get = get_bone2d_index, set = set_bone2d_index

#desc The [NodePath] to the [Bone2D] node that this [code]PhysicalBone2D[/code] node is supposed to be simulating.
var bone2d_nodepath: NodePath:
	get = get_bone2d_nodepath, set = set_bone2d_nodepath

#desc If [code]true[/code], the [code]PhysicalBone2D[/code] will keep the transform of the bone it is bound to when simulating physics.
var follow_bone_when_simulating: bool:
	get = get_follow_bone_when_simulating, set = set_follow_bone_when_simulating

#desc If [code]true[/code], the [code]PhysicalBone2D[/code] will start simulating using physics. If [code]false[/code], the [code]PhysicalBone2D[/code] will follow the transform of the [Bone2D] node.
#desc [b]Note:[/b] To have the Bone2D nodes visually follow the [code]PhysicalBone2D[/code] node, use a [SkeletonModification2DPhysicalBones] modification on the [Skeleton2D] node with the [Bone2D] nodes.
var simulate_physics: bool:
	get = get_simulate_physics, set = set_simulate_physics



#desc Returns the first [Joint2D] child node, if one exists. This is mainly a helper function to make it easier to get the [Joint2D] that the [code]PhysicalBone2D[/code] is autoconfiguring.
func get_joint() -> Joint2D:
	pass;

#desc Returns a boolean that indicates whether the [code]PhysicalBone2D[/code] node is running and simulating using the Godot 2D physics engine. When [code]true[/code], the PhysicalBone2D node is using physics.
func is_simulating_physics() -> bool:
	pass;


func get_auto_configure_joint() -> bool:
	return auto_configure_joint

func set_auto_configure_joint(value: bool) -> void:
	auto_configure_joint = value

func get_bone2d_index() -> int:
	return bone2d_index

func set_bone2d_index(value: int) -> void:
	bone2d_index = value

func get_bone2d_nodepath() -> NodePath:
	return bone2d_nodepath

func set_bone2d_nodepath(value: NodePath) -> void:
	bone2d_nodepath = value

func get_follow_bone_when_simulating() -> bool:
	return follow_bone_when_simulating

func set_follow_bone_when_simulating(value: bool) -> void:
	follow_bone_when_simulating = value

func get_simulate_physics() -> bool:
	return simulate_physics

func set_simulate_physics(value: bool) -> void:
	simulate_physics = value

