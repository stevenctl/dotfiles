extends GeometryInstance3D
#brief CPU-based 3D particle emitter.
#desc CPU-based 3D particle node used to create a variety of particle systems and effects.
#desc See also [GPUParticles3D], which provides the same functionality with hardware acceleration, but may not run on older devices.
class_name CPUParticles3D

#desc Particles are drawn in the order emitted.
#desc Particles are drawn in order of remaining lifetime.
#desc Particles are drawn in order of depth.
#desc Use with [method set_param_min], [method set_param_max], and [method set_param_curve] to set initial velocity properties.
#desc Use with [method set_param_min], [method set_param_max], and [method set_param_curve] to set angular velocity properties.
#desc Use with [method set_param_min], [method set_param_max], and [method set_param_curve] to set orbital velocity properties.
#desc Use with [method set_param_min], [method set_param_max], and [method set_param_curve] to set linear acceleration properties.
#desc Use with [method set_param_min], [method set_param_max], and [method set_param_curve] to set radial acceleration properties.
#desc Use with [method set_param_min], [method set_param_max], and [method set_param_curve] to set tangential acceleration properties.
#desc Use with [method set_param_min], [method set_param_max], and [method set_param_curve] to set damping properties.
#desc Use with [method set_param_min], [method set_param_max], and [method set_param_curve] to set angle properties.
#desc Use with [method set_param_min], [method set_param_max], and [method set_param_curve] to set scale properties.
#desc Use with [method set_param_min], [method set_param_max], and [method set_param_curve] to set hue variation properties.
#desc Use with [method set_param_min], [method set_param_max], and [method set_param_curve] to set animation speed properties.
#desc Use with [method set_param_min], [method set_param_max], and [method set_param_curve] to set animation offset properties.
#desc Represents the size of the [enum Parameter] enum.
#desc Use with [method set_particle_flag] to set [member particle_flag_align_y].
#desc Use with [method set_particle_flag] to set [member particle_flag_rotate_y].
#desc Use with [method set_particle_flag] to set [member particle_flag_disable_z].
#desc Represents the size of the [enum ParticleFlags] enum.
#desc All particles will be emitted from a single point.
#desc Particles will be emitted in the volume of a sphere.
#desc Particles will be emitted on the surface of a sphere.
#desc Particles will be emitted in the volume of a box.
#desc Particles will be emitted at a position chosen randomly among [member emission_points]. Particle color will be modulated by [member emission_colors].
#desc Particles will be emitted at a position chosen randomly among [member emission_points]. Particle velocity and rotation will be set based on [member emission_normals]. Particle color will be modulated by [member emission_colors].
#desc Particles will be emitted in a ring or cylinder.
#desc Represents the size of the [enum EmissionShape] enum.

#enum DrawOrder
enum {
    DRAW_ORDER_INDEX = 0,
    DRAW_ORDER_LIFETIME = 1,
    DRAW_ORDER_VIEW_DEPTH = 2,
}
#enum Parameter
enum {
    PARAM_INITIAL_LINEAR_VELOCITY = 0,
    PARAM_ANGULAR_VELOCITY = 1,
    PARAM_ORBIT_VELOCITY = 2,
    PARAM_LINEAR_ACCEL = 3,
    PARAM_RADIAL_ACCEL = 4,
    PARAM_TANGENTIAL_ACCEL = 5,
    PARAM_DAMPING = 6,
    PARAM_ANGLE = 7,
    PARAM_SCALE = 8,
    PARAM_HUE_VARIATION = 9,
    PARAM_ANIM_SPEED = 10,
    PARAM_ANIM_OFFSET = 11,
    PARAM_MAX = 12,
}
#enum ParticleFlags
enum {
    PARTICLE_FLAG_ALIGN_Y_TO_VELOCITY = 0,
    PARTICLE_FLAG_ROTATE_Y = 1,
    PARTICLE_FLAG_DISABLE_Z = 2,
    PARTICLE_FLAG_MAX = 3,
}
#enum EmissionShape
enum {
    EMISSION_SHAPE_POINT = 0,
    EMISSION_SHAPE_SPHERE = 1,
    EMISSION_SHAPE_SPHERE_SURFACE = 2,
    EMISSION_SHAPE_BOX = 3,
    EMISSION_SHAPE_POINTS = 4,
    EMISSION_SHAPE_DIRECTED_POINTS = 5,
    EMISSION_SHAPE_RING = 6,
    EMISSION_SHAPE_MAX = 7,
}
#desc Number of particles emitted in one emission cycle.
var amount: int:
	get = get_amount, set = set_amount

