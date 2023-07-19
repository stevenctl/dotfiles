extends PhysicsBody3D
#desc [b]Warning:[/b] With a non-uniform scale this node will probably not function as expected. Please make sure to keep its scale uniform (i.e. the same on all axes), and change the size(s) of its collision shape(s) instead.
class_name PhysicalBone3D

#desc In this mode, the body's damping value is added to any value set in areas or the default value.
#desc In this mode, the body's damping value replaces any value set in areas or the default value.

#enum DampMode
enum {
    DAMP_MODE_COMBINE = 0,
    DAMP_MODE_REPLACE = 1,
}
#enum JointType
enum {
    JOINT_TYPE_NONE = 0,
    JOINT_TYPE_PIN = 1,
    JOINT_TYPE_CONE = 2,
    JOINT_TYPE_HINGE = 3,
    JOINT_TYPE_SLIDER = 4,
    JOINT_TYPE_6DOF = 5,
}
#desc Damps the body's rotation. By default, the body will use the [b]Default Angular Damp[/b] in [b]Project > Project Settings > Physics > 3d[/b] or any value override set by an [Area3D] the body is in. Depending on [member angular_damp_mode], you can set [member angular_damp] to be added to or to replace the body's damping value.
#desc See [member ProjectSettings.physics/3d/default_angular_damp] for more details about damping.
var angular_damp: float:
	get = get_angular_damp, set = set_angular_damp

#desc Defines how [member angular_damp] is applied. See [enum DampMode] for possible values.
var angular_damp_mode: int:
	get = get_angular_damp_mode, set = set_angular_damp_mode

#desc The PhysicalBone3D's rotational velocity in [i]radians[/i] per second.
var angular_velocity: Vector3:
	get = get_angular_velocity, set = set_angular_velocity

#desc Sets the body's transform.
var body_offset: Transform3D:
	get = get_body_offset, set = set_body_offset

#desc The body's bounciness. Values range from [code]0[/code] (no bounce) to [code]1[/code] (full bounciness).
var bounce: float:
	get = get_bounce, set = set_bounce

#desc If [code]true[/code], the body is deactivated when there is no movement, so it will not take part in the simulation until it is awakened by an external force.
var can_sleep: bool:
	get = is_able_to_sleep, set = set_can_sleep

#desc If [code]true[/code], internal force integration will be disabled (like gravity or air friction) for this body. Other than collision response, the body will only move as determined by the [method _integrate_forces] function, if defined.
var custom_integrator: bool:
	get = is_using_custom_integrator, set = set_use_custom_integrator

#desc The body's friction, from [code]0[/code] (frictionless) to [code]1[/code] (max friction).
var friction: float:
	get = get_friction, set = set_friction

#desc This is multiplied by the global 3D gravity setting found in [b]Project > Project Settings > Physics > 3d[/b] to produce the body's gravity. For example, a value of 1 will be normal gravity, 2 will apply double gravity, and 0.5 will apply half gravity to this object.
var gravity_scale: float:
	get = get_gravity_scale, set = set_gravity_scale

#desc Sets the joint's transform.
var joint_offset: Transform3D:
	get = get_joint_offset, set = set_joint_offset

#desc Sets the joint's rotation in radians.
var joint_rotation: Vector3:
	get = get_joint_rotation, set = set_joint_rotation

#desc Sets the joint type. See [enum JointType] for possible values.
var joint_type: int:
	get = get_joint_type, set = set_joint_type

#desc Damps the body's movement. By default, the body will use the [b]Default Linear Damp[/b] in [b]Project > Project Settings > Physics > 3d[/b] or any value override set by an [Area3D] the body is in. Depending on [member linear_damp_mode], you can set [member linear_damp] to be added to or to replace the body's damping value.
#desc See [member ProjectSettings.physics/3d/default_linear_damp] for more details about damping.
var linear_damp: float:
	get = get_linear_damp, set = set_linear_damp

#desc Defines how [member linear_damp] is applied. See [enum DampMode] for possible values.
var linear_damp_mode: int:
	get = get_linear_damp_mode, set = set_linear_damp_mode

#desc The body's linear velocity in units per second. Can be used sporadically, but [b]don't set this every frame[/b], because physics may run in another thread and runs at a different granularity. Use [method _integrate_forces] as your process loop for precise control of the body state.
var linear_velocity: Vector3:
	get = get_linear_velocity, set = set_linear_velocity

#desc The body's mass.
var mass: float:
	get = get_mass, set = set_mass



#desc Called during physics processing, allowing you to read and safely modify the simulation state for the object. By default, it works in addition to the usual physics behavior, but the [member custom_integrator] property allows you to disable the default behavior and do fully custom force integration for a body.
func _integrate_forces(state: PhysicsDirectBodyState3D) -> void:
	pass;

func apply_central_impulse(impulse: Vector3) -> void:
	pass;

func apply_impulse(impulse: Vector3, position: Vector3 = Vector3(0, 0, 0)) -> void:
	pass;

func get_bone_id() -> int:
	pass;

func get_simulate_physics() -> bool:
	pass;

func is_simulating_physics() -> bool:
	pass;


func get_angular_damp() -> float:
	return angular_damp

func set_angular_damp(value: float) -> void:
	angular_damp = value

func get_angular_damp_mode() -> int:
	return angular_damp_mode

func set_angular_damp_mode(value: int) -> void:
	angular_damp_mode = value

func get_angular_velocity() -> Vector3:
	return angular_velocity

func set_angular_velocity(value: Vector3) -> void:
	angular_velocity = value

func get_body_offset() -> Transform3D:
	return body_offset

func set_body_offset(value: Transform3D) -> void:
	body_offset = value

func get_bounce() -> float:
	return bounce

func set_bounce(value: float) -> void:
	bounce = value

func is_able_to_sleep() -> bool:
	return can_sleep

func set_can_sleep(value: bool) -> void:
	can_sleep = value

func is_using_custom_integrator() -> bool:
	return custom_integrator

func set_use_custom_integrator(value: bool) -> void:
	custom_integrator = value

func get_friction() -> float:
	return friction

func set_friction(value: float) -> void:
	friction = value

func get_gravity_scale() -> float:
	return gravity_scale

func set_gravity_scale(value: float) -> void:
	gravity_scale = value

func get_joint_offset() -> Transform3D:
	return joint_offset

func set_joint_offset(value: Transform3D) -> void:
	joint_offset = value

func get_joint_rotation() -> Vector3:
	return joint_rotation

func set_joint_rotation(value: Vector3) -> void:
	joint_rotation = value

func get_joint_type() -> int:
	return joint_type

func set_joint_type(value: int) -> void:
	joint_type = value

func get_linear_damp() -> float:
	return linear_damp

func set_linear_damp(value: float) -> void:
	linear_damp = value

func get_linear_damp_mode() -> int:
	return linear_damp_mode

func set_linear_damp_mode(value: int) -> void:
	linear_damp_mode = value

func get_linear_velocity() -> Vector3:
	return linear_velocity

func set_linear_velocity(value: Vector3) -> void:
	linear_velocity = value

func get_mass() -> float:
	return mass

func set_mass(value: float) -> void:
	mass = value

