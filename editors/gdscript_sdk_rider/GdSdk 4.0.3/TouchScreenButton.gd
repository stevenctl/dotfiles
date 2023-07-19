extends Node2D
#brief Button for touch screen devices for gameplay use.
#desc TouchScreenButton allows you to create on-screen buttons for touch devices. It's intended for gameplay use, such as a unit you have to touch to move. Unlike [Button], TouchScreenButton supports multitouch out of the box. Several TouchScreenButtons can be pressed at the same time with touch input.
#desc This node inherits from [Node2D]. Unlike with [Control] nodes, you cannot set anchors on it. If you want to create menus or user interfaces, you may want to use [Button] nodes instead. To make button nodes react to touch events, you can enable the Emulate Mouse option in the Project Settings.
#desc You can configure TouchScreenButton to be visible only on touch devices, helping you develop your game both for desktop and mobile devices.
class_name TouchScreenButton

#desc Emitted when the button is pressed (down).
signal pressed
#desc Emitted when the button is released (up).
signal released
#desc Always visible.
#desc Visible on touch screens only.

#enum VisibilityMode
enum {
    VISIBILITY_ALWAYS = 0,
    VISIBILITY_TOUCHSCREEN_ONLY = 1,
}
#desc The button's action. Actions can be handled with [InputEventAction].
var action: String:
	get = get_action, set = set_action

#desc The button's bitmask.
var bitmask: BitMap:
	get = get_bitmask, set = set_bitmask

#desc If [code]true[/code], the [signal pressed] and [signal released] signals are emitted whenever a pressed finger goes in and out of the button, even if the pressure started outside the active area of the button.
#desc [b]Note:[/b] This is a "pass-by" (not "bypass") press mode.
var passby_press: bool:
	get = is_passby_press_enabled, set = set_passby_press

#desc The button's shape.
var shape: Shape2D:
	get = get_shape, set = set_shape

#desc If [code]true[/code], the button's shape is centered in the provided texture. If no texture is used, this property has no effect.
var shape_centered: bool:
	get = is_shape_centered, set = set_shape_centered

#desc If [code]true[/code], the button's shape is visible in the editor.
var shape_visible: bool:
	get = is_shape_visible, set = set_shape_visible

#desc The button's texture for the normal state.
var texture_normal: Texture2D:
	get = get_texture_normal, set = set_texture_normal

#desc The button's texture for the pressed state.
var texture_pressed: Texture2D:
	get = get_texture_pressed, set = set_texture_pressed

#desc The button's visibility mode. See [enum VisibilityMode] for possible values.
var visibility_mode: int:
	get = get_visibility_mode, set = set_visibility_mode



#desc Returns [code]true[/code] if this button is currently pressed.
func is_pressed() -> bool:
	pass;


func get_action() -> String:
	return action

func set_action(value: String) -> void:
	action = value

func get_bitmask() -> BitMap:
	return bitmask

func set_bitmask(value: BitMap) -> void:
	bitmask = value

func is_passby_press_enabled() -> bool:
	return passby_press

func set_passby_press(value: bool) -> void:
	passby_press = value

func get_shape() -> Shape2D:
	return shape

func set_shape(value: Shape2D) -> void:
	shape = value

func is_shape_centered() -> bool:
	return shape_centered

func set_shape_centered(value: bool) -> void:
	shape_centered = value

func is_shape_visible() -> bool:
	return shape_visible

func set_shape_visible(value: bool) -> void:
	shape_visible = value

func get_texture_normal() -> Texture2D:
	return texture_normal

func set_texture_normal(value: Texture2D) -> void:
	texture_normal = value

func get_texture_pressed() -> Texture2D:
	return texture_pressed

func set_texture_pressed(value: Texture2D) -> void:
	texture_pressed = value

func get_visibility_mode() -> int:
	return visibility_mode

func set_visibility_mode(value: int) -> void:
	visibility_mode = value

