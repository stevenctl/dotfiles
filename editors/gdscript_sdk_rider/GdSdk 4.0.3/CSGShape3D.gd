extends GeometryInstance3D
#brief The CSG base class.
#desc This is the CSG base class that provides CSG operation support to the various CSG nodes in Godot.
#desc [b]Note:[/b] CSG nodes are intended to be used for level prototyping. Creating CSG nodes has a significant CPU cost compared to creating a [MeshInstance3D] with a [PrimitiveMesh]. Moving a CSG node within another CSG node also has a significant CPU cost, so it should be avoided during gameplay.
#tutorial [Prototyping levels with CSG] https://docs.godotengine.org/en/stable/tutorials/3d/csg_tools.html
class_name CSGShape3D

#desc Geometry of both primitives is merged, intersecting geometry is removed.
#desc Only intersecting geometry remains, the rest is removed.
#desc The second shape is subtracted from the first, leaving a dent with its shape.

#enum Operation
enum {
    OPERATION_UNION = 0,
    OPERATION_INTERSECTION = 1,
    OPERATION_SUBTRACTION = 2,
}
#desc Calculate tangents for the CSG shape which allows the use of normal maps. This is only applied on the root shape, this setting is ignored on any child.
var calculate_tangents: bool:
	get = is_calculating_tangents, set = set_calculate_tangents

#desc The physics layers this area is in.
#desc Collidable objects can exist in any of 32 different layers. These layers work like a tagging system, and are not visual. A collidable can use these layers to select with which objects it can collide, using the collision_mask property.
#desc A contact is detected if object A is in any of the layers that object B scans, or object B is in any layer scanned by object A. See [url=$DOCS_URL/tutorials/physics/physics_introduction.html#collision-layers-and-masks]Collision layers and masks[/url] in the documentation for more information.
var collision_layer: int:
	get = get_collision_layer, set = set_collision_layer

#desc The physics layers this CSG shape scans for collisions. Only effective if [member use_collision] is [code]true[/code]. See [url=$DOCS_URL/tutorials/physics/physics_introduction.html#collision-layers-and-masks]Collision layers and masks[/url] in the documentation for more information.
var collision_mask: int:
	get = get_collision_mask, set = set_collision_mask

#desc The priority used to solve colliding when occurring penetration. Only effective if [member use_collision] is [code]true[/code]. The higher the priority is, the lower the penetration into the object will be. This can for example be used to prevent the player from breaking through the boundaries of a level.
var collision_priority: float:
	get = get_collision_priority, set = set_collision_priority

#desc The operation that is performed on this shape. This is ignored for the first CSG child node as the operation is between this node and the previous child of this nodes parent.
var operation: int:
	get = get_operation, set = set_operation

#desc Snap makes the mesh vertices snap to a given distance so that the faces of two meshes can be perfectly aligned. A lower value results in greater precision but may be harder to adjust.
var snap: float:
	get = get_snap, set = set_snap

#desc Adds a collision shape to the physics engine for our CSG shape. This will always act like a static body. Note that the collision shape is still active even if the CSG shape itself is hidden. See also [member collision_mask] and [member collision_priority].
var use_collision: bool:
	get = is_using_collision, set = set_use_collision



#desc Returns whether or not the specified layer of the [member collision_layer] is enabled, given a [code]layer_number[/code] between 1 and 32.
func get_collision_layer_value(layer_number: int) -> bool:
	pass;

#desc Returns whether or not the specified layer of the [member collision_mask] is enabled, given a [code]layer_number[/code] between 1 and 32.
func get_collision_mask_value(layer_number: int) -> bool:
	pass;

#desc Returns an [Array] with two elements, the first is the [Transform3D] of this node and the second is the root [Mesh] of this node. Only works when this node is the root shape.
func get_meshes() -> Array:
	pass;

#desc Returns [code]true[/code] if this is a root shape and is thus the object that is rendered.
func is_root_shape() -> bool:
	pass;

#desc Based on [code]value[/code], enables or disables the specified layer in the [member collision_layer], given a [code]layer_number[/code] between 1 and 32.
func set_collision_layer_value(layer_number: int, value: bool) -> void:
	pass;

#desc Based on [code]value[/code], enables or disables the specified layer in the [member collision_mask], given a [code]layer_number[/code] between 1 and 32.
func set_collision_mask_value(layer_number: int, value: bool) -> void:
	pass;


func is_calculating_tangents() -> bool:
	return calculate_tangents

func set_calculate_tangents(value: bool) -> void:
	calculate_tangents = value

func get_collision_layer() -> int:
	return collision_layer

func set_collision_layer(value: int) -> void:
	collision_layer = value

func get_collision_mask() -> int:
	return collision_mask

func set_collision_mask(value: int) -> void:
	collision_mask = value

func get_collision_priority() -> float:
	return collision_priority

func set_collision_priority(value: float) -> void:
	collision_priority = value

func get_operation() -> int:
	return operation

func set_operation(value: int) -> void:
	operation = value

func get_snap() -> float:
	return snap

func set_snap(value: float) -> void:
	snap = value

func is_using_collision() -> bool:
	return use_collision

func set_use_collision(value: bool) -> void:
	use_collision = value

