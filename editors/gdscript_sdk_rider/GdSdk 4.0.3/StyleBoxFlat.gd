extends StyleBox
#brief Customizable [StyleBox] with a given set of parameters (no texture required).
#desc This [StyleBox] can be used to achieve all kinds of looks without the need of a texture. The following properties are customizable:
#desc - Color
#desc - Border width (individual width for each border)
#desc - Rounded corners (individual radius for each corner)
#desc - Shadow (with blur and offset)
#desc Setting corner radius to high values is allowed. As soon as corners overlap, the stylebox will switch to a relative system.
#desc [b]Example:[/b]
#desc [codeblock]
#desc height = 30
#desc corner_radius_top_left = 50
#desc corner_radius_bottom_left = 100
#desc [/codeblock]
#desc The relative system now would take the 1:2 ratio of the two left corners to calculate the actual corner width. Both corners added will [b]never[/b] be more than the height. Result:
#desc [codeblock]
#desc corner_radius_top_left: 10
#desc corner_radius_bottom_left: 20
#desc [/codeblock]
class_name StyleBoxFlat


#desc Antialiasing draws a small ring around the edges, which fades to transparency. As a result, edges look much smoother. This is only noticeable when using rounded corners or [member skew].
#desc [b]Note:[/b] When using beveled corners with 45-degree angles ([member corner_detail] = 1), it is recommended to set [member anti_aliasing] to [code]false[/code] to ensure crisp visuals and avoid possible visual glitches.
var anti_aliasing: bool:
	get = is_anti_aliased, set = set_anti_aliased

#desc This changes the size of the antialiasing effect. [code]1.0[/code] is recommended for an optimal result at 100% scale, identical to how rounded rectangles are rendered in web browsers and most vector drawing software.
#desc [b]Note:[/b] Higher values may produce a blur effect but can also create undesired artifacts on small boxes with large-radius corners.
var anti_aliasing_size: float:
	get = get_aa_size, set = set_aa_size

#desc The background color of the stylebox.
var bg_color: Color:
	get = get_bg_color, set = set_bg_color

#desc If [code]true[/code], the border will fade into the background color.
var border_blend: bool:
	get = get_border_blend, set = set_border_blend

#desc Sets the color of the border.
var border_color: Color:
	get = get_border_color, set = set_border_color

#desc Border width for the bottom border.
var border_width_bottom: int:
	get = get_border_width, set = set_border_width

#desc Border width for the left border.
var border_width_left: int:
	get = get_border_width, set = set_border_width

#desc Border width for the right border.
var border_width_right: int:
	get = get_border_width, set = set_border_width

#desc Border width for the top border.
var border_width_top: int:
	get = get_border_width, set = set_border_width

#desc This sets the number of vertices used for each corner. Higher values result in rounder corners but take more processing power to compute. When choosing a value, you should take the corner radius ([method set_corner_radius_all]) into account.
#desc For corner radii less than 10, [code]4[/code] or [code]5[/code] should be enough. For corner radii less than 30, values between [code]8[/code] and [code]12[/code] should be enough.
#desc A corner detail of [code]1[/code] will result in chamfered corners instead of rounded corners, which is useful for some artistic effects.
var corner_detail: int:
	get = get_corner_detail, set = set_corner_detail

#desc The bottom-left corner's radius. If [code]0[/code], the corner is not rounded.
var corner_radius_bottom_left: int:
	get = get_corner_radius, set = set_corner_radius

#desc The bottom-right corner's radius. If [code]0[/code], the corner is not rounded.
var corner_radius_bottom_right: int:
	get = get_corner_radius, set = set_corner_radius

#desc The top-left corner's radius. If [code]0[/code], the corner is not rounded.
var corner_radius_top_left: int:
	get = get_corner_radius, set = set_corner_radius

#desc The top-right corner's radius. If [code]0[/code], the corner is not rounded.
var corner_radius_top_right: int:
	get = get_corner_radius, set = set_corner_radius

#desc Toggles drawing of the inner part of the stylebox.
var draw_center: bool:
	get = is_draw_center_enabled, set = set_draw_center

#desc Expands the stylebox outside of the control rect on the bottom edge. Useful in combination with [member border_width_bottom] to draw a border outside the control rect.
#desc [b]Note:[/b] Unlike [member StyleBox.content_margin_bottom], [member expand_margin_bottom] does [i]not[/i] affect the size of the clickable area for [Control]s. This can negatively impact usability if used wrong, as the user may try to click an area of the StyleBox that cannot actually receive clicks.
var expand_margin_bottom: float:
	get = get_expand_margin, set = set_expand_margin

#desc Expands the stylebox outside of the control rect on the left edge. Useful in combination with [member border_width_left] to draw a border outside the control rect.
#desc [b]Note:[/b] Unlike [member StyleBox.content_margin_left], [member expand_margin_left] does [i]not[/i] affect the size of the clickable area for [Control]s. This can negatively impact usability if used wrong, as the user may try to click an area of the StyleBox that cannot actually receive clicks.
var expand_margin_left: float:
	get = get_expand_margin, set = set_expand_margin

