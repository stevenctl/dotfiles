extends Object
#brief Server interface for low-level 2D physics access.
#desc PhysicsServer2D is the server responsible for all 2D physics. It can directly create and manipulate all physics objects:
#desc - A [i]space[/i] is a self-contained world for a physics simulation. It contains bodies, areas, and joints. Its state can be queried for collision and intersection information, and several parameters of the simulation can be modified.
#desc - A [i]shape[/i] is a geometric figure such as a circle, a rectangle, a capsule, or a polygon. It can be used for collision detection by adding it to a body/area, possibly with an extra transformation relative to the body/area's origin. Bodies/areas can have multiple (transformed) shapes added to them, and a single shape can be added to bodies/areas multiple times with different local transformations.
#desc - A [i]body[/i] is a physical object which can be in static, kinematic, or rigid mode. Its state (such as position and velocity) can be queried and updated. A force integration callback can be set to customize the body's physics.
#desc - An [i]area[/i] is a region in space which can be used to detect bodies and areas entering and exiting it. A body monitoring callback can be set to report entering/exiting body shapes, and similarly an area monitoring callback can be set. Gravity and damping can be overridden within the area by setting area parameters.
#desc - A [i]joint[/i] is a constraint, either between two bodies or on one body relative to a point. Parameters such as the joint bias and the rest length of a spring joint can be adjusted.
#desc Physics objects in the physics server may be created and manipulated independently; they do not have to be tied to nodes in the scene tree.
#desc [b]Note:[/b] All the physics nodes use the physics server internally. Adding a physics node to the scene tree will cause a corresponding physics object to be created in the physics server. A rigid body node registers a callback that updates the node's transform with the transform of the respective body object in the physics server (every physics update). An area node registers a callback to inform the area node about overlaps with the respective area object in the physics server. The raycast node queries the direct state of the relevant space in the physics server.
class_name PhysicsServer2D

