extends Node2D
#brief Base node for all joint constraints in 2D physics.
#desc Base node for all joint constraints in 2D physics. Joints take 2 bodies and apply a custom constraint.
class_name Joint2D


#desc When [member node_a] and [member node_b] move in different directions the [code]bias[/code] controls how fast the joint pulls them back to their original position. The lower the [code]bias[/code] the more the two bodies can pull on the joint.
#desc When set to [code]0[/code], the default value from [member ProjectSettings.physics/2d/solver/default_constraint_bias] is used.
var bias: float:
	get = get_bias, set = set_bias

#desc If [code]true[/code], [member node_a] and [member node_b] can not collide.
var disable_collision: bool:
	get = get_exclude_nodes_from_collision, set = set_exclude_nodes_from_collision

#desc The first body attached to the joint. Must derive from [PhysicsBody2D].
var node_a: NodePath:
	get = get_node_a, set = set_node_a

#desc The second body attached to the joint. Must derive from [PhysicsBody2D].
var node_b: NodePath:
	get = get_node_b, set = set_node_b




func get_bias() -> float:
	return bias

func set_bias(value: float) -> void:
	bias = value

func get_exclude_nodes_from_collision() -> bool:
	return disable_collision

func set_exclude_nodes_from_collision(value: bool) -> void:
	disable_collision = value

func get_node_a() -> NodePath:
	return node_a

func set_node_a(value: NodePath) -> void:
	node_a = value

func get_node_b() -> NodePath:
	return node_b

func set_node_b(value: NodePath) -> void:
	node_b = value

