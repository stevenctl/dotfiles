extends Control
#brief Control to show a tree of items.
#desc This shows a tree of items that can be selected, expanded and collapsed. The tree can have multiple columns with custom controls like text editing, buttons and popups. It can be useful for structured displays and interactions.
#desc Trees are built via code, using [TreeItem] objects to create the structure. They have a single root but multiple roots can be simulated if a dummy hidden root is added.
#desc [codeblocks]
#desc [gdscript]
#desc func _ready():
#desc var tree = Tree.new()
#desc var root = tree.create_item()
#desc tree.hide_root = true
#desc var child1 = tree.create_item(root)
#desc var child2 = tree.create_item(root)
#desc var subchild1 = tree.create_item(child1)
#desc subchild1.set_text(0, "Subchild1")
#desc [/gdscript]
#desc [csharp]
#desc public override void _Ready()
#desc {
#desc var tree = new Tree();
#desc TreeItem root = tree.CreateItem();
#desc tree.HideRoot = true;
#desc TreeItem child1 = tree.CreateItem(root);
#desc TreeItem child2 = tree.CreateItem(root);
#desc TreeItem subchild1 = tree.CreateItem(child1);
#desc subchild1.SetText(0, "Subchild1");
#desc }
#desc [/csharp]
#desc [/codeblocks]
#desc To iterate over all the [TreeItem] objects in a [Tree] object, use [method TreeItem.get_next] and [method TreeItem.get_first_child] after getting the root through [method get_root]. You can use [method Object.free] on a [TreeItem] to remove it from the [Tree].
#desc [b]Incremental search:[/b] Like [ItemList] and [PopupMenu], [Tree] supports searching within the list while the control is focused. Press a key that matches the first letter of an item's name to select the first item starting with the given letter. After that point, there are two ways to perform incremental search: 1) Press the same key again before the timeout duration to select the next item starting with the same letter. 2) Press letter keys that match the rest of the word before the timeout duration to match to select the item in question directly. Both of these actions will be reset to the beginning of the list if the timeout duration has passed since the last keystroke was registered. You can adjust the timeout duration by changing [member ProjectSettings.gui/timers/incremental_search_max_interval_msec].
class_name Tree

#desc Emitted when a button on the tree was pressed (see [method TreeItem.add_button]).
signal button_clicked(item: TreeItem, column: int, id: int, mouse_button_index: int)
#desc Emitted when a cell is selected.
signal cell_selected
#desc Emitted when [method TreeItem.propagate_check] is called. Connect to this signal to process the items that are affected when [method TreeItem.propagate_check] is invoked. The order that the items affected will be processed is as follows: the item that invoked the method, children of that item, and finally parents of that item.
signal check_propagated_to_item(item: TreeItem, column: int)
#desc Emitted when a column's title is clicked with either [constant MOUSE_BUTTON_LEFT] or [constant MOUSE_BUTTON_RIGHT].
signal column_title_clicked(column: int, mouse_button_index: int)
#desc Emitted when an item with [constant TreeItem.CELL_MODE_CUSTOM] is clicked with a mouse button.
signal custom_item_clicked(mouse_button_index: int)
#desc Emitted when a cell with the [constant TreeItem.CELL_MODE_CUSTOM] is clicked to be edited.
signal custom_popup_edited(arrow_clicked: bool)
#desc Emitted when a mouse button is clicked in the empty space of the tree.
signal empty_clicked(position: Vector2, mouse_button_index: int)
#desc Emitted when an item is double-clicked, or selected with a [code]ui_accept[/code] input event (e.g. using [kbd]Enter[/kbd] or [kbd]Space[/kbd] on the keyboard).
signal item_activated
#desc Emitted when an item is collapsed by a click on the folding arrow.
signal item_collapsed(item: TreeItem)
#desc Emitted when an item is edited.
signal item_edited
#desc Emitted when an item's icon is double-clicked. For a signal that emits when any part of the item is double-clicked, see [signal item_activated].
signal item_icon_double_clicked
#desc Emitted when an item is selected with a mouse button.
signal item_mouse_selected(position: Vector2, mouse_button_index: int)
#desc Emitted when an item is selected.
signal item_selected
#desc Emitted instead of [code]item_selected[/code] if [code]select_mode[/code] is [constant SELECT_MULTI].
signal multi_selected(item: TreeItem, column: int, selected: bool)
#desc Emitted when a left mouse button click does not select any item.
signal nothing_selected
#desc Allows selection of a single cell at a time. From the perspective of items, only a single item is allowed to be selected. And there is only one column selected in the selected item.
#desc The focus cursor is always hidden in this mode, but it is positioned at the current selection, making the currently selected item the currently focused item.
#desc Allows selection of a single row at a time. From the perspective of items, only a single items is allowed to be selected. And all the columns are selected in the selected item.
#desc The focus cursor is always hidden in this mode, but it is positioned at the first column of the current selection, making the currently selected item the currently focused item.
#desc Allows selection of multiple cells at the same time. From the perspective of items, multiple items are allowed to be selected. And there can be multiple columns selected in each selected item.
#desc The focus cursor is visible in this mode, the item or column under the cursor is not necessarily selected.
#desc Disables all drop sections, but still allows to detect the "on item" drop section by [method get_drop_section_at_position].
#desc [b]Note:[/b] This is the default flag, it has no effect when combined with other flags.
#desc Enables the "on item" drop section. This drop section covers the entire item.
#desc When combined with [constant DROP_MODE_INBETWEEN], this drop section halves the height and stays centered vertically.
#desc Enables "above item" and "below item" drop sections. The "above item" drop section covers the top half of the item, and the "below item" drop section covers the bottom half.
#desc When combined with [constant DROP_MODE_ON_ITEM], these drop sections halves the height and stays on top / bottom accordingly.

