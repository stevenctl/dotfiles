extends Control
#brief Tab bar control.
#desc Simple tabs control, similar to [TabContainer] but is only in charge of drawing tabs, not interacting with children.
class_name TabBar

#desc Emitted when the active tab is rearranged via mouse drag. See [member drag_to_rearrange_enabled].
signal active_tab_rearranged(idx_to: int)
#desc Emitted when a tab's right button is pressed. See [method set_tab_button_icon].
signal tab_button_pressed(tab: int)
#desc Emitted when switching to another tab.
signal tab_changed(tab: int)
#desc Emitted when a tab is clicked, even if it is the current tab.
signal tab_clicked(tab: int)
#desc Emitted when a tab's close button is pressed.
#desc [b]Note:[/b] Tabs are not removed automatically once the close button is pressed, this behavior needs to be programmed manually. For example:
#desc [codeblocks]
#desc [gdscript]
#desc $TabBar.tab_close_pressed.connect($TabBar.remove_tab)
#desc [/gdscript]
#desc [csharp]
#desc GetNode<TabBar>("TabBar").TabClosePressed += GetNode<TabBar>("TabBar").RemoveTab;
#desc [/csharp]
#desc [/codeblocks]
signal tab_close_pressed(tab: int)
#desc Emitted when a tab is hovered by the mouse.
signal tab_hovered(tab: int)
#desc Emitted when a tab is right-clicked. [member select_with_rmb] must be enabled.
signal tab_rmb_clicked(tab: int)
#desc Emitted when a tab is selected via click or script, even if it is the current tab.
signal tab_selected(tab: int)
#desc Places tabs to the left.
#desc Places tabs in the middle.
#desc Places tabs to the right.
#desc Represents the size of the [enum AlignmentMode] enum.
#desc Never show the close buttons.
#desc Only show the close button on the currently active tab.
#desc Show the close button on all tabs.
#desc Represents the size of the [enum CloseButtonDisplayPolicy] enum.

#enum AlignmentMode
enum {
    ALIGNMENT_LEFT = 0,
    ALIGNMENT_CENTER = 1,
    ALIGNMENT_RIGHT = 2,
    ALIGNMENT_MAX = 3,
}
#enum CloseButtonDisplayPolicy
enum {
    CLOSE_BUTTON_SHOW_NEVER = 0,
    CLOSE_BUTTON_SHOW_ACTIVE_ONLY = 1,
    CLOSE_BUTTON_SHOW_ALWAYS = 2,
    CLOSE_BUTTON_MAX = 3,
}
#desc If [code]true[/code], tabs overflowing this node's width will be hidden, displaying two navigation buttons instead. Otherwise, this node's minimum size is updated so that all tabs are visible.
var clip_tabs: bool:
	get = get_clip_tabs, set = set_clip_tabs

#desc Select tab at index [code]tab_idx[/code].
var current_tab: int:
	get = get_current_tab, set = set_current_tab

#desc If [code]true[/code], tabs can be rearranged with mouse drag.
var drag_to_rearrange_enabled: bool:
	get = get_drag_to_rearrange_enabled, set = set_drag_to_rearrange_enabled

#desc Sets the maximum width which all tabs should be limited to. Unlimited if set to [code]0[/code].
var max_tab_width: int:
	get = get_max_tab_width, set = set_max_tab_width

#desc If [code]true[/code], the tab offset will be changed to keep the currently selected tab visible.
var scroll_to_selected: bool:
	get = get_scroll_to_selected, set = set_scroll_to_selected

#desc if [code]true[/code], the mouse's scroll wheel can be used to navigate the scroll view.
var scrolling_enabled: bool:
	get = get_scrolling_enabled, set = set_scrolling_enabled

#desc If [code]true[/code], enables selecting a tab with the right mouse button.
var select_with_rmb: bool:
	get = get_select_with_rmb, set = set_select_with_rmb

#desc Sets the position at which tabs will be placed. See [enum AlignmentMode] for details.
var tab_alignment: int:
	get = get_tab_alignment, set = set_tab_alignment

#desc Sets when the close button will appear on the tabs. See [enum CloseButtonDisplayPolicy] for details.
var tab_close_display_policy: int:
	get = get_tab_close_display_policy, set = set_tab_close_display_policy

#desc The number of tabs currently in the bar.
var tab_count: int:
	get = get_tab_count, set = set_tab_count

#desc [TabBar]s with the same rearrange group ID will allow dragging the tabs between them. Enable drag with [member drag_to_rearrange_enabled].
#desc Setting this to [code]-1[/code] will disable rearranging between [TabBar]s.
var tabs_rearrange_group: int:
	get = get_tabs_rearrange_group, set = set_tabs_rearrange_group



#desc Adds a new tab.
func add_tab(title: String = "", icon: Texture2D = null) -> void:
	pass;

#desc Clears all tabs.
func clear_tabs() -> void:
	pass;

#desc Moves the scroll view to make the tab visible.
func ensure_tab_visible(idx: int) -> void:
	pass;