#desc Expands the stylebox outside of the control rect on the right edge. Useful in combination with [member border_width_right] to draw a border outside the control rect.
#desc [b]Note:[/b] Unlike [member StyleBox.content_margin_right], [member expand_margin_right] does [i]not[/i] affect the size of the clickable area for [Control]s. This can negatively impact usability if used wrong, as the user may try to click an area of the StyleBox that cannot actually receive clicks.
var expand_margin_right: float:
	get = get_expand_margin, set = set_expand_margin

#desc Expands the stylebox outside of the control rect on the top edge. Useful in combination with [member border_width_top] to draw a border outside the control rect.
#desc [b]Note:[/b] Unlike [member StyleBox.content_margin_top], [member expand_margin_top] does [i]not[/i] affect the size of the clickable area for [Control]s. This can negatively impact usability if used wrong, as the user may try to click an area of the StyleBox that cannot actually receive clicks.
var expand_margin_top: float:
	get = get_expand_margin, set = set_expand_margin

#desc The color of the shadow. This has no effect if [member shadow_size] is lower than 1.
var shadow_color: Color:
	get = get_shadow_color, set = set_shadow_color

#desc The shadow offset in pixels. Adjusts the position of the shadow relatively to the stylebox.
var shadow_offset: Vector2:
	get = get_shadow_offset, set = set_shadow_offset

#desc The shadow size in pixels.
var shadow_size: int:
	get = get_shadow_size, set = set_shadow_size

#desc If set to a non-zero value on either axis, [member skew] distorts the StyleBox horizontally and/or vertically. This can be used for "futuristic"-style UIs. Positive values skew the StyleBox towards the right (X axis) and upwards (Y axis), while negative values skew the StyleBox towards the left (X axis) and downwards (Y axis).
#desc [b]Note:[/b] To ensure text does not touch the StyleBox's edges, consider increasing the [StyleBox]'s content margin (see [member StyleBox.content_margin_bottom]). It is preferable to increase the content margin instead of the expand margin (see [member expand_margin_bottom]), as increasing the expand margin does not increase the size of the clickable area for [Control]s.
var skew: Vector2:
	get = get_skew, set = set_skew



#desc Returns the specified [enum Side]'s border width.
func get_border_width(margin: int) -> int:
	pass;

#desc Returns the smallest border width out of all four borders.
func get_border_width_min() -> int:
	pass;

#desc Returns the given [param corner]'s radius. See [enum Corner] for possible values.
func get_corner_radius(corner: int) -> int:
	pass;

#desc Returns the size of the specified [enum Side]'s expand margin.
func get_expand_margin(margin: int) -> float:
	pass;

#desc Sets the specified [enum Side]'s border width to [param width] pixels.
func set_border_width(margin: int, width: int) -> void:
	pass;

#desc Sets the border width to [param width] pixels for all sides.
func set_border_width_all(width: int) -> void:
	pass;

#desc Sets the corner radius to [param radius] pixels for the given [param corner]. See [enum Corner] for possible values.
func set_corner_radius(corner: int, radius: int) -> void:
	pass;

#desc Sets the corner radius to [param radius] pixels for all corners.
func set_corner_radius_all(radius: int) -> void:
	pass;

#desc Sets the expand margin to [param size] pixels for the specified [enum Side].
func set_expand_margin(margin: int, size: float) -> void:
	pass;

#desc Sets the expand margin to [param size] pixels for all sides.
func set_expand_margin_all(size: float) -> void:
	pass;


func is_anti_aliased() -> bool:
	return anti_aliasing

func set_anti_aliased(value: bool) -> void:
	anti_aliasing = value

func get_aa_size() -> float:
	return anti_aliasing_size

func set_aa_size(value: float) -> void:
	anti_aliasing_size = value

func get_bg_color() -> Color:
	return bg_color

func set_bg_color(value: Color) -> void:
	bg_color = value

func get_border_blend() -> bool:
	return border_blend

func set_border_blend(value: bool) -> void:
	border_blend = value

func get_border_color() -> Color:
	return border_color

func set_border_color(value: Color) -> void:
	border_color = value

func get_border_width() -> int:
	return border_width_bottom

func set_border_width(value: int) -> void:
	border_width_bottom = value

func get_border_width() -> int:
	return border_width_left

func set_border_width(value: int) -> void:
	border_width_left = value

func get_border_width() -> int:
	return border_width_right

func set_border_width(value: int) -> void:
	border_width_right = value

func get_border_width() -> int:
	return border_width_top

func set_border_width(value: int) -> void:
	border_width_top = value

func get_corner_detail() -> int:
	return corner_detail

func set_corner_detail(value: int) -> void:
	corner_detail = value

func get_corner_radius() -> int:
	return corner_radius_bottom_left

func set_corner_radius(value: int) -> void:
	corner_radius_bottom_left = value

func get_corner_radius() -> int:
	return corner_radius_bottom_right

func set_corner_radius(value: int) -> void:
	corner_radius_bottom_right = value

func get_corner_radius() -> int:
	return corner_radius_top_left

func set_corner_radius(value: int) -> void:
	corner_radius_top_left = value

func get_corner_radius() -> int:
	return corner_radius_top_right

func set_corner_radius(value: int) -> void:
	corner_radius_top_right = value

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

func get_skew() -> Vector2:
	return skew

func set_skew(value: Vector2) -> void:
	skew = value