#enum SelectMode
enum {
    SELECT_SINGLE = 0,
    SELECT_ROW = 1,
    SELECT_MULTI = 2,
}
#enum DropModeFlags
enum {
    DROP_MODE_DISABLED = 0,
    DROP_MODE_ON_ITEM = 1,
    DROP_MODE_INBETWEEN = 2,
}
#desc If [code]true[/code], the currently selected cell may be selected again.
var allow_reselect: bool:
	get = get_allow_reselect, set = set_allow_reselect

#desc If [code]true[/code], a right mouse button click can select items.
var allow_rmb_select: bool:
	get = get_allow_rmb_select, set = set_allow_rmb_select

var clip_contents: bool:
	get = is_clipping_contents, set = set_clip_contents

#desc If [code]true[/code], column titles are visible.
var column_titles_visible: bool:
	get = are_column_titles_visible, set = set_column_titles_visible

#desc The number of columns.
var columns: int:
	get = get_columns, set = set_columns

#desc The drop mode as an OR combination of flags. See [enum DropModeFlags] constants. Once dropping is done, reverts to [constant DROP_MODE_DISABLED]. Setting this during [method Control._can_drop_data] is recommended.
#desc This controls the drop sections, i.e. the decision and drawing of possible drop locations based on the mouse position.
var drop_mode_flags: int:
	get = get_drop_mode_flags, set = set_drop_mode_flags

#desc If [code]true[/code], recursive folding is enabled for this [Tree]. Holding down Shift while clicking the fold arrow collapses or uncollapses the [TreeItem] and all its descendants.
var enable_recursive_folding: bool:
	get = is_recursive_folding_enabled, set = set_enable_recursive_folding

var focus_mode: int:
	get = get_focus_mode, set = set_focus_mode

#desc If [code]true[/code], the folding arrow is hidden.
var hide_folding: bool:
	get = is_folding_hidden, set = set_hide_folding

#desc If [code]true[/code], the tree's root is hidden.
var hide_root: bool:
	get = is_root_hidden, set = set_hide_root

#desc If [code]true[/code], enables horizontal scrolling.
var scroll_horizontal_enabled: bool:
	get = is_h_scroll_enabled, set = set_h_scroll_enabled

#desc If [code]true[/code], enables vertical scrolling.
var scroll_vertical_enabled: bool:
	get = is_v_scroll_enabled, set = set_v_scroll_enabled

#desc Allows single or multiple selection. See the [enum SelectMode] constants.
var select_mode: int:
	get = get_select_mode, set = set_select_mode



#desc Clears the tree. This removes all items.
func clear() -> void:
	pass;

#desc Creates an item in the tree and adds it as a child of [param parent], which can be either a valid [TreeItem] or [code]null[/code].
#desc If [param parent] is [code]null[/code], the root item will be the parent, or the new item will be the root itself if the tree is empty.
#desc The new item will be the [param index]-th child of parent, or it will be the last child if there are not enough siblings.
func create_item(parent: TreeItem = null, index: int = -1) -> TreeItem:
	pass;

