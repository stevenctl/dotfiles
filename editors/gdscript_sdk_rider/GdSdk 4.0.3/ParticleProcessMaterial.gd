extends Material
#brief Particle properties for [GPUParticles3D] and [GPUParticles2D] nodes.
#desc ParticleProcessMaterial defines particle properties and behavior. It is used in the [code]process_material[/code] of [GPUParticles3D] and [GPUParticles2D] emitter nodes.
#desc Some of this material's properties are applied to each particle when emitted, while others can have a [CurveTexture] applied to vary values over the lifetime of the particle.
#desc Particle animation is available only in [GPUParticles2D]. To use it, attach a [CanvasItemMaterial], with [member CanvasItemMaterial.particles_animation] enabled, to the particles node.
class_name ParticleProcessMaterial

#desc Use with [method set_param_min], [method set_param_max], and [method set_param_texture] to set initial velocity properties.
#desc Use with [method set_param_min], [method set_param_max], and [method set_param_texture] to set angular velocity properties.
#desc Use with [method set_param_min], [method set_param_max], and [method set_param_texture] to set orbital velocity properties.
#desc Use with [method set_param_min], [method set_param_max], and [method set_param_texture] to set linear acceleration properties.
#desc Use with [method set_param_min], [method set_param_max], and [method set_param_texture] to set radial acceleration properties.
#desc Use with [method set_param_min], [method set_param_max], and [method set_param_texture] to set tangential acceleration properties.
#desc Use with [method set_param_min], [method set_param_max], and [method set_param_texture] to set damping properties.
#desc Use with [method set_param_min], [method set_param_max], and [method set_param_texture] to set angle properties.
#desc Use with [method set_param_min], [method set_param_max], and [method set_param_texture] to set scale properties.
#desc Use with [method set_param_min], [method set_param_max], and [method set_param_texture] to set hue variation properties.
#desc Use with [method set_param_min], [method set_param_max], and [method set_param_texture] to set animation speed properties.
#desc Use with [method set_param_min], [method set_param_max], and [method set_param_texture] to set animation offset properties.
#desc Represents the size of the [enum Parameter] enum.
#desc Use with [method set_particle_flag] to set [member particle_flag_align_y].
#desc Use with [method set_particle_flag] to set [member particle_flag_rotate_y].
#desc Use with [method set_particle_flag] to set [member particle_flag_disable_z].
#desc Represents the size of the [enum ParticleFlags] enum.
#desc All particles will be emitted from a single point.
#desc Particles will be emitted in the volume of a sphere.
#desc Particles will be emitted on the surface of a sphere.
#desc Particles will be emitted in the volume of a box.
#desc Particles will be emitted at a position determined by sampling a random point on the [member emission_point_texture]. Particle color will be modulated by [member emission_color_texture].
#desc Particles will be emitted at a position determined by sampling a random point on the [member emission_point_texture]. Particle velocity and rotation will be set based on [member emission_normal_texture]. Particle color will be modulated by [member emission_color_texture].
#desc Particles will be emitted in a ring or cylinder.
#desc Represents the size of the [enum EmissionShape] enum.
#desc Use with [method set_param_min] and [method set_param_max] to set the turbulence minimum und maximum influence on each particles velocity.
#desc Use with [method set_param_min] and [method set_param_max] to set the turbulence minimum and maximum displacement of the particles spawn position.
#desc Use with [method set_param_texture] to set the turbulence influence over the particles life time.
#desc Represents the size of the [enum SubEmitterMode] enum.
#desc No collision for particles. Particles will go through [GPUParticlesCollision3D] nodes.
#desc [RigidBody3D]-style collision for particles using [GPUParticlesCollision3D] nodes.
#desc Hide particles instantly when colliding with a [GPUParticlesCollision3D] node. This can be combined with a subemitter that uses the [constant COLLISION_RIGID] collision mode to "replace" the parent particle with the subemitter on impact.
#desc Represents the size of the [enum CollisionMode] enum.

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
    PARAM_MAX = 15,
    PARAM_TURB_VEL_INFLUENCE = 13,
    PARAM_TURB_INIT_DISPLACEMENT = 14,
    PARAM_TURB_INFLUENCE_OVER_LIFE = 12,
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
#enum SubEmitterMode
enum {
    SUB_EMITTER_DISABLED = 0,
    SUB_EMITTER_CONSTANT = 1,
    SUB_EMITTER_AT_END = 2,
    SUB_EMITTER_AT_COLLISION = 3,
    SUB_EMITTER_MAX = 4,
}
#enum CollisionMode
enum {
    COLLISION_DISABLED = 0,
    COLLISION_RIGID = 1,
    COLLISION_HIDE_ON_CONTACT = 2,
    COLLISION_MAX = 3,
}
#desc Each particle's rotation will be animated along this [CurveTexture].
var angle_curve: Texture2D:
	get = get_param_texture, set = set_param_texture

