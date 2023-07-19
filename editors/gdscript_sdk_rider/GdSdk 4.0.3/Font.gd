extends Resource
#brief Base class for fonts and font variations.
#desc Font is the abstract base class for font, so it shouldn't be used directly. Other types of fonts inherit from it.
class_name Font




#desc Draw a single Unicode character [param char] into a canvas item using the font, at a given position, with [param modulate] color. [param pos] specifies the baseline, not the top. To draw from the top, [i]ascent[/i] must be added to the Y axis.
#desc [b]Note:[/b] Do not use this function to draw strings character by character, use [method draw_string] or [TextLine] instead.
func draw_char(canvas_item: RID, pos: Vector2, char: int, font_size: int, modulate: Color = Color(1, 1, 1, 1)) -> float:
	pass;

#desc Draw a single Unicode character [param char] outline into a canvas item using the font, at a given position, with [param modulate] color and [param size] outline size. [param pos] specifies the baseline, not the top. To draw from the top, [i]ascent[/i] must be added to the Y axis.
#desc [b]Note:[/b] Do not use this function to draw strings character by character, use [method draw_string] or [TextLine] instead.
func draw_char_outline(canvas_item: RID, pos: Vector2, char: int, font_size: int, size: int = -1, modulate: Color = Color(1, 1, 1, 1)) -> float:
	pass;

#desc Breaks [param text] into lines using rules specified by [param brk_flags] and draws it into a canvas item using the font, at a given position, with [param modulate] color, optionally clipping the width and aligning horizontally. [param pos] specifies the baseline of the first line, not the top. To draw from the top, [i]ascent[/i] must be added to the Y axis.
#desc See also [method CanvasItem.draw_multiline_string].
func draw_multiline_string(canvas_item: RID, pos: Vector2, text: String, alignment: int = 0, width: float = -1, font_size: int = 16, max_lines: int = -1, modulate: Color = Color(1, 1, 1, 1), brk_flags: int = 3, jst_flags: int = 3, direction: int = 0, orientation: int = 0) -> void:
	pass;

#desc Breaks [param text] to the lines using rules specified by [param brk_flags] and draws text outline into a canvas item using the font, at a given position, with [param modulate] color and [param size] outline size, optionally clipping the width and aligning horizontally. [param pos] specifies the baseline of the first line, not the top. To draw from the top, [i]ascent[/i] must be added to the Y axis.
#desc See also [method CanvasItem.draw_multiline_string_outline].
func draw_multiline_string_outline(canvas_item: RID, pos: Vector2, text: String, alignment: int = 0, width: float = -1, font_size: int = 16, max_lines: int = -1, size: int = 1, modulate: Color = Color(1, 1, 1, 1), brk_flags: int = 3, jst_flags: int = 3, direction: int = 0, orientation: int = 0) -> void:
	pass;

#desc Draw [param text] into a canvas item using the font, at a given position, with [param modulate] color, optionally clipping the width and aligning horizontally. [param pos] specifies the baseline, not the top. To draw from the top, [i]ascent[/i] must be added to the Y axis.
#desc See also [method CanvasItem.draw_string].
func draw_string(canvas_item: RID, pos: Vector2, text: String, alignment: int = 0, width: float = -1, font_size: int = 16, modulate: Color = Color(1, 1, 1, 1), jst_flags: int = 3, direction: int = 0, orientation: int = 0) -> void:
	pass;

#desc Draw [param text] outline into a canvas item using the font, at a given position, with [param modulate] color and [param size] outline size, optionally clipping the width and aligning horizontally. [param pos] specifies the baseline, not the top. To draw from the top, [i]ascent[/i] must be added to the Y axis.
#desc See also [method CanvasItem.draw_string_outline].
func draw_string_outline(canvas_item: RID, pos: Vector2, text: String, alignment: int = 0, width: float = -1, font_size: int = 16, size: int = 1, modulate: Color = Color(1, 1, 1, 1), jst_flags: int = 3, direction: int = 0, orientation: int = 0) -> void:
	pass;

#desc Returns [TextServer] RID of the font cache for specific variation.
func find_variation(variation_coordinates: Dictionary, face_index: int = 0, strength: float = 0.0, transform: Transform2D = Transform2D(1, 0, 0, 1, 0, 0)) -> RID:
	pass;

#desc Returns the average font ascent (number of pixels above the baseline).
#desc [b]Note:[/b] Real ascent of the string is context-dependent and can be significantly different from the value returned by this function. Use it only as rough estimate (e.g. as the ascent of empty line).
func get_ascent(font_size: int = 16) -> float:
	pass;

#desc Returns the size of a character, optionally taking kerning into account if the next character is provided.
#desc [b]Note:[/b] Do not use this function to calculate width of the string character by character, use [method get_string_size] or [TextLine] instead. The height returned is the font height (see also [method get_height]) and has no relation to the glyph height.
func get_char_size(char: int, font_size: int) -> Vector2:
	pass;

#desc Returns the average font descent (number of pixels below the baseline).
#desc [b]Note:[/b] Real descent of the string is context-dependent and can be significantly different from the value returned by this function. Use it only as rough estimate (e.g. as the descent of empty line).
func get_descent(font_size: int = 16) -> float:
	pass;

#desc Returns number of faces in the TrueType / OpenType collection.
func get_face_count() -> int:
	pass;

#desc Returns array of fallback [Font]s.
func get_fallbacks() -> Array[Font]:
	pass;

#desc Returns font family name.
func get_font_name() -> String:
	pass;

#desc Returns font stretch amount, compared to a normal width. A percentage value between [code]50%[/code] and [code]200%[/code].
func get_font_stretch() -> int:
	pass;

