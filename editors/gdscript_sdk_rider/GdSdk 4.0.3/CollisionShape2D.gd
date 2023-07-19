extends Node2D
#brief Node that represents collision shape data in 2D space.
#desc Editor facility for creating and editing collision shapes in 2D space. Set the [member shape] property to configure the shape.
#desc You can use this node to represent all sorts of collision shapes, for example, add this to an [Area2D] to give it a detection shape, or add it to a [PhysicsBody2D] to create a solid object.
#tutorial [Physics introduction] https://docs.godotengine.org/en/stable/tutorials/physics/physics_introduction.html
#tutorial [2D Dodge The Creeps Demo] https://godotengine.org/asset-library/asset/515
#tutorial [2D Pong Demo] https://godotengine.org/asset-library/asset/121
#tutorial [2D Kinematic Character Demo] https://godotengine.org/asset-library/asset/113
class_name CollisionShape2D


#desc The collision shape debug color.
#desc [b]Note:[/b] The default value is [member ProjectSettings.debug/shapes/collision/shape_color]. The [code]Color(0, 0, 0, 1)[/code] value documented here is a placeholder, and not the actual default debug color.
var debug_color: Color:
	get = get_debug_color, set = set_debug_color

#desc A disabled collision shape has no effect in the world. This property should be changed with [method Object.set_deferred].
var disabled: bool:
	get = is_disabled, set = set_disabled

#desc Sets whether this collision shape should only detect collision on one side (top or bottom).
#desc [b]Note:[/b] This property has no effect if this [CollisionShape2D] is a child of an [Area2D] node.
var one_way_collision: bool:
	get = is_one_way_collision_enabled, set = set_one_way_collision

#desc The margin used for one-way collision (in pixels). Higher values will make the shape thicker, and work better for colliders that enter the shape at a high velocity.
var one_way_collision_margin: float:
	get = get_one_way_collision_margin, set = set_one_way_collision_margin

#desc The actual shape owned by this collision shape.
var shape: Shape2D:
	get = get_shape, set = set_shape




func get_debug_color() -> Color:
	return debug_color

func set_debug_color(value: Color) -> void:
	debug_color = value

func is_disabled() -> bool:
	return disabled

func set_disabled(value: bool) -> void:
	disabled = value

func is_one_way_collision_enabled() -> bool:
	return one_way_collision

func set_one_way_collision(value: bool) -> void:
	one_way_collision = value

func get_one_way_collision_margin() -> float:
	return one_way_collision_margin

func set_one_way_collision_margin(value: float) -> void:
	one_way_collision_margin = value

func get_shape() -> Shape2D:
	return shape

func set_shape(value: Shape2D) -> void:
	shape = value