#desc Maximum initial rotation applied to each particle, in degrees.
#desc Only applied when [member particle_flag_disable_z] or [member particle_flag_rotate_y] are [code]true[/code] or the [BaseMaterial3D] being used to draw the particle is using [constant BaseMaterial3D.BILLBOARD_PARTICLES].
var angle_max: float:
	get = get_param_max, set = set_param_max

#desc Minimum equivalent of [member angle_max].
var angle_min: float:
	get = get_param_min, set = set_param_min

#desc Each particle's angular velocity (rotation speed) will vary along this [CurveTexture] over its lifetime.
var angular_velocity_curve: Texture2D:
	get = get_param_texture, set = set_param_texture

#desc Maximum initial angular velocity (rotation speed) applied to each particle in [i]degrees[/i] per second.
#desc Only applied when [member particle_flag_disable_z] or [member particle_flag_rotate_y] are [code]true[/code] or the [BaseMaterial3D] being used to draw the particle is using [constant BaseMaterial3D.BILLBOARD_PARTICLES].
var angular_velocity_max: float:
	get = get_param_max, set = set_param_max

#desc Minimum equivalent of [member angular_velocity_max].
var angular_velocity_min: float:
	get = get_param_min, set = set_param_min

#desc Each particle's animation offset will vary along this [CurveTexture].
var anim_offset_curve: Texture2D:
	get = get_param_texture, set = set_param_texture

#desc Maximum animation offset that corresponds to frame index in the texture. [code]0[/code] is the first frame, [code]1[/code] is the last one. See [member CanvasItemMaterial.particles_animation].
var anim_offset_max: float:
	get = get_param_max, set = set_param_max

#desc Minimum equivalent of [member anim_offset_max].
var anim_offset_min: float:
	get = get_param_min, set = set_param_min

#desc Each particle's animation speed will vary along this [CurveTexture].
var anim_speed_curve: Texture2D:
	get = get_param_texture, set = set_param_texture

#desc Maximum particle animation speed. Animation speed of [code]1[/code] means that the particles will make full [code]0[/code] to [code]1[/code] offset cycle during lifetime, [code]2[/code] means [code]2[/code] cycles etc.
#desc With animation speed greater than [code]1[/code], remember to enable [member CanvasItemMaterial.particles_anim_loop] property if you want the animation to repeat.
var anim_speed_max: float:
	get = get_param_max, set = set_param_max

#desc Minimum equivalent of [member anim_speed_max].
var anim_speed_min: float:
	get = get_param_min, set = set_param_min

#desc True if the interaction with particle attractors is enabled.
var attractor_interaction_enabled: bool:
	get = is_attractor_interaction_enabled, set = set_attractor_interaction_enabled

#desc The particles' bounciness. Values range from [code]0[/code] (no bounce) to [code]1[/code] (full bounciness). Only effective if [member collision_mode] is [constant COLLISION_RIGID].
var collision_bounce: float:
	get = get_collision_bounce, set = set_collision_bounce

