extends Range
#brief Texture-based progress bar. Useful for loading screens and life or stamina bars.
#desc TextureProgressBar works like [ProgressBar], but uses up to 3 textures instead of Godot's [Theme] resource. It can be used to create horizontal, vertical and radial progress bars.
class_name TextureProgressBar

#desc The [member texture_progress] fills from left to right.
#desc The [member texture_progress] fills from right to left.
#desc The [member texture_progress] fills from top to bottom.
#desc The [member texture_progress] fills from bottom to top.
#desc Turns the node into a radial bar. The [member texture_progress] fills clockwise. See [member radial_center_offset], [member radial_initial_angle] and [member radial_fill_degrees] to control the way the bar fills up.
#desc Turns the node into a radial bar. The [member texture_progress] fills counterclockwise. See [member radial_center_offset], [member radial_initial_angle] and [member radial_fill_degrees] to control the way the bar fills up.
#desc The [member texture_progress] fills from the center, expanding both towards the left and the right.
#desc The [member texture_progress] fills from the center, expanding both towards the top and the bottom.
#desc Turns the node into a radial bar. The [member texture_progress] fills radially from the center, expanding both clockwise and counterclockwise. See [member radial_center_offset], [member radial_initial_angle] and [member radial_fill_degrees] to control the way the bar fills up.

#enum FillMode
enum {
    FILL_LEFT_TO_RIGHT = 0,
    FILL_RIGHT_TO_LEFT = 1,
    FILL_TOP_TO_BOTTOM = 2,
    FILL_BOTTOM_TO_TOP = 3,
    FILL_CLOCKWISE = 4,
    FILL_COUNTER_CLOCKWISE = 5,
    FILL_BILINEAR_LEFT_AND_RIGHT = 6,
    FILL_BILINEAR_TOP_AND_BOTTOM = 7,
    FILL_CLOCKWISE_AND_COUNTER_CLOCKWISE = 8,
}
#desc The fill direction. See [enum FillMode] for possible values.
var fill_mode: int:
	get = get_fill_mode, set = set_fill_mode

var mouse_filter: int:
	get = get_mouse_filter, set = set_mouse_filter

#desc If [code]true[/code], Godot treats the bar's textures like in [NinePatchRect]. Use the [code]stretch_margin_*[/code] properties like [member stretch_margin_bottom] to set up the nine patch's 3×3 grid. When using a radial [member fill_mode], this setting will enable stretching.
var nine_patch_stretch: bool:
	get = get_nine_patch_stretch, set = set_nine_patch_stretch

#desc Offsets [member texture_progress] if [member fill_mode] is [constant FILL_CLOCKWISE] or [constant FILL_COUNTER_CLOCKWISE].
var radial_center_offset: Vector2:
	get = get_radial_center_offset, set = set_radial_center_offset

#desc Upper limit for the fill of [member texture_progress] if [member fill_mode] is [constant FILL_CLOCKWISE] or [constant FILL_COUNTER_CLOCKWISE]. When the node's [code]value[/code] is equal to its [code]max_value[/code], the texture fills up to this angle.
#desc See [member Range.value], [member Range.max_value].
var radial_fill_degrees: float:
	get = get_fill_degrees, set = set_fill_degrees

#desc Starting angle for the fill of [member texture_progress] if [member fill_mode] is [constant FILL_CLOCKWISE] or [constant FILL_COUNTER_CLOCKWISE]. When the node's [code]value[/code] is equal to its [code]min_value[/code], the texture doesn't show up at all. When the [code]value[/code] increases, the texture fills and tends towards [member radial_fill_degrees].
var radial_initial_angle: float:
	get = get_radial_initial_angle, set = set_radial_initial_angle

var size_flags_vertical: int:
	get = get_v_size_flags, set = set_v_size_flags

var step: float:
	get = get_step, set = set_step

#desc The height of the 9-patch's bottom row. A margin of 16 means the 9-slice's bottom corners and side will have a height of 16 pixels. You can set all 4 margin values individually to create panels with non-uniform borders.
var stretch_margin_bottom: int:
	get = get_stretch_margin, set = set_stretch_margin

#desc The width of the 9-patch's left column.
var stretch_margin_left: int:
	get = get_stretch_margin, set = set_stretch_margin

#desc The width of the 9-patch's right column.
var stretch_margin_right: int:
	get = get_stretch_margin, set = set_stretch_margin

#desc The height of the 9-patch's top row.
var stretch_margin_top: int:
	get = get_stretch_margin, set = set_stretch_margin

