extends PhysicsBody2D
#brief Physics body for 2D physics which is static or moves only by script (without affecting other bodies on its path). Useful for floors and walls.
#desc Static body for 2D physics.
#desc A static body is a simple body that doesn't move under physics simulation, i.e. it can't be moved by external forces or contacts but its transformation can still be updated manually by the user. It is ideal for implementing objects in the environment, such as walls or platforms. In contrast to [RigidBody2D], it doesn't consume any CPU resources as long as they don't move.
#desc They have extra functionalities to move and affect other bodies:
#desc [b]Static transform change:[/b] Static bodies [i]can[/i] be moved by animation or script. In this case, they are just teleported and don't affect other bodies on their path. Use [AnimatableBody2D] instead of [StaticBody2D] if you need a moving static body that affects other bodies on its path.
#desc [b]Constant velocity:[/b] When [member constant_linear_velocity] or [member constant_angular_velocity] is set, static bodies don't move themselves but affect touching bodies as if they were moving. This is useful for simulating conveyor belts or conveyor wheels.
class_name StaticBody2D


#desc The body's constant angular velocity. This does not rotate the body, but affects touching bodies, as if it were rotating.
var constant_angular_velocity: float:
	get = get_constant_angular_velocity, set = set_constant_angular_velocity

#desc The body's constant linear velocity. This does not move the body, but affects touching bodies, as if it were moving.
var constant_linear_velocity: Vector2:
	get = get_constant_linear_velocity, set = set_constant_linear_velocity

#desc The physics material override for the body.
#desc If a material is assigned to this property, it will be used instead of any other physics material, such as an inherited one.
var physics_material_override: PhysicsMaterial:
	get = get_physics_material_override, set = set_physics_material_override




func get_constant_angular_velocity() -> float:
	return constant_angular_velocity

func set_constant_angular_velocity(value: float) -> void:
	constant_angular_velocity = value

func get_constant_linear_velocity() -> Vector2:
	return constant_linear_velocity

func set_constant_linear_velocity(value: Vector2) -> void:
	constant_linear_velocity = value

func get_physics_material_override() -> PhysicsMaterial:
	return physics_material_override

func set_physics_material_override(value: PhysicsMaterial) -> void:
	physics_material_override = value