#desc Returns [code]true[/code] if the offset buttons (the ones that appear when there's not enough space for all tabs) are visible.
func get_offset_buttons_visible() -> bool:
	pass;

#desc Returns the previously active tab index.
func get_previous_tab() -> int:
	pass;

#desc Returns the [Texture2D] for the right button of the tab at index [param tab_idx] or [code]null[/code] if the button has no [Texture2D].
func get_tab_button_icon(tab_idx: int) -> Texture2D:
	pass;

#desc Returns the [Texture2D] for the tab at index [param tab_idx] or [code]null[/code] if the tab has no [Texture2D].
func get_tab_icon(tab_idx: int) -> Texture2D:
	pass;

#desc Returns the index of the tab at local coordinates [param point]. Returns [code]-1[/code] if the point is outside the control boundaries or if there's no tab at the queried position.
func get_tab_idx_at_point(point: Vector2) -> int:
	pass;

#desc Returns tab title language code.
func get_tab_language(tab_idx: int) -> String:
	pass;

#desc Returns the number of hidden tabs offsetted to the left.
func get_tab_offset() -> int:
	pass;

#desc Returns tab [Rect2] with local position and size.
func get_tab_rect(tab_idx: int) -> Rect2:
	pass;

#desc Returns tab title text base writing direction.
func get_tab_text_direction(tab_idx: int) -> int:
	pass;

#desc Returns the title of the tab at index [param tab_idx].
func get_tab_title(tab_idx: int) -> String:
	pass;

#desc Returns [code]true[/code] if the tab at index [param tab_idx] is disabled.
func is_tab_disabled(tab_idx: int) -> bool:
	pass;

#desc Returns [code]true[/code] if the tab at index [param tab_idx] is hidden.
func is_tab_hidden(tab_idx: int) -> bool:
	pass;

#desc Moves a tab from [param from] to [param to].
func move_tab(from: int, to: int) -> void:
	pass;

#desc Removes the tab at index [param tab_idx].
func remove_tab(tab_idx: int) -> void:
	pass;

#desc Sets an [param icon] for the button of the tab at index [param tab_idx] (located to the right, before the close button), making it visible and clickable (See [signal tab_button_pressed]). Giving it a [code]null[/code] value will hide the button.
func set_tab_button_icon(tab_idx: int, icon: Texture2D) -> void:
	pass;

#desc If [param disabled] is [code]true[/code], disables the tab at index [param tab_idx], making it non-interactable.
func set_tab_disabled(tab_idx: int, disabled: bool) -> void:
	pass;

#desc If [param hidden] is [code]true[/code], hides the tab at index [param tab_idx], making it disappear from the tab area.
func set_tab_hidden(tab_idx: int, hidden: bool) -> void:
	pass;

#desc Sets an [param icon] for the tab at index [param tab_idx].
func set_tab_icon(tab_idx: int, icon: Texture2D) -> void:
	pass;

#desc Sets language code of tab title used for line-breaking and text shaping algorithms, if left empty current locale is used instead.
func set_tab_language(tab_idx: int, language: String) -> void:
	pass;

#desc Sets tab title base writing direction.
func set_tab_text_direction(tab_idx: int, direction: int) -> void:
	pass;

#desc Sets a [param title] for the tab at index [param tab_idx].
func set_tab_title(tab_idx: int, title: String) -> void:
	pass;


func get_clip_tabs() -> bool:
	return clip_tabs

func set_clip_tabs(value: bool) -> void:
	clip_tabs = value

func get_current_tab() -> int:
	return current_tab

func set_current_tab(value: int) -> void:
	current_tab = value

func get_drag_to_rearrange_enabled() -> bool:
	return drag_to_rearrange_enabled

func set_drag_to_rearrange_enabled(value: bool) -> void:
	drag_to_rearrange_enabled = value

func get_max_tab_width() -> int:
	return max_tab_width

func set_max_tab_width(value: int) -> void:
	max_tab_width = value

func get_scroll_to_selected() -> bool:
	return scroll_to_selected

func set_scroll_to_selected(value: bool) -> void:
	scroll_to_selected = value

func get_scrolling_enabled() -> bool:
	return scrolling_enabled

func set_scrolling_enabled(value: bool) -> void:
	scrolling_enabled = value

func get_select_with_rmb() -> bool:
	return select_with_rmb

func set_select_with_rmb(value: bool) -> void:
	select_with_rmb = value

func get_tab_alignment() -> int:
	return tab_alignment

func set_tab_alignment(value: int) -> void:
	tab_alignment = value

func get_tab_close_display_policy() -> int:
	return tab_close_display_policy

func set_tab_close_display_policy(value: int) -> void:
	tab_close_display_policy = value

func get_tab_count() -> int:
	return tab_count

func set_tab_count(value: int) -> void:
	tab_count = value

func get_tabs_rearrange_group() -> int:
	return tabs_rearrange_group

func set_tabs_rearrange_group(value: int) -> void:
	tabs_rearrange_group = value

