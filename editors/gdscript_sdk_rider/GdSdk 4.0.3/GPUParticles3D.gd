extends GeometryInstance3D
#brief 3D particle emitter.
#desc 3D particle node used to create a variety of particle systems and effects. [GPUParticles3D] features an emitter that generates some number of particles at a given rate.
#desc Use the [code]process_material[/code] property to add a [ParticleProcessMaterial] to configure particle appearance and behavior. Alternatively, you can add a [ShaderMaterial] which will be applied to all particles.
#tutorial [Controlling thousands of fish with Particles] https://docs.godotengine.org/en/stable/tutorials/performance/vertex_animation/controlling_thousands_of_fish.html
#tutorial [Third Person Shooter Demo] https://godotengine.org/asset-library/asset/678
class_name GPUParticles3D

#desc Particles are drawn in the order emitted.
#desc Particles are drawn in order of remaining lifetime.
#desc Particles are drawn in order of depth.
#desc Particle starts at the specified position.
#desc Particle starts with specified rotation and scale.
#desc Particle starts with the specified velocity vector, which defines the emission direction and speed.
#desc Particle starts with specified color.
#desc Particle starts with specified [code]CUSTOM[/code] data.
#desc Maximum number of draw passes supported.
const MAX_DRAW_PASSES = 4;


#enum DrawOrder
enum {
    DRAW_ORDER_INDEX = 0,
    DRAW_ORDER_LIFETIME = 1,
    DRAW_ORDER_REVERSE_LIFETIME = 2,
    DRAW_ORDER_VIEW_DEPTH = 3,
}
#enum EmitFlags
enum {
    EMIT_FLAG_POSITION = 1,
    EMIT_FLAG_ROTATION_SCALE = 2,
    EMIT_FLAG_VELOCITY = 4,
    EMIT_FLAG_COLOR = 8,
    EMIT_FLAG_CUSTOM = 16,
}
#enum TransformAlign
enum {
    TRANSFORM_ALIGN_DISABLED = 0,
    TRANSFORM_ALIGN_Z_BILLBOARD = 1,
    TRANSFORM_ALIGN_Y_TO_VELOCITY = 2,
    TRANSFORM_ALIGN_Z_BILLBOARD_Y_TO_VELOCITY = 3,
}
#desc Number of particles to emit.
var amount: int:
	get = get_amount, set = set_amount

var collision_base_size: float:
	get = get_collision_base_size, set = set_collision_base_size

#desc Particle draw order. Uses [enum DrawOrder] values.
var draw_order: int:
	get = get_draw_order, set = set_draw_order

#desc [Mesh] that is drawn for the first draw pass.
var draw_pass_1: Mesh:
	get = get_draw_pass_mesh, set = set_draw_pass_mesh

#desc [Mesh] that is drawn for the second draw pass.
var draw_pass_2: Mesh:
	get = get_draw_pass_mesh, set = set_draw_pass_mesh

#desc [Mesh] that is drawn for the third draw pass.
var draw_pass_3: Mesh:
	get = get_draw_pass_mesh, set = set_draw_pass_mesh

#desc [Mesh] that is drawn for the fourth draw pass.
var draw_pass_4: Mesh:
	get = get_draw_pass_mesh, set = set_draw_pass_mesh

#desc The number of draw passes when rendering particles.
var draw_passes: int:
	get = get_draw_passes, set = set_draw_passes

var draw_skin: Skin:
	get = get_skin, set = set_skin

#desc If [code]true[/code], particles are being emitted.
var emitting: bool:
	get = is_emitting, set = set_emitting

#desc Time ratio between each emission. If [code]0[/code], particles are emitted continuously. If [code]1[/code], all particles are emitted simultaneously.
var explosiveness: float:
	get = get_explosiveness_ratio, set = set_explosiveness_ratio

#desc The particle system's frame rate is fixed to a value. For example, changing the value to 2 will make the particles render at 2 frames per second. Note this does not slow down the simulation of the particle system itself.
var fixed_fps: int:
	get = get_fixed_fps, set = set_fixed_fps

#desc If [code]true[/code], results in fractional delta calculation which has a smoother particles display effect.
var fract_delta: bool:
	get = get_fractional_delta, set = set_fractional_delta

#desc Enables particle interpolation, which makes the particle movement smoother when their [member fixed_fps] is lower than the screen refresh rate.
var interpolate: bool:
	get = get_interpolate, set = set_interpolate

#desc Amount of time each particle will exist.
var lifetime: float:
	get = get_lifetime, set = set_lifetime

#desc If [code]true[/code], particles use the parent node's coordinate space (known as local coordinates). This will cause particles to move and rotate along the [GPUParticles3D] node (and its parents) when it is moved or rotated. If [code]false[/code], particles use global coordinates; they will not move or rotate along the [GPUParticles3D] node (and its parents) when it is moved or rotated.
var local_coords: bool:
	get = get_use_local_coordinates, set = set_use_local_coordinates

#desc If [code]true[/code], only [code]amount[/code] particles will be emitted.
var one_shot: bool:
	get = get_one_shot, set = set_one_shot

#desc Amount of time to preprocess the particles before animation starts. Lets you start the animation some time after particles have started emitting.
var preprocess: float:
	get = get_pre_process_time, set = set_pre_process_time

#desc [Material] for processing particles. Can be a [ParticleProcessMaterial] or a [ShaderMaterial].
var process_material: Material:
	get = get_process_material, set = set_process_material