#desc Each particle's rotation will be animated along this [Curve].
var angle_curve: Curve:
	get = get_param_curve, set = set_param_curve

#desc Maximum angle.
var angle_max: float:
	get = get_param_max, set = set_param_max

#desc Minimum angle.
var angle_min: float:
	get = get_param_min, set = set_param_min

#desc Each particle's angular velocity (rotation speed) will vary along this [Curve] over its lifetime.
var angular_velocity_curve: Curve:
	get = get_param_curve, set = set_param_curve

#desc Maximum initial angular velocity (rotation speed) applied to each particle in [i]degrees[/i] per second.
var angular_velocity_max: float:
	get = get_param_max, set = set_param_max

#desc Minimum initial angular velocity (rotation speed) applied to each particle in [i]degrees[/i] per second.
var angular_velocity_min: float:
	get = get_param_min, set = set_param_min

#desc Each particle's animation offset will vary along this [Curve].
var anim_offset_curve: Curve:
	get = get_param_curve, set = set_param_curve

#desc Maximum animation offset.
var anim_offset_max: float:
	get = get_param_max, set = set_param_max

#desc Minimum animation offset.
var anim_offset_min: float:
	get = get_param_min, set = set_param_min

#desc Each particle's animation speed will vary along this [Curve].
var anim_speed_curve: Curve:
	get = get_param_curve, set = set_param_curve

#desc Maximum particle animation speed.
var anim_speed_max: float:
	get = get_param_max, set = set_param_max

#desc Minimum particle animation speed.
var anim_speed_min: float:
	get = get_param_min, set = set_param_min

#desc Each particle's initial color.
#desc [b]Note:[/b] [member color] multiplies the particle mesh's vertex colors. To have a visible effect on a [BaseMaterial3D], [member BaseMaterial3D.vertex_color_use_as_albedo] [i]must[/i] be [code]true[/code]. For a [ShaderMaterial], [code]ALBEDO *= COLOR.rgb;[/code] must be inserted in the shader's [code]fragment()[/code] function. Otherwise, [member color] will have no visible effect.
var color: Color:
	get = get_color, set = set_color

#desc Each particle's initial color will vary along this [GradientTexture1D] (multiplied with [member color]).
#desc [b]Note:[/b] [member color_initial_ramp] multiplies the particle mesh's vertex colors. To have a visible effect on a [BaseMaterial3D], [member BaseMaterial3D.vertex_color_use_as_albedo] [i]must[/i] be [code]true[/code]. For a [ShaderMaterial], [code]ALBEDO *= COLOR.rgb;[/code] must be inserted in the shader's [code]fragment()[/code] function. Otherwise, [member color_initial_ramp] will have no visible effect.
var color_initial_ramp: Gradient:
	get = get_color_initial_ramp, set = set_color_initial_ramp

#desc Each particle's color will vary along this [GradientTexture1D] over its lifetime (multiplied with [member color]).
#desc [b]Note:[/b] [member color_ramp] multiplies the particle mesh's vertex colors. To have a visible effect on a [BaseMaterial3D], [member BaseMaterial3D.vertex_color_use_as_albedo] [i]must[/i] be [code]true[/code]. For a [ShaderMaterial], [code]ALBEDO *= COLOR.rgb;[/code] must be inserted in the shader's [code]fragment()[/code] function. Otherwise, [member color_ramp] will have no visible effect.
var color_ramp: Gradient:
	get = get_color_ramp, set = set_color_ramp

#desc Damping will vary along this [Curve].
var damping_curve: Curve:
	get = get_param_curve, set = set_param_curve