#desc The particles' friction. Values range from [code]0[/code] (frictionless) to [code]1[/code] (maximum friction). Only effective if [member collision_mode] is [constant COLLISION_RIGID].
var collision_friction: float:
	get = get_collision_friction, set = set_collision_friction

#desc The particles' collision mode.
#desc [b]Note:[/b] 3D Particles can only collide with [GPUParticlesCollision3D] nodes, not [PhysicsBody3D] nodes. To make particles collide with various objects, you can add [GPUParticlesCollision3D] nodes as children of [PhysicsBody3D] nodes.
#desc [b]Note:[/b] 2D Particles can only collide with [LightOccluder2D] nodes, not [PhysicsBody2D] nodes.
var collision_mode: int:
	get = get_collision_mode, set = set_collision_mode

#desc Should collision take scale into account.
var collision_use_scale: bool:
	get = is_collision_using_scale, set = set_collision_use_scale

#desc Each particle's initial color. If the [GPUParticles2D]'s [code]texture[/code] is defined, it will be multiplied by this color.
#desc [b]Note:[/b] [member color] multiplies the particle mesh's vertex colors. To have a visible effect on a [BaseMaterial3D], [member BaseMaterial3D.vertex_color_use_as_albedo] [i]must[/i] be [code]true[/code]. For a [ShaderMaterial], [code]ALBEDO *= COLOR.rgb;[/code] must be inserted in the shader's [code]fragment()[/code] function. Otherwise, [member color] will have no visible effect.
var color: Color:
	get = get_color, set = set_color

#desc Each particle's initial color will vary along this [GradientTexture1D] (multiplied with [member color]).
#desc [b]Note:[/b] [member color_initial_ramp] multiplies the particle mesh's vertex colors. To have a visible effect on a [BaseMaterial3D], [member BaseMaterial3D.vertex_color_use_as_albedo] [i]must[/i] be [code]true[/code]. For a [ShaderMaterial], [code]ALBEDO *= COLOR.rgb;[/code] must be inserted in the shader's [code]fragment()[/code] function. Otherwise, [member color_initial_ramp] will have no visible effect.
var color_initial_ramp: Texture2D:
	get = get_color_initial_ramp, set = set_color_initial_ramp

#desc Each particle's color will vary along this [GradientTexture1D] over its lifetime (multiplied with [member color]).
#desc [b]Note:[/b] [member color_ramp] multiplies the particle mesh's vertex colors. To have a visible effect on a [BaseMaterial3D], [member BaseMaterial3D.vertex_color_use_as_albedo] [i]must[/i] be [code]true[/code]. For a [ShaderMaterial], [code]ALBEDO *= COLOR.rgb;[/code] must be inserted in the shader's [code]fragment()[/code] function. Otherwise, [member color_ramp] will have no visible effect.
var color_ramp: Texture2D:
	get = get_color_ramp, set = set_color_ramp

#desc Damping will vary along this [CurveTexture].
var damping_curve: Texture2D:
	get = get_param_texture, set = set_param_texture

#desc The maximum rate at which particles lose velocity. For example value of [code]100[/code] means that the particle will go from [code]100[/code] velocity to [code]0[/code] in [code]1[/code] second.
var damping_max: float:
	get = get_param_max, set = set_param_max

#desc Minimum equivalent of [member damping_max].
var damping_min: float:
	get = get_param_min, set = set_param_min

#desc Unit vector specifying the particles' emission direction.
var direction: Vector3:
	get = get_direction, set = set_direction

#desc The box's extents if [code]emission_shape[/code] is set to [constant EMISSION_SHAPE_BOX].
var emission_box_extents: Vector3:
	get = get_emission_box_extents, set = set_emission_box_extents