#desc Deselects all tree items (rows and columns). In [constant SELECT_MULTI] mode also removes selection cursor.
func deselect_all() -> void:
	pass;

#desc Edits the selected tree item as if it was clicked. The item must be set editable with [method TreeItem.set_editable]. Returns [code]true[/code] if the item could be edited. Fails if no item is selected.
func edit_selected() -> bool:
	pass;

#desc Makes the currently focused cell visible.
#desc This will scroll the tree if necessary. In [constant SELECT_ROW] mode, this will not do horizontal scrolling, as all the cells in the selected row is focused logically.
#desc [b]Note:[/b] Despite the name of this method, the focus cursor itself is only visible in [constant SELECT_MULTI] mode.
func ensure_cursor_is_visible() -> void:
	pass;

#desc Returns the button ID at [param position], or -1 if no button is there.
func get_button_id_at_position(position: Vector2) -> int:
	pass;

#desc Returns the column index at [param position], or -1 if no item is there.
func get_column_at_position(position: Vector2) -> int:
	pass;

#desc Returns the expand ratio assigned to the column.
func get_column_expand_ratio(column: int) -> int:
	pass;

#desc Returns the column's title.
func get_column_title(column: int) -> String:
	pass;

#desc Returns column title base writing direction.
func get_column_title_direction(column: int) -> int:
	pass;

#desc Returns column title language code.
func get_column_title_language(column: int) -> String:
	pass;

#desc Returns the column's width in pixels.
func get_column_width(column: int) -> int:
	pass;

#desc Returns the rectangle for custom popups. Helper to create custom cell controls that display a popup. See [method TreeItem.set_cell_mode].
func get_custom_popup_rect() -> Rect2:
	pass;

#desc Returns the drop section at [param position], or -100 if no item is there.
#desc Values -1, 0, or 1 will be returned for the "above item", "on item", and "below item" drop sections, respectively. See [enum DropModeFlags] for a description of each drop section.
#desc To get the item which the returned drop section is relative to, use [method get_item_at_position].
func get_drop_section_at_position(position: Vector2) -> int:
	pass;

#desc Returns the currently edited item. Can be used with [signal item_edited] to get the item that was modified.
#desc [codeblocks]
#desc [gdscript]
#desc func _ready():
#desc $Tree.item_edited.connect(on_Tree_item_edited)
#desc 
#desc func on_Tree_item_edited():
#desc print($Tree.get_edited()) # This item just got edited (e.g. checked).
#desc [/gdscript]
#desc [csharp]
#desc public override void _Ready()
#desc {
#desc GetNode<Tree>("Tree").ItemEdited += OnTreeItemEdited;
#desc }
#desc 
#desc public void OnTreeItemEdited()
#desc {
#desc GD.Print(GetNode<Tree>("Tree").GetEdited()); // This item just got edited (e.g. checked).
#desc }
#desc [/csharp]
#desc [/codeblocks]
func get_edited() -> TreeItem:
	pass;

#desc Returns the column for the currently edited item.
func get_edited_column() -> int:
	pass;

#desc Returns the rectangle area for the specified [TreeItem]. If [param column] is specified, only get the position and size of that column, otherwise get the rectangle containing all columns. If a button index is specified, the rectangle of that button will be returned.
func get_item_area_rect(item: TreeItem, column: int = -1, button_index: int = -1) -> Rect2:
	pass;

#desc Returns the tree item at the specified position (relative to the tree origin position).
func get_item_at_position(position: Vector2) -> TreeItem:
	pass;

#desc Returns the next selected [TreeItem] after the given one, or [code]null[/code] if the end is reached.
#desc If [param from] is [code]null[/code], this returns the first selected item.
func get_next_selected(from: TreeItem) -> TreeItem:
	pass;

#desc Returns the last pressed button's index.
func get_pressed_button() -> int:
	pass;

#desc Returns the tree's root item, or [code]null[/code] if the tree is empty.
func get_root() -> TreeItem:
	pass;

#desc Returns the current scrolling position.
func get_scroll() -> Vector2:
	pass;

#desc Returns the currently focused item, or [code]null[/code] if no item is focused.
#desc In [constant SELECT_ROW] and [constant SELECT_SINGLE] modes, the focused item is same as the selected item. In [constant SELECT_MULTI] mode, the focused item is the item under the focus cursor, not necessarily selected.
#desc To get the currently selected item(s), use [method get_next_selected].
func get_selected() -> TreeItem:
	pass;

