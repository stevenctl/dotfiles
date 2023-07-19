extends Material
#brief A material for [CanvasItem]s.
#desc [CanvasItemMaterial]s provide a means of modifying the textures associated with a CanvasItem. They specialize in describing blend and lighting behaviors for textures. Use a [ShaderMaterial] to more fully customize a material's interactions with a [CanvasItem].
class_name CanvasItemMaterial

#desc Mix blending mode. Colors are assumed to be independent of the alpha (opacity) value.
#desc Additive blending mode.
#desc Subtractive blending mode.
#desc Multiplicative blending mode.
#desc Mix blending mode. Colors are assumed to be premultiplied by the alpha (opacity) value.
#desc Render the material using both light and non-light sensitive material properties.
#desc Render the material as if there were no light.
#desc Render the material as if there were only light.

#enum BlendMode
enum {
    BLEND_MODE_MIX = 0,
    BLEND_MODE_ADD = 1,
    BLEND_MODE_SUB = 2,
    BLEND_MODE_MUL = 3,
    BLEND_MODE_PREMULT_ALPHA = 4,
}
#enum LightMode
enum {
    LIGHT_MODE_NORMAL = 0,
    LIGHT_MODE_UNSHADED = 1,
    LIGHT_MODE_LIGHT_ONLY = 2,
}
#desc The manner in which a material's rendering is applied to underlying textures.
var blend_mode: int:
	get = get_blend_mode, set = set_blend_mode

#desc The manner in which material reacts to lighting.
var light_mode: int:
	get = get_light_mode, set = set_light_mode

#desc The number of columns in the spritesheet assigned as [Texture2D] for a [GPUParticles2D] or [CPUParticles2D].
#desc [b]Note:[/b] This property is only used and visible in the editor if [member particles_animation] is [code]true[/code].
var particles_anim_h_frames: int:
	get = get_particles_anim_h_frames, set = set_particles_anim_h_frames

#desc If [code]true[/code], the particles animation will loop.
#desc [b]Note:[/b] This property is only used and visible in the editor if [member particles_animation] is [code]true[/code].
var particles_anim_loop: bool:
	get = get_particles_anim_loop, set = set_particles_anim_loop

#desc The number of rows in the spritesheet assigned as [Texture2D] for a [GPUParticles2D] or [CPUParticles2D].
#desc [b]Note:[/b] This property is only used and visible in the editor if [member particles_animation] is [code]true[/code].
var particles_anim_v_frames: int:
	get = get_particles_anim_v_frames, set = set_particles_anim_v_frames

#desc If [code]true[/code], enable spritesheet-based animation features when assigned to [GPUParticles2D] and [CPUParticles2D] nodes. The [member ParticleProcessMaterial.anim_speed_max] or [member CPUParticles2D.anim_speed_max] should also be set to a positive value for the animation to play.
#desc This property (and other [code]particles_anim_*[/code] properties that depend on it) has no effect on other types of nodes.
var particles_animation: bool:
	get = get_particles_animation, set = set_particles_animation




func get_blend_mode() -> int:
	return blend_mode

func set_blend_mode(value: int) -> void:
	blend_mode = value

func get_light_mode() -> int:
	return light_mode

func set_light_mode(value: int) -> void:
	light_mode = value

func get_particles_anim_h_frames() -> int:
	return particles_anim_h_frames

func set_particles_anim_h_frames(value: int) -> void:
	particles_anim_h_frames = value

func get_particles_anim_loop() -> bool:
	return particles_anim_loop

func set_particles_anim_loop(value: bool) -> void:
	particles_anim_loop = value

func get_particles_anim_v_frames() -> int:
	return particles_anim_v_frames

func set_particles_anim_v_frames(value: int) -> void:
	particles_anim_v_frames = value

func get_particles_animation() -> bool:
	return particles_animation

func set_particles_animation(value: bool) -> void:
	particles_animation = value