#desc Particle color will be modulated by color determined by sampling this texture at the same point as the [member emission_point_texture].
#desc [b]Note:[/b] [member emission_color_texture] multiplies the particle mesh's vertex colors. To have a visible effect on a [BaseMaterial3D], [member BaseMaterial3D.vertex_color_use_as_albedo] [i]must[/i] be [code]true[/code]. For a [ShaderMaterial], [code]ALBEDO *= COLOR.rgb;[/code] must be inserted in the shader's [code]fragment()[/code] function. Otherwise, [member emission_color_texture] will have no visible effect.
var emission_color_texture: Texture2D:
	get = get_emission_color_texture, set = set_emission_color_texture

#desc Particle velocity and rotation will be set by sampling this texture at the same point as the [member emission_point_texture]. Used only in [constant EMISSION_SHAPE_DIRECTED_POINTS]. Can be created automatically from mesh or node by selecting "Create Emission Points from Mesh/Node" under the "Particles" tool in the toolbar.
var emission_normal_texture: Texture2D:
	get = get_emission_normal_texture, set = set_emission_normal_texture

#desc The number of emission points if [code]emission_shape[/code] is set to [constant EMISSION_SHAPE_POINTS] or [constant EMISSION_SHAPE_DIRECTED_POINTS].
var emission_point_count: int:
	get = get_emission_point_count, set = set_emission_point_count

#desc Particles will be emitted at positions determined by sampling this texture at a random position. Used with [constant EMISSION_SHAPE_POINTS] and [constant EMISSION_SHAPE_DIRECTED_POINTS]. Can be created automatically from mesh or node by selecting "Create Emission Points from Mesh/Node" under the "Particles" tool in the toolbar.
var emission_point_texture: Texture2D:
	get = get_emission_point_texture, set = set_emission_point_texture

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

#desc Particles will be emitted inside this region. Use [enum EmissionShape] constants for values.
var emission_shape: int:
	get = get_emission_shape, set = set_emission_shape

#desc The sphere's radius if [code]emission_shape[/code] is set to [constant EMISSION_SHAPE_SPHERE].
var emission_sphere_radius: float:
	get = get_emission_sphere_radius, set = set_emission_sphere_radius

#desc Amount of [member spread] along the Y axis.
var flatness: float:
	get = get_flatness, set = set_flatness

#desc Gravity applied to every particle.
var gravity: Vector3:
	get = get_gravity, set = set_gravity

#desc Each particle's hue will vary along this [CurveTexture].
var hue_variation_curve: Texture2D:
	get = get_param_texture, set = set_param_texture

#desc Maximum initial hue variation applied to each particle. It will shift the particle color's hue.
var hue_variation_max: float:
	get = get_param_max, set = set_param_max

#desc Minimum equivalent of [member hue_variation_max].
var hue_variation_min: float:
	get = get_param_min, set = set_param_min

#desc Maximum initial velocity magnitude for each particle. Direction comes from [member direction] and [member spread].
var initial_velocity_max: float:
	get = get_param_max, set = set_param_max

#desc Minimum equivalent of [member initial_velocity_max].
var initial_velocity_min: float:
	get = get_param_min, set = set_param_min

#desc Particle lifetime randomness ratio. The lifetime will be multiplied by a value interpolated between [code]1.0[/code] and a random number less than one. For example a random ratio of [code]0.4[/code] would scale the original lifetime between [code]0.4-1.0[/code] of its original value.
var lifetime_randomness: float:
	get = get_lifetime_randomness, set = set_lifetime_randomness

#desc Each particle's linear acceleration will vary along this [CurveTexture].
var linear_accel_curve: Texture2D:
	get = get_param_texture, set = set_param_texture

#desc Maximum linear acceleration applied to each particle in the direction of motion.
var linear_accel_max: float:
	get = get_param_max, set = set_param_max

#desc Minimum equivalent of [member linear_accel_max].
var linear_accel_min: float:
	get = get_param_min, set = set_param_min

#desc Each particle's orbital velocity will vary along this [CurveTexture].
var orbit_velocity_curve: Texture2D:
	get = get_param_texture, set = set_param_texture

