extends Font
#brief Font loaded from a system font.
#brief [b]Note:[/b] This class is implemented on iOS, Linux, macOS and Windows, on other platforms it will fallback to default theme font.
#desc [SystemFont] loads a font from a system font with the first matching name from [member font_names].
#desc It will attempt to match font style, but it's not guaranteed.
#desc The returned font might be part of a font collection or be a variable font with OpenType "weight", "width" and/or "italic" features set.
#desc You can create [FontVariation] of the system font for fine control over its features.
class_name SystemFont


#desc If set to [code]true[/code], system fonts can be automatically used as fallbacks.
var allow_system_fallback: bool:
	get = is_allow_system_fallback, set = set_allow_system_fallback

#desc Font anti-aliasing mode.
var antialiasing: int:
	get = get_antialiasing, set = set_antialiasing

#desc Array of fallback [Font]s.
var fallbacks: Array[Font]:
	get = get_fallbacks, set = set_fallbacks

#desc If set to [code]true[/code], italic or oblique font is preferred.
var font_italic: bool:
	get = get_font_italic, set = set_font_italic

#desc Array of font family names to search, first matching font found is used.
var font_names: PackedStringArray:
	get = get_font_names, set = set_font_names

#desc Preferred font stretch amount, compared to a normal width. A percentage value between [code]50%[/code] and [code]200%[/code].
var font_stretch: int:
	get = get_font_stretch, set = set_font_stretch

#desc Preferred weight (boldness) of the font. A value in the [code]100...999[/code] range, normal font weight is [code]400[/code], bold font weight is [code]700[/code].
var font_weight: int:
	get = get_font_weight, set = set_font_weight

#desc If set to [code]true[/code], auto-hinting is supported and preferred over font built-in hinting.
var force_autohinter: bool:
	get = is_force_autohinter, set = set_force_autohinter

#desc If set to [code]true[/code], generate mipmaps for the font textures.
var generate_mipmaps: bool:
	get = get_generate_mipmaps, set = set_generate_mipmaps

#desc Font hinting mode.
var hinting: int:
	get = get_hinting, set = set_hinting

#desc The width of the range around the shape between the minimum and maximum representable signed distance. If using font outlines, [member msdf_pixel_range] must be set to at least [i]twice[/i] the size of the largest font outline. The default [member msdf_pixel_range] value of [code]16[/code] allows outline sizes up to [code]8[/code] to look correct.
var msdf_pixel_range: int:
	get = get_msdf_pixel_range, set = set_msdf_pixel_range

#desc Source font size used to generate MSDF textures. Higher values allow for more precision, but are slower to render and require more memory. Only increase this value if you notice a visible lack of precision in glyph rendering.
var msdf_size: int:
	get = get_msdf_size, set = set_msdf_size

#desc If set to [code]true[/code], glyphs of all sizes are rendered using single multichannel signed distance field generated from the dynamic font vector data.
var multichannel_signed_distance_field: bool:
	get = is_multichannel_signed_distance_field, set = set_multichannel_signed_distance_field

#desc Font oversampling factor, if set to [code]0.0[/code] global oversampling factor is used instead.
var oversampling: float:
	get = get_oversampling, set = set_oversampling

#desc Font glyph subpixel positioning mode. Subpixel positioning provides shaper text and better kerning for smaller font sizes, at the cost of memory usage and font rasterization speed. Use [constant TextServer.SUBPIXEL_POSITIONING_AUTO] to automatically enable it based on the font size.
var subpixel_positioning: int:
	get = get_subpixel_positioning, set = set_subpixel_positioning




func is_allow_system_fallback() -> bool:
	return allow_system_fallback

func set_allow_system_fallback(value: bool) -> void:
	allow_system_fallback = value

func get_antialiasing() -> int:
	return antialiasing

func set_antialiasing(value: int) -> void:
	antialiasing = value

func get_fallbacks() -> Array[Font]:
	return fallbacks

func set_fallbacks(value: Array[Font]) -> void:
	fallbacks = value

func get_font_italic() -> bool:
	return font_italic

func set_font_italic(value: bool) -> void:
	font_italic = value

func get_font_names() -> PackedStringArray:
	return font_names

func set_font_names(value: PackedStringArray) -> void:
	font_names = value

func get_font_stretch() -> int:
	return font_stretch

func set_font_stretch(value: int) -> void:
	font_stretch = value

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

func get_oversampling() -> float:
	return oversampling

func set_oversampling(value: float) -> void:
	oversampling = value

func get_subpixel_positioning() -> int:
	return subpixel_positioning

func set_subpixel_positioning(value: int) -> void:
	subpixel_positioning = value

