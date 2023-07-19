extends Resource
#brief Collection of common settings to customize label text.
#desc [LabelSettings] is a resource that can be assigned to a [Label] node to customize it. It will take priority over the properties defined in theme. The resource can be shared between multiple labels and swapped on the fly, so it's convenient and flexible way to setup text style.
class_name LabelSettings


#desc [Font] used for the text.
var font: Font:
	get = get_font, set = set_font

#desc Color of the text.
var font_color: Color:
	get = get_font_color, set = set_font_color

#desc Size of the text.
var font_size: int:
	get = get_font_size, set = set_font_size

#desc Vertical space between lines when the text is multiline.
var line_spacing: float:
	get = get_line_spacing, set = set_line_spacing

#desc The color of the outline.
var outline_color: Color:
	get = get_outline_color, set = set_outline_color

#desc Text outline size.
var outline_size: int:
	get = get_outline_size, set = set_outline_size

#desc Color of the shadow effect. If alpha is [code]0[/code], no shadow will be drawn.
var shadow_color: Color:
	get = get_shadow_color, set = set_shadow_color

#desc Offset of the shadow effect, in pixels.
var shadow_offset: Vector2:
	get = get_shadow_offset, set = set_shadow_offset

#desc Size of the shadow effect.
var shadow_size: int:
	get = get_shadow_size, set = set_shadow_size




func get_font() -> Font:
	return font

func set_font(value: Font) -> void:
	font = value

func get_font_color() -> Color:
	return font_color

func set_font_color(value: Color) -> void:
	font_color = value

func get_font_size() -> int:
	return font_size

func set_font_size(value: int) -> void:
	font_size = value

func get_line_spacing() -> float:
	return line_spacing

func set_line_spacing(value: float) -> void:
	line_spacing = value

func get_outline_color() -> Color:
	return outline_color

func set_outline_color(value: Color) -> void:
	outline_color = value

func get_outline_size() -> int:
	return outline_size

func set_outline_size(value: int) -> void:
	outline_size = value

func get_shadow_color() -> Color:
	return shadow_color

func set_shadow_color(value: Color) -> void:
	shadow_color = value

func get_shadow_offset() -> Vector2:
	return shadow_offset

func set_shadow_offset(value: Vector2) -> void:
	shadow_offset = value

func get_shadow_size() -> int:
	return shadow_size

func set_shadow_size(value: int) -> void:
	shadow_size = value

