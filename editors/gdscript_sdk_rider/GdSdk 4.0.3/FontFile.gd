extends Font
#brief Font source data and prerendered glyph cache, imported from dynamic or bitmap font.
#desc [FontFile] contains a set of glyphs to represent Unicode characters imported from a font file, as well as a cache of rasterized glyphs, and a set of fallback [Font]s to use.
#desc Use [FontVariation] to access specific OpenType variation of the font, create simulated bold / slanted version, and draw lines of text.
#desc For more complex text processing, use [FontVariation] in conjunction with [TextLine] or [TextParagraph].
#desc Supported font formats:
#desc - Dynamic font importer: TrueType (.ttf), TrueType collection (.ttc), OpenType (.otf), OpenType collection (.otc), WOFF (.woff), WOFF2 (.woff2), Type 1 (.pfb, .pfm).
#desc - Bitmap font importer: AngelCode BMFont (.fnt, .font), text and binary (version 3) format variants.
#desc - Monospace image font importer: All supported image formats.
#desc [b]Note:[/b] A character is a symbol that represents an item (letter, digit etc.) in an abstract way.
#desc [b]Note:[/b] A glyph is a bitmap or shape used to draw one or more characters in a context-dependent manner. Glyph indices are bound to the specific font data source.
#desc [b]Note:[/b] If a none of the font data sources contain glyphs for a character used in a string, the character in question will be replaced with a box displaying its hexadecimal code.
#desc [codeblocks]
#desc [gdscript]
#desc var f = load("res://BarlowCondensed-Bold.ttf")
#desc $Label.add_theme_font_override("font", f)
#desc $Label.add_theme_font_size_override("font_size", 64)
#desc [/gdscript]
#desc [csharp]
#desc var f = ResourceLoader.Load<FontFile>("res://BarlowCondensed-Bold.ttf");
#desc GetNode("Label").AddThemeFontOverride("font", f);
#desc GetNode("Label").AddThemeFontSizeOverride("font_size", 64);
#desc [/csharp]
#desc [/codeblocks]
class_name FontFile


#desc If set to [code]true[/code], system fonts can be automatically used as fallbacks.
var allow_system_fallback: bool:
	get = is_allow_system_fallback, set = set_allow_system_fallback

#desc Font anti-aliasing mode.
var antialiasing: int:
	get = get_antialiasing, set = set_antialiasing

#desc Contents of the dynamic font source file.
var data: PackedByteArray:
	get = get_data, set = set_data

#desc Array of fallback [Font]s.
var fallbacks: Array[Font]:
	get = get_fallbacks, set = set_fallbacks

#desc Font size, used only for the bitmap fonts.
var fixed_size: int:
	get = get_fixed_size, set = set_fixed_size

#desc Font family name.
var font_name: String:
	get = get_font_name, set = set_font_name

#desc Font stretch amount, compared to a normal width. A percentage value between [code]50%[/code] and [code]200%[/code].
var font_stretch: int:
	get = get_font_stretch, set = set_font_stretch

#desc Font style flags, see [enum TextServer.FontStyle].
var font_style: int:
	get = get_font_style, set = set_font_style

#desc Weight (boldness) of the font. A value in the [code]100...999[/code] range, normal font weight is [code]400[/code], bold font weight is [code]700[/code].
var font_weight: int:
	get = get_font_weight, set = set_font_weight

#desc If set to [code]true[/code], auto-hinting is supported and preferred over font built-in hinting. Used by dynamic fonts only (MSDF fonts don't support hinting).
var force_autohinter: bool:
	get = is_force_autohinter, set = set_force_autohinter

#desc If set to [code]true[/code], generate mipmaps for the font textures.
var generate_mipmaps: bool:
	get = get_generate_mipmaps, set = set_generate_mipmaps

#desc Font hinting mode. Used by dynamic fonts only.
var hinting: int:
	get = get_hinting, set = set_hinting

#desc The width of the range around the shape between the minimum and maximum representable signed distance. If using font outlines, [member msdf_pixel_range] must be set to at least [i]twice[/i] the size of the largest font outline. The default [member msdf_pixel_range] value of [code]16[/code] allows outline sizes up to [code]8[/code] to look correct.
var msdf_pixel_range: int:
	get = get_msdf_pixel_range, set = set_msdf_pixel_range

#desc Source font size used to generate MSDF textures. Higher values allow for more precision, but are slower to render and require more memory. Only increase this value if you notice a visible lack of precision in glyph rendering.
var msdf_size: int:
	get = get_msdf_size, set = set_msdf_size