#desc Maximum damping.
var damping_max: float:
	get = get_param_max, set = set_param_max

#desc Minimum damping.
var damping_min: float:
	get = get_param_min, set = set_param_min

#desc Unit vector specifying the particles' emission direction.
var direction: Vector3:
	get = get_direction, set = set_direction

#desc Particle draw order. Uses [enum DrawOrder] values.
var draw_order: int:
	get = get_draw_order, set = set_draw_order

#desc The rectangle's extents if [member emission_shape] is set to [constant EMISSION_SHAPE_BOX].
var emission_box_extents: Vector3:
	get = get_emission_box_extents, set = set_emission_box_extents

#desc Sets the [Color]s to modulate particles by when using [constant EMISSION_SHAPE_POINTS] or [constant EMISSION_SHAPE_DIRECTED_POINTS].
#desc [b]Note:[/b] [member emission_colors] multiplies the particle mesh's vertex colors. To have a visible effect on a [BaseMaterial3D], [member BaseMaterial3D.vertex_color_use_as_albedo] [i]must[/i] be [code]true[/code]. For a [ShaderMaterial], [code]ALBEDO *= COLOR.rgb;[/code] must be inserted in the shader's [code]fragment()[/code] function. Otherwise, [member emission_colors] will have no visible effect.
var emission_colors: PackedColorArray:
	get = get_emission_colors, set = set_emission_colors

#desc Sets the direction the particles will be emitted in when using [constant EMISSION_SHAPE_DIRECTED_POINTS].
var emission_normals: PackedVector3Array:
	get = get_emission_normals, set = set_emission_normals

#desc Sets the initial positions to spawn particles when using [constant EMISSION_SHAPE_POINTS] or [constant EMISSION_SHAPE_DIRECTED_POINTS].
var emission_points: PackedVector3Array:
	get = get_emission_points, set = set_emission_points

#desc The axis of the ring when using the emitter [constant EMISSION_SHAPE_RING].
var emission_ring_axis: Vector3:
	get = get_emission_ring_axis, set = set_emission_ring_axis

#desc The height of the ring when using the emitter [constant EMISSION_SHAPE_RING].
var emission_ring_height: float:
	get = get_emission_ring_height, set = set_emission_ring_height

#desc The inner radius of the ring when using the emitter [constant EMISSION_SHAPE_RING].
var emission_ring_inner_radius: float:
	get = get_emission_ring_inner_radius, set = set_emission_ring_inner_radius

#desc The radius of the ring when using the emitter [constant EMISSION_SHAPE_RING].
var emission_ring_radius: float:
	get = get_emission_ring_radius, set = set_emission_ring_radius

#desc Particles will be emitted inside this region. See [enum EmissionShape] for possible values.
var emission_shape: int:
	get = get_emission_shape, set = set_emission_shape

#desc The sphere's radius if [enum EmissionShape] is set to [constant EMISSION_SHAPE_SPHERE].
var emission_sphere_radius: float:
	get = get_emission_sphere_radius, set = set_emission_sphere_radius

#desc If [code]true[/code], particles are being emitted.
var emitting: bool:
	get = is_emitting, set = set_emitting

#desc How rapidly particles in an emission cycle are emitted. If greater than [code]0[/code], there will be a gap in emissions before the next cycle begins.
var explosiveness: float:
	get = get_explosiveness_ratio, set = set_explosiveness_ratio

#desc The particle system's frame rate is fixed to a value. For example, changing the value to 2 will make the particles render at 2 frames per second. Note this does not slow down the particle system itself.
var fixed_fps: int:
	get = get_fixed_fps, set = set_fixed_fps

#desc Amount of [member spread] in Y/Z plane. A value of [code]1[/code] restricts particles to X/Z plane.
var flatness: float:
	get = get_flatness, set = set_flatness

#desc If [code]true[/code], results in fractional delta calculation which has a smoother particles display effect.
var fract_delta: bool:
	get = get_fractional_delta, set = set_fractional_delta

