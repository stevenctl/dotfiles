extends RefCounted
#brief Holds a paragraph of text.
#desc Abstraction over [TextServer] for handling paragraph of text.
class_name TextParagraph


#desc Paragraph horizontal alignment.
var alignment: int:
	get = get_alignment, set = set_alignment

#desc Line breaking rules. For more info see [TextServer].
var break_flags: int:
	get = get_break_flags, set = set_break_flags

#desc Custom punctuation character list, used for word breaking. If set to empty string, server defaults are used.
var custom_punctuation: String:
	get = get_custom_punctuation, set = set_custom_punctuation

#desc Text writing direction.
var direction: int:
	get = get_direction, set = set_direction

#desc Line alignment rules. For more info see [TextServer].
var justification_flags: int:
	get = get_justification_flags, set = set_justification_flags

#desc Limits the lines of text shown.
var max_lines_visible: int:
	get = get_max_lines_visible, set = set_max_lines_visible

#desc Text orientation.
var orientation: int:
	get = get_orientation, set = set_orientation

#desc If set to [code]true[/code] text will display control characters.
var preserve_control: bool:
	get = get_preserve_control, set = set_preserve_control

#desc If set to [code]true[/code] text will display invalid characters.
var preserve_invalid: bool:
	get = get_preserve_invalid, set = set_preserve_invalid

#desc Sets the clipping behavior when the text exceeds the paragraph's set width. See [enum TextServer.OverrunBehavior] for a description of all modes.
var text_overrun_behavior: int:
	get = get_text_overrun_behavior, set = set_text_overrun_behavior

#desc Paragraph width.
var width: float:
	get = get_width, set = set_width



#desc Adds inline object to the text buffer, [param key] must be unique. In the text, object is represented as [param length] object replacement characters.
func add_object(key: Variant, size: Vector2, inline_align: int = 5, length: int = 1, baseline: float = 0.0) -> bool:
	pass;

#desc Adds text span and font to draw it.
func add_string(text: String, font: Font, font_size: int, language: String = "", meta: Variant = null) -> bool:
	pass;

#desc Clears text paragraph (removes text and inline objects).
func clear() -> void:
	pass;

#desc Removes dropcap.
func clear_dropcap() -> void:
	pass;

#desc Draw all lines of the text and drop cap into a canvas item at a given position, with [param color]. [param pos] specifies the top left corner of the bounding box.
func draw(canvas: RID, pos: Vector2, color: Color = Color(1, 1, 1, 1), dc_color: Color = Color(1, 1, 1, 1)) -> void:
	pass;

#desc Draw drop cap into a canvas item at a given position, with [param color]. [param pos] specifies the top left corner of the bounding box.
func draw_dropcap(canvas: RID, pos: Vector2, color: Color = Color(1, 1, 1, 1)) -> void:
	pass;

#desc Draw drop cap outline into a canvas item at a given position, with [param color]. [param pos] specifies the top left corner of the bounding box.
func draw_dropcap_outline(canvas: RID, pos: Vector2, outline_size: int = 1, color: Color = Color(1, 1, 1, 1)) -> void:
	pass;

#desc Draw single line of text into a canvas item at a given position, with [param color]. [param pos] specifies the top left corner of the bounding box.
func draw_line(canvas: RID, pos: Vector2, line: int, color: Color = Color(1, 1, 1, 1)) -> void:
	pass;

#desc Draw outline of the single line of text into a canvas item at a given position, with [param color]. [param pos] specifies the top left corner of the bounding box.
func draw_line_outline(canvas: RID, pos: Vector2, line: int, outline_size: int = 1, color: Color = Color(1, 1, 1, 1)) -> void:
	pass;

#desc Draw outlines of all lines of the text and drop cap into a canvas item at a given position, with [param color]. [param pos] specifies the top left corner of the bounding box.
func draw_outline(canvas: RID, pos: Vector2, outline_size: int = 1, color: Color = Color(1, 1, 1, 1), dc_color: Color = Color(1, 1, 1, 1)) -> void:
	pass;

#desc Returns number of lines used by dropcap.
func get_dropcap_lines() -> int:
	pass;

