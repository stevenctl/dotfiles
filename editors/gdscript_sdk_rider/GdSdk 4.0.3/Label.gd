extends Control
#brief Displays plain text in a line or wrapped inside a rectangle. For formatted text, use [RichTextLabel].
#desc Label displays plain text on the screen. It gives you control over the horizontal and vertical alignment and can wrap the text inside the node's bounding rectangle. It doesn't support bold, italics, or other formatting. For that, use [RichTextLabel] instead.
#desc [b]Note:[/b] Contrarily to most other [Control]s, Label's [member Control.mouse_filter] defaults to [constant Control.MOUSE_FILTER_IGNORE] (i.e. it doesn't react to mouse input events). This implies that a label won't display any configured [member Control.tooltip_text], unless you change its mouse filter.
#tutorial [2D Dodge The Creeps Demo] https://godotengine.org/asset-library/asset/515
class_name Label


#desc If set to something other than [constant TextServer.AUTOWRAP_OFF], the text gets wrapped inside the node's bounding rectangle. If you resize the node, it will change its height automatically to show all the text. To see how each mode behaves, see [enum TextServer.AutowrapMode].
var autowrap_mode: int:
	get = get_autowrap_mode, set = set_autowrap_mode

#desc If [code]true[/code], the Label only shows the text that fits inside its bounding rectangle and will clip text horizontally.
var clip_text: bool:
	get = is_clipping_text, set = set_clip_text

#desc Controls the text's horizontal alignment. Supports left, center, right, and fill, or justify. Set it to one of the [enum HorizontalAlignment] constants.
var horizontal_alignment: int:
	get = get_horizontal_alignment, set = set_horizontal_alignment

#desc A [LabelSettings] resource that can be shared between multiple [Label] nodes. Takes priority over theme properties.
var label_settings: LabelSettings:
	get = get_label_settings, set = set_label_settings

#desc Language code used for line-breaking and text shaping algorithms, if left empty current locale is used instead.
var language: String:
	get = get_language, set = set_language

#desc The node ignores the first [code]lines_skipped[/code] lines before it starts to display text.
var lines_skipped: int:
	get = get_lines_skipped, set = set_lines_skipped

#desc Limits the lines of text the node shows on screen.
var max_lines_visible: int:
	get = get_max_lines_visible, set = set_max_lines_visible

var mouse_filter: int:
	get = get_mouse_filter, set = set_mouse_filter

var size_flags_vertical: int:
	get = get_v_size_flags, set = set_v_size_flags

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

#desc Sets the clipping behavior when the text exceeds the node's bounding rectangle. See [enum TextServer.OverrunBehavior] for a description of all modes.
var text_overrun_behavior: int:
	get = get_text_overrun_behavior, set = set_text_overrun_behavior

#desc If [code]true[/code], all the text displays as UPPERCASE.
var uppercase: bool:
	get = is_uppercase, set = set_uppercase

#desc Controls the text's vertical alignment. Supports top, center, bottom, and fill. Set it to one of the [enum VerticalAlignment] constants.
var vertical_alignment: int:
	get = get_vertical_alignment, set = set_vertical_alignment

#desc The number of characters to display. If set to [code]-1[/code], all characters are displayed. This can be useful when animating the text appearing in a dialog box.
#desc [b]Note:[/b] Setting this property updates [member visible_ratio] accordingly.
var visible_characters: int:
	get = get_visible_characters, set = set_visible_characters

#desc Sets the clipping behavior when [member visible_characters] or [member visible_ratio] is set. See [enum TextServer.VisibleCharactersBehavior] for more info.
var visible_characters_behavior: int:
	get = get_visible_characters_behavior, set = set_visible_characters_behavior

#desc The fraction of characters to display, relative to the total number of characters (see [method get_total_character_count]). If set to [code]1.0[/code], all characters are displayed. If set to [code]0.5[/code], only half of the characters will be displayed. This can be useful when animating the text appearing in a dialog box.
#desc [b]Note:[/b] Setting this property updates [member visible_characters] accordingly.
var visible_ratio: float:
	get = get_visible_ratio, set = set_visible_ratio



#desc Returns the number of lines of text the Label has.
func get_line_count() -> int:
	pass;

#desc Returns the height of the line [param line].
#desc If [param line] is set to [code]-1[/code], returns the biggest line height.
#desc If there are no lines, returns font size in pixels.
func get_line_height(line: int = -1) -> int:
	pass;

#desc Returns the total number of printable characters in the text (excluding spaces and newlines).
func get_total_character_count() -> int:
	pass;

#desc Returns the number of lines shown. Useful if the [Label]'s height cannot currently display all lines.
func get_visible_line_count() -> int:
	pass;


func get_autowrap_mode() -> int:
	return autowrap_mode

func set_autowrap_mode(value: int) -> void:
	autowrap_mode = value

func is_clipping_text() -> bool:
	return clip_text

func set_clip_text(value: bool) -> void:
	clip_text = value

func get_horizontal_alignment() -> int:
	return horizontal_alignment

func set_horizontal_alignment(value: int) -> void:
	horizontal_alignment = value

func get_label_settings() -> LabelSettings:
	return label_settings

func set_label_settings(value: LabelSettings) -> void:
	label_settings = value

func get_language() -> String:
	return language

func set_language(value: String) -> void:
	language = value

func get_lines_skipped() -> int:
	return lines_skipped

func set_lines_skipped(value: int) -> void:
	lines_skipped = value

func get_max_lines_visible() -> int:
	return max_lines_visible

func set_max_lines_visible(value: int) -> void:
	max_lines_visible = value

func get_mouse_filter() -> int:
	return mouse_filter

func set_mouse_filter(value: int) -> void:
	mouse_filter = value

func get_v_size_flags() -> int:
	return size_flags_vertical

func set_v_size_flags(value: int) -> void:
	size_flags_vertical = value

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

func get_text_overrun_behavior() -> int:
	return text_overrun_behavior

func set_text_overrun_behavior(value: int) -> void:
	text_overrun_behavior = value

func is_uppercase() -> bool:
	return uppercase

func set_uppercase(value: bool) -> void:
	uppercase = value

func get_vertical_alignment() -> int:
	return vertical_alignment

func set_vertical_alignment(value: int) -> void:
	vertical_alignment = value

func get_visible_characters() -> int:
	return visible_characters

func set_visible_characters(value: int) -> void:
	visible_characters = value

func get_visible_characters_behavior() -> int:
	return visible_characters_behavior

func set_visible_characters_behavior(value: int) -> void:
	visible_characters_behavior = value

func get_visible_ratio() -> float:
	return visible_ratio

func set_visible_ratio(value: float) -> void:
	visible_ratio = value

