extends PrimitiveMesh
#brief Generate an [PrimitiveMesh] from the text.
#desc Generate an [PrimitiveMesh] from the text.
#desc TextMesh can be generated only when using dynamic fonts with vector glyph contours. Bitmap fonts (including bitmap data in the TrueType/OpenType containers, like color emoji fonts) are not supported.
#desc The UV layout is arranged in 4 horizontal strips, top to bottom: 40% of the height for the front face, 40% for the back face, 10% for the outer edges and 10% for the inner edges.
class_name TextMesh


#desc If set to something other than [constant TextServer.AUTOWRAP_OFF], the text gets wrapped inside the node's bounding rectangle. If you resize the node, it will change its height automatically to show all the text. To see how each mode behaves, see [enum TextServer.AutowrapMode].
var autowrap_mode: int:
	get = get_autowrap_mode, set = set_autowrap_mode

#desc Step (in pixels) used to approximate Bézier curves.
var curve_step: float:
	get = get_curve_step, set = set_curve_step

#desc Depths of the mesh, if set to [code]0.0[/code] only front surface, is generated, and UV layout is changed to use full texture for the front face only.
var depth: float:
	get = get_depth, set = set_depth

#desc Font configuration used to display text.
var font: Font:
	get = get_font, set = set_font

#desc Font size of the [TextMesh]'s text.
var font_size: int:
	get = get_font_size, set = set_font_size

#desc Controls the text's horizontal alignment. Supports left, center, right, and fill, or justify. Set it to one of the [enum HorizontalAlignment] constants.
var horizontal_alignment: int:
	get = get_horizontal_alignment, set = set_horizontal_alignment

#desc Language code used for text shaping algorithms, if left empty current locale is used instead.
var language: String:
	get = get_language, set = set_language

#desc Vertical space between lines in multiline [TextMesh].
var line_spacing: float:
	get = get_line_spacing, set = set_line_spacing

#desc The text drawing offset (in pixels).
var offset: Vector2:
	get = get_offset, set = set_offset

#desc The size of one pixel's width on the text to scale it in 3D.
var pixel_size: float:
	get = get_pixel_size, set = set_pixel_size

#desc Set BiDi algorithm override for the structured text.
var structured_text_bidi_override: int:
	get = get_structured_text_bidi_override, set = set_structured_text_bidi_override

#desc Set additional options for BiDi override.
var structured_text_bidi_override_options: Array:
	get = get_structured_text_bidi_override_options, set = set_structured_text_bidi_override_options

#desc The text to generate mesh from.
var text: String:
	get = get_text, set = set_text

#desc Base text writing direction.
var text_direction: int:
	get = get_text_direction, set = set_text_direction

#desc If [code]true[/code], all the text displays as UPPERCASE.
var uppercase: bool:
	get = is_uppercase, set = set_uppercase

#desc Controls the text's vertical alignment. Supports top, center, bottom. Set it to one of the [enum VerticalAlignment] constants.
var vertical_alignment: int:
	get = get_vertical_alignment, set = set_vertical_alignment

#desc Text width (in pixels), used for fill alignment.
var width: float:
	get = get_width, set = set_width




func get_autowrap_mode() -> int:
	return autowrap_mode

func set_autowrap_mode(value: int) -> void:
	autowrap_mode = value

func get_curve_step() -> float:
	return curve_step

func set_curve_step(value: float) -> void:
	curve_step = value

func get_depth() -> float:
	return depth

func set_depth(value: float) -> void:
	depth = value

func get_font() -> Font:
	return font

func set_font(value: Font) -> void:
	font = value

func get_font_size() -> int:
	return font_size

func set_font_size(value: int) -> void:
	font_size = value

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

func get_offset() -> Vector2:
	return offset

func set_offset(value: Vector2) -> void:
	offset = value

func get_pixel_size() -> float:
	return pixel_size

func set_pixel_size(value: float) -> void:
	pixel_size = value

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

