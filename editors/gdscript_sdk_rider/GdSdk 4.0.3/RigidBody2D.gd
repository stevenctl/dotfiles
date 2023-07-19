extends PhysicsBody2D
#brief Physics Body which is moved by 2D physics simulation. Useful for objects that have gravity and can be pushed by other objects.
#desc This node implements simulated 2D physics. You do not control a RigidBody2D directly. Instead, you apply forces to it (gravity, impulses, etc.) and the physics simulation calculates the resulting movement based on its mass, friction, and other physical properties.
#desc You can switch the body's behavior using [member lock_rotation], [member freeze], and [member freeze_mode].
#desc [b]Note:[/b] You should not change a RigidBody2D's [code]position[/code] or [code]linear_velocity[/code] every frame or even very often. If you need to directly affect the body's state, use [method _integrate_forces], which allows you to directly access the physics state.
#desc Please also keep in mind that physics bodies manage their own transform which overwrites the ones you set. So any direct or indirect transformation (including scaling of the node or its parent) will be visible in the editor only, and immediately reset at runtime.
#desc If you need to override the default physics behavior or add a transformation at runtime, you can write a custom force integration. See [member custom_integrator].
#tutorial [2D Physics Platformer Demo] https://godotengine.org/asset-library/asset/119
#tutorial [Instancing Demo] https://godotengine.org/asset-library/asset/148
class_name RigidBody2D

#desc Emitted when a collision with another [PhysicsBody2D] or [TileMap] occurs. Requires [member contact_monitor] to be set to [code]true[/code] and [member max_contacts_reported] to be set high enough to detect all the collisions. [TileMap]s are detected if the [TileSet] has Collision [Shape2D]s.
#desc [param body] the [Node], if it exists in the tree, of the other [PhysicsBody2D] or [TileMap].
signal body_entered(body: Node)
#desc Emitted when the collision with another [PhysicsBody2D] or [TileMap] ends. Requires [member contact_monitor] to be set to [code]true[/code] and [member max_contacts_reported] to be set high enough to detect all the collisions. [TileMap]s are detected if the [TileSet] has Collision [Shape2D]s.
#desc [param body] the [Node], if it exists in the tree, of the other [PhysicsBody2D] or [TileMap].
signal body_exited(body: Node)
#desc Emitted when one of this RigidBody2D's [Shape2D]s collides with another [PhysicsBody2D] or [TileMap]'s [Shape2D]s. Requires [member contact_monitor] to be set to [code]true[/code] and [member max_contacts_reported] to be set high enough to detect all the collisions. [TileMap]s are detected if the [TileSet] has Collision [Shape2D]s.
#desc [param body_rid] the [RID] of the other [PhysicsBody2D] or [TileSet]'s [CollisionObject2D] used by the [PhysicsServer2D].
#desc [param body] the [Node], if it exists in the tree, of the other [PhysicsBody2D] or [TileMap].
#desc [param body_shape_index] the index of the [Shape2D] of the other [PhysicsBody2D] or [TileMap] used by the [PhysicsServer2D]. Get the [CollisionShape2D] node with [code]body.shape_owner_get_owner(body.shape_find_owner(body_shape_index))[/code].
#desc [param local_shape_index] the index of the [Shape2D] of this RigidBody2D used by the [PhysicsServer2D]. Get the [CollisionShape2D] node with [code]self.shape_owner_get_owner(self.shape_find_owner(local_shape_index))[/code].
signal body_shape_entered(body_rid: RID, body: Node, body_shape_index: int, local_shape_index: int)
#desc Emitted when the collision between one of this RigidBody2D's [Shape2D]s and another [PhysicsBody2D] or [TileMap]'s [Shape2D]s ends. Requires [member contact_monitor] to be set to [code]true[/code] and [member max_contacts_reported] to be set high enough to detect all the collisions. [TileMap]s are detected if the [TileSet] has Collision [Shape2D]s.
#desc [param body_rid] the [RID] of the other [PhysicsBody2D] or [TileSet]'s [CollisionObject2D] used by the [PhysicsServer2D].
#desc [param body] the [Node], if it exists in the tree, of the other [PhysicsBody2D] or [TileMap].
#desc [param body_shape_index] the index of the [Shape2D] of the other [PhysicsBody2D] or [TileMap] used by the [PhysicsServer2D]. Get the [CollisionShape2D] node with [code]body.shape_owner_get_owner(body.shape_find_owner(body_shape_index))[/code].
#desc [param local_shape_index] the index of the [Shape2D] of this RigidBody2D used by the [PhysicsServer2D]. Get the [CollisionShape2D] node with [code]self.shape_owner_get_owner(self.shape_find_owner(local_shape_index))[/code].
signal body_shape_exited(body_rid: RID, body: Node, body_shape_index: int, local_shape_index: int)
#desc Emitted when the physics engine changes the body's sleeping state.
#desc [b]Note:[/b] Changing the value [member sleeping] will not trigger this signal. It is only emitted if the sleeping state is changed by the physics engine or [code]emit_signal("sleeping_state_changed")[/code] is used.
signal sleeping_state_changed
#desc Static body freeze mode (default). The body is not affected by gravity and forces. It can be only moved by user code and doesn't collide with other bodies along its path.
#desc Kinematic body freeze mode. Similar to [constant FREEZE_MODE_STATIC], but collides with other bodies along its path when moved. Useful for a frozen body that needs to be animated.
#desc In this mode, the body's center of mass is calculated automatically based on its shapes. This assumes that the shapes' origins are also their center of mass.
#desc In this mode, the body's center of mass is set through [member center_of_mass]. Defaults to the body's origin position.
#desc In this mode, the body's damping value is added to any value set in areas or the default value.
#desc In this mode, the body's damping value replaces any value set in areas or the default value.
#desc Continuous collision detection disabled. This is the fastest way to detect body collisions, but can miss small, fast-moving objects.
#desc Continuous collision detection enabled using raycasting. This is faster than shapecasting but less precise.
#desc Continuous collision detection enabled using shapecasting. This is the slowest CCD method and the most precise.