#desc [Texture2D] that draws over the progress bar. Use it to add highlights or an upper-frame that hides part of [member texture_progress].
var texture_over: Texture2D:
	get = get_over_texture, set = set_over_texture

#desc [Texture2D] that clips based on the node's [code]value[/code] and [member fill_mode]. As [code]value[/code] increased, the texture fills up. It shows entirely when [code]value[/code] reaches [code]max_value[/code]. It doesn't show at all if [code]value[/code] is equal to [code]min_value[/code].
#desc The [code]value[/code] property comes from [Range]. See [member Range.value], [member Range.min_value], [member Range.max_value].
var texture_progress: Texture2D:
	get = get_progress_texture, set = set_progress_texture

#desc The offset of [member texture_progress]. Useful for [member texture_over] and [member texture_under] with fancy borders, to avoid transparent margins in your progress texture.
var texture_progress_offset: Vector2:
	get = get_texture_progress_offset, set = set_texture_progress_offset

#desc [Texture2D] that draws under the progress bar. The bar's background.
var texture_under: Texture2D:
	get = get_under_texture, set = set_under_texture

#desc Multiplies the color of the bar's [code]texture_over[/code] texture. The effect is similar to [member CanvasItem.modulate], except it only affects this specific texture instead of the entire node.
var tint_over: Color:
	get = get_tint_over, set = set_tint_over

#desc Multiplies the color of the bar's [code]texture_progress[/code] texture.
var tint_progress: Color:
	get = get_tint_progress, set = set_tint_progress

#desc Multiplies the color of the bar's [code]texture_under[/code] texture.
var tint_under: Color:
	get = get_tint_under, set = set_tint_under



#desc Returns the stretch margin with the specified index. See [member stretch_margin_bottom] and related properties.
func get_stretch_margin(margin: int) -> int:
	pass;

#desc Sets the stretch margin with the specified index. See [member stretch_margin_bottom] and related properties.
func set_stretch_margin(margin: int, value: int) -> void:
	pass;


func get_fill_mode() -> int:
	return fill_mode

func set_fill_mode(value: int) -> void:
	fill_mode = value

func get_mouse_filter() -> int:
	return mouse_filter

func set_mouse_filter(value: int) -> void:
	mouse_filter = value

func get_nine_patch_stretch() -> bool:
	return nine_patch_stretch

func set_nine_patch_stretch(value: bool) -> void:
	nine_patch_stretch = value

func get_radial_center_offset() -> Vector2:
	return radial_center_offset

func set_radial_center_offset(value: Vector2) -> void:
	radial_center_offset = value

func get_fill_degrees() -> float:
	return radial_fill_degrees

func set_fill_degrees(value: float) -> void:
	radial_fill_degrees = value

func get_radial_initial_angle() -> float:
	return radial_initial_angle

func set_radial_initial_angle(value: float) -> void:
	radial_initial_angle = value

func get_v_size_flags() -> int:
	return size_flags_vertical

func set_v_size_flags(value: int) -> void:
	size_flags_vertical = value

func get_step() -> float:
	return step

func set_step(value: float) -> void:
	step = value

func get_stretch_margin() -> int:
	return stretch_margin_bottom

func set_stretch_margin(value: int) -> void:
	stretch_margin_bottom = value

func get_stretch_margin() -> int:
	return stretch_margin_left

func set_stretch_margin(value: int) -> void:
	stretch_margin_left = value

func get_stretch_margin() -> int:
	return stretch_margin_right

func set_stretch_margin(value: int) -> void:
	stretch_margin_right = value

func get_stretch_margin() -> int:
	return stretch_margin_top

func set_stretch_margin(value: int) -> void:
	stretch_margin_top = value

func get_over_texture() -> Texture2D:
	return texture_over

func set_over_texture(value: Texture2D) -> void:
	texture_over = value

func get_progress_texture() -> Texture2D:
	return texture_progress

func set_progress_texture(value: Texture2D) -> void:
	texture_progress = value

func get_texture_progress_offset() -> Vector2:
	return texture_progress_offset

func set_texture_progress_offset(value: Vector2) -> void:
	texture_progress_offset = value

func get_under_texture() -> Texture2D:
	return texture_under

func set_under_texture(value: Texture2D) -> void:
	texture_under = value

func get_tint_over() -> Color:
	return tint_over

func set_tint_over(value: Color) -> void:
	tint_over = value

func get_tint_progress() -> Color:
	return tint_progress

func set_tint_progress(value: Color) -> void:
	tint_progress = value

func get_tint_under() -> Color:
	return tint_under

func set_tint_under(value: Color) -> void:
	tint_under = value

