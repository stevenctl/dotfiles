extends Container
#brief Container for splitting and adjusting.
#desc Container for splitting two [Control]s vertically or horizontally, with a grabber that allows adjusting the split offset or ratio.
#tutorial [GUI containers] https://docs.godotengine.org/en/stable/tutorials/ui/gui_containers.html
class_name SplitContainer

#desc Emitted when the dragger is dragged by user.
signal dragged(offset: int)
#desc The split dragger is visible when the cursor hovers it.
#desc The split dragger is never visible.
#desc The split dragger is never visible and its space collapsed.

#enum DraggerVisibility
enum {
    DRAGGER_VISIBLE = 0,
    DRAGGER_HIDDEN = 1,
    DRAGGER_HIDDEN_COLLAPSED = 2,
}
#desc If [code]true[/code], the area of the first [Control] will be collapsed and the dragger will be disabled.
var collapsed: bool:
	get = is_collapsed, set = set_collapsed

#desc Determines the dragger's visibility. See [enum DraggerVisibility] for details.
var dragger_visibility: int:
	get = get_dragger_visibility, set = set_dragger_visibility

#desc The initial offset of the splitting between the two [Control]s, with [code]0[/code] being at the end of the first [Control].
var split_offset: int:
	get = get_split_offset, set = set_split_offset

#desc If [code]true[/code], the [SplitContainer] will arrange its children vertically, rather than horizontally.
#desc Can't be changed when using [HSplitContainer] and [VSplitContainer].
var vertical: bool:
	get = is_vertical, set = set_vertical



#desc Clamps the [member split_offset] value to not go outside the currently possible minimal and maximum values.
func clamp_split_offset() -> void:
	pass;


func is_collapsed() -> bool:
	return collapsed

func set_collapsed(value: bool) -> void:
	collapsed = value

func get_dragger_visibility() -> int:
	return dragger_visibility

func set_dragger_visibility(value: int) -> void:
	dragger_visibility = value

func get_split_offset() -> int:
	return split_offset

func set_split_offset(value: int) -> void:
	split_offset = value

func is_vertical() -> bool:
	return vertical

func set_vertical(value: bool) -> void:
	vertical = value