#enum FreezeMode
enum {
    FREEZE_MODE_STATIC = 0,
    FREEZE_MODE_KINEMATIC = 1,
}
#enum CenterOfMassMode
enum {
    CENTER_OF_MASS_MODE_AUTO = 0,
    CENTER_OF_MASS_MODE_CUSTOM = 1,
}
#enum DampMode
enum {
    DAMP_MODE_COMBINE = 0,
    DAMP_MODE_REPLACE = 1,
}
#enum CCDMode
enum {
    CCD_MODE_DISABLED = 0,
    CCD_MODE_CAST_RAY = 1,
    CCD_MODE_CAST_SHAPE = 2,
}
#desc Damps the body's rotation. By default, the body will use the [b]Default Angular Damp[/b] in [b]Project > Project Settings > Physics > 2d[/b] or any value override set by an [Area2D] the body is in. Depending on [member angular_damp_mode], you can set [member angular_damp] to be added to or to replace the body's damping value.
#desc See [member ProjectSettings.physics/2d/default_angular_damp] for more details about damping.
var angular_damp: float:
	get = get_angular_damp, set = set_angular_damp

#desc Defines how [member angular_damp] is applied. See [enum DampMode] for possible values.
var angular_damp_mode: int:
	get = get_angular_damp_mode, set = set_angular_damp_mode

#desc The body's rotational velocity in [i]radians[/i] per second.
var angular_velocity: float:
	get = get_angular_velocity, set = set_angular_velocity

#desc If [code]true[/code], the body can enter sleep mode when there is no movement. See [member sleeping].
var can_sleep: bool:
	get = is_able_to_sleep, set = set_can_sleep

#desc The body's custom center of mass, relative to the body's origin position, when [member center_of_mass_mode] is set to [constant CENTER_OF_MASS_MODE_CUSTOM]. This is the balanced point of the body, where applied forces only cause linear acceleration. Applying forces outside of the center of mass causes angular acceleration.
#desc When [member center_of_mass_mode] is set to [constant CENTER_OF_MASS_MODE_AUTO] (default value), the center of mass is automatically computed.
var center_of_mass: Vector2:
	get = get_center_of_mass, set = set_center_of_mass

#desc Defines the way the body's center of mass is set. See [enum CenterOfMassMode] for possible values.
var center_of_mass_mode: int:
	get = get_center_of_mass_mode, set = set_center_of_mass_mode

#desc The body's total constant positional forces applied during each physics update.
#desc See [method add_constant_force] and [method add_constant_central_force].
var constant_force: Vector2:
	get = get_constant_force, set = set_constant_force