#desc If set to [code]true[/code], glyphs of all sizes are rendered using single multichannel signed distance field (MSDF) generated from the dynamic font vector data. Since this approach does not rely on rasterizing the font every time its size changes, this allows for resizing the font in real-time without any performance penalty. Text will also not look grainy for [Control]s that are scaled down (or for [Label3D]s viewed from a long distance). As a downside, font hinting is not available with MSDF. The lack of font hinting may result in less crisp and less readable fonts at small sizes.
#desc [b]Note:[/b] If using font outlines, [member msdf_pixel_range] must be set to at least [i]twice[/i] the size of the largest font outline.
#desc [b]Note:[/b] MSDF font rendering does not render glyphs with overlapping shapes correctly. Overlapping shapes are not valid per the OpenType standard, but are still commonly found in many font files, especially those converted by Google Fonts. To avoid issues with overlapping glyphs, consider downloading the font file directly from the type foundry instead of relying on Google Fonts.
var multichannel_signed_distance_field: bool:
	get = is_multichannel_signed_distance_field, set = set_multichannel_signed_distance_field

#desc Font OpenType feature set override.
var opentype_feature_overrides: Dictionary:
	get = get_opentype_feature_overrides, set = set_opentype_feature_overrides

#desc Font oversampling factor. If set to [code]0.0[/code], the global oversampling factor is used instead. Used by dynamic fonts only (MSDF fonts ignore oversampling).
var oversampling: float:
	get = get_oversampling, set = set_oversampling

#desc Font style name.
var style_name: String:
	get = get_font_style_name, set = set_font_style_name

#desc Font glyph subpixel positioning mode. Subpixel positioning provides shaper text and better kerning for smaller font sizes, at the cost of higher memory usage and lower font rasterization speed. Use [constant TextServer.SUBPIXEL_POSITIONING_AUTO] to automatically enable it based on the font size.
var subpixel_positioning: int:
	get = get_subpixel_positioning, set = set_subpixel_positioning



#desc Removes all font cache entries.
func clear_cache() -> void:
	pass;

#desc Removes all rendered glyphs information from the cache entry.
#desc [b]Note:[/b] This function will not remove textures associated with the glyphs, use [method remove_texture] to remove them manually.
func clear_glyphs(cache_index: int, size: Vector2i) -> void:
	pass;

#desc Removes all kerning overrides.
func clear_kerning_map(cache_index: int, size: int) -> void:
	pass;

#desc Removes all font sizes from the cache entry
func clear_size_cache(cache_index: int) -> void:
	pass;

#desc Removes all textures from font cache entry.
#desc [b]Note:[/b] This function will not remove glyphs associated with the texture, use [method remove_glyph] to remove them manually.
func clear_textures(cache_index: int, size: Vector2i) -> void:
	pass;

#desc Returns the font ascent (number of pixels above the baseline).
func get_cache_ascent(cache_index: int, size: int) -> float:
	pass;

#desc Returns number of the font cache entries.
func get_cache_count() -> int:
	pass;

#desc Returns the font descent (number of pixels below the baseline).
func get_cache_descent(cache_index: int, size: int) -> float:
	pass;

#desc Returns scaling factor of the color bitmap font.
func get_cache_scale(cache_index: int, size: int) -> float:
	pass;

#desc Returns pixel offset of the underline below the baseline.
func get_cache_underline_position(cache_index: int, size: int) -> float:
	pass;

#desc Returns thickness of the underline in pixels.
func get_cache_underline_thickness(cache_index: int, size: int) -> float:
	pass;

#desc Returns embolden strength, if is not equal to zero, emboldens the font outlines. Negative values reduce the outline thickness.
func get_embolden(cache_index: int) -> float:
	pass;

#desc Recturns an active face index in the TrueType / OpenType collection.
func get_face_index(cache_index: int) -> int:
	pass;

#desc Returns glyph advance (offset of the next glyph).
#desc [b]Note:[/b] Advance for glyphs outlines is the same as the base glyph advance and is not saved.
func get_glyph_advance(cache_index: int, size: int, glyph: int) -> Vector2:
	pass;

#desc Returns the glyph index of a [param char], optionally modified by the [param variation_selector].
func get_glyph_index(size: int, char: int, variation_selector: int) -> int:
	pass;

#desc Returns list of rendered glyphs in the cache entry.
func get_glyph_list(cache_index: int, size: Vector2i) -> PackedInt32Array:
	pass;

#desc Returns glyph offset from the baseline.
func get_glyph_offset(cache_index: int, size: Vector2i, glyph: int) -> Vector2:
	pass;

#desc Returns glyph size.
func get_glyph_size(cache_index: int, size: Vector2i, glyph: int) -> Vector2:
	pass;

#desc Returns index of the cache texture containing the glyph.
func get_glyph_texture_idx(cache_index: int, size: Vector2i, glyph: int) -> int:
	pass;

#desc Returns rectangle in the cache texture containing the glyph.
func get_glyph_uv_rect(cache_index: int, size: Vector2i, glyph: int) -> Rect2:
	pass;

