extends GeometryInstance3D
#brief Displays plain text in a 3D world.
#desc Label3D displays plain text in a 3D world. It gives you control over the horizontal and vertical alignment.
class_name Label3D

#desc If set, lights in the environment affect the label.
#desc If set, text can be seen from the back as well. If not, the text is invisible when looking at it from behind.
#desc Disables the depth test, so this object is drawn on top of all others. However, objects drawn after it in the draw order may cover it.
#desc Label is scaled by depth so that it always appears the same size on screen.
#desc Represents the size of the [enum DrawFlags] enum.
#desc This mode performs standard alpha blending. It can display translucent areas, but transparency sorting issues may be visible when multiple transparent materials are overlapping. [member GeometryInstance3D.cast_shadow] has no effect when this transparency mode is used; the [Label3D] will never cast shadows.
#desc This mode only allows fully transparent or fully opaque pixels. Harsh edges will be visible unless some form of screen-space antialiasing is enabled (see [member ProjectSettings.rendering/anti_aliasing/quality/screen_space_aa]). This mode is also known as [i]alpha testing[/i] or [i]1-bit transparency[/i].
#desc [b]Note:[/b] This mode might have issues with anti-aliased fonts and outlines, try adjusting [member alpha_scissor_threshold] or using MSDF font.
#desc [b]Note:[/b] When using text with overlapping glyphs (e.g., cursive scripts), this mode might have transparency sorting issues between the main text and the outline.
#desc This mode draws fully opaque pixels in the depth prepass. This is slower than [constant ALPHA_CUT_DISABLED] or [constant ALPHA_CUT_DISCARD], but it allows displaying translucent areas and smooth edges while using proper sorting.
#desc [b]Note:[/b] When using text with overlapping glyphs (e.g., cursive scripts), this mode might have transparency sorting issues between the main text and the outline.
#desc This mode draws cuts off all values below a spatially-deterministic threshold, the rest will remain opaque.