#desc The body's total constant rotational forces applied during each physics update.
#desc See [method add_constant_torque].
var constant_torque: float:
	get = get_constant_torque, set = set_constant_torque

#desc If [code]true[/code], the RigidBody2D will emit signals when it collides with another RigidBody2D.
#desc [b]Note:[/b] By default the maximum contacts reported is set to 0, meaning nothing will be recorded, see [member max_contacts_reported].
var contact_monitor: bool:
	get = is_contact_monitor_enabled, set = set_contact_monitor

#desc Continuous collision detection mode.
#desc Continuous collision detection tries to predict where a moving body will collide instead of moving it and correcting its movement after collision. Continuous collision detection is slower, but more precise and misses fewer collisions with small, fast-moving objects. Raycasting and shapecasting methods are available. See [enum CCDMode] for details.
var continuous_cd: int:
	get = get_continuous_collision_detection_mode, set = set_continuous_collision_detection_mode

#desc If [code]true[/code], internal force integration is disabled for this body. Aside from collision response, the body will only move as determined by the [method _integrate_forces] function.
var custom_integrator: bool:
	get = is_using_custom_integrator, set = set_use_custom_integrator

#desc If [code]true[/code], the body is frozen. Gravity and forces are not applied anymore.
#desc See [member freeze_mode] to set the body's behavior when frozen.
#desc For a body that is always frozen, use [StaticBody2D] or [AnimatableBody2D] instead.
var freeze: bool:
	get = is_freeze_enabled, set = set_freeze_enabled

#desc The body's freeze mode. Can be used to set the body's behavior when [member freeze] is enabled. See [enum FreezeMode] for possible values.
#desc For a body that is always frozen, use [StaticBody2D] or [AnimatableBody2D] instead.
var freeze_mode: int:
	get = get_freeze_mode, set = set_freeze_mode

#desc Multiplies the gravity applied to the body. The body's gravity is calculated from the [b]Default Gravity[/b] value in [b]Project > Project Settings > Physics > 2d[/b] and/or any additional gravity vector applied by [Area2D]s.
var gravity_scale: float:
	get = get_gravity_scale, set = set_gravity_scale

#desc The body's moment of inertia. This is like mass, but for rotation: it determines how much torque it takes to rotate the body. The moment of inertia is usually computed automatically from the mass and the shapes, but this property allows you to set a custom value.
#desc If set to [code]0[/code], inertia is automatically computed (default value).
#desc [b]Note:[/b] This value does not change when inertia is automatically computed. Use [PhysicsServer2D] to get the computed inertia.
#desc [codeblocks]
#desc [gdscript]
#desc @onready var ball = $Ball
#desc 
#desc func get_ball_inertia():
#desc return 1.0 / PhysicsServer2D.body_get_direct_state(ball.get_rid()).inverse_inertia
#desc [/gdscript]
#desc [csharp]
#desc private RigidBody2D _ball;
#desc 
#desc public override void _Ready()
#desc {
#desc _ball = GetNode<RigidBody2D>("Ball");
#desc }
#desc 
#desc private float GetBallInertia()
#desc {
#desc return 1.0f / PhysicsServer2D.BodyGetDirectState(_ball.GetRid()).InverseInertia;
#desc }
#desc [/csharp]
#desc [/codeblocks]
var inertia: float:
	get = get_inertia, set = set_inertia

#desc Damps the body's movement. By default, the body will use the [b]Default Linear Damp[/b] in [b]Project > Project Settings > Physics > 2d[/b] or any value override set by an [Area2D] the body is in. Depending on [member linear_damp_mode], you can set [member linear_damp] to be added to or to replace the body's damping value.
#desc See [member ProjectSettings.physics/2d/default_linear_damp] for more details about damping.
var linear_damp: float:
	get = get_linear_damp, set = set_linear_damp

#desc Defines how [member linear_damp] is applied. See [enum DampMode] for possible values.
var linear_damp_mode: int:
	get = get_linear_damp_mode, set = set_linear_damp_mode

#desc The body's linear velocity in pixels per second. Can be used sporadically, but [b]don't set this every frame[/b], because physics may run in another thread and runs at a different granularity. Use [method _integrate_forces] as your process loop for precise control of the body state.
var linear_velocity: Vector2:
	get = get_linear_velocity, set = set_linear_velocity