#desc Maximum orbital velocity applied to each particle. Makes the particles circle around origin. Specified in number of full rotations around origin per second.
#desc Only available when [member particle_flag_disable_z] is [code]true[/code].
var orbit_velocity_max: float:
	get = get_param_max, set = set_param_max

#desc Minimum equivalent of [member orbit_velocity_max].
var orbit_velocity_min: float:
	get = get_param_min, set = set_param_min

#desc Align Y axis of particle with the direction of its velocity.
var particle_flag_align_y: bool:
	get = get_particle_flag, set = set_particle_flag

#desc If [code]true[/code], particles will not move on the z axis.
var particle_flag_disable_z: bool:
	get = get_particle_flag, set = set_particle_flag

#desc If [code]true[/code], particles rotate around Y axis by [member angle_min].
var particle_flag_rotate_y: bool:
	get = get_particle_flag, set = set_particle_flag

#desc Each particle's radial acceleration will vary along this [CurveTexture].
var radial_accel_curve: Texture2D:
	get = get_param_texture, set = set_param_texture

#desc Maximum radial acceleration applied to each particle. Makes particle accelerate away from the origin or towards it if negative.
var radial_accel_max: float:
	get = get_param_max, set = set_param_max

#desc Minimum equivalent of [member radial_accel_max].
var radial_accel_min: float:
	get = get_param_min, set = set_param_min

#desc Each particle's scale will vary along this [CurveTexture]. If a [CurveXYZTexture] is supplied instead, the scale will be separated per-axis.
var scale_curve: Texture2D:
	get = get_param_texture, set = set_param_texture

#desc Maximum initial scale applied to each particle.
var scale_max: float:
	get = get_param_max, set = set_param_max

#desc Minimum equivalent of [member scale_max].
var scale_min: float:
	get = get_param_min, set = set_param_min

#desc Each particle's initial direction range from [code]+spread[/code] to [code]-spread[/code] degrees.
var spread: float:
	get = get_spread, set = set_spread

#desc Sub particle amount on collision.
#desc Maximum amount set in the sub particles emitter.
var sub_emitter_amount_at_collision: int:
	get = get_sub_emitter_amount_at_collision, set = set_sub_emitter_amount_at_collision

var sub_emitter_amount_at_end: int:
	get = get_sub_emitter_amount_at_end, set = set_sub_emitter_amount_at_end

var sub_emitter_frequency: float:
	get = get_sub_emitter_frequency, set = set_sub_emitter_frequency

var sub_emitter_keep_velocity: bool:
	get = get_sub_emitter_keep_velocity, set = set_sub_emitter_keep_velocity

var sub_emitter_mode: int:
	get = get_sub_emitter_mode, set = set_sub_emitter_mode

#desc Each particle's tangential acceleration will vary along this [CurveTexture].
var tangential_accel_curve: Texture2D:
	get = get_param_texture, set = set_param_texture

#desc Maximum tangential acceleration applied to each particle. Tangential acceleration is perpendicular to the particle's velocity giving the particles a swirling motion.
var tangential_accel_max: float:
	get = get_param_max, set = set_param_max

#desc Minimum equivalent of [member tangential_accel_max].
var tangential_accel_min: float:
	get = get_param_min, set = set_param_min

#desc If [code]true[/code], enables turbulence for the particle system. Turbulence can be used to vary particle movement according to its position (based on a 3D noise pattern).
#desc [b]Note:[/b] Enabling turbulence has a high performance cost on the GPU. Only enable turbulence on a few particle systems at once at most, and consider disabling it when targeting mobile/web platforms.
var turbulence_enabled: bool:
	get = get_turbulence_enabled, set = set_turbulence_enabled

#desc Maximum turbulence influence on each particle.
#desc The actual amount of turbulence influence on each particle is calculated as a random value between [member turbulence_influence_min] and [member turbulence_influence_max] and multiplied by the amount of turbulence influence from [member turbulence_influence_over_life].
var turbulence_influence_max: float:
	get = get_param_max, set = set_param_max

