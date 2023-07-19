extends RefCounted
#brief Controls how an individual character will be displayed in a [RichTextEffect].
#desc By setting various properties on this object, you can control how individual characters will be displayed in a [RichTextEffect].
#tutorial [BBCode in RichTextLabel] https://docs.godotengine.org/en/stable/tutorials/ui/bbcode_in_richtextlabel.html
#tutorial [RichTextEffect test project (third-party)] https://github.com/Eoin-ONeill-Yokai/Godot-Rich-Text-Effect-Test-Project
class_name CharFXTransform


#desc The color the character will be drawn with.
var color: Color:
	get = get_color, set = set_color

#desc The time elapsed since the [RichTextLabel] was added to the scene tree (in seconds). Time stops when the [RichTextLabel] is paused (see [member Node.process_mode]). Resets when the text in the [RichTextLabel] is changed.
#desc [b]Note:[/b] Time still passes while the [RichTextLabel] is hidden.
var elapsed_time: float:
	get = get_elapsed_time, set = set_elapsed_time

#desc Contains the arguments passed in the opening BBCode tag. By default, arguments are strings; if their contents match a type such as [bool], [int] or [float], they will be converted automatically. Color codes in the form [code]#rrggbb[/code] or [code]#rgb[/code] will be converted to an opaque [Color]. String arguments may not contain spaces, even if they're quoted. If present, quotes will also be present in the final string.
#desc For example, the opening BBCode tag [code][example foo=hello bar=true baz=42 color=#ffffff][/code] will map to the following [Dictionary]:
#desc [codeblock]
#desc {"foo": "hello", "bar": true, "baz": 42, "color": Color(1, 1, 1, 1)}
#desc [/codeblock]
var env: Dictionary:
	get = get_environment, set = set_environment

#desc Font resource used to render glyph.
var font: RID:
	get = get_font, set = set_font

#desc Number of glyphs in the grapheme cluster. This value is set in the first glyph of a cluster. Setting this property won't affect drawing.
var glyph_count: int:
	get = get_glyph_count, set = set_glyph_count

#desc Glyph flags. See [enum TextServer.GraphemeFlag] for more info. Setting this property won't affect drawing.
var glyph_flags: int:
	get = get_glyph_flags, set = set_glyph_flags

#desc Font specific glyph index.
var glyph_index: int:
	get = get_glyph_index, set = set_glyph_index

#desc The position offset the character will be drawn with (in pixels).
var offset: Vector2:
	get = get_offset, set = set_offset

#desc If [code]true[/code], FX transform is called for outline drawing. Setting this property won't affect drawing.
var outline: bool:
	get = is_outline, set = set_outline

#desc Absolute character range in the string, corresponding to the glyph. Setting this property won't affect drawing.
var range: Vector2i:
	get = get_range, set = set_range

#desc The character offset of the glyph, relative to the current [RichTextEffect] custom block. Setting this property won't affect drawing.
var relative_index: int:
	get = get_relative_index, set = set_relative_index

#desc If [code]true[/code], the character will be drawn. If [code]false[/code], the character will be hidden. Characters around hidden characters will reflow to take the space of hidden characters. If this is not desired, set their [member color] to [code]Color(1, 1, 1, 0)[/code] instead.
var visible: bool:
	get = is_visible, set = set_visibility




func get_color() -> Color:
	return color

func set_color(value: Color) -> void:
	color = value

func get_elapsed_time() -> float:
	return elapsed_time

func set_elapsed_time(value: float) -> void:
	elapsed_time = value

func get_environment() -> Dictionary:
	return env

func set_environment(value: Dictionary) -> void:
	env = value

func get_font() -> RID:
	return font

func set_font(value: RID) -> void:
	font = value

func get_glyph_count() -> int:
	return glyph_count

func set_glyph_count(value: int) -> void:
	glyph_count = value

func get_glyph_flags() -> int:
	return glyph_flags

func set_glyph_flags(value: int) -> void:
	glyph_flags = value

func get_glyph_index() -> int:
	return glyph_index

func set_glyph_index(value: int) -> void:
	glyph_index = value

func get_offset() -> Vector2:
	return offset

func set_offset(value: Vector2) -> void:
	offset = value

func is_outline() -> bool:
	return outline

func set_outline(value: bool) -> void:
	outline = value

func get_range() -> Vector2i:
	return range

func set_range(value: Vector2i) -> void:
	range = value

func get_relative_index() -> int:
	return relative_index

func set_relative_index(value: int) -> void:
	relative_index = value

func is_visible() -> bool:
	return visible

func set_visibility(value: bool) -> void:
	visible = value