#desc Gravity applied to every particle.
var gravity: Vector3:
	get = get_gravity, set = set_gravity

#desc Each particle's hue will vary along this [Curve].
var hue_variation_curve: Curve:
	get = get_param_curve, set = set_param_curve

#desc Maximum hue variation.
var hue_variation_max: float:
	get = get_param_max, set = set_param_max

#desc Minimum hue variation.
var hue_variation_min: float:
	get = get_param_min, set = set_param_min

#desc Maximum value of the initial velocity.
var initial_velocity_max: float:
	get = get_param_max, set = set_param_max

#desc Minimum value of the initial velocity.
var initial_velocity_min: float:
	get = get_param_min, set = set_param_min

#desc Amount of time each particle will exist.
var lifetime: float:
	get = get_lifetime, set = set_lifetime

#desc Particle lifetime randomness ratio.
var lifetime_randomness: float:
	get = get_lifetime_randomness, set = set_lifetime_randomness

#desc Each particle's linear acceleration will vary along this [Curve].
var linear_accel_curve: Curve:
	get = get_param_curve, set = set_param_curve

#desc Maximum linear acceleration.
var linear_accel_max: float:
	get = get_param_max, set = set_param_max

#desc Minimum linear acceleration.
var linear_accel_min: float:
	get = get_param_min, set = set_param_min

#desc If [code]true[/code], particles use the parent node's coordinate space (known as local coordinates). This will cause particles to move and rotate along the [CPUParticles3D] node (and its parents) when it is moved or rotated. If [code]false[/code], particles use global coordinates; they will not move or rotate along the [CPUParticles3D] node (and its parents) when it is moved or rotated.
var local_coords: bool:
	get = get_use_local_coordinates, set = set_use_local_coordinates

#desc The [Mesh] used for each particle. If [code]null[/code], particles will be spheres.
var mesh: Mesh:
	get = get_mesh, set = set_mesh

#desc If [code]true[/code], only one emission cycle occurs. If set [code]true[/code] during a cycle, emission will stop at the cycle's end.
var one_shot: bool:
	get = get_one_shot, set = set_one_shot

#desc Each particle's orbital velocity will vary along this [Curve].
var orbit_velocity_curve: Curve:
	get = get_param_curve, set = set_param_curve

#desc Maximum orbit velocity.
var orbit_velocity_max: float:
	get = get_param_max, set = set_param_max

#desc Minimum orbit velocity.
var orbit_velocity_min: float:
	get = get_param_min, set = set_param_min

#desc Align Y axis of particle with the direction of its velocity.
var particle_flag_align_y: bool:
	get = get_particle_flag, set = set_particle_flag

#desc If [code]true[/code], particles will not move on the Z axis.
var particle_flag_disable_z: bool:
	get = get_particle_flag, set = set_particle_flag

#desc If [code]true[/code], particles rotate around Y axis by [member angle_min].
var particle_flag_rotate_y: bool:
	get = get_particle_flag, set = set_particle_flag

#desc Particle system starts as if it had already run for this many seconds.
var preprocess: float:
	get = get_pre_process_time, set = set_pre_process_time

#desc Each particle's radial acceleration will vary along this [Curve].
var radial_accel_curve: Curve:
	get = get_param_curve, set = set_param_curve

#desc Maximum radial acceleration.
var radial_accel_max: float:
	get = get_param_max, set = set_param_max

#desc Minimum radial acceleration.
var radial_accel_min: float:
	get = get_param_min, set = set_param_min

#desc Emission lifetime randomness ratio.
var randomness: float:
	get = get_randomness_ratio, set = set_randomness_ratio

#desc Each particle's scale will vary along this [Curve].
var scale_amount_curve: Curve:
	get = get_param_curve, set = set_param_curve

#desc Maximum scale.
var scale_amount_max: float:
	get = get_param_max, set = set_param_max

#desc Minimum scale.
var scale_amount_min: float:
	get = get_param_min, set = set_param_min

#desc Curve for the scale over life, along the x axis.
var scale_curve_x: Curve:
	get = get_scale_curve_x, set = set_scale_curve_x