#desc Returns kerning for the pair of glyphs.
func get_kerning(cache_index: int, size: int, glyph_pair: Vector2i) -> Vector2:
	pass;

#desc Returns list of the kerning overrides.
func get_kerning_list(cache_index: int, size: int) -> Array[Vector2i]:
	pass;

#desc Returns [code]true[/code] if support override is enabled for the [param language].
func get_language_support_override(language: String) -> bool:
	pass;

#desc Returns list of language support overrides.
func get_language_support_overrides() -> PackedStringArray:
	pass;

#desc Returns [code]true[/code] if support override is enabled for the [param script].
func get_script_support_override(script: String) -> bool:
	pass;

#desc Returns list of script support overrides.
func get_script_support_overrides() -> PackedStringArray:
	pass;

#desc Returns list of the font sizes in the cache. Each size is [code]Vector2i[/code] with font size and outline size.
func get_size_cache_list(cache_index: int) -> Array[Vector2i]:
	pass;

#desc Returns number of textures used by font cache entry.
func get_texture_count(cache_index: int, size: Vector2i) -> int:
	pass;

#desc Returns a copy of the font cache texture image.
func get_texture_image(cache_index: int, size: Vector2i, texture_index: int) -> Image:
	pass;

#desc Returns a copy of the array containing glyph packing data.
func get_texture_offsets(cache_index: int, size: Vector2i, texture_index: int) -> PackedInt32Array:
	pass;

#desc Returns 2D transform, applied to the font outlines, can be used for slanting, flipping and rotating glyphs.
func get_transform(cache_index: int) -> Transform2D:
	pass;

#desc Returns variation coordinates for the specified font cache entry. See [method Font.get_supported_variation_list] for more info.
func get_variation_coordinates(cache_index: int) -> Dictionary:
	pass;

#desc Loads an AngelCode BMFont (.fnt, .font) bitmap font from file [param path].
#desc [b]Warning:[/b] This method should only be used in the editor or in cases when you need to load external fonts at run-time, such as fonts located at the [code]user://[/code] directory.
func load_bitmap_font(path: String) -> int:
	pass;

#desc Loads a TrueType (.ttf), OpenType (.otf), WOFF (.woff), WOFF2 (.woff2) or Type 1 (.pfb, .pfm) dynamic font from file [param path].
#desc [b]Warning:[/b] This method should only be used in the editor or in cases when you need to load external fonts at run-time, such as fonts located at the [code]user://[/code] directory.
func load_dynamic_font(path: String) -> int:
	pass;

#desc Removes specified font cache entry.
func remove_cache(cache_index: int) -> void:
	pass;

#desc Removes specified rendered glyph information from the cache entry.
#desc [b]Note:[/b] This function will not remove textures associated with the glyphs, use [method remove_texture] to remove them manually.
func remove_glyph(cache_index: int, size: Vector2i, glyph: int) -> void:
	pass;

#desc Removes kerning override for the pair of glyphs.
func remove_kerning(cache_index: int, size: int, glyph_pair: Vector2i) -> void:
	pass;

#desc Remove language support override.
func remove_language_support_override(language: String) -> void:
	pass;

#desc Removes script support override.
func remove_script_support_override(script: String) -> void:
	pass;

#desc Removes specified font size from the cache entry.
func remove_size_cache(cache_index: int, size: Vector2i) -> void:
	pass;

#desc Removes specified texture from the cache entry.
#desc [b]Note:[/b] This function will not remove glyphs associated with the texture. Remove them manually using [method remove_glyph].
func remove_texture(cache_index: int, size: Vector2i, texture_index: int) -> void:
	pass;

#desc Renders specified glyph to the font cache texture.
func render_glyph(cache_index: int, size: Vector2i, index: int) -> void:
	pass;

#desc Renders the range of characters to the font cache texture.
func render_range(cache_index: int, size: Vector2i, start: int, end: int) -> void:
	pass;

#desc Sets the font ascent (number of pixels above the baseline).
func set_cache_ascent(cache_index: int, size: int, ascent: float) -> void:
	pass;

#desc Sets the font descent (number of pixels below the baseline).
func set_cache_descent(cache_index: int, size: int, descent: float) -> void:
	pass;

#desc Sets scaling factor of the color bitmap font.
func set_cache_scale(cache_index: int, size: int, scale: float) -> void:
	pass;

#desc Sets pixel offset of the underline below the baseline.
func set_cache_underline_position(cache_index: int, size: int, underline_position: float) -> void:
	pass;

#desc Sets thickness of the underline in pixels.
func set_cache_underline_thickness(cache_index: int, size: int, underline_thickness: float) -> void:
	pass;

#desc Sets embolden strength, if is not equal to zero, emboldens the font outlines. Negative values reduce the outline thickness.
func set_embolden(cache_index: int, strength: float) -> void:
	pass;

