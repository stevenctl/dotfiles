extends GeometryInstance3D
#brief 2D sprite node in 3D environment.
#desc A node that displays 2D texture information in a 3D environment. See also [Sprite3D] where many other properties are defined.
class_name SpriteBase3D

#desc If set, the texture's transparency and the opacity are used to make those parts of the sprite invisible.
#desc If set, lights in the environment affect the sprite.
#desc If set, texture can be seen from the back as well. If not, the texture is invisible when looking at it from behind.
#desc Disables the depth test, so this object is drawn on top of all others. However, objects drawn after it in the draw order may cover it.
#desc Label is scaled by depth so that it always appears the same size on screen.
#desc Represents the size of the [enum DrawFlags] enum.
#desc This mode performs standard alpha blending. It can display translucent areas, but transparency sorting issues may be visible when multiple transparent materials are overlapping.
#desc This mode only allows fully transparent or fully opaque pixels. Harsh edges will be visible unless some form of screen-space antialiasing is enabled (see [member ProjectSettings.rendering/anti_aliasing/quality/screen_space_aa]). On the bright side, this mode doesn't suffer from transparency sorting issues when multiple transparent materials are overlapping. This mode is also known as [i]alpha testing[/i] or [i]1-bit transparency[/i].
#desc This mode draws fully opaque pixels in the depth prepass. This is slower than [constant ALPHA_CUT_DISABLED] or [constant ALPHA_CUT_DISCARD], but it allows displaying translucent areas and smooth edges while using proper sorting.
#desc This mode draws cuts off all values below a spatially-deterministic threshold, the rest will remain opaque.

#enum DrawFlags
enum {
    FLAG_TRANSPARENT = 0,
    FLAG_SHADED = 1,
    FLAG_DOUBLE_SIDED = 2,
    FLAG_DISABLE_DEPTH_TEST = 3,
    FLAG_FIXED_SIZE = 4,
    FLAG_MAX = 5,
}
#enum AlphaCutMode
enum {
    ALPHA_CUT_DISABLED = 0,
    ALPHA_CUT_DISCARD = 1,
    ALPHA_CUT_OPAQUE_PREPASS = 2,
    ALPHA_CUT_HASH = 3,
}
#desc Threshold at which antialiasing will be applied on the alpha channel.
var alpha_antialiasing_edge: float:
	get = get_alpha_antialiasing_edge, set = set_alpha_antialiasing_edge

#desc The type of alpha antialiasing to apply. See [enum BaseMaterial3D.AlphaAntiAliasing].
var alpha_antialiasing_mode: int:
	get = get_alpha_antialiasing, set = set_alpha_antialiasing

#desc The alpha cutting mode to use for the sprite. See [enum AlphaCutMode] for possible values.
var alpha_cut: int:
	get = get_alpha_cut_mode, set = set_alpha_cut_mode

#desc The hashing scale for Alpha Hash. Recommended values between [code]0[/code] and [code]2[/code].
var alpha_hash_scale: float:
	get = get_alpha_hash_scale, set = set_alpha_hash_scale

#desc Threshold at which the alpha scissor will discard values.
var alpha_scissor_threshold: float:
	get = get_alpha_scissor_threshold, set = set_alpha_scissor_threshold

#desc The direction in which the front of the texture faces.
var axis: int:
	get = get_axis, set = set_axis

#desc The billboard mode to use for the sprite. See [enum BaseMaterial3D.BillboardMode] for possible values.
var billboard: int:
	get = get_billboard_mode, set = set_billboard_mode

#desc If [code]true[/code], texture will be centered.
var centered: bool:
	get = is_centered, set = set_centered

#desc If [code]true[/code], texture can be seen from the back as well, if [code]false[/code], it is invisible when looking at it from behind.
var double_sided: bool:
	get = get_draw_flag, set = set_draw_flag

#desc If [code]true[/code], the label is rendered at the same size regardless of distance.
var fixed_size: bool:
	get = get_draw_flag, set = set_draw_flag

#desc If [code]true[/code], texture is flipped horizontally.
var flip_h: bool:
	get = is_flipped_h, set = set_flip_h

#desc If [code]true[/code], texture is flipped vertically.
var flip_v: bool:
	get = is_flipped_v, set = set_flip_v

#desc A color value used to [i]multiply[/i] the texture's colors. Can be used for mood-coloring or to simulate the color of light.
#desc [b]Note:[/b] If a [member GeometryInstance3D.material_override] is defined on the [SpriteBase3D], the material override must be configured to take vertex colors into account for albedo. Otherwise, the color defined in [member modulate] will be ignored. For a [BaseMaterial3D], [member BaseMaterial3D.vertex_color_use_as_albedo] must be [code]true[/code]. For a [ShaderMaterial], [code]ALBEDO *= COLOR.rgb;[/code] must be inserted in the shader's [code]fragment()[/code] function.
var modulate: Color:
	get = get_modulate, set = set_modulate