#desc Curve for the scale over life, along the y axis.
var scale_curve_y: Curve:
	get = get_scale_curve_y, set = set_scale_curve_y

#desc Curve for the scale over life, along the z axis.
var scale_curve_z: Curve:
	get = get_scale_curve_z, set = set_scale_curve_z

#desc Particle system's running speed scaling ratio. A value of [code]0[/code] can be used to pause the particles.
var speed_scale: float:
	get = get_speed_scale, set = set_speed_scale

#desc If set to [code]true[/code], three different scale curves can be specified, one per scale axis.
var split_scale: bool:
	get = get_split_scale, set = set_split_scale

#desc Each particle's initial direction range from [code]+spread[/code] to [code]-spread[/code] degrees. Applied to X/Z plane and Y/Z planes.
var spread: float:
	get = get_spread, set = set_spread

#desc Each particle's tangential acceleration will vary along this [Curve].
var tangential_accel_curve: Curve:
	get = get_param_curve, set = set_param_curve

#desc Maximum tangent acceleration.
var tangential_accel_max: float:
	get = get_param_max, set = set_param_max

#desc Minimum tangent acceleration.
var tangential_accel_min: float:
	get = get_param_min, set = set_param_min



#desc Sets this node's properties to match a given [GPUParticles3D] node with an assigned [ParticleProcessMaterial].
func convert_from_particles(particles: Node) -> void:
	pass;

#desc Returns the [Curve] of the parameter specified by [enum Parameter].
func get_param_curve(param: int) -> Curve:
	pass;

#desc Returns the maximum value range for the given parameter.
func get_param_max(param: int) -> float:
	pass;

#desc Returns the minimum value range for the given parameter.
func get_param_min(param: int) -> float:
	pass;

#desc Returns the enabled state of the given particle flag (see [enum ParticleFlags] for options).
func get_particle_flag(particle_flag: int) -> bool:
	pass;

#desc Restarts the particle emitter.
func restart() -> void:
	pass;

#desc Sets the [Curve] of the parameter specified by [enum Parameter].
func set_param_curve(param: int, curve: Curve) -> void:
	pass;

#desc Sets the maximum value for the given parameter.
func set_param_max(param: int, value: float) -> void:
	pass;

#desc Sets the minimum value for the given parameter.
func set_param_min(param: int, value: float) -> void:
	pass;

#desc Enables or disables the given particle flag (see [enum ParticleFlags] for options).
func set_particle_flag(particle_flag: int, enable: bool) -> void:
	pass;


func get_amount() -> int:
	return amount

func set_amount(value: int) -> void:
	amount = value

func get_param_curve() -> Curve:
	return angle_curve

func set_param_curve(value: Curve) -> void:
	angle_curve = value

func get_param_max() -> float:
	return angle_max

func set_param_max(value: float) -> void:
	angle_max = value

func get_param_min() -> float:
	return angle_min

func set_param_min(value: float) -> void:
	angle_min = value

func get_param_curve() -> Curve:
	return angular_velocity_curve

func set_param_curve(value: Curve) -> void:
	angular_velocity_curve = value

func get_param_max() -> float:
	return angular_velocity_max

func set_param_max(value: float) -> void:
	angular_velocity_max = value

func get_param_min() -> float:
	return angular_velocity_min

func set_param_min(value: float) -> void:
	angular_velocity_min = value

func get_param_curve() -> Curve:
	return anim_offset_curve

func set_param_curve(value: Curve) -> void:
	anim_offset_curve = value

func get_param_max() -> float:
	return anim_offset_max

func set_param_max(value: float) -> void:
	anim_offset_max = value

func get_param_min() -> float:
	return anim_offset_min

func set_param_min(value: float) -> void:
	anim_offset_min = value

func get_param_curve() -> Curve:
	return anim_speed_curve

func set_param_curve(value: Curve) -> void:
	anim_speed_curve = value

func get_param_max() -> float:
	return anim_speed_max

func set_param_max(value: float) -> void:
	anim_speed_max = value

func get_param_min() -> float:
	return anim_speed_min

