extends StyleBox
#brief Texture-based nine-patch [StyleBox].
#desc Texture-based nine-patch [StyleBox], in a way similar to [NinePatchRect]. This stylebox performs a 3×3 scaling of a texture, where only the center cell is fully stretched. This makes it possible to design bordered styles regardless of the stylebox's size.
class_name StyleBoxTexture

#desc Stretch the stylebox's texture. This results in visible distortion unless the texture size matches the stylebox's size perfectly.
#desc Repeats the stylebox's texture to match the stylebox's size according to the nine-patch system.
#desc Repeats the stylebox's texture to match the stylebox's size according to the nine-patch system. Unlike [constant AXIS_STRETCH_MODE_TILE], the texture may be slightly stretched to make the nine-patch texture tile seamlessly.

#enum AxisStretchMode
enum {
    AXIS_STRETCH_MODE_STRETCH = 0,
    AXIS_STRETCH_MODE_TILE = 1,
    AXIS_STRETCH_MODE_TILE_FIT = 2,
}
#desc Controls how the stylebox's texture will be stretched or tiled horizontally. See [enum AxisStretchMode] for possible values.
var axis_stretch_horizontal: int:
	get = get_h_axis_stretch_mode, set = set_h_axis_stretch_mode

#desc Controls how the stylebox's texture will be stretched or tiled vertically. See [enum AxisStretchMode] for possible values.
var axis_stretch_vertical: int:
	get = get_v_axis_stretch_mode, set = set_v_axis_stretch_mode

#desc If [code]true[/code], the nine-patch texture's center tile will be drawn.
var draw_center: bool:
	get = is_draw_center_enabled, set = set_draw_center

#desc Expands the bottom margin of this style box when drawing, causing it to be drawn larger than requested.
var expand_margin_bottom: float:
	get = get_expand_margin, set = set_expand_margin

#desc Expands the left margin of this style box when drawing, causing it to be drawn larger than requested.
var expand_margin_left: float:
	get = get_expand_margin, set = set_expand_margin

#desc Expands the right margin of this style box when drawing, causing it to be drawn larger than requested.
var expand_margin_right: float:
	get = get_expand_margin, set = set_expand_margin

#desc Expands the top margin of this style box when drawing, causing it to be drawn larger than requested.
var expand_margin_top: float:
	get = get_expand_margin, set = set_expand_margin

#desc Modulates the color of the texture when this style box is drawn.
var modulate_color: Color:
	get = get_modulate, set = set_modulate

#desc Species a sub-region of the texture to use.
#desc This is equivalent to first wrapping the texture in an [AtlasTexture] with the same region.
#desc If empty ([code]Rect2(0, 0, 0, 0)[/code]), the whole texture will be used.
var region_rect: Rect2:
	get = get_region_rect, set = set_region_rect

#desc The texture to use when drawing this style box.
var texture: Texture2D:
	get = get_texture, set = set_texture

#desc Increases the bottom margin of the 3×3 texture box.
#desc A higher value means more of the source texture is considered to be part of the bottom border of the 3×3 box.
#desc This is also the value used as fallback for [member StyleBox.content_margin_bottom] if it is negative.
var texture_margin_bottom: float:
	get = get_texture_margin, set = set_texture_margin

#desc Increases the left margin of the 3×3 texture box.
#desc A higher value means more of the source texture is considered to be part of the left border of the 3×3 box.
#desc This is also the value used as fallback for [member StyleBox.content_margin_left] if it is negative.
var texture_margin_left: float:
	get = get_texture_margin, set = set_texture_margin

#desc Increases the right margin of the 3×3 texture box.
#desc A higher value means more of the source texture is considered to be part of the right border of the 3×3 box.
#desc This is also the value used as fallback for [member StyleBox.content_margin_right] if it is negative.
var texture_margin_right: float:
	get = get_texture_margin, set = set_texture_margin

#desc Increases the top margin of the 3×3 texture box.
#desc A higher value means more of the source texture is considered to be part of the top border of the 3×3 box.
#desc This is also the value used as fallback for [member StyleBox.content_margin_top] if it is negative.
var texture_margin_top: float:
	get = get_texture_margin, set = set_texture_margin



#desc Returns the expand margin size of the specified [enum Side].
func get_expand_margin(margin: int) -> float:
	pass;

#desc Returns the margin size of the specified [enum Side].
func get_texture_margin(margin: int) -> float:
	pass;

#desc Sets the expand margin to [param size] pixels for the specified [enum Side].
func set_expand_margin(margin: int, size: float) -> void:
	pass;

#desc Sets the expand margin to [param size] pixels for all sides.
func set_expand_margin_all(size: float) -> void:
	pass;

#desc Sets the margin to [param size] pixels for the specified [enum Side].
func set_texture_margin(margin: int, size: float) -> void:
	pass;

#desc Sets the margin to [param size] pixels for all sides.
func set_texture_margin_all(size: float) -> void:
	pass;


func get_h_axis_stretch_mode() -> int:
	return axis_stretch_horizontal

func set_h_axis_stretch_mode(value: int) -> void:
	axis_stretch_horizontal = value

func get_v_axis_stretch_mode() -> int:
	return axis_stretch_vertical

func set_v_axis_stretch_mode(value: int) -> void:
	axis_stretch_vertical = value

func is_draw_center_enabled() -> bool:
	return draw_center

func set_draw_center(value: bool) -> void:
	draw_center = value

func get_expand_margin() -> float:
	return expand_margin_bottom

func set_expand_margin(value: float) -> void:
	expand_margin_bottom = value

func get_expand_margin() -> float:
	return expand_margin_left

func set_expand_margin(value: float) -> void:
	expand_margin_left = value

func get_expand_margin() -> float:
	return expand_margin_right

func set_expand_margin(value: float) -> void:
	expand_margin_right = value

func get_expand_margin() -> float:
	return expand_margin_top

func set_expand_margin(value: float) -> void:
	expand_margin_top = value

func get_modulate() -> Color:
	return modulate_color

func set_modulate(value: Color) -> void:
	modulate_color = value

func get_region_rect() -> Rect2:
	return region_rect

func set_region_rect(value: Rect2) -> void:
	region_rect = value

func get_texture() -> Texture2D:
	return texture

func set_texture(value: Texture2D) -> void:
	texture = value

func get_texture_margin() -> float:
	return texture_margin_bottom

func set_texture_margin(value: float) -> void:
	texture_margin_bottom = value

func get_texture_margin() -> float:
	return texture_margin_left

func set_texture_margin(value: float) -> void:
	texture_margin_left = value

func get_texture_margin() -> float:
	return texture_margin_right

func set_texture_margin(value: float) -> void:
	texture_margin_right = value

func get_texture_margin() -> float:
	return texture_margin_top

func set_texture_margin(value: float) -> void:
	texture_margin_top = value