#desc Minimum turbulence influence on each particle.
#desc The actual amount of turbulence influence on each particle is calculated as a random value between [member turbulence_influence_min] and [member turbulence_influence_max] and multiplied by the amount of turbulence influence from [member turbulence_influence_over_life].
var turbulence_influence_min: float:
	get = get_param_min, set = set_param_min

#desc Each particle's amount of turbulence will be influenced along this [CurveTexture] over its life time.
var turbulence_influence_over_life: Texture2D:
	get = get_param_texture, set = set_param_texture

#desc Maximum displacement of each particle's spawn position by the turbulence.
#desc The actual amount of displacement will be a factor of the underlying turbulence multiplied by a random value between [member turbulence_initial_displacement_min] and [member turbulence_initial_displacement_max].
var turbulence_initial_displacement_max: float:
	get = get_param_max, set = set_param_max

#desc Minimum displacement of each particle's spawn position by the turbulence.
#desc The actual amount of displacement will be a factor of the underlying turbulence multiplied by a random value between [member turbulence_initial_displacement_min] and [member turbulence_initial_displacement_max].
var turbulence_initial_displacement_min: float:
	get = get_param_min, set = set_param_min

#desc This value controls the overall scale/frequency of the turbulence noise pattern.
#desc A small scale will result in smaller features with more detail while a high scale will result in smoother noise with larger features.
var turbulence_noise_scale: float:
	get = get_turbulence_noise_scale, set = set_turbulence_noise_scale

#desc The movement speed of the turbulence pattern. This changes how quickly the noise changes over time.
#desc A value of [code]Vector3(0.0, 0.0, 0.0)[/code] will freeze the turbulence pattern in place.
var turbulence_noise_speed: Vector3:
	get = get_turbulence_noise_speed, set = set_turbulence_noise_speed

#desc Use to influence the noise speed in a random pattern. This helps break up visible movement patterns.
var turbulence_noise_speed_random: float:
	get = get_turbulence_noise_speed_random, set = set_turbulence_noise_speed_random

#desc The turbulence noise strength. Increasing this will result in a stronger, more contrasting noise pattern.
var turbulence_noise_strength: float:
	get = get_turbulence_noise_strength, set = set_turbulence_noise_strength



#desc Returns the maximum value range for the given parameter.
func get_param_max(param: int) -> float:
	pass;

#desc Returns the minimum value range for the given parameter.
func get_param_min(param: int) -> float:
	pass;

#desc Returns the [Texture2D] used by the specified parameter.
func get_param_texture(param: int) -> Texture2D:
	pass;

#desc Returns [code]true[/code] if the specified particle flag is enabled. See [enum ParticleFlags] for options.
func get_particle_flag(particle_flag: int) -> bool:
	pass;

#desc Sets the maximum value range for the given parameter.
func set_param_max(param: int, value: float) -> void:
	pass;

#desc Sets the minimum value range for the given parameter.
func set_param_min(param: int, value: float) -> void:
	pass;

#desc Sets the [Texture2D] for the specified [enum Parameter].
func set_param_texture(param: int, texture: Texture2D) -> void:
	pass;

#desc If [code]true[/code], enables the specified particle flag. See [enum ParticleFlags] for options.
func set_particle_flag(particle_flag: int, enable: bool) -> void:
	pass;


func get_param_texture() -> Texture2D:
	return angle_curve

func set_param_texture(value: Texture2D) -> void:
	angle_curve = value

func get_param_max() -> float:
	return angle_max

func set_param_max(value: float) -> void:
	angle_max = value

func get_param_min() -> float:
	return angle_min

func set_param_min(value: float) -> void:
	angle_min = value

func get_param_texture() -> Texture2D:
	return angular_velocity_curve

func set_param_texture(value: Texture2D) -> void:
	angular_velocity_curve = value

func get_param_max() -> float:
	return angular_velocity_max

func set_param_max(value: float) -> void:
	angular_velocity_max = value