#desc Emission randomness ratio.
var randomness: float:
	get = get_randomness_ratio, set = set_randomness_ratio

#desc Speed scaling ratio. A value of [code]0[/code] can be used to pause the particles.
var speed_scale: float:
	get = get_speed_scale, set = set_speed_scale

var sub_emitter: NodePath:
	get = get_sub_emitter, set = set_sub_emitter

#desc If [code]true[/code], enables particle trails using a mesh skinning system. Designed to work with [RibbonTrailMesh] and [TubeTrailMesh].
#desc [b]Note:[/b] [member BaseMaterial3D.use_particle_trails] must also be enabled on the particle mesh's material. Otherwise, setting [member trail_enabled] to [code]true[/code] will have no effect.
#desc [b]Note:[/b] Unlike [GPUParticles2D], the number of trail sections and subdivisions is set in the [RibbonTrailMesh] or the [TubeTrailMesh]'s properties.
var trail_enabled: bool:
	get = is_trail_enabled, set = set_trail_enabled

#desc The amount of time the particle's trail should represent (in seconds). Only effective if [member trail_enabled] is [code]true[/code].
var trail_lifetime: float:
	get = get_trail_lifetime, set = set_trail_lifetime

var transform_align: int:
	get = get_transform_align, set = set_transform_align

#desc The [AABB] that determines the node's region which needs to be visible on screen for the particle system to be active.
#desc Grow the box if particles suddenly appear/disappear when the node enters/exits the screen. The [AABB] can be grown via code or with the [b]Particles → Generate AABB[/b] editor tool.
var visibility_aabb: AABB:
	get = get_visibility_aabb, set = set_visibility_aabb



#desc Returns the axis-aligned bounding box that contains all the particles that are active in the current frame.
func capture_aabb() -> AABB:
	pass;

#desc Emits a single particle. Whether [param xform], [param velocity], [param color] and [param custom] are applied depends on the value of [param flags]. See [enum EmitFlags].
func emit_particle(xform: Transform3D, velocity: Vector3, color: Color, custom: Color, flags: int) -> void:
	pass;

#desc Returns the [Mesh] that is drawn at index [param pass].
func get_draw_pass_mesh(pass: int) -> Mesh:
	pass;

#desc Restarts the particle emission, clearing existing particles.
func restart() -> void:
	pass;

#desc Sets the [Mesh] that is drawn at index [param pass].
func set_draw_pass_mesh(pass: int, mesh: Mesh) -> void:
	pass;


func get_amount() -> int:
	return amount

func set_amount(value: int) -> void:
	amount = value

func get_collision_base_size() -> float:
	return collision_base_size

func set_collision_base_size(value: float) -> void:
	collision_base_size = value

func get_draw_order() -> int:
	return draw_order

func set_draw_order(value: int) -> void:
	draw_order = value

func get_draw_pass_mesh() -> Mesh:
	return draw_pass_1

func set_draw_pass_mesh(value: Mesh) -> void:
	draw_pass_1 = value

func get_draw_pass_mesh() -> Mesh:
	return draw_pass_2

func set_draw_pass_mesh(value: Mesh) -> void:
	draw_pass_2 = value

func get_draw_pass_mesh() -> Mesh:
	return draw_pass_3

func set_draw_pass_mesh(value: Mesh) -> void:
	draw_pass_3 = value

func get_draw_pass_mesh() -> Mesh:
	return draw_pass_4

func set_draw_pass_mesh(value: Mesh) -> void:
	draw_pass_4 = value

func get_draw_passes() -> int:
	return draw_passes

func set_draw_passes(value: int) -> void:
	draw_passes = value

func get_skin() -> Skin:
	return draw_skin

func set_skin(value: Skin) -> void:
	draw_skin = value

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

func get_fractional_delta() -> bool:
	return fract_delta

func set_fractional_delta(value: bool) -> void:
	fract_delta = value

func get_interpolate() -> bool:
	return interpolate

func set_interpolate(value: bool) -> void:
	interpolate = value

func get_lifetime() -> float:
	return lifetime

func set_lifetime(value: float) -> void:
	lifetime = value

func get_use_local_coordinates() -> bool:
	return local_coords

func set_use_local_coordinates(value: bool) -> void:
	local_coords = value

func get_one_shot() -> bool:
	return one_shot

func set_one_shot(value: bool) -> void:
	one_shot = value

func get_pre_process_time() -> float:
	return preprocess

func set_pre_process_time(value: float) -> void:
	preprocess = value

func get_process_material() -> Material:
	return process_material

func set_process_material(value: Material) -> void:
	process_material = value

func get_randomness_ratio() -> float:
	return randomness

func set_randomness_ratio(value: float) -> void:
	randomness = value

func get_speed_scale() -> float:
	return speed_scale

func set_speed_scale(value: float) -> void:
	speed_scale = value

func get_sub_emitter() -> NodePath:
	return sub_emitter

func set_sub_emitter(value: NodePath) -> void:
	sub_emitter = value

func is_trail_enabled() -> bool:
	return trail_enabled

func set_trail_enabled(value: bool) -> void:
	trail_enabled = value

func get_trail_lifetime() -> float:
	return trail_lifetime

func set_trail_lifetime(value: float) -> void:
	trail_lifetime = value

func get_transform_align() -> int:
	return transform_align

func set_transform_align(value: int) -> void:
	transform_align = value

func get_visibility_aabb() -> AABB:
	return visibility_aabb

func set_visibility_aabb(value: AABB) -> void:
	visibility_aabb = value

