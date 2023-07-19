extends Button
#brief Button that pops out a [ColorPicker].
#desc Encapsulates a [ColorPicker] making it accessible by pressing a button. Pressing the button will toggle the [ColorPicker] visibility.
#desc See also [BaseButton] which contains common properties and methods associated with this node.
#desc [b]Note:[/b] By default, the button may not be wide enough for the color preview swatch to be visible. Make sure to set [member Control.custom_minimum_size] to a big enough value to give the button enough space.
#tutorial [GUI Drag And Drop Demo] https://godotengine.org/asset-library/asset/133
#tutorial [2D GD Paint Demo] https://godotengine.org/asset-library/asset/517
class_name ColorPickerButton

#desc Emitted when the color changes.
signal color_changed(color: Color)
#desc Emitted when the [ColorPicker] is created (the button is pressed for the first time).
signal picker_created
#desc Emitted when the [ColorPicker] is closed.
signal popup_closed

#desc The currently selected color.
var color: Color:
	get = get_pick_color, set = set_pick_color

#desc If [code]true[/code], the alpha channel in the displayed [ColorPicker] will be visible.
var edit_alpha: bool:
	get = is_editing_alpha, set = set_edit_alpha

var toggle_mode: bool:
	get = is_toggle_mode, set = set_toggle_mode



#desc Returns the [ColorPicker] that this node toggles.
#desc [b]Warning:[/b] This is a required internal node, removing and freeing it may cause a crash. If you wish to hide it or any of its children, use their [member CanvasItem.visible] property.
func get_picker() -> ColorPicker:
	pass;

#desc Returns the control's [PopupPanel] which allows you to connect to popup signals. This allows you to handle events when the ColorPicker is shown or hidden.
#desc [b]Warning:[/b] This is a required internal node, removing and freeing it may cause a crash. If you wish to hide it or any of its children, use their [member Window.visible] property.
func get_popup() -> PopupPanel:
	pass;


func get_pick_color() -> Color:
	return color

func set_pick_color(value: Color) -> void:
	color = value

func is_editing_alpha() -> bool:
	return edit_alpha

func set_edit_alpha(value: bool) -> void:
	edit_alpha = value

func is_toggle_mode() -> bool:
	return toggle_mode

func set_toggle_mode(value: bool) -> void:
	toggle_mode = value