#desc Constant to set/get the maximum distance a pair of bodies has to move before their collision status has to be recalculated. The default value of this parameter is [member ProjectSettings.physics/2d/solver/contact_recycle_radius].
#desc Constant to set/get the maximum distance a shape can be from another before they are considered separated and the contact is discarded. The default value of this parameter is [member ProjectSettings.physics/2d/solver/contact_max_separation].
#desc Constant to set/get the maximum distance a shape can penetrate another shape before it is considered a collision. The default value of this parameter is [member ProjectSettings.physics/2d/solver/contact_max_allowed_penetration].
#desc Constant to set/get the default solver bias for all physics contacts. A solver bias is a factor controlling how much two objects "rebound", after overlapping, to avoid leaving them in that state because of numerical imprecision. The default value of this parameter is [member ProjectSettings.physics/2d/solver/default_contact_bias].
#desc Constant to set/get the threshold linear velocity of activity. A body marked as potentially inactive for both linear and angular velocity will be put to sleep after the time given. The default value of this parameter is [member ProjectSettings.physics/2d/sleep_threshold_linear].
#desc Constant to set/get the threshold angular velocity of activity. A body marked as potentially inactive for both linear and angular velocity will be put to sleep after the time given. The default value of this parameter is [member ProjectSettings.physics/2d/sleep_threshold_angular].
#desc Constant to set/get the maximum time of activity. A body marked as potentially inactive for both linear and angular velocity will be put to sleep after this time. The default value of this parameter is [member ProjectSettings.physics/2d/time_before_sleep].
#desc Constant to set/get the default solver bias for all physics constraints. A solver bias is a factor controlling how much two objects "rebound", after violating a constraint, to avoid leaving them in that state because of numerical imprecision. The default value of this parameter is [member ProjectSettings.physics/2d/solver/default_constraint_bias].
#desc Constant to set/get the number of solver iterations for all contacts and constraints. The greater the number of iterations, the more accurate the collisions will be. However, a greater number of iterations requires more CPU power, which can decrease performance. The default value of this parameter is [member ProjectSettings.physics/2d/solver/solver_iterations].
#desc This is the constant for creating world boundary shapes. A world boundary shape is an [i]infinite[/i] line with an origin point, and a normal. Thus, it can be used for front/behind checks.
#desc This is the constant for creating separation ray shapes. A separation ray is defined by a length and separates itself from what is touching its far endpoint. Useful for character controllers.
#desc This is the constant for creating segment shapes. A segment shape is a [i]finite[/i] line from a point A to a point B. It can be checked for intersections.
#desc This is the constant for creating circle shapes. A circle shape only has a radius. It can be used for intersections and inside/outside checks.
#desc This is the constant for creating rectangle shapes. A rectangle shape is defined by a width and a height. It can be used for intersections and inside/outside checks.
#desc This is the constant for creating capsule shapes. A capsule shape is defined by a radius and a length. It can be used for intersections and inside/outside checks.
#desc This is the constant for creating convex polygon shapes. A polygon is defined by a list of points. It can be used for intersections and inside/outside checks.
#desc This is the constant for creating concave polygon shapes. A polygon is defined by a list of points. It can be used for intersections checks, but not for inside/outside checks.
#desc This constant is used internally by the engine. Any attempt to create this kind of shape results in an error.
#desc Constant to set/get gravity override mode in an area. See [enum AreaSpaceOverrideMode] for possible values. The default value of this parameter is [constant AREA_SPACE_OVERRIDE_DISABLED].
#desc Constant to set/get gravity strength in an area. The default value of this parameter is [code]9.80665[/code].
#desc Constant to set/get gravity vector/center in an area. The default value of this parameter is [code]Vector2(0, -1)[/code].
#desc Constant to set/get whether the gravity vector of an area is a direction, or a center point. The default value of this parameter is [code]false[/code].
#desc Constant to set/get the distance at which the gravity strength is equal to the gravity controlled by [constant AREA_PARAM_GRAVITY]. For example, on a planet 100 pixels in radius with a surface gravity of 4.0 px/s², set the gravity to 4.0 and the unit distance to 100.0. The gravity will have falloff according to the inverse square law, so in the example, at 200 pixels from the center the gravity will be 1.0 px/s² (twice the distance, 1/4th the gravity), at 50 pixels it will be 16.0 px/s² (half the distance, 4x the gravity), and so on.
#desc The above is true only when the unit distance is a positive number. When the unit distance is set to 0.0, the gravity will be constant regardless of distance. The default value of this parameter is [code]0.0[/code].
#desc Constant to set/get linear damping override mode in an area. See [enum AreaSpaceOverrideMode] for possible values. The default value of this parameter is [constant AREA_SPACE_OVERRIDE_DISABLED].
#desc Constant to set/get the linear damping factor of an area. The default value of this parameter is [code]0.1[/code].
#desc Constant to set/get angular damping override mode in an area. See [enum AreaSpaceOverrideMode] for possible values. The default value of this parameter is [constant AREA_SPACE_OVERRIDE_DISABLED].
#desc Constant to set/get the angular damping factor of an area. The default value of this parameter is [code]1.0[/code].
#desc Constant to set/get the priority (order of processing) of an area. The default value of this parameter is [code]0[/code].
#desc This area does not affect gravity/damp. These are generally areas that exist only to detect collisions, and objects entering or exiting them.
#desc This area adds its gravity/damp values to whatever has been calculated so far. This way, many overlapping areas can combine their physics to make interesting effects.
#desc This area adds its gravity/damp values to whatever has been calculated so far. Then stops taking into account the rest of the areas, even the default one.
#desc This area replaces any gravity/damp, even the default one, and stops taking into account the rest of the areas.
#desc This area replaces any gravity/damp calculated so far, but keeps calculating the rest of the areas, down to the default one.
#desc Constant for static bodies. In this mode, a body can be only moved by user code and doesn't collide with other bodies along its path when moved.
#desc Constant for kinematic bodies. In this mode, a body can be only moved by user code and collides with other bodies along its path.
#desc Constant for rigid bodies. In this mode, a body can be pushed by other bodies and has forces applied.
#desc Constant for linear rigid bodies. In this mode, a body can not rotate, and only its linear velocity is affected by external forces.
#desc Constant to set/get a body's bounce factor. The default value of this parameter is [code]0.0[/code].
#desc Constant to set/get a body's friction. The default value of this parameter is [code]1.0[/code].
#desc Constant to set/get a body's mass. The default value of this parameter is [code]1.0[/code]. If the body's mode is set to [constant BODY_MODE_RIGID], then setting this parameter will have the following additional effects:
#desc - If the parameter [constant BODY_PARAM_CENTER_OF_MASS] has never been set explicitly, then the value of that parameter will be recalculated based on the body's shapes.
#desc - If the parameter [constant BODY_PARAM_INERTIA] is set to a value [code]<= 0.0[/code], then the value of that parameter will be recalculated based on the body's shapes, mass, and center of mass.
#desc Constant to set/get a body's inertia. The default value of this parameter is [code]0.0[/code]. If the body's inertia is set to a value [code]<= 0.0[/code], then the inertia will be recalculated based on the body's shapes, mass, and center of mass.
#desc Constant to set/get a body's center of mass position in the body's local coordinate system. The default value of this parameter is [code]Vector2(0,0)[/code]. If this parameter is never set explicitly, then it is recalculated based on the body's shapes when setting the parameter [constant BODY_PARAM_MASS] or when calling [method body_set_space].
#desc Constant to set/get a body's gravity multiplier. The default value of this parameter is [code]1.0[/code].
#desc Constant to set/get a body's linear damping mode. See [enum BodyDampMode] for possible values. The default value of this parameter is [constant BODY_DAMP_MODE_COMBINE].
#desc Constant to set/get a body's angular damping mode. See [enum BodyDampMode] for possible values. The default value of this parameter is [constant BODY_DAMP_MODE_COMBINE].
#desc Constant to set/get a body's linear damping factor. The default value of this parameter is [code]0.0[/code].
#desc Constant to set/get a body's angular damping factor. The default value of this parameter is [code]0.0[/code].
#desc Represents the size of the [enum BodyParameter] enum.
#desc The body's damping value is added to any value set in areas or the default value.
#desc The body's damping value replaces any value set in areas or the default value.
#desc Constant to set/get the current transform matrix of the body.
#desc Constant to set/get the current linear velocity of the body.
#desc Constant to set/get the current angular velocity of the body.
#desc Constant to sleep/wake up a body, or to get whether it is sleeping.
#desc Constant to set/get whether the body can sleep.
#desc Constant to create pin joints.
#desc Constant to create groove joints.
#desc Constant to create damped spring joints.
#desc Represents the size of the [enum JointType] enum.
#desc Constant to set/get how fast the joint pulls the bodies back to satisfy the joint constraint. The lower the value, the more the two bodies can pull on the joint. The default value of this parameter is [code]0.0[/code].
#desc [b]Note:[/b] In Godot Physics, this parameter is only used for pin joints and groove joints.
#desc Constant to set/get the maximum speed with which the joint can apply corrections. The default value of this parameter is [code]3.40282e+38[/code].
#desc [b]Note:[/b] In Godot Physics, this parameter is only used for groove joints.
#desc Constant to set/get the maximum force that the joint can use to act on the two bodies. The default value of this parameter is [code]3.40282e+38[/code].
#desc [b]Note:[/b] In Godot Physics, this parameter is only used for groove joints.
#desc Constant to set/get a how much the bond of the pin joint can flex. The default value of this parameter is [code]0.0[/code].
#desc Sets the resting length of the spring joint. The joint will always try to go to back this length when pulled apart. The default value of this parameter is the distance between the joint's anchor points.
#desc Sets the stiffness of the spring joint. The joint applies a force equal to the stiffness times the distance from its resting length. The default value of this parameter is [code]20.0[/code].
#desc Sets the damping ratio of the spring joint. A value of 0 indicates an undamped spring, while 1 causes the system to reach equilibrium as fast as possible (critical damping). The default value of this parameter is [code]1.5[/code].
#desc Disables continuous collision detection. This is the fastest way to detect body collisions, but it can miss small and/or fast-moving objects.
#desc Enables continuous collision detection by raycasting. It is faster than shapecasting, but less precise.
#desc Enables continuous collision detection by shapecasting. It is the slowest CCD method, and the most precise.
#desc The value of the first parameter and area callback function receives, when an object enters one of its shapes.
#desc The value of the first parameter and area callback function receives, when an object exits one of its shapes.
#desc Constant to get the number of objects that are not sleeping.
#desc Constant to get the number of possible collisions.
#desc Constant to get the number of space regions where a collision could occur.