#desc Returns the currently focused column, or -1 if no column is focused.
#desc In [constant SELECT_SINGLE] mode, the focused column is the selected column. In [constant SELECT_ROW] mode, the focused column is always 0 if any item is selected. In [constant SELECT_MULTI] mode, the focused column is the column under the focus cursor, and there are not necessarily any column selected.
#desc To tell whether a column of an item is selected, use [method TreeItem.is_selected].
func get_selected_column() -> int:
	pass;

#desc Returns [code]true[/code] if the column has enabled clipping (see [method set_column_clip_content]).
func is_column_clipping_content(column: int) -> bool:
	pass;

#desc Returns [code]true[/code] if the column has enabled expanding (see [method set_column_expand]).
func is_column_expanding(column: int) -> bool:
	pass;

#desc Causes the [Tree] to jump to the specified [TreeItem].
func scroll_to_item(item: TreeItem, center_on_item: bool = false) -> void:
	pass;

#desc Allows to enable clipping for column's content, making the content size ignored.
func set_column_clip_content(column: int, enable: bool) -> void:
	pass;

#desc Overrides the calculated minimum width of a column. It can be set to [code]0[/code] to restore the default behavior. Columns that have the "Expand" flag will use their "min_width" in a similar fashion to [member Control.size_flags_stretch_ratio].
func set_column_custom_minimum_width(column: int, min_width: int) -> void:
	pass;

#desc If [code]true[/code], the column will have the "Expand" flag of [Control]. Columns that have the "Expand" flag will use their expand ratio in a similar fashion to [member Control.size_flags_stretch_ratio] (see [method set_column_expand_ratio]).
func set_column_expand(column: int, expand: bool) -> void:
	pass;

#desc Sets the relative expand ratio for a column. See [method set_column_expand].
func set_column_expand_ratio(column: int, ratio: int) -> void:
	pass;

#desc Sets the title of a column.
func set_column_title(column: int, title: String) -> void:
	pass;

#desc Sets column title base writing direction.
func set_column_title_direction(column: int, direction: int) -> void:
	pass;

#desc Sets language code of column title used for line-breaking and text shaping algorithms, if left empty current locale is used instead.
func set_column_title_language(column: int, language: String) -> void:
	pass;

#desc Selects the specified [TreeItem] and column.
func set_selected(item: TreeItem, column: int) -> void:
	pass;


func get_allow_reselect() -> bool:
	return allow_reselect

func set_allow_reselect(value: bool) -> void:
	allow_reselect = value

func get_allow_rmb_select() -> bool:
	return allow_rmb_select

func set_allow_rmb_select(value: bool) -> void:
	allow_rmb_select = value

func is_clipping_contents() -> bool:
	return clip_contents

func set_clip_contents(value: bool) -> void:
	clip_contents = value

func are_column_titles_visible() -> bool:
	return column_titles_visible

func set_column_titles_visible(value: bool) -> void:
	column_titles_visible = value

func get_columns() -> int:
	return columns

func set_columns(value: int) -> void:
	columns = value

func get_drop_mode_flags() -> int:
	return drop_mode_flags

func set_drop_mode_flags(value: int) -> void:
	drop_mode_flags = value

func is_recursive_folding_enabled() -> bool:
	return enable_recursive_folding

func set_enable_recursive_folding(value: bool) -> void:
	enable_recursive_folding = value

func get_focus_mode() -> int:
	return focus_mode

func set_focus_mode(value: int) -> void:
	focus_mode = value

func is_folding_hidden() -> bool:
	return hide_folding

func set_hide_folding(value: bool) -> void:
	hide_folding = value

func is_root_hidden() -> bool:
	return hide_root

func set_hide_root(value: bool) -> void:
	hide_root = value

func is_h_scroll_enabled() -> bool:
	return scroll_horizontal_enabled

func set_h_scroll_enabled(value: bool) -> void:
	scroll_horizontal_enabled = value

func is_v_scroll_enabled() -> bool:
	return scroll_vertical_enabled

func set_v_scroll_enabled(value: bool) -> void:
	scroll_vertical_enabled = value

func get_select_mode() -> int:
	return select_mode

func set_select_mode(value: int) -> void:
	select_mode = value