#desc Sets an active face index in the TrueType / OpenType collection.
func set_face_index(cache_index: int, face_index: int) -> void:
	pass;

#desc Sets glyph advance (offset of the next glyph).
#desc [b]Note:[/b] Advance for glyphs outlines is the same as the base glyph advance and is not saved.
func set_glyph_advance(cache_index: int, size: int, glyph: int, advance: Vector2) -> void:
	pass;

#desc Sets glyph offset from the baseline.
func set_glyph_offset(cache_index: int, size: Vector2i, glyph: int, offset: Vector2) -> void:
	pass;

#desc Sets glyph size.
func set_glyph_size(cache_index: int, size: Vector2i, glyph: int, gl_size: Vector2) -> void:
	pass;

#desc Sets index of the cache texture containing the glyph.
func set_glyph_texture_idx(cache_index: int, size: Vector2i, glyph: int, texture_idx: int) -> void:
	pass;

#desc Sets rectangle in the cache texture containing the glyph.
func set_glyph_uv_rect(cache_index: int, size: Vector2i, glyph: int, uv_rect: Rect2) -> void:
	pass;

#desc Sets kerning for the pair of glyphs.
func set_kerning(cache_index: int, size: int, glyph_pair: Vector2i, kerning: Vector2) -> void:
	pass;

#desc Adds override for [method Font.is_language_supported].
func set_language_support_override(language: String, supported: bool) -> void:
	pass;

#desc Adds override for [method Font.is_script_supported].
func set_script_support_override(script: String, supported: bool) -> void:
	pass;

#desc Sets font cache texture image.
func set_texture_image(cache_index: int, size: Vector2i, texture_index: int, image: Image) -> void:
	pass;

#desc Sets array containing glyph packing data.
func set_texture_offsets(cache_index: int, size: Vector2i, texture_index: int, offset: PackedInt32Array) -> void:
	pass;

#desc Sets 2D transform, applied to the font outlines, can be used for slanting, flipping and rotating glyphs.
func set_transform(cache_index: int, transform: Transform2D) -> void:
	pass;

#desc Sets variation coordinates for the specified font cache entry. See [method Font.get_supported_variation_list] for more info.
func set_variation_coordinates(cache_index: int, variation_coordinates: Dictionary) -> void:
	pass;


func is_allow_system_fallback() -> bool:
	return allow_system_fallback

func set_allow_system_fallback(value: bool) -> void:
	allow_system_fallback = value

func get_antialiasing() -> int:
	return antialiasing

func set_antialiasing(value: int) -> void:
	antialiasing = value

func get_data() -> PackedByteArray:
	return data

func set_data(value: PackedByteArray) -> void:
	data = value

func get_fallbacks() -> Array[Font]:
	return fallbacks

func set_fallbacks(value: Array[Font]) -> void:
	fallbacks = value

func get_fixed_size() -> int:
	return fixed_size

func set_fixed_size(value: int) -> void:
	fixed_size = value

func get_font_name() -> String:
	return font_name

func set_font_name(value: String) -> void:
	font_name = value

func get_font_stretch() -> int:
	return font_stretch

func set_font_stretch(value: int) -> void:
	font_stretch = value

func get_font_style() -> int:
	return font_style

func set_font_style(value: int) -> void:
	font_style = value

func get_font_weight() -> int:
	return font_weight

func set_font_weight(value: int) -> void:
	font_weight = value

func is_force_autohinter() -> bool:
	return force_autohinter

func set_force_autohinter(value: bool) -> void:
	force_autohinter = value

func get_generate_mipmaps() -> bool:
	return generate_mipmaps

func set_generate_mipmaps(value: bool) -> void:
	generate_mipmaps = value

func get_hinting() -> int:
	return hinting

func set_hinting(value: int) -> void:
	hinting = value

func get_msdf_pixel_range() -> int:
	return msdf_pixel_range

func set_msdf_pixel_range(value: int) -> void:
	msdf_pixel_range = value

func get_msdf_size() -> int:
	return msdf_size

func set_msdf_size(value: int) -> void:
	msdf_size = value

func is_multichannel_signed_distance_field() -> bool:
	return multichannel_signed_distance_field

func set_multichannel_signed_distance_field(value: bool) -> void:
	multichannel_signed_distance_field = value

func get_opentype_feature_overrides() -> Dictionary:
	return opentype_feature_overrides

func set_opentype_feature_overrides(value: Dictionary) -> void:
	opentype_feature_overrides = value

func get_oversampling() -> float:
	return oversampling

func set_oversampling(value: float) -> void:
	oversampling = value

func get_font_style_name() -> String:
	return style_name

func set_font_style_name(value: String) -> void:
	style_name = value

func get_subpixel_positioning() -> int:
	return subpixel_positioning

func set_subpixel_positioning(value: int) -> void:
	subpixel_positioning = value