#enum SpaceParameter
enum {
    SPACE_PARAM_CONTACT_RECYCLE_RADIUS = 0,
    SPACE_PARAM_CONTACT_MAX_SEPARATION = 1,
    SPACE_PARAM_CONTACT_MAX_ALLOWED_PENETRATION = 2,
    SPACE_PARAM_CONTACT_DEFAULT_BIAS = 3,
    SPACE_PARAM_BODY_LINEAR_VELOCITY_SLEEP_THRESHOLD = 4,
    SPACE_PARAM_BODY_ANGULAR_VELOCITY_SLEEP_THRESHOLD = 5,
    SPACE_PARAM_BODY_TIME_TO_SLEEP = 6,
    SPACE_PARAM_CONSTRAINT_DEFAULT_BIAS = 7,
    SPACE_PARAM_SOLVER_ITERATIONS = 8,
}
#enum ShapeType
enum {
    SHAPE_WORLD_BOUNDARY = 0,
    SHAPE_SEPARATION_RAY = 1,
    SHAPE_SEGMENT = 2,
    SHAPE_CIRCLE = 3,
    SHAPE_RECTANGLE = 4,
    SHAPE_CAPSULE = 5,
    SHAPE_CONVEX_POLYGON = 6,
    SHAPE_CONCAVE_POLYGON = 7,
    SHAPE_CUSTOM = 8,
}
#enum AreaParameter
enum {
    AREA_PARAM_GRAVITY_OVERRIDE_MODE = 0,
    AREA_PARAM_GRAVITY = 1,
    AREA_PARAM_GRAVITY_VECTOR = 2,
    AREA_PARAM_GRAVITY_IS_POINT = 3,
    AREA_PARAM_GRAVITY_POINT_UNIT_DISTANCE = 4,
    AREA_PARAM_LINEAR_DAMP_OVERRIDE_MODE = 5,
    AREA_PARAM_LINEAR_DAMP = 6,
    AREA_PARAM_ANGULAR_DAMP_OVERRIDE_MODE = 7,
    AREA_PARAM_ANGULAR_DAMP = 8,
    AREA_PARAM_PRIORITY = 9,
}
#enum AreaSpaceOverrideMode
enum {
    AREA_SPACE_OVERRIDE_DISABLED = 0,
    AREA_SPACE_OVERRIDE_COMBINE = 1,
    AREA_SPACE_OVERRIDE_COMBINE_REPLACE = 2,
    AREA_SPACE_OVERRIDE_REPLACE = 3,
    AREA_SPACE_OVERRIDE_REPLACE_COMBINE = 4,
}
#enum BodyMode
enum {
    BODY_MODE_STATIC = 0,
    BODY_MODE_KINEMATIC = 1,
    BODY_MODE_RIGID = 2,
    BODY_MODE_RIGID_LINEAR = 3,
}
#enum BodyParameter
enum {
    BODY_PARAM_BOUNCE = 0,
    BODY_PARAM_FRICTION = 1,
    BODY_PARAM_MASS = 2,
    BODY_PARAM_INERTIA = 3,
    BODY_PARAM_CENTER_OF_MASS = 4,
    BODY_PARAM_GRAVITY_SCALE = 5,
    BODY_PARAM_LINEAR_DAMP_MODE = 6,
    BODY_PARAM_ANGULAR_DAMP_MODE = 7,
    BODY_PARAM_LINEAR_DAMP = 8,
    BODY_PARAM_ANGULAR_DAMP = 9,
    BODY_PARAM_MAX = 10,
}
#enum BodyDampMode
enum {
    BODY_DAMP_MODE_COMBINE = 0,
    BODY_DAMP_MODE_REPLACE = 1,
}
#enum BodyState
enum {
    BODY_STATE_TRANSFORM = 0,
    BODY_STATE_LINEAR_VELOCITY = 1,
    BODY_STATE_ANGULAR_VELOCITY = 2,
    BODY_STATE_SLEEPING = 3,
    BODY_STATE_CAN_SLEEP = 4,
}
#enum JointType
enum {
    JOINT_TYPE_PIN = 0,
    JOINT_TYPE_GROOVE = 1,
    JOINT_TYPE_DAMPED_SPRING = 2,
    JOINT_TYPE_MAX = 3,
}
#enum JointParam
enum {
    JOINT_PARAM_BIAS = 0,
    JOINT_PARAM_MAX_BIAS = 1,
    JOINT_PARAM_MAX_FORCE = 2,
}
#enum PinJointParam
enum {
    PIN_JOINT_SOFTNESS = 0,
}
#enum DampedSpringParam
enum {
    DAMPED_SPRING_REST_LENGTH = 0,
    DAMPED_SPRING_STIFFNESS = 1,
    DAMPED_SPRING_DAMPING = 2,
}
#enum CCDMode
enum {
    CCD_MODE_DISABLED = 0,
    CCD_MODE_CAST_RAY = 1,
    CCD_MODE_CAST_SHAPE = 2,
}
#enum AreaBodyStatus
enum {
    AREA_BODY_ADDED = 0,
    AREA_BODY_REMOVED = 1,
}
#enum ProcessInfo
enum {
    INFO_ACTIVE_OBJECTS = 0,
    INFO_COLLISION_PAIRS = 1,
    INFO_ISLAND_COUNT = 2,
}