func set_param_min(value: float) -> void:
	anim_speed_min = value

func get_color() -> Color:
	return color

func set_color(value: Color) -> void:
	color = value

func get_color_initial_ramp() -> Gradient:
	return color_initial_ramp

func set_color_initial_ramp(value: Gradient) -> void:
	color_initial_ramp = value

func get_color_ramp() -> Gradient:
	return color_ramp

func set_color_ramp(value: Gradient) -> void:
	color_ramp = value

func get_param_curve() -> Curve:
	return damping_curve

func set_param_curve(value: Curve) -> void:
	damping_curve = value

func get_param_max() -> float:
	return damping_max

func set_param_max(value: float) -> void:
	damping_max = value

func get_param_min() -> float:
	return damping_min

func set_param_min(value: float) -> void:
	damping_min = value

func get_direction() -> Vector3:
	return direction

func set_direction(value: Vector3) -> void:
	direction = value

func get_draw_order() -> int:
	return draw_order

func set_draw_order(value: int) -> void:
	draw_order = value

func get_emission_box_extents() -> Vector3:
	return emission_box_extents

func set_emission_box_extents(value: Vector3) -> void:
	emission_box_extents = value

func get_emission_colors() -> PackedColorArray:
	return emission_colors

func set_emission_colors(value: PackedColorArray) -> void:
	emission_colors = value

func get_emission_normals() -> PackedVector3Array:
	return emission_normals

func set_emission_normals(value: PackedVector3Array) -> void:
	emission_normals = value

func get_emission_points() -> PackedVector3Array:
	return emission_points

func set_emission_points(value: PackedVector3Array) -> void:
	emission_points = value

func get_emission_ring_axis() -> Vector3:
	return emission_ring_axis

func set_emission_ring_axis(value: Vector3) -> void:
	emission_ring_axis = value

func get_emission_ring_height() -> float:
	return emission_ring_height

func set_emission_ring_height(value: float) -> void:
	emission_ring_height = value

func get_emission_ring_inner_radius() -> float:
	return emission_ring_inner_radius

func set_emission_ring_inner_radius(value: float) -> void:
	emission_ring_inner_radius = value

func get_emission_ring_radius() -> float:
	return emission_ring_radius

func set_emission_ring_radius(value: float) -> void:
	emission_ring_radius = value

func get_emission_shape() -> int:
	return emission_shape

func set_emission_shape(value: int) -> void:
	emission_shape = value

func get_emission_sphere_radius() -> float:
	return emission_sphere_radius

func set_emission_sphere_radius(value: float) -> void:
	emission_sphere_radius = value

func is_emitting() -> bool:
	return emitting

func set_emitting(value: bool) -> void:
	emitting = value

func get_explosiveness_ratio() -> float:
	return explosiveness

func set_explosiveness_ratio(value: float) -> void:
	explosiveness = value

func get_fixed_fps() -> int:
	return fixed_fps

func set_fixed_fps(value: int) -> void:
	fixed_fps = value

func get_flatness() -> float:
	return flatness

func set_flatness(value: float) -> void:
	flatness = value

func get_fractional_delta() -> bool:
	return fract_delta

func set_fractional_delta(value: bool) -> void:
	fract_delta = value

func get_gravity() -> Vector3:
	return gravity

func set_gravity(value: Vector3) -> void:
	gravity = value

func get_param_curve() -> Curve:
	return hue_variation_curve

func set_param_curve(value: Curve) -> void:
	hue_variation_curve = value

func get_param_max() -> float:
	return hue_variation_max

func set_param_max(value: float) -> void:
	hue_variation_max = value

func get_param_min() -> float:
	return hue_variation_min

func set_param_min(value: float) -> void:
	hue_variation_min = value

func get_param_max() -> float:
	return initial_velocity_max

func set_param_max(value: float) -> void:
	initial_velocity_max = value

func get_param_min() -> float:
	return initial_velocity_min

func set_param_min(value: float) -> void:
	initial_velocity_min = value

func get_lifetime() -> float:
	return lifetime

func set_lifetime(value: float) -> void:
	lifetime = value