#desc Returns drop cap text buffer RID.
func get_dropcap_rid() -> RID:
	pass;

#desc Returns drop cap bounding box size.
func get_dropcap_size() -> Vector2:
	pass;

#desc Returns the text line ascent (number of pixels above the baseline for horizontal layout or to the left of baseline for vertical).
func get_line_ascent(line: int) -> float:
	pass;

#desc Returns number of lines in the paragraph.
func get_line_count() -> int:
	pass;

#desc Returns the text line descent (number of pixels below the baseline for horizontal layout or to the right of baseline for vertical).
func get_line_descent(line: int) -> float:
	pass;

#desc Returns bounding rectangle of the inline object.
func get_line_object_rect(line: int, key: Variant) -> Rect2:
	pass;

#desc Returns array of inline objects in the line.
func get_line_objects(line: int) -> Array:
	pass;

#desc Returns character range of the line.
func get_line_range(line: int) -> Vector2i:
	pass;

#desc Returns TextServer line buffer RID.
func get_line_rid(line: int) -> RID:
	pass;

#desc Returns size of the bounding box of the line of text.
func get_line_size(line: int) -> Vector2:
	pass;

#desc Returns pixel offset of the underline below the baseline.
func get_line_underline_position(line: int) -> float:
	pass;

#desc Returns thickness of the underline.
func get_line_underline_thickness(line: int) -> float:
	pass;

#desc Returns width (for horizontal layout) or height (for vertical) of the line of text.
func get_line_width(line: int) -> float:
	pass;

#desc Returns the size of the bounding box of the paragraph, without line breaks.
func get_non_wrapped_size() -> Vector2:
	pass;

#desc Returns TextServer full string buffer RID.
func get_rid() -> RID:
	pass;

#desc Returns the size of the bounding box of the paragraph.
func get_size() -> Vector2:
	pass;

#desc Returns caret character offset at the specified coordinates. This function always returns a valid position.
func hit_test(coords: Vector2) -> int:
	pass;

#desc Sets new size and alignment of embedded object.
func resize_object(key: Variant, size: Vector2, inline_align: int = 5, baseline: float = 0.0) -> bool:
	pass;

#desc Overrides BiDi for the structured text.
#desc Override ranges should cover full source text without overlaps. BiDi algorithm will be used on each range separately.
func set_bidi_override(override: Array) -> void:
	pass;

#desc Sets drop cap, overrides previously set drop cap. Drop cap (dropped capital) is a decorative element at the beginning of a paragraph that is larger than the rest of the text.
func set_dropcap(text: String, font: Font, font_size: int, dropcap_margins: Rect2 = Rect2(0, 0, 0, 0), language: String = "") -> bool:
	pass;

#desc Aligns paragraph to the given tab-stops.
func tab_align(tab_stops: PackedFloat32Array) -> void:
	pass;


func get_alignment() -> int:
	return alignment

func set_alignment(value: int) -> void:
	alignment = value

func get_break_flags() -> int:
	return break_flags

func set_break_flags(value: int) -> void:
	break_flags = value

func get_custom_punctuation() -> String:
	return custom_punctuation

func set_custom_punctuation(value: String) -> void:
	custom_punctuation = value

func get_direction() -> int:
	return direction

func set_direction(value: int) -> void:
	direction = value

func get_justification_flags() -> int:
	return justification_flags

func set_justification_flags(value: int) -> void:
	justification_flags = value

func get_max_lines_visible() -> int:
	return max_lines_visible

func set_max_lines_visible(value: int) -> void:
	max_lines_visible = value

func get_orientation() -> int:
	return orientation

func set_orientation(value: int) -> void:
	orientation = value

func get_preserve_control() -> bool:
	return preserve_control

func set_preserve_control(value: bool) -> void:
	preserve_control = value

func get_preserve_invalid() -> bool:
	return preserve_invalid

func set_preserve_invalid(value: bool) -> void:
	preserve_invalid = value

func get_text_overrun_behavior() -> int:
	return text_overrun_behavior

func set_text_overrun_behavior(value: int) -> void:
	text_overrun_behavior = value

func get_width() -> float:
	return width

func set_width(value: float) -> void:
	width = value