#desc Adds a shape to the area, with the given local transform. The shape (together with its [param transform] and [param disabled] properties) is added to an array of shapes, and the shapes of an area are usually referenced by their index in this array.
func area_add_shape(area: RID, shape: RID, transform: Transform2D = Transform2D(1, 0, 0, 1, 0, 0), disabled: bool = false) -> void:
	pass;

#desc Attaches the [code]ObjectID[/code] of a canvas to the area. Use [method Object.get_instance_id] to get the [code]ObjectID[/code] of a [CanvasLayer].
func area_attach_canvas_instance_id(area: RID, id: int) -> void:
	pass;

#desc Attaches the [code]ObjectID[/code] of an [Object] to the area. Use [method Object.get_instance_id] to get the [code]ObjectID[/code] of a [CollisionObject2D].
func area_attach_object_instance_id(area: RID, id: int) -> void:
	pass;

#desc Removes all shapes from the area. This does not delete the shapes themselves, so they can continue to be used elsewhere or added back later.
func area_clear_shapes(area: RID) -> void:
	pass;

#desc Creates a 2D area object in the physics server, and returns the [RID] that identifies it. Use [method area_add_shape] to add shapes to it, use [method area_set_transform] to set its transform, and use [method area_set_space] to add the area to a space.
func area_create() -> RID:
	pass;

#desc Returns the [code]ObjectID[/code] of the canvas attached to the area. Use [method @GlobalScope.instance_from_id] to retrieve a [CanvasLayer] from a nonzero [code]ObjectID[/code].
func area_get_canvas_instance_id(area: RID) -> int:
	pass;

#desc Returns the physics layer or layers the area belongs to, as a bitmask.
func area_get_collision_layer(area: RID) -> int:
	pass;

#desc Returns the physics layer or layers the area can contact with, as a bitmask.
func area_get_collision_mask(area: RID) -> int:
	pass;

#desc Returns the [code]ObjectID[/code] attached to the area. Use [method @GlobalScope.instance_from_id] to retrieve an [Object] from a nonzero [code]ObjectID[/code].
func area_get_object_instance_id(area: RID) -> int:
	pass;

#desc Returns the value of the given area parameter. See [enum AreaParameter] for the list of available parameters.
func area_get_param(area: RID, param: int) -> Variant:
	pass;

#desc Returns the [RID] of the shape with the given index in the area's array of shapes.
func area_get_shape(area: RID, shape_idx: int) -> RID:
	pass;

#desc Returns the number of shapes added to the area.
func area_get_shape_count(area: RID) -> int:
	pass;

#desc Returns the local transform matrix of the shape with the given index in the area's array of shapes.
func area_get_shape_transform(area: RID, shape_idx: int) -> Transform2D:
	pass;

#desc Returns the [RID] of the space assigned to the area. Returns [code]RID()[/code] if no space is assigned.
func area_get_space(area: RID) -> RID:
	pass;

#desc Returns the transform matrix of the area.
func area_get_transform(area: RID) -> Transform2D:
	pass;

#desc Removes the shape with the given index from the area's array of shapes. The shape itself is not deleted, so it can continue to be used elsewhere or added back later. As a result of this operation, the area's shapes which used to have indices higher than [param shape_idx] will have their index decreased by one.
func area_remove_shape(area: RID, shape_idx: int) -> void:
	pass;

#desc Sets the area's area monitor callback. This callback will be called when any other (shape of an) area enters or exits (a shape of) the given area, and must take the following five parameters:
#desc 1. an integer [code]status[/code]: either [constant AREA_BODY_ADDED] or [constant AREA_BODY_REMOVED] depending on whether the other area's shape entered or exited the area,
#desc 2. an [RID] [code]area_rid[/code]: the [RID] of the other area that entered or exited the area,
#desc 3. an integer [code]instance_id[/code]: the [code]ObjectID[/code] attached to the other area,
#desc 4. an integer [code]area_shape_idx[/code]: the index of the shape of the other area that entered or exited the area,
#desc 5. an integer [code]self_shape_idx[/code]: the index of the shape of the area where the other area entered or exited.
#desc By counting (or keeping track of) the shapes that enter and exit, it can be determined if an area (with all its shapes) is entering for the first time or exiting for the last time.
func area_set_area_monitor_callback(area: RID, callback: Callable) -> void:
	pass;

#desc Assigns the area to one or many physics layers, via a bitmask.
func area_set_collision_layer(area: RID, layer: int) -> void:
	pass;

#desc Sets which physics layers the area will monitor, via a bitmask.
func area_set_collision_mask(area: RID, mask: int) -> void:
	pass;

#desc Sets the area's body monitor callback. This callback will be called when any other (shape of a) body enters or exits (a shape of) the given area, and must take the following five parameters:
#desc 1. an integer [code]status[/code]: either [constant AREA_BODY_ADDED] or [constant AREA_BODY_REMOVED] depending on whether the other body shape entered or exited the area,
#desc 2. an [RID] [code]body_rid[/code]: the [RID] of the body that entered or exited the area,
#desc 3. an integer [code]instance_id[/code]: the [code]ObjectID[/code] attached to the body,
#desc 4. an integer [code]body_shape_idx[/code]: the index of the shape of the body that entered or exited the area,
#desc 5. an integer [code]self_shape_idx[/code]: the index of the shape of the area where the body entered or exited.
#desc By counting (or keeping track of) the shapes that enter and exit, it can be determined if a body (with all its shapes) is entering for the first time or exiting for the last time.
func area_set_monitor_callback(area: RID, callback: Callable) -> void:
	pass;

#desc Sets whether the area is monitorable or not. If [param monitorable] is [code]true[/code], the area monitoring callback of other areas will be called when this area enters or exits them.
func area_set_monitorable(area: RID, monitorable: bool) -> void:
	pass;