func get_lifetime_randomness() -> float:
	return lifetime_randomness

func set_lifetime_randomness(value: float) -> void:
	lifetime_randomness = value

func get_param_curve() -> Curve:
	return linear_accel_curve

func set_param_curve(value: Curve) -> void:
	linear_accel_curve = value

func get_param_max() -> float:
	return linear_accel_max

func set_param_max(value: float) -> void:
	linear_accel_max = value

func get_param_min() -> float:
	return linear_accel_min

func set_param_min(value: float) -> void:
	linear_accel_min = value

func get_use_local_coordinates() -> bool:
	return local_coords

func set_use_local_coordinates(value: bool) -> void:
	local_coords = value

func get_mesh() -> Mesh:
	return mesh

func set_mesh(value: Mesh) -> void:
	mesh = value

func get_one_shot() -> bool:
	return one_shot

func set_one_shot(value: bool) -> void:
	one_shot = value

func get_param_curve() -> Curve:
	return orbit_velocity_curve

func set_param_curve(value: Curve) -> void:
	orbit_velocity_curve = value

func get_param_max() -> float:
	return orbit_velocity_max

func set_param_max(value: float) -> void:
	orbit_velocity_max = value

func get_param_min() -> float:
	return orbit_velocity_min

func set_param_min(value: float) -> void:
	orbit_velocity_min = value

func get_particle_flag() -> bool:
	return particle_flag_align_y

func set_particle_flag(value: bool) -> void:
	particle_flag_align_y = value

func get_particle_flag() -> bool:
	return particle_flag_disable_z

func set_particle_flag(value: bool) -> void:
	particle_flag_disable_z = value

func get_particle_flag() -> bool:
	return particle_flag_rotate_y

func set_particle_flag(value: bool) -> void:
	particle_flag_rotate_y = value

func get_pre_process_time() -> float:
	return preprocess

func set_pre_process_time(value: float) -> void:
	preprocess = value

func get_param_curve() -> Curve:
	return radial_accel_curve

func set_param_curve(value: Curve) -> void:
	radial_accel_curve = value

func get_param_max() -> float:
	return radial_accel_max

func set_param_max(value: float) -> void:
	radial_accel_max = value

func get_param_min() -> float:
	return radial_accel_min

func set_param_min(value: float) -> void:
	radial_accel_min = value

func get_randomness_ratio() -> float:
	return randomness

func set_randomness_ratio(value: float) -> void:
	randomness = value

func get_param_curve() -> Curve:
	return scale_amount_curve

func set_param_curve(value: Curve) -> void:
	scale_amount_curve = value

func get_param_max() -> float:
	return scale_amount_max

func set_param_max(value: float) -> void:
	scale_amount_max = value

func get_param_min() -> float:
	return scale_amount_min

func set_param_min(value: float) -> void:
	scale_amount_min = value

func get_scale_curve_x() -> Curve:
	return scale_curve_x

func set_scale_curve_x(value: Curve) -> void:
	scale_curve_x = value

func get_scale_curve_y() -> Curve:
	return scale_curve_y

func set_scale_curve_y(value: Curve) -> void:
	scale_curve_y = value

func get_scale_curve_z() -> Curve:
	return scale_curve_z

func set_scale_curve_z(value: Curve) -> void:
	scale_curve_z = value

func get_speed_scale() -> float:
	return speed_scale

func set_speed_scale(value: float) -> void:
	speed_scale = value

func get_split_scale() -> bool:
	return split_scale

func set_split_scale(value: bool) -> void:
	split_scale = value

func get_spread() -> float:
	return spread

func set_spread(value: float) -> void:
	spread = value

func get_param_curve() -> Curve:
	return tangential_accel_curve

func set_param_curve(value: Curve) -> void:
	tangential_accel_curve = value

func get_param_max() -> float:
	return tangential_accel_max

func set_param_max(value: float) -> void:
	tangential_accel_max = value

func get_param_min() -> float:
	return tangential_accel_min

func set_param_min(value: float) -> void:
	tangential_accel_min = value