func get_param_min() -> float:
	return angular_velocity_min

func set_param_min(value: float) -> void:
	angular_velocity_min = value

func get_param_texture() -> Texture2D:
	return anim_offset_curve

func set_param_texture(value: Texture2D) -> void:
	anim_offset_curve = value

func get_param_max() -> float:
	return anim_offset_max

func set_param_max(value: float) -> void:
	anim_offset_max = value

func get_param_min() -> float:
	return anim_offset_min

func set_param_min(value: float) -> void:
	anim_offset_min = value

func get_param_texture() -> Texture2D:
	return anim_speed_curve

func set_param_texture(value: Texture2D) -> void:
	anim_speed_curve = value

func get_param_max() -> float:
	return anim_speed_max

func set_param_max(value: float) -> void:
	anim_speed_max = value

func get_param_min() -> float:
	return anim_speed_min

func set_param_min(value: float) -> void:
	anim_speed_min = value

func is_attractor_interaction_enabled() -> bool:
	return attractor_interaction_enabled

func set_attractor_interaction_enabled(value: bool) -> void:
	attractor_interaction_enabled = value

func get_collision_bounce() -> float:
	return collision_bounce

func set_collision_bounce(value: float) -> void:
	collision_bounce = value

func get_collision_friction() -> float:
	return collision_friction

func set_collision_friction(value: float) -> void:
	collision_friction = value

func get_collision_mode() -> int:
	return collision_mode

func set_collision_mode(value: int) -> void:
	collision_mode = value

func is_collision_using_scale() -> bool:
	return collision_use_scale

func set_collision_use_scale(value: bool) -> void:
	collision_use_scale = value

func get_color() -> Color:
	return color

func set_color(value: Color) -> void:
	color = value

func get_color_initial_ramp() -> Texture2D:
	return color_initial_ramp

func set_color_initial_ramp(value: Texture2D) -> void:
	color_initial_ramp = value

func get_color_ramp() -> Texture2D:
	return color_ramp

func set_color_ramp(value: Texture2D) -> void:
	color_ramp = value

func get_param_texture() -> Texture2D:
	return damping_curve

func set_param_texture(value: Texture2D) -> void:
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

func get_emission_box_extents() -> Vector3:
	return emission_box_extents

func set_emission_box_extents(value: Vector3) -> void:
	emission_box_extents = value

func get_emission_color_texture() -> Texture2D:
	return emission_color_texture

func set_emission_color_texture(value: Texture2D) -> void:
	emission_color_texture = value

func get_emission_normal_texture() -> Texture2D:
	return emission_normal_texture

func set_emission_normal_texture(value: Texture2D) -> void:
	emission_normal_texture = value

func get_emission_point_count() -> int:
	return emission_point_count

func set_emission_point_count(value: int) -> void:
	emission_point_count = value

func get_emission_point_texture() -> Texture2D:
	return emission_point_texture

func set_emission_point_texture(value: Texture2D) -> void:
	emission_point_texture = value

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

func get_flatness() -> float:
	return flatness

func set_flatness(value: float) -> void:
	flatness = value

func get_gravity() -> Vector3:
	return gravity

func set_gravity(value: Vector3) -> void:
	gravity = value

func get_param_texture() -> Texture2D:
	return hue_variation_curve

func set_param_texture(value: Texture2D) -> void:
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

func get_lifetime_randomness() -> float:
	return lifetime_randomness

func set_lifetime_randomness(value: float) -> void:
	lifetime_randomness = value

func get_param_texture() -> Texture2D:
	return linear_accel_curve

func set_param_texture(value: Texture2D) -> void:
	linear_accel_curve = value

func get_param_max() -> float:
	return linear_accel_max

func set_param_max(value: float) -> void:
	linear_accel_max = value

func get_param_min() -> float:
	return linear_accel_min

func set_param_min(value: float) -> void:
	linear_accel_min = value

func get_param_texture() -> Texture2D:
	return orbit_velocity_curve