#desc If [code]true[/code], the body cannot rotate. Gravity and forces only apply linear movement.
var lock_rotation: bool:
	get = is_lock_rotation_enabled, set = set_lock_rotation_enabled

#desc The body's mass.
var mass: float:
	get = get_mass, set = set_mass

#desc The maximum number of contacts that will be recorded. Requires a value greater than 0 and [member contact_monitor] to be set to [code]true[/code] to start to register contacts. Use [method get_contact_count] to retrieve the count or [method get_colliding_bodies] to retrieve bodies that have been collided with.
#desc [b]Note:[/b] The number of contacts is different from the number of collisions. Collisions between parallel edges will result in two contacts (one at each end), and collisions between parallel faces will result in four contacts (one at each corner).
var max_contacts_reported: int:
	get = get_max_contacts_reported, set = set_max_contacts_reported

#desc The physics material override for the body.
#desc If a material is assigned to this property, it will be used instead of any other physics material, such as an inherited one.
var physics_material_override: PhysicsMaterial:
	get = get_physics_material_override, set = set_physics_material_override

#desc If [code]true[/code], the body will not move and will not calculate forces until woken up by another body through, for example, a collision, or by using the [method apply_impulse] or [method apply_force] methods.
var sleeping: bool:
	get = is_sleeping, set = set_sleeping



#desc Allows you to read and safely modify the simulation state for the object. Use this instead of [method Node._physics_process] if you need to directly change the body's [code]position[/code] or other physics properties. By default, it works in addition to the usual physics behavior, but [member custom_integrator] allows you to disable the default behavior and write custom force integration for a body.
func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	pass;

#desc Adds a constant directional force without affecting rotation that keeps being applied over time until cleared with [code]constant_force = Vector2(0, 0)[/code].
#desc This is equivalent to using [method add_constant_force] at the body's center of mass.
func add_constant_central_force(force: Vector2) -> void:
	pass;

#desc Adds a constant positioned force to the body that keeps being applied over time until cleared with [code]constant_force = Vector2(0, 0)[/code].
#desc [param position] is the offset from the body origin in global coordinates.
func add_constant_force(force: Vector2, position: Vector2 = Vector2(0, 0)) -> void:
	pass;

#desc Adds a constant rotational force without affecting position that keeps being applied over time until cleared with [code]constant_torque = 0[/code].
func add_constant_torque(torque: float) -> void:
	pass;

#desc Applies a directional force without affecting rotation. A force is time dependent and meant to be applied every physics update.
#desc This is equivalent to using [method apply_force] at the body's center of mass.
func apply_central_force(force: Vector2) -> void:
	pass;

#desc Applies a directional impulse without affecting rotation.
#desc An impulse is time-independent! Applying an impulse every frame would result in a framerate-dependent force. For this reason, it should only be used when simulating one-time impacts (use the "_force" functions otherwise).
#desc This is equivalent to using [method apply_impulse] at the body's center of mass.
func apply_central_impulse(impulse: Vector2 = Vector2(0, 0)) -> void:
	pass;

#desc Applies a positioned force to the body. A force is time dependent and meant to be applied every physics update.
#desc [param position] is the offset from the body origin in global coordinates.
func apply_force(force: Vector2, position: Vector2 = Vector2(0, 0)) -> void:
	pass;

#desc Applies a positioned impulse to the body.
#desc An impulse is time-independent! Applying an impulse every frame would result in a framerate-dependent force. For this reason, it should only be used when simulating one-time impacts (use the "_force" functions otherwise).
#desc [param position] is the offset from the body origin in global coordinates.
func apply_impulse(impulse: Vector2, position: Vector2 = Vector2(0, 0)) -> void:
	pass;

#desc Applies a rotational force without affecting position. A force is time dependent and meant to be applied every physics update.
#desc [b]Note:[/b] [member inertia] is required for this to work. To have [member inertia], an active [CollisionShape2D] must be a child of the node, or you can manually set [member inertia].
func apply_torque(torque: float) -> void:
	pass;

#desc Applies a rotational impulse to the body without affecting the position.
#desc An impulse is time-independent! Applying an impulse every frame would result in a framerate-dependent force. For this reason, it should only be used when simulating one-time impacts (use the "_force" functions otherwise).
#desc [b]Note:[/b] [member inertia] is required for this to work. To have [member inertia], an active [CollisionShape2D] must be a child of the node, or you can manually set [member inertia].
func apply_torque_impulse(torque: float) -> void:
	pass;

