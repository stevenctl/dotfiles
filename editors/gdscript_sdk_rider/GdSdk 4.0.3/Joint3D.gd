extends Node3D
#brief Base class for all 3D joints.
#desc Joints are used to bind together two physics bodies. They have a solver priority and can define if the bodies of the two attached nodes should be able to collide with each other. See also [Generic6DOFJoint3D].
#tutorial [3D Truck Town Demo] https://godotengine.org/asset-library/asset/524
class_name Joint3D


#desc If [code]true[/code], the two bodies of the nodes are not able to collide with each other.
var exclude_nodes_from_collision: bool:
	get = get_exclude_nodes_from_collision, set = set_exclude_nodes_from_collision

#desc The node attached to the first side (A) of the joint.
var node_a: NodePath:
	get = get_node_a, set = set_node_a

#desc The node attached to the second side (B) of the joint.
var node_b: NodePath:
	get = get_node_b, set = set_node_b

#desc The priority used to define which solver is executed first for multiple joints. The lower the value, the higher the priority.
var solver_priority: int:
	get = get_solver_priority, set = set_solver_priority




func get_exclude_nodes_from_collision() -> bool:
	return exclude_nodes_from_collision

func set_exclude_nodes_from_collision(value: bool) -> void:
	exclude_nodes_from_collision = value

func get_node_a() -> NodePath:
	return node_a

func set_node_a(value: NodePath) -> void:
	node_a = value

func get_node_b() -> NodePath:
	return node_b

func set_node_b(value: NodePath) -> void:
	node_b = value

func get_solver_priority() -> int:
	return solver_priority

func set_solver_priority(value: int) -> void:
	solver_priority = value

