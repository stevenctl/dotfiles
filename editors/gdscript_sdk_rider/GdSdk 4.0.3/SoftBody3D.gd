extends MeshInstance3D
#brief A soft mesh physics body.
#desc A deformable physics body. Used to create elastic or deformable objects such as cloth, rubber, or other flexible materials.
#desc [b]Note:[/b] There are many known bugs in [SoftBody3D]. Therefore, it's not recommended to use them for things that can affect gameplay (such as a player character made entirely out of soft bodies).
#tutorial [SoftBody] https://docs.godotengine.org/en/stable/tutorials/physics/soft_body.html
class_name SoftBody3D

#desc When [member Node.process_mode] is set to [constant Node.PROCESS_MODE_DISABLED], remove from the physics simulation to stop all physics interactions with this [SoftBody3D].
#desc Automatically re-added to the physics simulation when the [Node] is processed again.
#desc When [member Node.process_mode] is set to [constant Node.PROCESS_MODE_DISABLED], do not affect the physics simulation.

#enum DisableMode
enum {
    DISABLE_MODE_REMOVE = 0,
    DISABLE_MODE_KEEP_ACTIVE = 1,
}
#desc The physics layers this SoftBody3D [b]is in[/b]. Collision objects can exist in one or more of 32 different layers. See also [member collision_mask].
#desc [b]Note:[/b] Object A can detect a contact with object B only if object B is in any of the layers that object A scans. See [url=$DOCS_URL/tutorials/physics/physics_introduction.html#collision-layers-and-masks]Collision layers and masks[/url] in the documentation for more information.
var collision_layer: int:
	get = get_collision_layer, set = set_collision_layer

#desc The physics layers this SoftBody3D [b]scans[/b]. Collision objects can scan one or more of 32 different layers. See also [member collision_layer].
#desc [b]Note:[/b] Object A can detect a contact with object B only if object B is in any of the layers that object A scans. See [url=$DOCS_URL/tutorials/physics/physics_introduction.html#collision-layers-and-masks]Collision layers and masks[/url] in the documentation for more information.
var collision_mask: int:
	get = get_collision_mask, set = set_collision_mask

var damping_coefficient: float:
	get = get_damping_coefficient, set = set_damping_coefficient

#desc Defines the behavior in physics when [member Node.process_mode] is set to [constant Node.PROCESS_MODE_DISABLED]. See [enum DisableMode] for more details about the different modes.
var disable_mode: int:
	get = get_disable_mode, set = set_disable_mode

var drag_coefficient: float:
	get = get_drag_coefficient, set = set_drag_coefficient

var linear_stiffness: float:
	get = get_linear_stiffness, set = set_linear_stiffness

#desc [NodePath] to a [CollisionObject3D] this SoftBody3D should avoid clipping.
var parent_collision_ignore: NodePath:
	get = get_parent_collision_ignore, set = set_parent_collision_ignore

var pressure_coefficient: float:
	get = get_pressure_coefficient, set = set_pressure_coefficient

#desc If [code]true[/code], the [SoftBody3D] will respond to [RayCast3D]s.
var ray_pickable: bool:
	get = is_ray_pickable, set = set_ray_pickable

#desc Increasing this value will improve the resulting simulation, but can affect performance. Use with care.
var simulation_precision: int:
	get = get_simulation_precision, set = set_simulation_precision

#desc The SoftBody3D's mass.
var total_mass: float:
	get = get_total_mass, set = set_total_mass



#desc Adds a body to the list of bodies that this body can't collide with.
func add_collision_exception_with(body: Node) -> void:
	pass;

#desc Returns an array of nodes that were added as collision exceptions for this body.
func get_collision_exceptions() -> Array[PhysicsBody3D]:
	pass;

#desc Returns whether or not the specified layer of the [member collision_layer] is enabled, given a [param layer_number] between 1 and 32.
func get_collision_layer_value(layer_number: int) -> bool:
	pass;

#desc Returns whether or not the specified layer of the [member collision_mask] is enabled, given a [param layer_number] between 1 and 32.
func get_collision_mask_value(layer_number: int) -> bool:
	pass;

func get_physics_rid() -> RID:
	pass;

#desc Returns local translation of a vertex in the surface array.
func get_point_transform(point_index: int) -> Vector3:
	pass;

#desc Returns [code]true[/code] if vertex is set to pinned.
func is_point_pinned(point_index: int) -> bool:
	pass;

#desc Removes a body from the list of bodies that this body can't collide with.
func remove_collision_exception_with(body: Node) -> void:
	pass;

#desc Based on [code]value[/code], enables or disables the specified layer in the [member collision_layer], given a [param layer_number] between 1 and 32.
func set_collision_layer_value(layer_number: int, value: bool) -> void:
	pass;

#desc Based on [code]value[/code], enables or disables the specified layer in the [member collision_mask], given a [param layer_number] between 1 and 32.
func set_collision_mask_value(layer_number: int, value: bool) -> void:
	pass;

#desc Sets the pinned state of a surface vertex. When set to [code]true[/code], the optional [param attachment_path] can define a [Node3D] the pinned vertex will be attached to.
func set_point_pinned(point_index: int, pinned: bool, attachment_path: NodePath = NodePath("")) -> void:
	pass;


func get_collision_layer() -> int:
	return collision_layer

func set_collision_layer(value: int) -> void:
	collision_layer = value

func get_collision_mask() -> int:
	return collision_mask

func set_collision_mask(value: int) -> void:
	collision_mask = value

func get_damping_coefficient() -> float:
	return damping_coefficient

func set_damping_coefficient(value: float) -> void:
	damping_coefficient = value

func get_disable_mode() -> int:
	return disable_mode

func set_disable_mode(value: int) -> void:
	disable_mode = value

func get_drag_coefficient() -> float:
	return drag_coefficient

func set_drag_coefficient(value: float) -> void:
	drag_coefficient = value

func get_linear_stiffness() -> float:
	return linear_stiffness

func set_linear_stiffness(value: float) -> void:
	linear_stiffness = value

func get_parent_collision_ignore() -> NodePath:
	return parent_collision_ignore

func set_parent_collision_ignore(value: NodePath) -> void:
	parent_collision_ignore = value

func get_pressure_coefficient() -> float:
	return pressure_coefficient

func set_pressure_coefficient(value: float) -> void:
	pressure_coefficient = value

func is_ray_pickable() -> bool:
	return ray_pickable

func set_ray_pickable(value: bool) -> void:
	ray_pickable = value

func get_simulation_precision() -> int:
	return simulation_precision

func set_simulation_precision(value: int) -> void:
	simulation_precision = value

func get_total_mass() -> float:
	return total_mass

func set_total_mass(value: float) -> void:
	total_mass = value