#desc Returns a list of the bodies colliding with this one. Requires [member contact_monitor] to be set to [code]true[/code] and [member max_contacts_reported] to be set high enough to detect all the collisions.
#desc [b]Note:[/b] The result of this test is not immediate after moving objects. For performance, list of collisions is updated once per frame and before the physics step. Consider using signals instead.
func get_colliding_bodies() -> Array[Node2D]:
	pass;

#desc Returns the number of contacts this body has with other bodies. By default, this returns 0 unless bodies are configured to monitor contacts (see [member contact_monitor]).
#desc [b]Note:[/b] To retrieve the colliding bodies, use [method get_colliding_bodies].
func get_contact_count() -> int:
	pass;

#desc Sets the body's velocity on the given axis. The velocity in the given vector axis will be set as the given vector length. This is useful for jumping behavior.
func set_axis_velocity(axis_velocity: Vector2) -> void:
	pass;


func get_angular_damp() -> float:
	return angular_damp

func set_angular_damp(value: float) -> void:
	angular_damp = value

func get_angular_damp_mode() -> int:
	return angular_damp_mode

func set_angular_damp_mode(value: int) -> void:
	angular_damp_mode = value

func get_angular_velocity() -> float:
	return angular_velocity

func set_angular_velocity(value: float) -> void:
	angular_velocity = value

func is_able_to_sleep() -> bool:
	return can_sleep

func set_can_sleep(value: bool) -> void:
	can_sleep = value

func get_center_of_mass() -> Vector2:
	return center_of_mass

func set_center_of_mass(value: Vector2) -> void:
	center_of_mass = value

func get_center_of_mass_mode() -> int:
	return center_of_mass_mode

func set_center_of_mass_mode(value: int) -> void:
	center_of_mass_mode = value

func get_constant_force() -> Vector2:
	return constant_force

func set_constant_force(value: Vector2) -> void:
	constant_force = value

func get_constant_torque() -> float:
	return constant_torque

func set_constant_torque(value: float) -> void:
	constant_torque = value

func is_contact_monitor_enabled() -> bool:
	return contact_monitor

func set_contact_monitor(value: bool) -> void:
	contact_monitor = value

func get_continuous_collision_detection_mode() -> int:
	return continuous_cd

func set_continuous_collision_detection_mode(value: int) -> void:
	continuous_cd = value

func is_using_custom_integrator() -> bool:
	return custom_integrator

func set_use_custom_integrator(value: bool) -> void:
	custom_integrator = value

func is_freeze_enabled() -> bool:
	return freeze

func set_freeze_enabled(value: bool) -> void:
	freeze = value

func get_freeze_mode() -> int:
	return freeze_mode

func set_freeze_mode(value: int) -> void:
	freeze_mode = value

func get_gravity_scale() -> float:
	return gravity_scale

func set_gravity_scale(value: float) -> void:
	gravity_scale = value

func get_inertia() -> float:
	return inertia

func set_inertia(value: float) -> void:
	inertia = value

func get_linear_damp() -> float:
	return linear_damp

func set_linear_damp(value: float) -> void:
	linear_damp = value

func get_linear_damp_mode() -> int:
	return linear_damp_mode

func set_linear_damp_mode(value: int) -> void:
	linear_damp_mode = value

func get_linear_velocity() -> Vector2:
	return linear_velocity

func set_linear_velocity(value: Vector2) -> void:
	linear_velocity = value

func is_lock_rotation_enabled() -> bool:
	return lock_rotation

func set_lock_rotation_enabled(value: bool) -> void:
	lock_rotation = value

func get_mass() -> float:
	return mass

func set_mass(value: float) -> void:
	mass = value

func get_max_contacts_reported() -> int:
	return max_contacts_reported

func set_max_contacts_reported(value: int) -> void:
	max_contacts_reported = value

func get_physics_material_override() -> PhysicsMaterial:
	return physics_material_override

func set_physics_material_override(value: PhysicsMaterial) -> void:
	physics_material_override = value

func is_sleeping() -> bool:
	return sleeping

func set_sleeping(value: bool) -> void:
	sleeping = value