#desc Sets the value of the given area parameter. See [enum AreaParameter] for the list of available parameters.
func area_set_param(area: RID, param: int, value: Variant) -> void:
	pass;

#desc Replaces the area's shape at the given index by another shape, while not affecting the [code]transform[/code] and [code]disabled[/code] properties at the same index.
func area_set_shape(area: RID, shape_idx: int, shape: RID) -> void:
	pass;

#desc Sets the disabled property of the area's shape with the given index. If [param disabled] is [code]true[/code], then the shape will not detect any other shapes entering or exiting it.
func area_set_shape_disabled(area: RID, shape_idx: int, disabled: bool) -> void:
	pass;

#desc Sets the local transform matrix of the area's shape with the given index.
func area_set_shape_transform(area: RID, shape_idx: int, transform: Transform2D) -> void:
	pass;

#desc Adds the area to the given space, after removing the area from the previously assigned space (if any).
#desc [b]Note:[/b] To remove an area from a space without immediately adding it back elsewhere, use [code]PhysicsServer2D.area_set_space(area, RID())[/code].
func area_set_space(area: RID, space: RID) -> void:
	pass;

#desc Sets the transform matrix of the area.
func area_set_transform(area: RID, transform: Transform2D) -> void:
	pass;

#desc Adds [param excepted_body] to the body's list of collision exceptions, so that collisions with it are ignored.
func body_add_collision_exception(body: RID, excepted_body: RID) -> void:
	pass;

#desc Adds a constant directional force to the body. The force does not affect rotation. The force remains applied over time until cleared with [code]PhysicsServer2D.body_set_constant_force(body, Vector2(0, 0))[/code].
#desc This is equivalent to using [method body_add_constant_force] at the body's center of mass.
func body_add_constant_central_force(body: RID, force: Vector2) -> void:
	pass;

#desc Adds a constant positioned force to the body. The force can affect rotation if [param position] is different from the body's center of mass. The force remains applied over time until cleared with [code]PhysicsServer2D.body_set_constant_force(body, Vector2(0, 0))[/code].
#desc [param position] is the offset from the body origin in global coordinates.
func body_add_constant_force(body: RID, force: Vector2, position: Vector2 = Vector2(0, 0)) -> void:
	pass;

#desc Adds a constant rotational force to the body. The force does not affect position. The force remains applied over time until cleared with [code]PhysicsServer2D.body_set_constant_torque(body, 0)[/code].
func body_add_constant_torque(body: RID, torque: float) -> void:
	pass;

#desc Adds a shape to the area, with the given local transform. The shape (together with its [param transform] and [param disabled] properties) is added to an array of shapes, and the shapes of a body are usually referenced by their index in this array.
func body_add_shape(body: RID, shape: RID, transform: Transform2D = Transform2D(1, 0, 0, 1, 0, 0), disabled: bool = false) -> void:
	pass;

#desc Applies a directional force to the body, at the body's center of mass. The force does not affect rotation. A force is time dependent and meant to be applied every physics update.
#desc This is equivalent to using [method body_apply_force] at the body's center of mass.
func body_apply_central_force(body: RID, force: Vector2) -> void:
	pass;

#desc Applies a directional impulse to the body, at the body's center of mass. The impulse does not affect rotation.
#desc An impulse is time-independent! Applying an impulse every frame would result in a framerate-dependent force. For this reason, it should only be used when simulating one-time impacts (use the "_force" functions otherwise).
#desc This is equivalent to using [method body_apply_impulse] at the body's center of mass.
func body_apply_central_impulse(body: RID, impulse: Vector2) -> void:
	pass;

#desc Applies a positioned force to the body. The force can affect rotation if [param position] is different from the body's center of mass. A force is time dependent and meant to be applied every physics update.
#desc [param position] is the offset from the body origin in global coordinates.
func body_apply_force(body: RID, force: Vector2, position: Vector2 = Vector2(0, 0)) -> void:
	pass;

#desc Applies a positioned impulse to the body. The impulse can affect rotation if [param position] is different from the body's center of mass.
#desc An impulse is time-independent! Applying an impulse every frame would result in a framerate-dependent force. For this reason, it should only be used when simulating one-time impacts (use the "_force" functions otherwise).
#desc [param position] is the offset from the body origin in global coordinates.
func body_apply_impulse(body: RID, impulse: Vector2, position: Vector2 = Vector2(0, 0)) -> void:
	pass;

#desc Applies a rotational force to the body. The force does not affect position. A force is time dependent and meant to be applied every physics update.
func body_apply_torque(body: RID, torque: float) -> void:
	pass;

#desc Applies a rotational impulse to the body. The impulse does not affect position.
#desc An impulse is time-independent! Applying an impulse every frame would result in a framerate-dependent force. For this reason, it should only be used when simulating one-time impacts (use the "_force" functions otherwise).
func body_apply_torque_impulse(body: RID, impulse: float) -> void:
	pass;

#desc Attaches the [code]ObjectID[/code] of a canvas to the body. Use [method Object.get_instance_id] to get the [code]ObjectID[/code] of a [CanvasLayer].
func body_attach_canvas_instance_id(body: RID, id: int) -> void:
	pass;

#desc Attaches the [code]ObjectID[/code] of an [Object] to the body. Use [method Object.get_instance_id] to get the [code]ObjectID[/code] of a [CollisionObject2D].
func body_attach_object_instance_id(body: RID, id: int) -> void:
	pass;

#desc Removes all shapes from the body. This does not delete the shapes themselves, so they can continue to be used elsewhere or added back later.
func body_clear_shapes(body: RID) -> void:
	pass;

#desc Creates a 2D body object in the physics server, and returns the [RID] that identifies it. Use [method body_add_shape] to add shapes to it, use [method body_set_state] to set its transform, and use [method body_set_space] to add the body to a space.
func body_create() -> RID:
	pass;