#desc Returns font style flags, see [enum TextServer.FontStyle].
func get_font_style() -> int:
	pass;

#desc Returns font style name.
func get_font_style_name() -> String:
	pass;

#desc Returns weight (boldness) of the font. A value in the [code]100...999[/code] range, normal font weight is [code]400[/code], bold font weight is [code]700[/code].
func get_font_weight() -> int:
	pass;

#desc Returns the total average font height (ascent plus descent) in pixels.
#desc [b]Note:[/b] Real height of the string is context-dependent and can be significantly different from the value returned by this function. Use it only as rough estimate (e.g. as the height of empty line).
func get_height(font_size: int = 16) -> float:
	pass;

#desc Returns the size of a bounding box of a string broken into the lines, taking kerning and advance into account.
#desc See also [method draw_multiline_string].
func get_multiline_string_size(text: String, alignment: int = 0, width: float = -1, font_size: int = 16, max_lines: int = -1, brk_flags: int = 3, jst_flags: int = 3, direction: int = 0, orientation: int = 0) -> Vector2:
	pass;

#desc Returns a set of OpenType feature tags. More info: [url=https://docs.microsoft.com/en-us/typography/opentype/spec/featuretags]OpenType feature tags[/url].
func get_opentype_features() -> Dictionary:
	pass;

#desc Returns [Array] of valid [Font] [RID]s, which can be passed to the [TextServer] methods.
func get_rids() -> Array[RID]:
	pass;

#desc Returns the spacing for the given [code]type[/code] (see [enum TextServer.SpacingType]).
func get_spacing(spacing: int) -> int:
	pass;

#desc Returns the size of a bounding box of a single-line string, taking kerning, advance and subpixel positioning into account. See also [method get_multiline_string_size] and [method draw_string].
#desc For example, to get the string size as displayed by a single-line Label, use:
#desc [codeblocks]
#desc [gdscript]
#desc var string_size = $Label.get_theme_font("font").get_string_size($Label.text, HORIZONTAL_ALIGNMENT_LEFT, -1, $Label.get_theme_font_size("font_size"))
#desc [/gdscript]
#desc [csharp]
#desc Label label = GetNode<Label>("Label");
#desc Vector2 stringSize = label.GetThemeFont("font").GetStringSize(label.Text, HorizontalAlignment.Left, -1, label.GetThemeFontSize("font_size"));
#desc [/csharp]
#desc [/codeblocks]
#desc [b]Note:[/b] Since kerning, advance and subpixel positioning are taken into account by [method get_string_size], using separate [method get_string_size] calls on substrings of a string then adding the results together will return a different result compared to using a single [method get_string_size] call on the full string.
#desc [b]Note:[/b] Real height of the string is context-dependent and can be significantly different from the value returned by [method get_height].
func get_string_size(text: String, alignment: int = 0, width: float = -1, font_size: int = 16, jst_flags: int = 3, direction: int = 0, orientation: int = 0) -> Vector2:
	pass;

#desc Returns a string containing all the characters available in the font.
#desc If a given character is included in more than one font data source, it appears only once in the returned string.
func get_supported_chars() -> String:
	pass;

#desc Returns list of OpenType features supported by font.
func get_supported_feature_list() -> Dictionary:
	pass;

#desc Returns list of supported [url=https://docs.microsoft.com/en-us/typography/opentype/spec/dvaraxisreg]variation coordinates[/url], each coordinate is returned as [code]tag: Vector3i(min_value,max_value,default_value)[/code].
#desc Font variations allow for continuous change of glyph characteristics along some given design axis, such as weight, width or slant.
#desc To print available variation axes of a variable font:
#desc [codeblock]
#desc var fv = FontVariation.new()
#desc fv.set_base_font = load("res://RobotoFlex.ttf")
#desc var variation_list = fv.get_supported_variation_list()
#desc for tag in variation_list:
#desc var name = TextServerManager.get_primary_interface().tag_to_name(tag)
#desc var values = variation_list[tag]
#desc print("variation axis: %s (%d)\n\tmin, max, default: %s" % [name, tag, values])
#desc [/codeblock]
#desc [b]Note:[/b] To set and get variation coordinates of a [FontVariation], use [member FontVariation.variation_opentype].
func get_supported_variation_list() -> Dictionary:
	pass;

#desc Returns average pixel offset of the underline below the baseline.
#desc [b]Note:[/b] Real underline position of the string is context-dependent and can be significantly different from the value returned by this function. Use it only as rough estimate.
func get_underline_position(font_size: int = 16) -> float:
	pass;

#desc Returns average thickness of the underline.
#desc [b]Note:[/b] Real underline thickness of the string is context-dependent and can be significantly different from the value returned by this function. Use it only as rough estimate.
func get_underline_thickness(font_size: int = 16) -> float:
	pass;

#desc Returns [code]true[/code] if a Unicode [param char] is available in the font.
func has_char(char: int) -> bool:
	pass;

#desc Returns [code]true[/code], if font supports given language ([url=https://en.wikipedia.org/wiki/ISO_639-1]ISO 639[/url] code).
func is_language_supported(language: String) -> bool:
	pass;

#desc Returns [code]true[/code], if font supports given script ([url=https://en.wikipedia.org/wiki/ISO_15924]ISO 15924[/url] code).
func is_script_supported(script: String) -> bool:
	pass;

#desc Sets LRU cache capacity for [code]draw_*[/code] methods.
func set_cache_capacity(single_line: int, multi_line: int) -> void:
	pass;

#desc Sets array of fallback [Font]s.
func set_fallbacks(fallbacks: Font[]) -> void:
	pass;