#enum DrawFlags
enum {
    FLAG_SHADED = 0,
    FLAG_DOUBLE_SIDED = 1,
    FLAG_DISABLE_DEPTH_TEST = 2,
    FLAG_FIXED_SIZE = 3,
    FLAG_MAX = 4,
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

#desc If set to something other than [constant TextServer.AUTOWRAP_OFF], the text gets wrapped inside the node's bounding rectangle. If you resize the node, it will change its height automatically to show all the text. To see how each mode behaves, see [enum TextServer.AutowrapMode].
var autowrap_mode: int:
	get = get_autowrap_mode, set = set_autowrap_mode

#desc The billboard mode to use for the label. See [enum BaseMaterial3D.BillboardMode] for possible values.
var billboard: int:
	get = get_billboard_mode, set = set_billboard_mode

var cast_shadow: int:
	get = get_cast_shadows_setting, set = set_cast_shadows_setting

#desc If [code]true[/code], text can be seen from the back as well, if [code]false[/code], it is invisible when looking at it from behind.
var double_sided: bool:
	get = get_draw_flag, set = set_draw_flag

#desc If [code]true[/code], the label is rendered at the same size regardless of distance.
var fixed_size: bool:
	get = get_draw_flag, set = set_draw_flag

#desc Font configuration used to display text.
var font: Font:
	get = get_font, set = set_font

#desc Font size of the [Label3D]'s text. To make the font look more detailed when up close, increase [member font_size] while decreasing [member pixel_size] at the same time.
#desc Higher font sizes require more time to render new characters, which can cause stuttering during gameplay.
var font_size: int:
	get = get_font_size, set = set_font_size

var gi_mode: int:
	get = get_gi_mode, set = set_gi_mode

#desc Controls the text's horizontal alignment. Supports left, center, right, and fill, or justify. Set it to one of the [enum HorizontalAlignment] constants.
var horizontal_alignment: int:
	get = get_horizontal_alignment, set = set_horizontal_alignment

#desc Language code used for line-breaking and text shaping algorithms, if left empty current locale is used instead.
var language: String:
	get = get_language, set = set_language

#desc Vertical space between lines in multiline [Label3D].
var line_spacing: float:
	get = get_line_spacing, set = set_line_spacing

#desc Text [Color] of the [Label3D].
var modulate: Color:
	get = get_modulate, set = set_modulate

#desc If [code]true[/code], depth testing is disabled and the object will be drawn in render order.
var no_depth_test: bool:
	get = get_draw_flag, set = set_draw_flag

#desc The text drawing offset (in pixels).
var offset: Vector2:
	get = get_offset, set = set_offset

#desc The tint of text outline.
var outline_modulate: Color:
	get = get_outline_modulate, set = set_outline_modulate

#desc Sets the render priority for the text outline. Higher priority objects will be sorted in front of lower priority objects.
#desc [b]Note:[/b] This only applies if [member alpha_cut] is set to [constant ALPHA_CUT_DISABLED] (default value).
#desc [b]Note:[/b] This only applies to sorting of transparent objects. This will not impact how transparent objects are sorted relative to opaque objects. This is because opaque objects are not sorted, while transparent objects are sorted from back to front (subject to priority).
var outline_render_priority: int:
	get = get_outline_render_priority, set = set_outline_render_priority

#desc Text outline size.
var outline_size: int:
	get = get_outline_size, set = set_outline_size

#desc The size of one pixel's width on the label to scale it in 3D. To make the font look more detailed when up close, increase [member font_size] while decreasing [member pixel_size] at the same time.
var pixel_size: float:
	get = get_pixel_size, set = set_pixel_size

#desc Sets the render priority for the text. Higher priority objects will be sorted in front of lower priority objects.
#desc [b]Note:[/b] This only applies if [member alpha_cut] is set to [constant ALPHA_CUT_DISABLED] (default value).
#desc [b]Note:[/b] This only applies to sorting of transparent objects. This will not impact how transparent objects are sorted relative to opaque objects. This is because opaque objects are not sorted, while transparent objects are sorted from back to front (subject to priority).
var render_priority: int:
	get = get_render_priority, set = set_render_priority

#desc If [code]true[/code], the [Light3D] in the [Environment] has effects on the label.
var shaded: bool:
	get = get_draw_flag, set = set_draw_flag

#desc Set BiDi algorithm override for the structured text.
var structured_text_bidi_override: int:
	get = get_structured_text_bidi_override, set = set_structured_text_bidi_override

#desc Set additional options for BiDi override.
var structured_text_bidi_override_options: Array:
	get = get_structured_text_bidi_override_options, set = set_structured_text_bidi_override_options

#desc The text to display on screen.
var text: String:
	get = get_text, set = set_text

#desc Base text writing direction.
var text_direction: int:
	get = get_text_direction, set = set_text_direction

#desc Filter flags for the texture. See [enum BaseMaterial3D.TextureFilter] for options.
var texture_filter: int:
	get = get_texture_filter, set = set_texture_filter

#desc If [code]true[/code], all the text displays as UPPERCASE.
var uppercase: bool:
	get = is_uppercase, set = set_uppercase

#desc Controls the text's vertical alignment. Supports top, center, bottom. Set it to one of the [enum VerticalAlignment] constants.
var vertical_alignment: int:
	get = get_vertical_alignment, set = set_vertical_alignment

#desc Text width (in pixels), used for autowrap and fill alignment.
var width: float:
	get = get_width, set = set_width



#desc Returns a [TriangleMesh] with the label's vertices following its current configuration (such as its [member pixel_size]).
func generate_triangle_mesh() -> TriangleMesh:
	pass;

#desc Returns the value of the specified flag.
func get_draw_flag(flag: int) -> bool:
	pass;

#desc If [code]true[/code], the specified flag will be enabled. See [enum Label3D.DrawFlags] for a list of flags.
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

func get_autowrap_mode() -> int:
	return autowrap_mode

func set_autowrap_mode(value: int) -> void:
	autowrap_mode = value

func get_billboard_mode() -> int:
	return billboard

func set_billboard_mode(value: int) -> void:
	billboard = value

func get_cast_shadows_setting() -> int:
	return cast_shadow

func set_cast_shadows_setting(value: int) -> void:
	cast_shadow = value

func get_draw_flag() -> bool:
	return double_sided

func set_draw_flag(value: bool) -> void:
	double_sided = value

func get_draw_flag() -> bool:
	return fixed_size

func set_draw_flag(value: bool) -> void:
	fixed_size = value

func get_font() -> Font:
	return font

func set_font(value: Font) -> void:
	font = value

func get_font_size() -> int:
	return font_size

func set_font_size(value: int) -> void:
	font_size = value

func get_gi_mode() -> int:
	return gi_mode

func set_gi_mode(value: int) -> void:
	gi_mode = value

func get_horizontal_alignment() -> int:
	return horizontal_alignment

func set_horizontal_alignment(value: int) -> void:
	horizontal_alignment = value

func get_language() -> String:
	return language

func set_language(value: String) -> void:
	language = value

func get_line_spacing() -> float:
	return line_spacing

func set_line_spacing(value: float) -> void:
	line_spacing = value

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

func get_outline_modulate() -> Color:
	return outline_modulate

func set_outline_modulate(value: Color) -> void:
	outline_modulate = value

func get_outline_render_priority() -> int:
	return outline_render_priority

func set_outline_render_priority(value: int) -> void:
	outline_render_priority = value

func get_outline_size() -> int:
	return outline_size

func set_outline_size(value: int) -> void:
	outline_size = value

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

func get_structured_text_bidi_override() -> int:
	return structured_text_bidi_override

func set_structured_text_bidi_override(value: int) -> void:
	structured_text_bidi_override = value

func get_structured_text_bidi_override_options() -> Array:
	return structured_text_bidi_override_options

func set_structured_text_bidi_override_options(value: Array) -> void:
	structured_text_bidi_override_options = value

func get_text() -> String:
	return text

func set_text(value: String) -> void:
	text = value

func get_text_direction() -> int:
	return text_direction

func set_text_direction(value: int) -> void:
	text_direction = value

func get_texture_filter() -> int:
	return texture_filter

func set_texture_filter(value: int) -> void:
	texture_filter = value

func is_uppercase() -> bool:
	return uppercase

func set_uppercase(value: bool) -> void:
	uppercase = value

func get_vertical_alignment() -> int:
	return vertical_alignment

func set_vertical_alignment(value: int) -> void:
	vertical_alignment = value

func get_width() -> float:
	return width

func set_width(value: float) -> void:
	width = value