#desc Returns the [code]ObjectID[/code] of the canvas attached to the body. Use [method @GlobalScope.instance_from_id] to retrieve a [CanvasLayer] from a nonzero [code]ObjectID[/code].
func body_get_canvas_instance_id(body: RID) -> int:
	pass;

#desc Returns the physics layer or layers the body belongs to, as a bitmask.
func body_get_collision_layer(body: RID) -> int:
	pass;

#desc Returns the physics layer or layers the body can collide with, as a bitmask.
func body_get_collision_mask(body: RID) -> int:
	pass;

#desc Returns the body's collision priority. This is used in the depenetration phase of [method body_test_motion]. The higher the priority is, the lower the penetration into the body will be.
func body_get_collision_priority(body: RID) -> float:
	pass;

#desc Returns the body's total constant positional force applied during each physics update.
#desc See [method body_add_constant_force] and [method body_add_constant_central_force].
func body_get_constant_force(body: RID) -> Vector2:
	pass;

#desc Returns the body's total constant rotational force applied during each physics update.
#desc See [method body_add_constant_torque].
func body_get_constant_torque(body: RID) -> float:
	pass;

#desc Returns the body's continuous collision detection mode (see [enum CCDMode]).
func body_get_continuous_collision_detection_mode(body: RID) -> int:
	pass;

#desc Returns the [PhysicsDirectBodyState2D] of the body. Returns [code]null[/code] if the body is destroyed or not assigned to a space.
func body_get_direct_state(body: RID) -> PhysicsDirectBodyState2D:
	pass;

#desc Returns the maximum number of contacts that the body can report. See [method body_set_max_contacts_reported].
func body_get_max_contacts_reported(body: RID) -> int:
	pass;

#desc Returns the body's mode (see [enum BodyMode]).
func body_get_mode(body: RID) -> int:
	pass;

#desc Returns the [code]ObjectID[/code] attached to the body. Use [method @GlobalScope.instance_from_id] to retrieve an [Object] from a nonzero [code]ObjectID[/code].
func body_get_object_instance_id(body: RID) -> int:
	pass;

#desc Returns the value of the given body parameter. See [enum BodyParameter] for the list of available parameters.
func body_get_param(body: RID, param: int) -> Variant:
	pass;

#desc Returns the [RID] of the shape with the given index in the body's array of shapes.
func body_get_shape(body: RID, shape_idx: int) -> RID:
	pass;

#desc Returns the number of shapes added to the body.
func body_get_shape_count(body: RID) -> int:
	pass;

#desc Returns the local transform matrix of the shape with the given index in the area's array of shapes.
func body_get_shape_transform(body: RID, shape_idx: int) -> Transform2D:
	pass;

#desc Returns the [RID] of the space assigned to the body. Returns [code]RID()[/code] if no space is assigned.
func body_get_space(body: RID) -> RID:
	pass;

#desc Returns the value of the given state of the body. See [enum BodyState] for the list of available states.
func body_get_state(body: RID, state: int) -> Variant:
	pass;

#desc Returns [code]true[/code] if the body uses a callback function to calculate its own physics (see [method body_set_force_integration_callback]).
func body_is_omitting_force_integration(body: RID) -> bool:
	pass;

#desc Removes [param excepted_body] from the body's list of collision exceptions, so that collisions with it are no longer ignored.
func body_remove_collision_exception(body: RID, excepted_body: RID) -> void:
	pass;

#desc Removes the shape with the given index from the body's array of shapes. The shape itself is not deleted, so it can continue to be used elsewhere or added back later. As a result of this operation, the body's shapes which used to have indices higher than [param shape_idx] will have their index decreased by one.
func body_remove_shape(body: RID, shape_idx: int) -> void:
	pass;

#desc Restores the default inertia and center of mass of the body based on its shapes. This undoes any custom values previously set using [method body_set_param].
func body_reset_mass_properties(body: RID) -> void:
	pass;

#desc Modifies the body's linear velocity so that its projection to the axis [code]axis_velocity.normalized()[/code] is exactly [code]axis_velocity.length()[/code]. This is useful for jumping behavior.
func body_set_axis_velocity(body: RID, axis_velocity: Vector2) -> void:
	pass;

#desc Sets the physics layer or layers the body belongs to, via a bitmask.
func body_set_collision_layer(body: RID, layer: int) -> void:
	pass;

#desc Sets the physics layer or layers the body can collide with, via a bitmask.
func body_set_collision_mask(body: RID, mask: int) -> void:
	pass;

#desc Sets the body's collision priority. This is used in the depenetration phase of [method body_test_motion]. The higher the priority is, the lower the penetration into the body will be.
func body_set_collision_priority(body: RID, priority: float) -> void:
	pass;

#desc Sets the body's total constant positional force applied during each physics update.
#desc See [method body_add_constant_force] and [method body_add_constant_central_force].
func body_set_constant_force(body: RID, force: Vector2) -> void:
	pass;

#desc Sets the body's total constant rotational force applied during each physics update.
#desc See [method body_add_constant_torque].
func body_set_constant_torque(body: RID, torque: float) -> void:
	pass;

#desc Sets the continuous collision detection mode using one of the [enum CCDMode] constants.
#desc Continuous collision detection tries to predict where a moving body would collide in between physics updates, instead of moving it and correcting its movement if it collided.
func body_set_continuous_collision_detection_mode(body: RID, mode: int) -> void:
	pass;

#desc Sets the function used to calculate physics for the body, if that body allows it (see [method body_set_omit_force_integration]).
#desc The force integration function takes the following two parameters:
#desc 1. a [PhysicsDirectBodyState2D] [code]state[/code]: used to retrieve and modify the body's state,
#desc 2. a [Variant] [code]userdata[/code]: optional user data.
#desc [b]Note:[/b] This callback is currently not called in Godot Physics.
func body_set_force_integration_callback(body: RID, callable: Callable, userdata: Variant = null) -> void:
	pass;

#desc Sets the maximum number of contacts that the body can report. If [param amount] is greater than zero, then the body will keep track of at most this many contacts with other bodies.
func body_set_max_contacts_reported(body: RID, amount: int) -> void:
	pass;