#desc If [code]true[/code], depth testing is disabled and the object will be drawn in render order.
var no_depth_test: bool:
	get = get_draw_flag, set = set_draw_flag

#desc The texture's drawing offset.
var offset: Vector2:
	get = get_offset, set = set_offset

#desc The size of one pixel's width on the sprite to scale it in 3D.
var pixel_size: float:
	get = get_pixel_size, set = set_pixel_size

#desc Sets the render priority for the sprite. Higher priority objects will be sorted in front of lower priority objects.
#desc [b]Note:[/b] This only applies if [member alpha_cut] is set to [constant ALPHA_CUT_DISABLED] (default value).
#desc [b]Note:[/b] This only applies to sorting of transparent objects. This will not impact how transparent objects are sorted relative to opaque objects. This is because opaque objects are not sorted, while transparent objects are sorted from back to front (subject to priority).
var render_priority: int:
	get = get_render_priority, set = set_render_priority

#desc If [code]true[/code], the [Light3D] in the [Environment] has effects on the sprite.
var shaded: bool:
	get = get_draw_flag, set = set_draw_flag

#desc Filter flags for the texture. See [enum BaseMaterial3D.TextureFilter] for options.
var texture_filter: int:
	get = get_texture_filter, set = set_texture_filter

#desc If [code]true[/code], the texture's transparency and the opacity are used to make those parts of the sprite invisible.
var transparent: bool:
	get = get_draw_flag, set = set_draw_flag



#desc Returns a [TriangleMesh] with the sprite's vertices following its current configuration (such as its [member axis] and [member pixel_size]).
func generate_triangle_mesh() -> TriangleMesh:
	pass;

#desc Returns the value of the specified flag.
func get_draw_flag(flag: int) -> bool:
	pass;

#desc Returns the rectangle representing this sprite.
func get_item_rect() -> Rect2:
	pass;

#desc If [code]true[/code], the specified flag will be enabled. See [enum SpriteBase3D.DrawFlags] for a list of flags.
func set_draw_flag(flag: int, enabled: bool) -> void:
	pass;


func get_alpha_antialiasing_edge() -> float:
	return alpha_antialiasing_edge

func set_alpha_antialiasing_edge(value: float) -> void:
	alpha_antialiasing_edge = value

func get_alpha_antialiasing() -> int:
	return alpha_antialiasing_mode

func set_alpha_antialiasing(value: int) -> void:
	alpha_antialiasing_mode = value

func get_alpha_cut_mode() -> int:
	return alpha_cut

func set_alpha_cut_mode(value: int) -> void:
	alpha_cut = value

func get_alpha_hash_scale() -> float:
	return alpha_hash_scale

func set_alpha_hash_scale(value: float) -> void:
	alpha_hash_scale = value

func get_alpha_scissor_threshold() -> float:
	return alpha_scissor_threshold

func set_alpha_scissor_threshold(value: float) -> void:
	alpha_scissor_threshold = value

func get_axis() -> int:
	return axis

func set_axis(value: int) -> void:
	axis = value

func get_billboard_mode() -> int:
	return billboard

func set_billboard_mode(value: int) -> void:
	billboard = value

func is_centered() -> bool:
	return centered

func set_centered(value: bool) -> void:
	centered = value

func get_draw_flag() -> bool:
	return double_sided

func set_draw_flag(value: bool) -> void:
	double_sided = value

func get_draw_flag() -> bool:
	return fixed_size

func set_draw_flag(value: bool) -> void:
	fixed_size = value

func is_flipped_h() -> bool:
	return flip_h

func set_flip_h(value: bool) -> void:
	flip_h = value

func is_flipped_v() -> bool:
	return flip_v

func set_flip_v(value: bool) -> void:
	flip_v = value

func get_modulate() -> Color:
	return modulate

func set_modulate(value: Color) -> void:
	modulate = value

func get_draw_flag() -> bool:
	return no_depth_test

func set_draw_flag(value: bool) -> void:
	no_depth_test = value

func get_offset() -> Vector2:
	return offset

func set_offset(value: Vector2) -> void:
	offset = value

func get_pixel_size() -> float:
	return pixel_size

func set_pixel_size(value: float) -> void:
	pixel_size = value

func get_render_priority() -> int:
	return render_priority

func set_render_priority(value: int) -> void:
	render_priority = value

func get_draw_flag() -> bool:
	return shaded

func set_draw_flag(value: bool) -> void:
	shaded = value

func get_texture_filter() -> int:
	return texture_filter

func set_texture_filter(value: int) -> void:
	texture_filter = value

func get_draw_flag() -> bool:
	return transparent

func set_draw_flag(value: bool) -> void:
	transparent = value

