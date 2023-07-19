extends Control
#brief Scalable texture-based frame that tiles the texture's centers and sides, but keeps the corners' original size. Perfect for panels and dialog boxes.
#desc Also known as 9-slice panels, NinePatchRect produces clean panels of any size, based on a small texture. To do so, it splits the texture in a 3×3 grid. When you scale the node, it tiles the texture's sides horizontally or vertically, the center on both axes but it doesn't scale or tile the corners.
class_name NinePatchRect

#desc Emitted when the node's texture changes.
signal texture_changed
#desc Stretches the center texture across the NinePatchRect. This may cause the texture to be distorted.
#desc Repeats the center texture across the NinePatchRect. This won't cause any visible distortion. The texture must be seamless for this to work without displaying artifacts between edges.
#desc Repeats the center texture across the NinePatchRect, but will also stretch the texture to make sure each tile is visible in full. This may cause the texture to be distorted, but less than [constant AXIS_STRETCH_MODE_STRETCH]. The texture must be seamless for this to work without displaying artifacts between edges.

#enum AxisStretchMode
enum {
    AXIS_STRETCH_MODE_STRETCH = 0,
    AXIS_STRETCH_MODE_TILE = 1,
    AXIS_STRETCH_MODE_TILE_FIT = 2,
}
#desc The stretch mode to use for horizontal stretching/tiling. See [enum NinePatchRect.AxisStretchMode] for possible values.
var axis_stretch_horizontal: int:
	get = get_h_axis_stretch_mode, set = set_h_axis_stretch_mode

#desc The stretch mode to use for vertical stretching/tiling. See [enum NinePatchRect.AxisStretchMode] for possible values.
var axis_stretch_vertical: int:
	get = get_v_axis_stretch_mode, set = set_v_axis_stretch_mode

#desc If [code]true[/code], draw the panel's center. Else, only draw the 9-slice's borders.
var draw_center: bool:
	get = is_draw_center_enabled, set = set_draw_center

var mouse_filter: int:
	get = get_mouse_filter, set = set_mouse_filter

#desc The height of the 9-slice's bottom row. A margin of 16 means the 9-slice's bottom corners and side will have a height of 16 pixels. You can set all 4 margin values individually to create panels with non-uniform borders.
var patch_margin_bottom: int:
	get = get_patch_margin, set = set_patch_margin

#desc The width of the 9-slice's left column. A margin of 16 means the 9-slice's left corners and side will have a width of 16 pixels. You can set all 4 margin values individually to create panels with non-uniform borders.
var patch_margin_left: int:
	get = get_patch_margin, set = set_patch_margin

#desc The width of the 9-slice's right column. A margin of 16 means the 9-slice's right corners and side will have a width of 16 pixels. You can set all 4 margin values individually to create panels with non-uniform borders.
var patch_margin_right: int:
	get = get_patch_margin, set = set_patch_margin

#desc The height of the 9-slice's top row. A margin of 16 means the 9-slice's top corners and side will have a height of 16 pixels. You can set all 4 margin values individually to create panels with non-uniform borders.
var patch_margin_top: int:
	get = get_patch_margin, set = set_patch_margin

#desc Rectangular region of the texture to sample from. If you're working with an atlas, use this property to define the area the 9-slice should use. All other properties are relative to this one. If the rect is empty, NinePatchRect will use the whole texture.
var region_rect: Rect2:
	get = get_region_rect, set = set_region_rect

#desc The node's texture resource.
var texture: Texture2D:
	get = get_texture, set = set_texture



#desc Returns the size of the margin on the specified [enum Side].
func get_patch_margin(margin: int) -> int:
	pass;

#desc Sets the size of the margin on the specified [enum Side] to [param value] pixels.
func set_patch_margin(margin: int, value: int) -> void:
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

func get_mouse_filter() -> int:
	return mouse_filter

func set_mouse_filter(value: int) -> void:
	mouse_filter = value

func get_patch_margin() -> int:
	return patch_margin_bottom

func set_patch_margin(value: int) -> void:
	patch_margin_bottom = value

func get_patch_margin() -> int:
	return patch_margin_left

func set_patch_margin(value: int) -> void:
	patch_margin_left = value

func get_patch_margin() -> int:
	return patch_margin_right

func set_patch_margin(value: int) -> void:
	patch_margin_right = value

func get_patch_margin() -> int:
	return patch_margin_top

func set_patch_margin(value: int) -> void:
	patch_margin_top = value

func get_region_rect() -> Rect2:
	return region_rect

func set_region_rect(value: Rect2) -> void:
	region_rect = value

func get_texture() -> Texture2D:
	return texture

func set_texture(value: Texture2D) -> void:
	texture = value