func set_param_texture(value: Texture2D) -> void:
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

func get_param_texture() -> Texture2D:
	return radial_accel_curve

func set_param_texture(value: Texture2D) -> void:
	radial_accel_curve = value

func get_param_max() -> float:
	return radial_accel_max

func set_param_max(value: float) -> void:
	radial_accel_max = value

func get_param_min() -> float:
	return radial_accel_min

func set_param_min(value: float) -> void:
	radial_accel_min = value

func get_param_texture() -> Texture2D:
	return scale_curve

func set_param_texture(value: Texture2D) -> void:
	scale_curve = value

func get_param_max() -> float:
	return scale_max

func set_param_max(value: float) -> void:
	scale_max = value

func get_param_min() -> float:
	return scale_min

func set_param_min(value: float) -> void:
	scale_min = value

func get_spread() -> float:
	return spread

func set_spread(value: float) -> void:
	spread = value

func get_sub_emitter_amount_at_collision() -> int:
	return sub_emitter_amount_at_collision

func set_sub_emitter_amount_at_collision(value: int) -> void:
	sub_emitter_amount_at_collision = value

func get_sub_emitter_amount_at_end() -> int:
	return sub_emitter_amount_at_end

func set_sub_emitter_amount_at_end(value: int) -> void:
	sub_emitter_amount_at_end = value

func get_sub_emitter_frequency() -> float:
	return sub_emitter_frequency

func set_sub_emitter_frequency(value: float) -> void:
	sub_emitter_frequency = value

func get_sub_emitter_keep_velocity() -> bool:
	return sub_emitter_keep_velocity

func set_sub_emitter_keep_velocity(value: bool) -> void:
	sub_emitter_keep_velocity = value

func get_sub_emitter_mode() -> int:
	return sub_emitter_mode

func set_sub_emitter_mode(value: int) -> void:
	sub_emitter_mode = value

func get_param_texture() -> Texture2D:
	return tangential_accel_curve

func set_param_texture(value: Texture2D) -> void:
	tangential_accel_curve = value

func get_param_max() -> float:
	return tangential_accel_max

func set_param_max(value: float) -> void:
	tangential_accel_max = value

func get_param_min() -> float:
	return tangential_accel_min

func set_param_min(value: float) -> void:
	tangential_accel_min = value

func get_turbulence_enabled() -> bool:
	return turbulence_enabled

func set_turbulence_enabled(value: bool) -> void:
	turbulence_enabled = value

func get_param_max() -> float:
	return turbulence_influence_max

func set_param_max(value: float) -> void:
	turbulence_influence_max = value

func get_param_min() -> float:
	return turbulence_influence_min

func set_param_min(value: float) -> void:
	turbulence_influence_min = value

func get_param_texture() -> Texture2D:
	return turbulence_influence_over_life

func set_param_texture(value: Texture2D) -> void:
	turbulence_influence_over_life = value

func get_param_max() -> float:
	return turbulence_initial_displacement_max

func set_param_max(value: float) -> void:
	turbulence_initial_displacement_max = value

func get_param_min() -> float:
	return turbulence_initial_displacement_min

func set_param_min(value: float) -> void:
	turbulence_initial_displacement_min = value

func get_turbulence_noise_scale() -> float:
	return turbulence_noise_scale

func set_turbulence_noise_scale(value: float) -> void:
	turbulence_noise_scale = value

func get_turbulence_noise_speed() -> Vector3:
	return turbulence_noise_speed

func set_turbulence_noise_speed(value: Vector3) -> void:
	turbulence_noise_speed = value

func get_turbulence_noise_speed_random() -> float:
	return turbulence_noise_speed_random

func set_turbulence_noise_speed_random(value: float) -> void:
	turbulence_noise_speed_random = value

func get_turbulence_noise_strength() -> float:
	return turbulence_noise_strength

func set_turbulence_noise_strength(value: float) -> void:
	turbulence_noise_strength = value