#desc Sets the body's mode. See [enum BodyMode] for the list of available modes.
func body_set_mode(body: RID, mode: int) -> void:
	pass;

#desc Sets whether the body uses a callback function to calculate its own physics (see [method body_set_force_integration_callback]).
func body_set_omit_force_integration(body: RID, enable: bool) -> void:
	pass;

#desc Sets the value of the given body parameter. See [enum BodyParameter] for the list of available parameters.
func body_set_param(body: RID, param: int, value: Variant) -> void:
	pass;

#desc Replaces the body's shape at the given index by another shape, while not affecting the [code]transform[/code], [code]disabled[/code], and one-way collision properties at the same index.
func body_set_shape(body: RID, shape_idx: int, shape: RID) -> void:
	pass;

#desc Sets the one-way collision properties of the body's shape with the given index. If [param enable] is [code]true[/code], the one-way collision direction given by the shape's local upward axis [code]body_get_shape_transform(body, shape_idx).y[/code] will be used to ignore collisions with the shape in the opposite direction, and to ensure depenetration of kinematic bodies happens in this direction.
func body_set_shape_as_one_way_collision(body: RID, shape_idx: int, enable: bool, margin: float) -> void:
	pass;

#desc Sets the disabled property of the body's shape with the given index. If [param disabled] is [code]true[/code], then the shape will be ignored in all collision detection.
func body_set_shape_disabled(body: RID, shape_idx: int, disabled: bool) -> void:
	pass;

#desc Sets the local transform matrix of the body's shape with the given index.
func body_set_shape_transform(body: RID, shape_idx: int, transform: Transform2D) -> void:
	pass;

#desc Adds the body to the given space, after removing the body from the previously assigned space (if any). If the body's mode is set to [constant BODY_MODE_RIGID], then adding the body to a space will have the following additional effects:
#desc - If the parameter [constant BODY_PARAM_CENTER_OF_MASS] has never been set explicitly, then the value of that parameter will be recalculated based on the body's shapes.
#desc - If the parameter [constant BODY_PARAM_INERTIA] is set to a value [code]<= 0.0[/code], then the value of that parameter will be recalculated based on the body's shapes, mass, and center of mass.
#desc [b]Note:[/b] To remove a body from a space without immediately adding it back elsewhere, use [code]PhysicsServer2D.body_set_space(body, RID())[/code].
func body_set_space(body: RID, space: RID) -> void:
	pass;

#desc Sets the value of a body's state. See [enum BodyState] for the list of available states.
#desc [b]Note:[/b] The state change doesn't take effect immediately. The state will change on the next physics frame.
func body_set_state(body: RID, state: int, value: Variant) -> void:
	pass;

#desc Returns [code]true[/code] if a collision would result from moving the body along a motion vector from a given point in space. See [PhysicsTestMotionParameters2D] for the available motion parameters. Optionally a [PhysicsTestMotionResult2D] object can be passed, which will be used to store the information about the resulting collision.
func body_test_motion(body: RID, parameters: PhysicsTestMotionParameters2D, result: PhysicsTestMotionResult2D = null) -> bool:
	pass;

#desc Creates a 2D capsule shape in the physics server, and returns the [RID] that identifies it. Use [method shape_set_data] to set the capsule's height and radius.
func capsule_shape_create() -> RID:
	pass;

#desc Creates a 2D circle shape in the physics server, and returns the [RID] that identifies it. Use [method shape_set_data] to set the circle's radius.
func circle_shape_create() -> RID:
	pass;

#desc Creates a 2D concave polygon shape in the physics server, and returns the [RID] that identifies it. Use [method shape_set_data] to set the concave polygon's segments.
func concave_polygon_shape_create() -> RID:
	pass;

#desc Creates a 2D convex polygon shape in the physics server, and returns the [RID] that identifies it. Use [method shape_set_data] to set the convex polygon's points.
func convex_polygon_shape_create() -> RID:
	pass;

#desc Returns the value of the given damped spring joint parameter. See [enum DampedSpringParam] for the list of available parameters.
func damped_spring_joint_get_param(joint: RID, param: int) -> float:
	pass;

#desc Sets the value of the given damped spring joint parameter. See [enum DampedSpringParam] for the list of available parameters.
func damped_spring_joint_set_param(joint: RID, param: int, value: float) -> void:
	pass;

#desc Destroys any of the objects created by PhysicsServer2D. If the [RID] passed is not one of the objects that can be created by PhysicsServer2D, an error will be printed to the console.
func free_rid(rid: RID) -> void:
	pass;

#desc Returns information about the current state of the 2D physics engine. See [enum ProcessInfo] for the list of available states.
func get_process_info(process_info: int) -> int:
	pass;

#desc Destroys the joint with the given [RID], creates a new uninitialized joint, and makes the [RID] refer to this new joint.
func joint_clear(joint: RID) -> void:
	pass;

#desc Creates a 2D joint in the physics server, and returns the [RID] that identifies it. To set the joint type, use [method joint_make_damped_spring], [method joint_make_groove] or [method joint_make_pin]. Use [method joint_set_param] to set generic joint parameters.
func joint_create() -> RID:
	pass;

#desc Sets whether the bodies attached to the [Joint2D] will collide with each other.
func joint_disable_collisions_between_bodies(joint: RID, disable: bool) -> void:
	pass;

#desc Returns the value of the given joint parameter. See [enum JointParam] for the list of available parameters.
func joint_get_param(joint: RID, param: int) -> float:
	pass;

#desc Returns the joint's type (see [enum JointType]).
func joint_get_type(joint: RID) -> int:
	pass;

#desc Returns whether the bodies attached to the [Joint2D] will collide with each other.
func joint_is_disabled_collisions_between_bodies(joint: RID) -> bool:
	pass;

