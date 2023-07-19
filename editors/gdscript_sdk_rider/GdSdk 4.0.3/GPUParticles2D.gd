extends Node2D
#brief 2D particle emitter.
#desc 2D particle node used to create a variety of particle systems and effects. [GPUParticles2D] features an emitter that generates some number of particles at a given rate.
#desc Use the [member process_material] property to add a [ParticleProcessMaterial] to configure particle appearance and behavior. Alternatively, you can add a [ShaderMaterial] which will be applied to all particles.
#desc 2D particles can optionally collide with [LightOccluder2D] nodes (note: they don't collide with [PhysicsBody2D] nodes).
#tutorial [Particle systems (2D)] https://docs.godotengine.org/en/stable/tutorials/2d/particle_systems_2d.html
#tutorial [2D Particles Demo] https://godotengine.org/asset-library/asset/118
#tutorial [2D Dodge The Creeps Demo (uses GPUParticles2D for the trail behind the player)] https://godotengine.org/asset-library/asset/515
class_name GPUParticles2D

#desc Particles are drawn in the order emitted.
#desc Particles are drawn in order of remaining lifetime.
#desc Particle starts at the specified position.
#desc Particle starts with specified rotation and scale.
#desc Particle starts with the specified velocity vector, which defines the emission direction and speed.
#desc Particle starts with specified color.
#desc Particle starts with specified [code]CUSTOM[/code] data.

#enum DrawOrder
enum {
    DRAW_ORDER_INDEX = 0,
    DRAW_ORDER_LIFETIME = 1,
    DRAW_ORDER_REVERSE_LIFETIME = 2,
}
#enum EmitFlags
enum {
    EMIT_FLAG_POSITION = 1,
    EMIT_FLAG_ROTATION_SCALE = 2,
    EMIT_FLAG_VELOCITY = 4,
    EMIT_FLAG_COLOR = 8,
    EMIT_FLAG_CUSTOM = 16,
}
#desc Number of particles emitted in one emission cycle.
var amount: int:
	get = get_amount, set = set_amount

#desc Multiplier for particle's collision radius. [code]1.0[/code] corresponds to the size of the sprite.
var collision_base_size: float:
	get = get_collision_base_size, set = set_collision_base_size

#desc Particle draw order. Uses [enum DrawOrder] values.
var draw_order: int:
	get = get_draw_order, set = set_draw_order

#desc If [code]true[/code], particles are being emitted.
var emitting: bool:
	get = is_emitting, set = set_emitting

#desc How rapidly particles in an emission cycle are emitted. If greater than [code]0[/code], there will be a gap in emissions before the next cycle begins.
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

#desc If [code]true[/code], particles use the parent node's coordinate space (known as local coordinates). This will cause particles to move and rotate along the [GPUParticles2D] node (and its parents) when it is moved or rotated. If [code]false[/code], particles use global coordinates; they will not move or rotate along the [GPUParticles2D] node (and its parents) when it is moved or rotated.
var local_coords: bool:
	get = get_use_local_coordinates, set = set_use_local_coordinates

#desc If [code]true[/code], only one emission cycle occurs. If set [code]true[/code] during a cycle, emission will stop at the cycle's end.
var one_shot: bool:
	get = get_one_shot, set = set_one_shot

#desc Particle system starts as if it had already run for this many seconds.
var preprocess: float:
	get = get_pre_process_time, set = set_pre_process_time

#desc [Material] for processing particles. Can be a [ParticleProcessMaterial] or a [ShaderMaterial].
var process_material: Material:
	get = get_process_material, set = set_process_material

#desc Emission lifetime randomness ratio.
var randomness: float:
	get = get_randomness_ratio, set = set_randomness_ratio

#desc Particle system's running speed scaling ratio. A value of [code]0[/code] can be used to pause the particles.
var speed_scale: float:
	get = get_speed_scale, set = set_speed_scale

#desc The [NodePath] to the [GPUParticles2D] used for sub-emissions.
var sub_emitter: NodePath:
	get = get_sub_emitter, set = set_sub_emitter

#desc Particle texture. If [code]null[/code], particles will be squares.
var texture: Texture2D:
	get = get_texture, set = set_texture

#desc If [code]true[/code], enables particle trails using a mesh skinning system.
#desc [b]Note:[/b] Unlike [GPUParticles3D], the number of trail sections and subdivisions is set with the [member trail_sections] and [member trail_section_subdivisions] properties.
var trail_enabled: bool:
	get = is_trail_enabled, set = set_trail_enabled

#desc The amount of time the particle's trail should represent (in seconds). Only effective if [member trail_enabled] is [code]true[/code].
var trail_lifetime: float:
	get = get_trail_lifetime, set = set_trail_lifetime

#desc The number of subdivisions to use for the particle trail rendering. Higher values can result in smoother trail curves, at the cost of performance due to increased mesh complexity. See also [member trail_sections]. Only effective if [member trail_enabled] is [code]true[/code].
var trail_section_subdivisions: int:
	get = get_trail_section_subdivisions, set = set_trail_section_subdivisions

#desc The number of sections to use for the particle trail rendering. Higher values can result in smoother trail curves, at the cost of performance due to increased mesh complexity. See also [member trail_section_subdivisions]. Only effective if [member trail_enabled] is [code]true[/code].
var trail_sections: int:
	get = get_trail_sections, set = set_trail_sections

#desc The [Rect2] that determines the node's region which needs to be visible on screen for the particle system to be active.
#desc Grow the rect if particles suddenly appear/disappear when the node enters/exits the screen. The [Rect2] can be grown via code or with the [b]Particles → Generate Visibility Rect[/b] editor tool.
var visibility_rect: Rect2:
	get = get_visibility_rect, set = set_visibility_rect



#desc Returns a rectangle containing the positions of all existing particles.
func capture_rect() -> Rect2:
	pass;

#desc Emits a single particle. Whether [param xform], [param velocity], [param color] and [param custom] are applied depends on the value of [param flags]. See [enum EmitFlags].
func emit_particle(xform: Transform2D, velocity: Vector2, color: Color, custom: Color, flags: int) -> void:
	pass;

#desc Restarts all the existing particles.
func restart() -> void:
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

func get_texture() -> Texture2D:
	return texture

func set_texture(value: Texture2D) -> void:
	texture = value

func is_trail_enabled() -> bool:
	return trail_enabled

func set_trail_enabled(value: bool) -> void:
	trail_enabled = value

func get_trail_lifetime() -> float:
	return trail_lifetime

func set_trail_lifetime(value: float) -> void:
	trail_lifetime = value

func get_trail_section_subdivisions() -> int:
	return trail_section_subdivisions

func set_trail_section_subdivisions(value: int) -> void:
	trail_section_subdivisions = value

func get_trail_sections() -> int:
	return trail_sections

func set_trail_sections(value: int) -> void:
	trail_sections = value

func get_visibility_rect() -> Rect2:
	return visibility_rect

func set_visibility_rect(value: Rect2) -> void:
	visibility_rect = value

