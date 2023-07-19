extends RefCounted
#brief Holds a line of text.
#desc Abstraction over [TextServer] for handling single line of text.
class_name TextLine


#desc Sets text alignment within the line as if the line was horizontal.
var alignment: int:
	get = get_horizontal_alignment, set = set_horizontal_alignment

#desc Text writing direction.
var direction: int:
	get = get_direction, set = set_direction

#desc Line alignment rules. For more info see [TextServer].
var flags: int:
	get = get_flags, set = set_flags

#desc Text orientation.
var orientation: int:
	get = get_orientation, set = set_orientation

#desc If set to [code]true[/code] text will display control characters.
var preserve_control: bool:
	get = get_preserve_control, set = set_preserve_control

#desc If set to [code]true[/code] text will display invalid characters.
var preserve_invalid: bool:
	get = get_preserve_invalid, set = set_preserve_invalid

#desc Sets the clipping behavior when the text exceeds the text line's set width. See [enum TextServer.OverrunBehavior] for a description of all modes.
var text_overrun_behavior: int:
	get = get_text_overrun_behavior, set = set_text_overrun_behavior

#desc Text line width.
var width: float:
	get = get_width, set = set_width



#desc Adds inline object to the text buffer, [param key] must be unique. In the text, object is represented as [param length] object replacement characters.
func add_object(key: Variant, size: Vector2, inline_align: int = 5, length: int = 1, baseline: float = 0.0) -> bool:
	pass;

#desc Adds text span and font to draw it.
func add_string(text: String, font: Font, font_size: int, language: String = "", meta: Variant = null) -> bool:
	pass;

#desc Clears text line (removes text and inline objects).
func clear() -> void:
	pass;

#desc Draw text into a canvas item at a given position, with [param color]. [param pos] specifies the top left corner of the bounding box.
func draw(canvas: RID, pos: Vector2, color: Color = Color(1, 1, 1, 1)) -> void:
	pass;

#desc Draw text into a canvas item at a given position, with [param color]. [param pos] specifies the top left corner of the bounding box.
func draw_outline(canvas: RID, pos: Vector2, outline_size: int = 1, color: Color = Color(1, 1, 1, 1)) -> void:
	pass;

#desc Returns the text ascent (number of pixels above the baseline for horizontal layout or to the left of baseline for vertical).
func get_line_ascent() -> float:
	pass;

#desc Returns the text descent (number of pixels below the baseline for horizontal layout or to the right of baseline for vertical).
func get_line_descent() -> float:
	pass;

#desc Returns pixel offset of the underline below the baseline.
func get_line_underline_position() -> float:
	pass;

#desc Returns thickness of the underline.
func get_line_underline_thickness() -> float:
	pass;

#desc Returns width (for horizontal layout) or height (for vertical) of the text.
func get_line_width() -> float:
	pass;

#desc Returns bounding rectangle of the inline object.
func get_object_rect(key: Variant) -> Rect2:
	pass;

#desc Returns array of inline objects.
func get_objects() -> Array:
	pass;

#desc Returns TextServer buffer RID.
func get_rid() -> RID:
	pass;

#desc Returns size of the bounding box of the text.
func get_size() -> Vector2:
	pass;

#desc Returns caret character offset at the specified pixel offset at the baseline. This function always returns a valid position.
func hit_test(coords: float) -> int:
	pass;

#desc Sets new size and alignment of embedded object.
func resize_object(key: Variant, size: Vector2, inline_align: int = 5, baseline: float = 0.0) -> bool:
	pass;

#desc Overrides BiDi for the structured text.
#desc Override ranges should cover full source text without overlaps. BiDi algorithm will be used on each range separately.
func set_bidi_override(override: Array) -> void:
	pass;

#desc Aligns text to the given tab-stops.
func tab_align(tab_stops: PackedFloat32Array) -> void:
	pass;


func get_horizontal_alignment() -> int:
	return alignment

func set_horizontal_alignment(value: int) -> void:
	alignment = value

func get_direction() -> int:
	return direction

func set_direction(value: int) -> void:
	direction = value

func get_flags() -> int:
	return flags

func set_flags(value: int) -> void:
	flags = value

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

