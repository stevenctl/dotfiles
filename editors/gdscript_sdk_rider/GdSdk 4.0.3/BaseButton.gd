extends Control
#brief Base class for different kinds of buttons.
#desc BaseButton is the abstract base class for buttons, so it shouldn't be used directly (it doesn't display anything). Other types of buttons inherit from it.
class_name BaseButton

#desc Emitted when the button starts being held down.
signal button_down
#desc Emitted when the button stops being held down.
signal button_up
#desc Emitted when the button is toggled or pressed. This is on [signal button_down] if [member action_mode] is [constant ACTION_MODE_BUTTON_PRESS] and on [signal button_up] otherwise.
#desc If you need to know the button's pressed state (and [member toggle_mode] is active), use [signal toggled] instead.
signal pressed
#desc Emitted when the button was just toggled between pressed and normal states (only if [member toggle_mode] is active). The new state is contained in the [param button_pressed] argument.
signal toggled(button_pressed: bool)
#desc The normal state (i.e. not pressed, not hovered, not toggled and enabled) of buttons.
#desc The state of buttons are pressed.
#desc The state of buttons are hovered.
#desc The state of buttons are disabled.
#desc The state of buttons are both hovered and pressed.
#desc Require just a press to consider the button clicked.
#desc Require a press and a subsequent release before considering the button clicked.

#enum DrawMode
enum {
    DRAW_NORMAL = 0,
    DRAW_PRESSED = 1,
    DRAW_HOVER = 2,
    DRAW_DISABLED = 3,
    DRAW_HOVER_PRESSED = 4,
}
#enum ActionMode
enum {
    ACTION_MODE_BUTTON_PRESS = 0,
    ACTION_MODE_BUTTON_RELEASE = 1,
}
#desc Determines when the button is considered clicked, one of the [enum ActionMode] constants.
var action_mode: int:
	get = get_action_mode, set = set_action_mode

#desc The [ButtonGroup] associated with the button. Not to be confused with node groups.
var button_group: ButtonGroup:
	get = get_button_group, set = set_button_group

#desc Binary mask to choose which mouse buttons this button will respond to.
#desc To allow both left-click and right-click, use [code]MOUSE_BUTTON_MASK_LEFT | MOUSE_BUTTON_MASK_RIGHT[/code].
var button_mask: int:
	get = get_button_mask, set = set_button_mask

#desc If [code]true[/code], the button's state is pressed. Means the button is pressed down or toggled (if [member toggle_mode] is active). Only works if [member toggle_mode] is [code]true[/code].
#desc [b]Note:[/b] Setting [member button_pressed] will result in [signal toggled] to be emitted. If you want to change the pressed state without emitting that signal, use [method set_pressed_no_signal].
var button_pressed: bool:
	get = is_pressed, set = set_pressed

#desc If [code]true[/code], the button is in disabled state and can't be clicked or toggled.
var disabled: bool:
	get = is_disabled, set = set_disabled

var focus_mode: int:
	get = get_focus_mode, set = set_focus_mode

#desc If [code]true[/code], the button stays pressed when moving the cursor outside the button while pressing it.
#desc [b]Note:[/b] This property only affects the button's visual appearance. Signals will be emitted at the same moment regardless of this property's value.
var keep_pressed_outside: bool:
	get = is_keep_pressed_outside, set = set_keep_pressed_outside

#desc [Shortcut] associated to the button.
var shortcut: Shortcut:
	get = get_shortcut, set = set_shortcut

#desc If [code]true[/code], the button will highlight for a short amount of time when its shortcut is activated. If [code]false[/code] and [member toggle_mode] is [code]false[/code], the shortcut will activate without any visual feedback.
var shortcut_feedback: bool:
	get = is_shortcut_feedback, set = set_shortcut_feedback

#desc If [code]true[/code], the button will add information about its shortcut in the tooltip.
var shortcut_in_tooltip: bool:
	get = is_shortcut_in_tooltip_enabled, set = set_shortcut_in_tooltip

#desc If [code]true[/code], the button is in toggle mode. Makes the button flip state between pressed and unpressed each time its area is clicked.
var toggle_mode: bool:
	get = is_toggle_mode, set = set_toggle_mode



#desc Called when the button is pressed. If you need to know the button's pressed state (and [member toggle_mode] is active), use [method _toggled] instead.
func _pressed() -> void:
	pass;

#desc Called when the button is toggled (only if [member toggle_mode] is active).
func _toggled(button_pressed: bool) -> void:
	pass;

#desc Returns the visual state used to draw the button. This is useful mainly when implementing your own draw code by either overriding _draw() or connecting to "draw" signal. The visual state of the button is defined by the [enum DrawMode] enum.
func get_draw_mode() -> int:
	pass;

#desc Returns [code]true[/code] if the mouse has entered the button and has not left it yet.
func is_hovered() -> bool:
	pass;

#desc Changes the [member button_pressed] state of the button, without emitting [signal toggled]. Use when you just want to change the state of the button without sending the pressed event (e.g. when initializing scene). Only works if [member toggle_mode] is [code]true[/code].
#desc [b]Note:[/b] This method doesn't unpress other buttons in [member button_group].
func set_pressed_no_signal(pressed: bool) -> void:
	pass;


func get_action_mode() -> int:
	return action_mode

func set_action_mode(value: int) -> void:
	action_mode = value

func get_button_group() -> ButtonGroup:
	return button_group

func set_button_group(value: ButtonGroup) -> void:
	button_group = value

func get_button_mask() -> int:
	return button_mask

func set_button_mask(value: int) -> void:
	button_mask = value

func is_pressed() -> bool:
	return button_pressed

func set_pressed(value: bool) -> void:
	button_pressed = value

func is_disabled() -> bool:
	return disabled

func set_disabled(value: bool) -> void:
	disabled = value

func get_focus_mode() -> int:
	return focus_mode

func set_focus_mode(value: int) -> void:
	focus_mode = value

func is_keep_pressed_outside() -> bool:
	return keep_pressed_outside

func set_keep_pressed_outside(value: bool) -> void:
	keep_pressed_outside = value

func get_shortcut() -> Shortcut:
	return shortcut

func set_shortcut(value: Shortcut) -> void:
	shortcut = value

func is_shortcut_feedback() -> bool:
	return shortcut_feedback

func set_shortcut_feedback(value: bool) -> void:
	shortcut_feedback = value

func is_shortcut_in_tooltip_enabled() -> bool:
	return shortcut_in_tooltip

func set_shortcut_in_tooltip(value: bool) -> void:
	shortcut_in_tooltip = value

func is_toggle_mode() -> bool:
	return toggle_mode

func set_toggle_mode(value: bool) -> void:
	toggle_mode = value

