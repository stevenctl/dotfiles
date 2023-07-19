extends Font
#brief Variation of the [Font].
#desc OpenType variations, simulated bold / slant, and additional font settings like OpenType features and extra spacing.
#desc To use simulated bold font variant:
#desc [codeblocks]
#desc [gdscript]
#desc var fv = FontVariation.new()
#desc fv.set_base_font(load("res://BarlowCondensed-Regular.ttf"))
#desc fv.set_variation_embolden(1.2)
#desc $Label.add_theme_font_override("font", fv)
#desc $Label.add_theme_font_size_override("font_size", 64)
#desc [/gdscript]
#desc [csharp]
#desc var fv = new FontVariation();
#desc fv.SetBaseFont(ResourceLoader.Load<FontFile>("res://BarlowCondensed-Regular.ttf"));
#desc fv.SetVariationEmbolden(1.2);
#desc GetNode("Label").AddThemeFontOverride("font", fv);
#desc GetNode("Label").AddThemeFontSizeOverride("font_size", 64);
#desc [/csharp]
#desc [/codeblocks]
#desc To set the coordinate of multiple variation axes:
#desc [codeblock]
#desc var fv = FontVariation.new();
#desc var ts = TextServerManager.get_primary_interface()
#desc fv.base_font = load("res://BarlowCondensed-Regular.ttf")
#desc fv.variation_opentype = { ts.name_to_tag("wght"): 900, ts.name_to_tag("custom_hght"): 900 }
#desc [/codeblock]
class_name FontVariation


#desc Base font used to create a variation. If not set, default [Theme] font is used.
var base_font: Font:
	get = get_base_font, set = set_base_font

#desc Array of fallback [Font]s to use as a substitute if a glyph is not found in this [FontVariation]. If not set, [member base_font]'s fallbacks are used instead.
var fallbacks: Array[Font]:
	get = get_fallbacks, set = set_fallbacks

#desc A set of OpenType feature tags. More info: [url=https://docs.microsoft.com/en-us/typography/opentype/spec/featuretags]OpenType feature tags[/url].
var opentype_features: Dictionary:
	get = get_opentype_features, set = set_opentype_features

#desc Extra spacing at the bottom of the line in pixels.
var spacing_bottom: int:
	get = get_spacing, set = set_spacing

#desc Extra spacing between graphical glyphs.
var spacing_glyph: int:
	get = get_spacing, set = set_spacing

#desc Extra width of the space glyphs.
var spacing_space: int:
	get = get_spacing, set = set_spacing

#desc Extra spacing at the top of the line in pixels.
var spacing_top: int:
	get = get_spacing, set = set_spacing

#desc If is not equal to zero, emboldens the font outlines. Negative values reduce the outline thickness.
#desc [b]Note:[/b] Emboldened fonts might have self-intersecting outlines, which will prevent MSDF fonts and [TextMesh] from working correctly.
var variation_embolden: float:
	get = get_variation_embolden, set = set_variation_embolden

#desc Active face index in the TrueType / OpenType collection file.
var variation_face_index: int:
	get = get_variation_face_index, set = set_variation_face_index

#desc Font OpenType variation coordinates. More info: [url=https://docs.microsoft.com/en-us/typography/opentype/spec/dvaraxisreg]OpenType variation tags[/url].
#desc [b]Note:[/b] This [Dictionary] uses OpenType tags as keys. Variation axes can be identified both by tags([code]int[/code]) and names ([code]string[/code]). Some axes might be accessible by multiple names. For example, [code]wght[/code] refers to the same axis as [code]weight[/code]. Tags on the other hand are unique. To convert between names and tags, use [method TextServer.name_to_tag] and [method TextServer.tag_to_name].
#desc [b]Note:[/b] To get available variation axes of a font, use [method Font.get_supported_variation_list].
var variation_opentype: Dictionary:
	get = get_variation_opentype, set = set_variation_opentype

#desc 2D transform, applied to the font outlines, can be used for slanting, flipping and rotating glyphs.
#desc For example, to simulate italic typeface by slanting, apply the following transform [code]Transform2D(1.0, slant, 0.0, 1.0, 0.0, 0.0)[/code].
var variation_transform: Transform2D:
	get = get_variation_transform, set = set_variation_transform



#desc Sets the spacing for [code]type[/code] (see [enum TextServer.SpacingType]) to [param value] in pixels (not relative to the font size).
func set_spacing(spacing: int, value: int) -> void:
	pass;


func get_base_font() -> Font:
	return base_font

func set_base_font(value: Font) -> void:
	base_font = value

func get_fallbacks() -> Array[Font]:
	return fallbacks

func set_fallbacks(value: Array[Font]) -> void:
	fallbacks = value

func get_opentype_features() -> Dictionary:
	return opentype_features

func set_opentype_features(value: Dictionary) -> void:
	opentype_features = value

func get_spacing() -> int:
	return spacing_bottom

func set_spacing(value: int) -> void:
	spacing_bottom = value

func get_spacing() -> int:
	return spacing_glyph

func set_spacing(value: int) -> void:
	spacing_glyph = value

func get_spacing() -> int:
	return spacing_space

func set_spacing(value: int) -> void:
	spacing_space = value

func get_spacing() -> int:
	return spacing_top

func set_spacing(value: int) -> void:
	spacing_top = value

func get_variation_embolden() -> float:
	return variation_embolden

func set_variation_embolden(value: float) -> void:
	variation_embolden = value

func get_variation_face_index() -> int:
	return variation_face_index

func set_variation_face_index(value: int) -> void:
	variation_face_index = value

func get_variation_opentype() -> Dictionary:
	return variation_opentype

func set_variation_opentype(value: Dictionary) -> void:
	variation_opentype = value

func get_variation_transform() -> Transform2D:
	return variation_transform

func set_variation_transform(value: Transform2D) -> void:
	variation_transform = value

