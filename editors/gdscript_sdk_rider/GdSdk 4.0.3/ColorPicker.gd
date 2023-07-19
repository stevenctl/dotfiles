extends VBoxContainer
#brief Color picker control.
#desc Displays a color picker widget. Useful for selecting a color from an RGB/RGBA colorspace.
#desc [b]Note:[/b] This control is the color picker widget itself. You can use a [ColorPickerButton] instead if you need a button that brings up a [ColorPicker] in a pop-up.
#tutorial [Tween Demo] https://godotengine.org/asset-library/asset/146
class_name ColorPicker

#desc Emitted when the color is changed.
signal color_changed(color: Color)
#desc Emitted when a preset is added.
signal preset_added(color: Color)
#desc Emitted when a preset is removed.
signal preset_removed(color: Color)
#desc Allows editing the color with Red/Green/Blue sliders.
#desc Allows editing the color with Hue/Saturation/Value sliders.
#desc Allows the color R, G, B component values to go beyond 1.0, which can be used for certain special operations that require it (like tinting without darkening or rendering sprites in HDR).
#desc Allows editing the color with Hue/Saturation/Lightness sliders.
#desc OKHSL is a new color space similar to HSL but that better match perception by leveraging the Oklab color space which is designed to be simple to use, while doing a good job at predicting perceived lightness, chroma and hue.
#desc [url=https://bottosson.github.io/posts/colorpicker/]Okhsv and Okhsl color spaces[/url]
#desc HSV Color Model rectangle color space.
#desc HSV Color Model rectangle color space with a wheel.
#desc HSV Color Model circle color space. Use Saturation as a radius.
#desc HSL OK Color Model circle color space.
#desc The color space shape and the shape select button are hidden. Can't be selected from the shapes popup.

#enum ColorModeType
enum {
    MODE_RGB = 0,
    MODE_HSV = 1,
    MODE_RAW = 2,
    MODE_OKHSL = 3,
}
#enum PickerShapeType
enum {
    SHAPE_HSV_RECTANGLE = 0,
    SHAPE_HSV_WHEEL = 1,
    SHAPE_VHS_CIRCLE = 2,
    SHAPE_OKHSL_CIRCLE = 3,
    SHAPE_NONE = 4,
}
#desc If [code]true[/code], it's possible to add presets under Swatches. If [code]false[/code], the button to add presets is disabled.
var can_add_swatches: bool:
	get = are_swatches_enabled, set = set_can_add_swatches

#desc The currently selected color.
var color: Color:
	get = get_pick_color, set = set_pick_color

#desc The currently selected color mode. See [enum ColorModeType].
var color_mode: int:
	get = get_color_mode, set = set_color_mode

#desc If [code]true[/code], the color mode buttons are visible.
var color_modes_visible: bool:
	get = are_modes_visible, set = set_modes_visible

#desc If [code]true[/code], the color will apply only after the user releases the mouse button, otherwise it will apply immediately even in mouse motion event (which can cause performance issues).
var deferred_mode: bool:
	get = is_deferred_mode, set = set_deferred_mode

#desc If [code]true[/code], shows an alpha channel slider (opacity).
var edit_alpha: bool:
	get = is_editing_alpha, set = set_edit_alpha

#desc If [code]true[/code], the hex color code input field is visible.
var hex_visible: bool:
	get = is_hex_visible, set = set_hex_visible

#desc The shape of the color space view. See [enum PickerShapeType].
var picker_shape: int:
	get = get_picker_shape, set = set_picker_shape

#desc If [code]true[/code], the Swatches and Recent Colors presets are visible.
var presets_visible: bool:
	get = are_presets_visible, set = set_presets_visible

#desc If [code]true[/code], the color sampler and color preview are visible.
var sampler_visible: bool:
	get = is_sampler_visible, set = set_sampler_visible

#desc If [code]true[/code], the color sliders are visible.
var sliders_visible: bool:
	get = are_sliders_visible, set = set_sliders_visible



#desc Adds the given color to a list of color presets. The presets are displayed in the color picker and the user will be able to select them.
#desc [b]Note:[/b] The presets list is only for [i]this[/i] color picker.
func add_preset(color: Color) -> void:
	pass;

#desc Adds the given color to a list of color recent presets so that it can be picked later. Recent presets are the colors that were picked recently, a new preset is automatically created and added to recent presets when you pick a new color.
#desc [b]Note:[/b] The recent presets list is only for [i]this[/i] color picker.
func add_recent_preset(color: Color) -> void:
	pass;

#desc Removes the given color from the list of color presets of this color picker.
func erase_preset(color: Color) -> void:
	pass;

#desc Removes the given color from the list of color recent presets of this color picker.
func erase_recent_preset(color: Color) -> void:
	pass;

#desc Returns the list of colors in the presets of the color picker.
func get_presets() -> PackedColorArray:
	pass;

#desc Returns the list of colors in the recent presets of the color picker.
func get_recent_presets() -> PackedColorArray:
	pass;


func are_swatches_enabled() -> bool:
	return can_add_swatches

func set_can_add_swatches(value: bool) -> void:
	can_add_swatches = value

func get_pick_color() -> Color:
	return color

func set_pick_color(value: Color) -> void:
	color = value

func get_color_mode() -> int:
	return color_mode

func set_color_mode(value: int) -> void:
	color_mode = value

func are_modes_visible() -> bool:
	return color_modes_visible

func set_modes_visible(value: bool) -> void:
	color_modes_visible = value

func is_deferred_mode() -> bool:
	return deferred_mode

func set_deferred_mode(value: bool) -> void:
	deferred_mode = value

func is_editing_alpha() -> bool:
	return edit_alpha

func set_edit_alpha(value: bool) -> void:
	edit_alpha = value

func is_hex_visible() -> bool:
	return hex_visible

func set_hex_visible(value: bool) -> void:
	hex_visible = value

func get_picker_shape() -> int:
	return picker_shape

func set_picker_shape(value: int) -> void:
	picker_shape = value

func are_presets_visible() -> bool:
	return presets_visible

func set_presets_visible(value: bool) -> void:
	presets_visible = value

func is_sampler_visible() -> bool:
	return sampler_visible

func set_sampler_visible(value: bool) -> void:
	sampler_visible = value

func are_sliders_visible() -> bool:
	return sliders_visible

func set_sliders_visible(value: bool) -> void:
	sliders_visible = value