#desc Makes the joint a damped spring joint, attached at the point [param anchor_a] (given in global coordinates) on the body [param body_a] and at the point [param anchor_b] (given in global coordinates) on the body [param body_b]. To set the parameters which are specific to the damped spring, see [method damped_spring_joint_set_param].
func joint_make_damped_spring(joint: RID, anchor_a: Vector2, anchor_b: Vector2, body_a: RID, body_b: RID) -> void:
	pass;

#desc Makes the joint a groove joint.
func joint_make_groove(joint: RID, groove1_a: Vector2, groove2_a: Vector2, anchor_b: Vector2, body_a: RID, body_b: RID) -> void:
	pass;

#desc Makes the joint a pin joint. If [param body_b] is [code]RID()[/code], then [param body_a] is pinned to the point [param anchor] (given in global coordinates); otherwise, [param body_a] is pinned to [param body_b] at the point [param anchor] (given in global coordinates). To set the parameters which are specific to the pin joint, see [method pin_joint_set_param].
func joint_make_pin(joint: RID, anchor: Vector2, body_a: RID, body_b: RID) -> void:
	pass;

#desc Sets the value of the given joint parameter. See [enum JointParam] for the list of available parameters.
func joint_set_param(joint: RID, param: int, value: float) -> void:
	pass;

#desc Returns the value of a pin joint parameter. See [enum PinJointParam] for a list of available parameters.
func pin_joint_get_param(joint: RID, param: int) -> float:
	pass;

#desc Sets a pin joint parameter. See [enum PinJointParam] for a list of available parameters.
func pin_joint_set_param(joint: RID, param: int, value: float) -> void:
	pass;

#desc Creates a 2D rectangle shape in the physics server, and returns the [RID] that identifies it. Use [method shape_set_data] to set the rectangle's half-extents.
func rectangle_shape_create() -> RID:
	pass;

#desc Creates a 2D segment shape in the physics server, and returns the [RID] that identifies it. Use [method shape_set_data] to set the segment's start and end points.
func segment_shape_create() -> RID:
	pass;

#desc Creates a 2D separation ray shape in the physics server, and returns the [RID] that identifies it. Use [method shape_set_data] to set the shape's [code]length[/code] and [code]slide_on_slope[/code] properties.
func separation_ray_shape_create() -> RID:
	pass;

#desc Activates or deactivates the 2D physics server. If [param active] is [code]false[/code], then the physics server will not do anything in its physics step.
func set_active(active: bool) -> void:
	pass;

#desc Returns the shape data that defines the configuration of the shape, such as the half-extents of a rectangle or the segments of a concave shape. See [method shape_set_data] for the precise format of this data in each case.
func shape_get_data(shape: RID) -> Variant:
	pass;

#desc Returns the shape's type (see [enum ShapeType]).
func shape_get_type(shape: RID) -> int:
	pass;

#desc Sets the shape data that defines the configuration of the shape. The [param data] to be passed depends on the shape's type (see [method shape_get_type]):
#desc - [constant SHAPE_WORLD_BOUNDARY]: an array of length two containing a [Vector2] [code]normal[/code] direction and a [code]float[/code] distance [code]d[/code],
#desc - [constant SHAPE_SEPARATION_RAY]: a dictionary containing the key [code]length[/code] with a [code]float[/code] value and the key [code]slide_on_slope[/code] with a [code]bool[/code] value,
#desc - [constant SHAPE_SEGMENT]: a [Rect2] [code]rect[/code] containing the first point of the segment in [code]rect.position[/code] and the second point of the segment in [code]rect.size[/code],
#desc - [constant SHAPE_CIRCLE]: a [code]float[/code] [code]radius[/code],
#desc - [constant SHAPE_RECTANGLE]: a [Vector2] [code]half_extents[/code],
#desc - [constant SHAPE_CAPSULE]: an array of length two (or a [Vector2]) containing a [code]float[/code] [code]height[/code] and a [code]float[/code] [code]radius[/code],
#desc - [constant SHAPE_CONVEX_POLYGON]: either a [PackedVector2Array] of points defining a convex polygon in counterclockwise order (the clockwise outward normal of each segment formed by consecutive points is calculated internally), or a [PackedFloat32Array] of length divisible by four so that every 4-tuple of [code]float[/code]s contains the coordinates of a point followed by the coordinates of the clockwise outward normal vector to the segment between the current point and the next point,
#desc - [constant SHAPE_CONCAVE_POLYGON]: a [PackedVector2Array] of length divisible by two (each pair of points forms one segment).
#desc [b]Warning[/b]: In the case of [constant SHAPE_CONVEX_POLYGON], this method does not check if the points supplied actually form a convex polygon (unlike the [member CollisionPolygon2D.polygon] property).
func shape_set_data(shape: RID, data: Variant) -> void:
	pass;

#desc Creates a 2D space in the physics server, and returns the [RID] that identifies it. A space contains bodies and areas, and controls the stepping of the physics simulation of the objects in it.
func space_create() -> RID:
	pass;

#desc Returns the state of a space, a [PhysicsDirectSpaceState2D]. This object can be used for collision/intersection queries.
func space_get_direct_state(space: RID) -> PhysicsDirectSpaceState2D:
	pass;

#desc Returns the value of the given space parameter. See [enum SpaceParameter] for the list of available parameters.
func space_get_param(space: RID, param: int) -> float:
	pass;

#desc Returns [code]true[/code] if the space is active.
func space_is_active(space: RID) -> bool:
	pass;

#desc Activates or deactivates the space. If [param active] is [code]false[/code], then the physics server will not do anything with this space in its physics step.
func space_set_active(space: RID, active: bool) -> void:
	pass;

#desc Sets the value of the given space parameter. See [enum SpaceParameter] for the list of available parameters.
func space_set_param(space: RID, param: int, value: float) -> void:
	pass;

#desc Creates a 2D world boundary shape in the physics server, and returns the [RID] that identifies it. Use [method shape_set_data] to set the shape's normal direction and distance properties.
func world_boundary_shape_create() -> RID:
	pass;


