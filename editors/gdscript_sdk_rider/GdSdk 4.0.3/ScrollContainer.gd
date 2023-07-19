extends Container
#brief A helper node for displaying scrollable elements such as lists.
#desc A ScrollContainer node meant to contain a [Control] child.
#desc ScrollContainers will automatically create a scrollbar child ([HScrollBar], [VScrollBar], or both) when needed and will only draw the Control within the ScrollContainer area. Scrollbars will automatically be drawn at the right (for vertical) or bottom (for horizontal) and will enable dragging to move the viewable Control (and its children) within the ScrollContainer. Scrollbars will also automatically resize the grabber based on the [member Control.custom_minimum_size] of the Control relative to the ScrollContainer.
#desc Works great with a [Panel] control. You can set [constant Control.SIZE_EXPAND] on the children's size flags, so they will upscale to the ScrollContainer's size if it's larger (scroll is invisible for the chosen dimension).
#tutorial [GUI containers] https://docs.godotengine.org/en/stable/tutorials/ui/gui_containers.html
class_name ScrollContainer

#desc Emitted when scrolling stops.
signal scroll_ended
#desc Emitted when scrolling is started.
signal scroll_started
#desc Scrolling disabled, scrollbar will be invisible.
#desc Scrolling enabled, scrollbar will be visible only if necessary, i.e. container's content is bigger than the container.
#desc Scrolling enabled, scrollbar will be always visible.
#desc Scrolling enabled, scrollbar will be hidden.

#enum ScrollMode
enum {
    SCROLL_MODE_DISABLED = 0,
    SCROLL_MODE_AUTO = 1,
    SCROLL_MODE_SHOW_ALWAYS = 2,
    SCROLL_MODE_SHOW_NEVER = 3,
}
var clip_contents: bool:
	get = is_clipping_contents, set = set_clip_contents

#desc If [code]true[/code], the ScrollContainer will automatically scroll to focused children (including indirect children) to make sure they are fully visible.
var follow_focus: bool:
	get = is_following_focus, set = set_follow_focus

#desc Controls whether horizontal scrollbar can be used and when it should be visible. See [enum ScrollMode] for options.
var horizontal_scroll_mode: int:
	get = get_horizontal_scroll_mode, set = set_horizontal_scroll_mode

#desc Deadzone for touch scrolling. Lower deadzone makes the scrolling more sensitive.
var scroll_deadzone: int:
	get = get_deadzone, set = set_deadzone

#desc The current horizontal scroll value.
#desc [b]Note:[/b] If you are setting this value in the [method Node._ready] function or earlier, it needs to be wrapped with [method Object.set_deferred], since scroll bar's [member Range.max_value] is not initialized yet.
#desc [codeblock]
#desc func _ready():
#desc set_deferred("scroll_horizontal", 600)
#desc [/codeblock]
var scroll_horizontal: int:
	get = get_h_scroll, set = set_h_scroll

#desc The current vertical scroll value.
#desc [b]Note:[/b] Setting it early needs to be deferred, just like in [member scroll_horizontal].
#desc [codeblock]
#desc func _ready():
#desc set_deferred("scroll_vertical", 600)
#desc [/codeblock]
var scroll_vertical: int:
	get = get_v_scroll, set = set_v_scroll

#desc Controls whether vertical scrollbar can be used and when it should be visible. See [enum ScrollMode] for options.
var vertical_scroll_mode: int:
	get = get_vertical_scroll_mode, set = set_vertical_scroll_mode



#desc Ensures the given [param control] is visible (must be a direct or indirect child of the ScrollContainer). Used by [member follow_focus].
#desc [b]Note:[/b] This will not work on a node that was just added during the same frame. If you want to scroll to a newly added child, you must wait until the next frame using [signal SceneTree.process_frame]:
#desc [codeblock]
#desc add_child(child_node)
#desc await get_tree().process_frame
#desc ensure_control_visible(child_node)
#desc [/codeblock]
func ensure_control_visible(control: Control) -> void:
	pass;

#desc Returns the horizontal scrollbar [HScrollBar] of this [ScrollContainer].
#desc [b]Warning:[/b] This is a required internal node, removing and freeing it may cause a crash. If you wish to disable or hide a scrollbar, you can use [member horizontal_scroll_mode].
func get_h_scroll_bar() -> HScrollBar:
	pass;

#desc Returns the vertical scrollbar [VScrollBar] of this [ScrollContainer].
#desc [b]Warning:[/b] This is a required internal node, removing and freeing it may cause a crash. If you wish to disable or hide a scrollbar, you can use [member vertical_scroll_mode].
func get_v_scroll_bar() -> VScrollBar:
	pass;


func is_clipping_contents() -> bool:
	return clip_contents

func set_clip_contents(value: bool) -> void:
	clip_contents = value

func is_following_focus() -> bool:
	return follow_focus

func set_follow_focus(value: bool) -> void:
	follow_focus = value

func get_horizontal_scroll_mode() -> int:
	return horizontal_scroll_mode

func set_horizontal_scroll_mode(value: int) -> void:
	horizontal_scroll_mode = value

func get_deadzone() -> int:
	return scroll_deadzone

func set_deadzone(value: int) -> void:
	scroll_deadzone = value

func get_h_scroll() -> int:
	return scroll_horizontal

func set_h_scroll(value: int) -> void:
	scroll_horizontal = value

func get_v_scroll() -> int:
	return scroll_vertical

func set_v_scroll(value: int) -> void:
	scroll_vertical = value

func get_vertical_scroll_mode() -> int:
	return vertical_scroll_mode

func set_vertical_scroll_mode(value: int) -> void:
	vertical_scroll_mode = value

