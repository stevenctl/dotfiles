extends CanvasItem
#brief A 2D game object, inherited by all 2D-related nodes. Has a position, rotation, scale, and Z index.
#desc A 2D game object, with a transform (position, rotation, and scale). All 2D nodes, including physics objects and sprites, inherit from Node2D. Use Node2D as a parent node to move, scale and rotate children in a 2D project. Also gives control of the node's render order.
#tutorial [Custom drawing in 2D] https://docs.godotengine.org/en/stable/tutorials/2d/custom_drawing_in_2d.html
#tutorial [All 2D Demos] https://github.com/godotengine/godot-demo-projects/tree/master/2d
class_name Node2D


#desc Global position.
var global_position: Vector2:
	get = get_global_position, set = set_global_position

#desc Global rotation in radians.
var global_rotation: float:
	get = get_global_rotation, set = set_global_rotation

#desc Helper property to access [member global_rotation] in degrees instead of radians.
var global_rotation_degrees: float:
	get = get_global_rotation_degrees, set = set_global_rotation_degrees

#desc Global scale.
var global_scale: Vector2:
	get = get_global_scale, set = set_global_scale

#desc Global skew in radians.
var global_skew: float:
	get = get_global_skew, set = set_global_skew

#desc Global [Transform2D].
var global_transform: Transform2D:
	get = get_global_transform, set = set_global_transform

#desc Position, relative to the node's parent.
var position: Vector2:
	get = get_position, set = set_position

#desc Rotation in radians, relative to the node's parent.
#desc [b]Note:[/b] This property is edited in the inspector in degrees. If you want to use degrees in a script, use [member rotation_degrees].
var rotation: float:
	get = get_rotation, set = set_rotation

#desc Helper property to access [member rotation] in degrees instead of radians.
var rotation_degrees: float:
	get = get_rotation_degrees, set = set_rotation_degrees

#desc The node's scale. Unscaled value: [code](1, 1)[/code].
#desc [b]Note:[/b] Negative X scales in 2D are not decomposable from the transformation matrix. Due to the way scale is represented with transformation matrices in Godot, negative scales on the X axis will be changed to negative scales on the Y axis and a rotation of 180 degrees when decomposed.
var scale: Vector2:
	get = get_scale, set = set_scale

#desc Slants the node.
#desc [b]Note:[/b] Skew is X axis only.
var skew: float:
	get = get_skew, set = set_skew

#desc Local [Transform2D].
var transform: Transform2D:
	get = get_transform, set = set_transform



#desc Multiplies the current scale by the [param ratio] vector.
func apply_scale(ratio: Vector2) -> void:
	pass;

#desc Returns the angle between the node and the [param point] in radians.
#desc [url=https://raw.githubusercontent.com/godotengine/godot-docs/master/img/node2d_get_angle_to.png]Illustration of the returned angle.[/url]
func get_angle_to(point: Vector2) -> float:
	pass;

#desc Returns the [Transform2D] relative to this node's parent.
func get_relative_transform_to_parent(parent: Node) -> Transform2D:
	pass;

#desc Adds the [param offset] vector to the node's global position.
func global_translate(offset: Vector2) -> void:
	pass;

#desc Rotates the node so it points towards the [param point], which is expected to use global coordinates.
func look_at(point: Vector2) -> void:
	pass;

#desc Applies a local translation on the node's X axis based on the [method Node._process]'s [param delta]. If [param scaled] is [code]false[/code], normalizes the movement.
func move_local_x(delta: float, scaled: bool = false) -> void:
	pass;

#desc Applies a local translation on the node's Y axis based on the [method Node._process]'s [param delta]. If [param scaled] is [code]false[/code], normalizes the movement.
func move_local_y(delta: float, scaled: bool = false) -> void:
	pass;

#desc Applies a rotation to the node, in radians, starting from its current rotation.
func rotate(radians: float) -> void:
	pass;

#desc Transforms the provided local position into a position in global coordinate space. The input is expected to be local relative to the [Node2D] it is called on. e.g. Applying this method to the positions of child nodes will correctly transform their positions into the global coordinate space, but applying it to a node's own position will give an incorrect result, as it will incorporate the node's own transformation into its global position.
func to_global(local_point: Vector2) -> Vector2:
	pass;

#desc Transforms the provided global position into a position in local coordinate space. The output will be local relative to the [Node2D] it is called on. e.g. It is appropriate for determining the positions of child nodes, but it is not appropriate for determining its own position relative to its parent.
func to_local(global_point: Vector2) -> Vector2:
	pass;

#desc Translates the node by the given [param offset] in local coordinates.
func translate(offset: Vector2) -> void:
	pass;


func get_global_position() -> Vector2:
	return global_position

func set_global_position(value: Vector2) -> void:
	global_position = value

func get_global_rotation() -> float:
	return global_rotation

func set_global_rotation(value: float) -> void:
	global_rotation = value

func get_global_rotation_degrees() -> float:
	return global_rotation_degrees

func set_global_rotation_degrees(value: float) -> void:
	global_rotation_degrees = value

func get_global_scale() -> Vector2:
	return global_scale

func set_global_scale(value: Vector2) -> void:
	global_scale = value

func get_global_skew() -> float:
	return global_skew

func set_global_skew(value: float) -> void:
	global_skew = value

func get_global_transform() -> Transform2D:
	return global_transform

func set_global_transform(value: Transform2D) -> void:
	global_transform = value

func get_position() -> Vector2:
	return position

func set_position(value: Vector2) -> void:
	position = value

func get_rotation() -> float:
	return rotation

func set_rotation(value: float) -> void:
	rotation = value

func get_rotation_degrees() -> float:
	return rotation_degrees

func set_rotation_degrees(value: float) -> void:
	rotation_degrees = value

func get_scale() -> Vector2:
	return scale

func set_scale(value: Vector2) -> void:
	scale = value

func get_skew() -> float:
	return skew

func set_skew(value: float) -> void:
	skew = value

func get_transform() -> Transform2D:
	return transform

func set_transform(value: Transform2D) -> void:
	transform = value

