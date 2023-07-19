extends Resource
#brief Base class for all 3D shape resources.
#desc Base class for all 3D shape resources. Nodes that inherit from this can be used as shapes for a [PhysicsBody3D] or [Area3D] objects.
#tutorial [Physics introduction] https://docs.godotengine.org/en/stable/tutorials/physics/physics_introduction.html
class_name Shape3D


#desc The shape's custom solver bias. Defines how much bodies react to enforce contact separation when this shape is involved.
#desc When set to [code]0[/code], the default value from [member ProjectSettings.physics/3d/solver/default_contact_bias] is used.
var custom_solver_bias: float:
	get = get_custom_solver_bias, set = set_custom_solver_bias

#desc The collision margin for the shape. This is not used in Godot Physics.
#desc Collision margins allow collision detection to be more efficient by adding an extra shell around shapes. Collision algorithms are more expensive when objects overlap by more than their margin, so a higher value for margins is better for performance, at the cost of accuracy around edges as it makes them less sharp.
var margin: float:
	get = get_margin, set = set_margin



#desc Returns the [ArrayMesh] used to draw the debug collision for this [Shape3D].
func get_debug_mesh() -> ArrayMesh:
	pass;


func get_custom_solver_bias() -> float:
	return custom_solver_bias

func set_custom_solver_bias(value: float) -> void:
	custom_solver_bias = value

func get_margin() -> float:
	return margin

func set_margin(value: float) -> void:
	margin = value

