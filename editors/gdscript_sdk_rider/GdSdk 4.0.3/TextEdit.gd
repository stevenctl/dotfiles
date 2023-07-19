extends Control
#brief Multiline text editing control.
#desc TextEdit is meant for editing large, multiline text. It also has facilities for editing code, such as syntax highlighting support and multiple levels of undo/redo.
#desc [b]Note:[/b] Most viewport, caret and edit methods contain a [code]caret_index[/code] argument for [member caret_multiple] support. The argument should be one of the following: [code]-1[/code] for all carets, [code]0[/code] for the main caret, or greater than [code]0[/code] for secondary carets.
#desc [b]Note:[/b] When holding down [kbd]Alt[/kbd], the vertical scroll wheel will scroll 5 times as fast as it would normally do. This also works in the Godot script editor.
class_name TextEdit

#desc Emitted when the caret changes position.
signal caret_changed
#desc Emitted when a gutter is added.
signal gutter_added
#desc Emitted when a gutter is clicked.
signal gutter_clicked(line: int, gutter: int)
#desc Emitted when a gutter is removed.
signal gutter_removed
#desc Emitted immediately when the text changes.
#desc When text is added [param from_line] will be less then [param to_line]. On a remove [param to_line] will be less then [param from_line].
signal lines_edited_from(from_line: int, to_line: int)
#desc Emitted when the text changes.
signal text_changed
#desc Emitted when [method clear] is called or [member text] is set.
signal text_set
#desc Cuts (copies and clears) the selected text.
#desc Copies the selected text.
#desc Pastes the clipboard text over the selected text (or at the cursor's position).
#desc Erases the whole [TextEdit] text.
#desc Selects the whole [TextEdit] text.
#desc Undoes the previous action.
#desc Redoes the previous action.
#desc ID of "Text Writing Direction" submenu.
#desc Sets text direction to inherited.
#desc Sets text direction to automatic.
#desc Sets text direction to left-to-right.
#desc Sets text direction to right-to-left.
#desc Toggles control character display.
#desc ID of "Insert Control Character" submenu.
#desc Inserts left-to-right mark (LRM) character.
#desc Inserts right-to-left mark (RLM) character.
#desc Inserts start of left-to-right embedding (LRE) character.
#desc Inserts start of right-to-left embedding (RLE) character.
#desc Inserts start of left-to-right override (LRO) character.
#desc Inserts start of right-to-left override (RLO) character.
#desc Inserts pop direction formatting (PDF) character.
#desc Inserts Arabic letter mark (ALM) character.
#desc Inserts left-to-right isolate (LRI) character.
#desc Inserts right-to-left isolate (RLI) character.
#desc Inserts first strong isolate (FSI) character.
#desc Inserts pop direction isolate (PDI) character.
#desc Inserts zero width joiner (ZWJ) character.
#desc Inserts zero width non-joiner (ZWNJ) character.
#desc Inserts word joiner (WJ) character.
#desc Inserts soft hyphen (SHY) character.
#desc Represents the size of the [enum MenuItems] enum.
#desc No current action.
#desc A typing action.
#desc A backwards delete action.
#desc A forward delete action.
#desc Match case when searching.
#desc Match whole words when searching.
#desc Search from end to beginning.
#desc Vertical line caret.
#desc Block caret.
#desc Not selecting.
#desc Select as if [code]shift[/code] is pressed.
#desc Select single characters as if the user single clicked.
#desc Select whole words as if the user double clicked.
#desc Select whole lines as if the user tripped clicked.
#desc Line wrapping is disabled.
#desc Line wrapping occurs at the control boundary, beyond what would normally be visible.
#desc Draw a string.
#desc Draw an icon.
#desc Custom draw.

#enum MenuItems
enum {
    MENU_CUT = 0,
    MENU_COPY = 1,
    MENU_PASTE = 2,
    MENU_CLEAR = 3,
    MENU_SELECT_ALL = 4,
    MENU_UNDO = 5,
    MENU_REDO = 6,
    MENU_SUBMENU_TEXT_DIR = 7,
    MENU_DIR_INHERITED = 8,
    MENU_DIR_AUTO = 9,
    MENU_DIR_LTR = 10,
    MENU_DIR_RTL = 11,
    MENU_DISPLAY_UCC = 12,
    MENU_SUBMENU_INSERT_UCC = 13,
    MENU_INSERT_LRM = 14,
    MENU_INSERT_RLM = 15,
    MENU_INSERT_LRE = 16,
    MENU_INSERT_RLE = 17,
    MENU_INSERT_LRO = 18,
    MENU_INSERT_RLO = 19,
    MENU_INSERT_PDF = 20,
    MENU_INSERT_ALM = 21,
    MENU_INSERT_LRI = 22,
    MENU_INSERT_RLI = 23,
    MENU_INSERT_FSI = 24,
    MENU_INSERT_PDI = 25,
    MENU_INSERT_ZWJ = 26,
    MENU_INSERT_ZWNJ = 27,
    MENU_INSERT_WJ = 28,
    MENU_INSERT_SHY = 29,
    MENU_MAX = 30,
}
#enum EditAction
enum {
    ACTION_NONE = 0,
    ACTION_TYPING = 1,
    ACTION_BACKSPACE = 2,
    ACTION_DELETE = 3,
}
#enum SearchFlags
enum {
    SEARCH_MATCH_CASE = 1,
    SEARCH_WHOLE_WORDS = 2,
    SEARCH_BACKWARDS = 4,
}
#enum CaretType
enum {
    CARET_TYPE_LINE = 0,
    CARET_TYPE_BLOCK = 1,
}
#enum SelectionMode
enum {
    SELECTION_MODE_NONE = 0,
    SELECTION_MODE_SHIFT = 1,
    SELECTION_MODE_POINTER = 2,
    SELECTION_MODE_WORD = 3,
    SELECTION_MODE_LINE = 4,
}
#enum LineWrappingMode
enum {
    LINE_WRAPPING_NONE = 0,
    LINE_WRAPPING_BOUNDARY = 1,
}
#enum GutterType
enum {
    GUTTER_TYPE_STRING = 0,
    GUTTER_TYPE_ICON = 1,
    GUTTER_TYPE_CUSTOM = 2,
}
#desc Sets if the caret should blink.
var caret_blink: bool:
	get = is_caret_blink_enabled, set = set_caret_blink_enabled

#desc Duration (in seconds) of a caret's blinking cycle.
var caret_blink_interval: float:
	get = get_caret_blink_interval, set = set_caret_blink_interval

#desc Allow moving caret, selecting and removing the individual composite character components.
#desc [b]Note:[/b] [kbd]Backspace[/kbd] is always removing individual composite character components.
var caret_mid_grapheme: bool:
	get = is_caret_mid_grapheme_enabled, set = set_caret_mid_grapheme_enabled

#desc If [code]true[/code], a right-click moves the caret at the mouse position before displaying the context menu.
#desc If [code]false[/code], the context menu disregards mouse location.
var caret_move_on_right_click: bool:
	get = is_move_caret_on_right_click_enabled, set = set_move_caret_on_right_click_enabled

#desc Sets if multiple carets are allowed.
var caret_multiple: bool:
	get = is_multiple_carets_enabled, set = set_multiple_carets_enabled

#desc Set the type of caret to draw.
var caret_type: int:
	get = get_caret_type, set = set_caret_type

#desc If [code]true[/code], a right-click displays the context menu.
var context_menu_enabled: bool:
	get = is_context_menu_enabled, set = set_context_menu_enabled

#desc If [code]true[/code], the selected text will be deselected when focus is lost.
var deselect_on_focus_loss_enabled: bool:
	get = is_deselect_on_focus_loss_enabled, set = set_deselect_on_focus_loss_enabled

#desc If [code]true[/code], allow drag and drop of selected text.
var drag_and_drop_selection_enabled: bool:
	get = is_drag_and_drop_selection_enabled, set = set_drag_and_drop_selection_enabled

#desc If [code]true[/code], control characters are displayed.
var draw_control_chars: bool:
	get = get_draw_control_chars, set = set_draw_control_chars

#desc If [code]true[/code], the "space" character will have a visible representation.
var draw_spaces: bool:
	get = is_drawing_spaces, set = set_draw_spaces

#desc If [code]true[/code], the "tab" character will have a visible representation.
var draw_tabs: bool:
	get = is_drawing_tabs, set = set_draw_tabs

#desc If [code]false[/code], existing text cannot be modified and new text cannot be added.
var editable: bool:
	get = is_editable, set = set_editable

var focus_mode: int:
	get = get_focus_mode, set = set_focus_mode

#desc If [code]true[/code], all occurrences of the selected text will be highlighted.
var highlight_all_occurrences: bool:
	get = is_highlight_all_occurrences_enabled, set = set_highlight_all_occurrences

#desc If [code]true[/code], the line containing the cursor is highlighted.
var highlight_current_line: bool:
	get = is_highlight_current_line_enabled, set = set_highlight_current_line

#desc Language code used for line-breaking and text shaping algorithms, if left empty current locale is used instead.
var language: String:
	get = get_language, set = set_language

#desc If [code]false[/code], using middle mouse button to paste clipboard will be disabled.
#desc [b]Note:[/b] This method is only implemented on Linux.
var middle_mouse_paste_enabled: bool:
	get = is_middle_mouse_paste_enabled, set = set_middle_mouse_paste_enabled

#desc If [code]true[/code], a minimap is shown, providing an outline of your source code.
var minimap_draw: bool:
	get = is_drawing_minimap, set = set_draw_minimap

#desc The width, in pixels, of the minimap.
var minimap_width: int:
	get = get_minimap_width, set = set_minimap_width

var mouse_default_cursor_shape: int:
	get = get_default_cursor_shape, set = set_default_cursor_shape

#desc Text shown when the [TextEdit] is empty. It is [b]not[/b] the [TextEdit]'s default value (see [member text]).
var placeholder_text: String:
	get = get_placeholder, set = set_placeholder

#desc If [code]true[/code], [TextEdit] will disable vertical scroll and fit minimum height to the number of visible lines.
var scroll_fit_content_height: bool:
	get = is_fit_content_height_enabled, set = set_fit_content_height_enabled

#desc If there is a horizontal scrollbar, this determines the current horizontal scroll value in pixels.
var scroll_horizontal: int:
	get = get_h_scroll, set = set_h_scroll

#desc Allow scrolling past the last line into "virtual" space.
var scroll_past_end_of_file: bool:
	get = is_scroll_past_end_of_file_enabled, set = set_scroll_past_end_of_file_enabled

#desc Scroll smoothly over the text rather then jumping to the next location.
var scroll_smooth: bool:
	get = is_smooth_scroll_enabled, set = set_smooth_scroll_enabled

#desc Sets the scroll speed with the minimap or when [member scroll_smooth] is enabled.
var scroll_v_scroll_speed: float:
	get = get_v_scroll_speed, set = set_v_scroll_speed

#desc If there is a vertical scrollbar, this determines the current vertical scroll value in line numbers, starting at 0 for the top line.
var scroll_vertical: float:
	get = get_v_scroll, set = set_v_scroll

#desc If [code]true[/code], text can be selected.
#desc If [code]false[/code], text can not be selected by the user or by the [method select] or [method select_all] methods.
var selecting_enabled: bool:
	get = is_selecting_enabled, set = set_selecting_enabled

#desc If [code]true[/code], shortcut keys for context menu items are enabled, even if the context menu is disabled.
var shortcut_keys_enabled: bool:
	get = is_shortcut_keys_enabled, set = set_shortcut_keys_enabled

#desc Set BiDi algorithm override for the structured text.
var structured_text_bidi_override: int:
	get = get_structured_text_bidi_override, set = set_structured_text_bidi_override

#desc Set additional options for BiDi override.
var structured_text_bidi_override_options: Array:
	get = get_structured_text_bidi_override_options, set = set_structured_text_bidi_override_options

#desc Sets the [SyntaxHighlighter] to use.
var syntax_highlighter: SyntaxHighlighter:
	get = get_syntax_highlighter, set = set_syntax_highlighter

#desc String value of the [TextEdit].
var text: String:
	get = get_text, set = set_text

#desc Base text writing direction.
var text_direction: int:
	get = get_text_direction, set = set_text_direction

#desc If [code]true[/code], the native virtual keyboard is shown when focused on platforms that support it.
var virtual_keyboard_enabled: bool:
	get = is_virtual_keyboard_enabled, set = set_virtual_keyboard_enabled

#desc Sets the line wrapping mode to use.
var wrap_mode: int:
	get = get_line_wrapping_mode, set = set_line_wrapping_mode



#desc Override this method to define what happens when the user presses the backspace key.
func _backspace(caret_index: int) -> void:
	pass;

#desc Override this method to define what happens when the user performs a copy operation.
func _copy(caret_index: int) -> void:
	pass;

#desc Override this method to define what happens when the user performs a cut operation.
func _cut(caret_index: int) -> void:
	pass;

#desc Override this method to define what happens when the user types in the provided key [param unicode_char].
func _handle_unicode_input(unicode_char: int, caret_index: int) -> void:
	pass;

#desc Override this method to define what happens when the user performs a paste operation.
func _paste(caret_index: int) -> void:
	pass;

#desc Override this method to define what happens when the user performs a paste operation with middle mouse button.
#desc [b]Note:[/b] This method is only implemented on Linux.
func _paste_primary_clipboard(caret_index: int) -> void:
	pass;

#desc Adds a new caret at the given location. Returns the index of the new caret, or [code]-1[/code] if the location is invalid.
func add_caret(line: int, col: int) -> int:
	pass;

#desc Adds an additional caret above or below every caret. If [param below] is true the new caret will be added below and above otherwise.
func add_caret_at_carets(below: bool) -> void:
	pass;

#desc Register a new gutter to this [TextEdit]. Use [param at] to have a specific gutter order. A value of [code]-1[/code] appends the gutter to the right.
func add_gutter(at: int = -1) -> void:
	pass;

#desc Adds a selection and a caret for the next occurrence of the current selection. If there is no active selection, selects word under caret.
func add_selection_for_next_occurrence() -> void:
	pass;

#desc Reposition the carets affected by the edit. This assumes edits are applied in edit order, see [method get_caret_index_edit_order].
func adjust_carets_after_edit(caret: int, from_line: int, from_col: int, to_line: int, to_col: int) -> void:
	pass;

#desc Adjust the viewport so the caret is visible.
func adjust_viewport_to_caret(caret_index: int = 0) -> void:
	pass;

#desc Called when the user presses the backspace key. Can be overridden with [method _backspace].
func backspace(caret_index: int = -1) -> void:
	pass;

#desc Starts a multipart edit. All edits will be treated as one action until [method end_complex_operation] is called.
func begin_complex_operation() -> void:
	pass;

#desc Centers the viewport on the line the editing caret is at. This also resets the [member scroll_horizontal] value to [code]0[/code].
func center_viewport_to_caret(caret_index: int = 0) -> void:
	pass;

#desc Performs a full reset of [TextEdit], including undo history.
func clear() -> void:
	pass;

#desc Clears the undo history.
func clear_undo_history() -> void:
	pass;

#desc Copies the current text selection. Can be overridden with [method _copy].
func copy(caret_index: int = -1) -> void:
	pass;

#desc Cut's the current selection. Can be overridden with [method _cut].
func cut(caret_index: int = -1) -> void:
	pass;

#desc Deletes the selected text.
func delete_selection(caret_index: int = -1) -> void:
	pass;

#desc Deselects the current selection.
func deselect(caret_index: int = -1) -> void:
	pass;

#desc Marks the end of steps in the current action started with [method start_action].
func end_action() -> void:
	pass;

#desc Ends a multipart edit, started with [method begin_complex_operation]. If called outside a complex operation, the current operation is pushed onto the undo/redo stack.
func end_complex_operation() -> void:
	pass;

#desc Returns the column the editing caret is at.
func get_caret_column(caret_index: int = 0) -> int:
	pass;

#desc Returns the number of carets in this [TextEdit].
func get_caret_count() -> int:
	pass;

#desc Returns the caret pixel draw position.
func get_caret_draw_pos(caret_index: int = 0) -> Vector2:
	pass;

#desc Returns a list of caret indexes in their edit order, this done from bottom to top. Edit order refers to the way actions such as [method insert_text_at_caret] are applied.
func get_caret_index_edit_order() -> PackedInt32Array:
	pass;

#desc Returns the line the editing caret is on.
func get_caret_line(caret_index: int = 0) -> int:
	pass;

#desc Returns the wrap index the editing caret is on.
func get_caret_wrap_index(caret_index: int = 0) -> int:
	pass;

#desc Returns the first column containing a non-whitespace character.
func get_first_non_whitespace_column(line: int) -> int:
	pass;

#desc Returns the first visible line.
func get_first_visible_line() -> int:
	pass;

#desc Returns the number of gutters registered.
func get_gutter_count() -> int:
	pass;

#desc Returns the name of the gutter at the given index.
func get_gutter_name(gutter: int) -> String:
	pass;

#desc Returns the type of the gutter at the given index.
func get_gutter_type(gutter: int) -> int:
	pass;

#desc Returns the width of the gutter at the given index.
func get_gutter_width(gutter: int) -> int:
	pass;

#desc Returns the [HScrollBar] used by [TextEdit].
func get_h_scroll_bar() -> HScrollBar:
	pass;

#desc Returns the number of spaces and [code]tab * tab_size[/code] before the first char.
func get_indent_level(line: int) -> int:
	pass;

#desc Returns the last visible line. Use [method get_last_full_visible_line_wrap_index] for the wrap index.
func get_last_full_visible_line() -> int:
	pass;

#desc Returns the last visible wrap index of the last visible line.
func get_last_full_visible_line_wrap_index() -> int:
	pass;

#desc Returns the last unhidden line in the entire [TextEdit].
func get_last_unhidden_line() -> int:
	pass;

#desc Returns the text of a specific line.
func get_line(line: int) -> String:
	pass;

#desc Returns the current background color of the line. [code]Color(0, 0, 0, 0)[/code] is returned if no color is set.
func get_line_background_color(line: int) -> Color:
	pass;

#desc Returns the line and column at the given position. In the returned vector, [code]x[/code] is the column, [code]y[/code] is the line. If [param allow_out_of_bounds] is [code]false[/code] and the position is not over the text, both vector values will be set to [code]-1[/code].
func get_line_column_at_pos(position: Vector2i, allow_out_of_bounds: bool = true) -> Vector2i:
	pass;

#desc Returns the number of lines in the text.
func get_line_count() -> int:
	pass;

#desc Returns the icon currently in [param gutter] at [param line].
func get_line_gutter_icon(line: int, gutter: int) -> Texture2D:
	pass;

#desc Returns the color currently in [param gutter] at [param line].
func get_line_gutter_item_color(line: int, gutter: int) -> Color:
	pass;

#desc Returns the metadata currently in [param gutter] at [param line].
func get_line_gutter_metadata(line: int, gutter: int) -> Variant:
	pass;

#desc Returns the text currently in [param gutter] at [param line].
func get_line_gutter_text(line: int, gutter: int) -> String:
	pass;

#desc Returns the height of a largest line.
func get_line_height() -> int:
	pass;

#desc Returns the width in pixels of the [param wrap_index] on [param line].
func get_line_width(line: int, wrap_index: int = -1) -> int:
	pass;

#desc Returns the number of times the given line is wrapped.
func get_line_wrap_count(line: int) -> int:
	pass;

#desc Returns the wrap index of the given line column.
func get_line_wrap_index_at_column(line: int, column: int) -> int:
	pass;

#desc Returns an array of [String]s representing each wrapped index.
func get_line_wrapped_text(line: int) -> PackedStringArray:
	pass;

#desc Returns the local mouse position adjusted for the text direction.
func get_local_mouse_pos() -> Vector2:
	pass;

#desc Returns the [PopupMenu] of this [TextEdit]. By default, this menu is displayed when right-clicking on the [TextEdit].
#desc You can add custom menu items or remove standard ones. Make sure your IDs don't conflict with the standard ones (see [enum MenuItems]). For example:
#desc [codeblocks]
#desc [gdscript]
#desc func _ready():
#desc var menu = get_menu()
#desc # Remove all items after "Redo".
#desc menu.item_count = menu.get_item_index(MENU_REDO) + 1
#desc # Add custom items.
#desc menu.add_separator()
#desc menu.add_item("Insert Date", MENU_MAX + 1)
#desc # Connect callback.
#desc menu.id_pressed.connect(_on_item_pressed)
#desc 
#desc func _on_item_pressed(id):
#desc if id == MENU_MAX + 1:
#desc insert_text_at_caret(Time.get_date_string_from_system())
#desc [/gdscript]
#desc [csharp]
#desc public override void _Ready()
#desc {
#desc var menu = GetMenu();
#desc // Remove all items after "Redo".
#desc menu.ItemCount = menu.GetItemIndex(TextEdit.MenuItems.Redo) + 1;
#desc // Add custom items.
#desc menu.AddSeparator();
#desc menu.AddItem("Insert Date", TextEdit.MenuItems.Max + 1);
#desc // Add event handler.
#desc menu.IdPressed += OnItemPressed;
#desc }
#desc 
#desc public void OnItemPressed(int id)
#desc {
#desc if (id == TextEdit.MenuItems.Max + 1)
#desc {
#desc InsertTextAtCaret(Time.GetDateStringFromSystem());
#desc }
#desc }
#desc [/csharp]
#desc [/codeblocks]
#desc [b]Warning:[/b] This is a required internal node, removing and freeing it may cause a crash. If you wish to hide it or any of its children, use their [member Window.visible] property.
func get_menu() -> PopupMenu:
	pass;

#desc Returns the equivalent minimap line at [param position].
func get_minimap_line_at_pos(position: Vector2i) -> int:
	pass;

#desc Returns the number of lines that may be drawn on the minimap.
func get_minimap_visible_lines() -> int:
	pass;

#desc Similar to [method get_next_visible_line_offset_from], but takes into account the line wrap indexes. In the returned vector, [code]x[/code] is the line, [code]y[/code] is the wrap index.
func get_next_visible_line_index_offset_from(line: int, wrap_index: int, visible_amount: int) -> Vector2i:
	pass;

#desc Returns the count to the next visible line from [param line] to [code]line + visible_amount[/code]. Can also count backwards. For example if a [TextEdit] has 5 lines with lines 2 and 3 hidden, calling this with [code]line = 1, visible_amount = 1[/code] would return 3.
func get_next_visible_line_offset_from(line: int, visible_amount: int) -> int:
	pass;

#desc Returns the local position for the given [param line] and [param column]. If [code]x[/code] or [code]y[/code] of the returned vector equal [code]-1[/code], the position is outside of the viewable area of the control.
#desc [b]Note:[/b] The Y position corresponds to the bottom side of the line. Use [method get_rect_at_line_column] to get the top side position.
func get_pos_at_line_column(line: int, column: int) -> Vector2i:
	pass;

#desc Returns the local position and size for the grapheme at the given [param line] and [param column]. If [code]x[/code] or [code]y[/code] position of the returned rect equal [code]-1[/code], the position is outside of the viewable area of the control.
#desc [b]Note:[/b] The Y position of the returned rect corresponds to the top side of the line, unlike [method get_pos_at_line_column] which returns the bottom side.
func get_rect_at_line_column(line: int, column: int) -> Rect2i:
	pass;

#desc Returns the last tagged saved version from [method tag_saved_version].
func get_saved_version() -> int:
	pass;

#desc Returns the scroll position for [param wrap_index] of [param line].
func get_scroll_pos_for_line(line: int, wrap_index: int = 0) -> float:
	pass;

#desc Returns the text inside the selection.
func get_selected_text(caret_index: int = -1) -> String:
	pass;

#desc Returns the original start column of the selection.
func get_selection_column(caret_index: int = 0) -> int:
	pass;

#desc Returns the selection begin column.
func get_selection_from_column(caret_index: int = 0) -> int:
	pass;

#desc Returns the selection begin line.
func get_selection_from_line(caret_index: int = 0) -> int:
	pass;

#desc Returns the original start line of the selection.
func get_selection_line(caret_index: int = 0) -> int:
	pass;

#desc Returns the current selection mode.
func get_selection_mode() -> int:
	pass;

#desc Returns the selection end column.
func get_selection_to_column(caret_index: int = 0) -> int:
	pass;

#desc Returns the selection end line.
func get_selection_to_line(caret_index: int = 0) -> int:
	pass;

#desc Returns the [TextEdit]'s' tab size.
func get_tab_size() -> int:
	pass;

#desc Returns the total width of all gutters and internal padding.
func get_total_gutter_width() -> int:
	pass;

#desc Returns the number of lines that may be drawn.
func get_total_visible_line_count() -> int:
	pass;

#desc Returns the [VScrollBar] of the [TextEdit].
func get_v_scroll_bar() -> VScrollBar:
	pass;

#desc Returns the current version of the [TextEdit]. The version is a count of recorded operations by the undo/redo history.
func get_version() -> int:
	pass;

#desc Returns the number of visible lines, including wrapped text.
func get_visible_line_count() -> int:
	pass;

#desc Returns the total number of visible + wrapped lines between the two lines.
func get_visible_line_count_in_range(from_line: int, to_line: int) -> int:
	pass;

#desc Returns the word at [param position].
func get_word_at_pos(position: Vector2) -> String:
	pass;

#desc Returns a [String] text with the word under the caret's location.
func get_word_under_caret(caret_index: int = -1) -> String:
	pass;

#desc Returns if the user has IME text.
func has_ime_text() -> bool:
	pass;

#desc Returns [code]true[/code] if a "redo" action is available.
func has_redo() -> bool:
	pass;

#desc Returns [code]true[/code] if the user has selected text.
func has_selection(caret_index: int = -1) -> bool:
	pass;

#desc Returns [code]true[/code] if an "undo" action is available.
func has_undo() -> bool:
	pass;

#desc Inserts a new line with [param text] at [param line].
func insert_line_at(line: int, text: String) -> void:
	pass;

#desc Insert the specified text at the caret position.
func insert_text_at_caret(text: String, caret_index: int = -1) -> void:
	pass;

#desc Returns [code]true[/code] if the caret is visible on the screen.
func is_caret_visible(caret_index: int = 0) -> bool:
	pass;

#desc Returns [code]true[/code] if the user is dragging their mouse for scrolling or selecting.
func is_dragging_cursor() -> bool:
	pass;

#desc Returns whether the gutter is clickable.
func is_gutter_clickable(gutter: int) -> bool:
	pass;

#desc Returns whether the gutter is currently drawn.
func is_gutter_drawn(gutter: int) -> bool:
	pass;

#desc Returns whether the gutter is overwritable.
func is_gutter_overwritable(gutter: int) -> bool:
	pass;

#desc Returns whether the gutter on the given line is clickable.
func is_line_gutter_clickable(line: int, gutter: int) -> bool:
	pass;

#desc Returns if the given line is wrapped.
func is_line_wrapped(line: int) -> bool:
	pass;

#desc Returns whether the menu is visible. Use this instead of [code]get_menu().visible[/code] to improve performance (so the creation of the menu is avoided).
func is_menu_visible() -> bool:
	pass;

#desc Returns whether the mouse is over selection. If [param edges] is [code]true[/code], the edges are considered part of the selection.
func is_mouse_over_selection(edges: bool, caret_index: int = -1) -> bool:
	pass;

#desc Returns whether the user is in overtype mode.
func is_overtype_mode_enabled() -> bool:
	pass;

#desc Executes a given action as defined in the [enum MenuItems] enum.
func menu_option(option: int) -> void:
	pass;

#desc Merge the gutters from [param from_line] into [param to_line]. Only overwritable gutters will be copied.
func merge_gutters(from_line: int, to_line: int) -> void:
	pass;

#desc Merges any overlapping carets. Will favor the newest caret, or the caret with a selection.
#desc [b]Note:[/b] This is not called when a caret changes position but after certain actions, so it is possible to get into a state where carets overlap.
func merge_overlapping_carets() -> void:
	pass;

#desc Paste at the current location. Can be overridden with [method _paste].
func paste(caret_index: int = -1) -> void:
	pass;

#desc Pastes the primary clipboard.
func paste_primary_clipboard(caret_index: int = -1) -> void:
	pass;

#desc Perform redo operation.
func redo() -> void:
	pass;

#desc Removes the given caret index.
#desc [b]Note:[/b] This can result in adjustment of all other caret indices.
func remove_caret(caret: int) -> void:
	pass;

#desc Removes the gutter from this [TextEdit].
func remove_gutter(gutter: int) -> void:
	pass;

#desc Removes all additional carets.
func remove_secondary_carets() -> void:
	pass;

#desc Removes text between the given positions.
#desc [b]Note:[/b] This does not adjust the caret or selection, which as a result it can end up in an invalid position.
func remove_text(from_line: int, from_column: int, to_line: int, to_column: int) -> void:
	pass;

#desc Perform a search inside the text. Search flags can be specified in the [enum SearchFlags] enum.
#desc In the returned vector, [code]x[/code] is the column, [code]y[/code] is the line. If no results are found, both are equal to [code]-1[/code].
#desc [codeblocks]
#desc [gdscript]
#desc var result = search("print", SEARCH_WHOLE_WORDS, 0, 0)
#desc if result.x != -1:
#desc # Result found.
#desc var line_number = result.y
#desc var column_number = result.x
#desc [/gdscript]
#desc [csharp]
#desc Vector2I result = Search("print", (uint)TextEdit.SearchFlags.WholeWords, 0, 0);
#desc if (result.X != -1)
#desc {
#desc // Result found.
#desc int lineNumber = result.Y;
#desc int columnNumber = result.X;
#desc }
#desc [/csharp]
#desc [/codeblocks]
func search(text: String, flags: int, from_line: int, from_colum: int) -> Vector2i:
	pass;

#desc Perform selection, from line/column to line/column.
#desc If [member selecting_enabled] is [code]false[/code], no selection will occur.
func select(from_line: int, from_column: int, to_line: int, to_column: int, caret_index: int = 0) -> void:
	pass;

#desc Select all the text.
#desc If [member selecting_enabled] is [code]false[/code], no selection will occur.
func select_all() -> void:
	pass;

#desc Selects the word under the caret.
func select_word_under_caret(caret_index: int = -1) -> void:
	pass;

#desc Moves the caret to the specified [param column] index.
#desc If [param adjust_viewport] is [code]true[/code], the viewport will center at the caret position after the move occurs.
#desc [b]Note:[/b] If supporting multiple carets this will not check for any overlap. See [method merge_overlapping_carets].
func set_caret_column(column: int, adjust_viewport: bool = true, caret_index: int = 0) -> void:
	pass;

#desc Moves the caret to the specified [param line] index.
#desc If [param adjust_viewport] is [code]true[/code], the viewport will center at the caret position after the move occurs.
#desc If [param can_be_hidden] is [code]true[/code], the specified [code]line[/code] can be hidden.
#desc [b]Note:[/b] If supporting multiple carets this will not check for any overlap. See [method merge_overlapping_carets].
func set_caret_line(line: int, adjust_viewport: bool = true, can_be_hidden: bool = true, wrap_index: int = 0, caret_index: int = 0) -> void:
	pass;

#desc Sets the gutter as clickable. This will change the mouse cursor to a pointing hand when hovering over the gutter.
func set_gutter_clickable(gutter: int, clickable: bool) -> void:
	pass;

#desc Set a custom draw method for the gutter. The callback method must take the following args: [code]line: int, gutter: int, Area: Rect2[/code].
func set_gutter_custom_draw(column: int, draw_callback: Callable) -> void:
	pass;

#desc Sets whether the gutter should be drawn.
func set_gutter_draw(gutter: int, draw: bool) -> void:
	pass;

#desc Sets the name of the gutter.
func set_gutter_name(gutter: int, name: String) -> void:
	pass;

#desc Sets the gutter to overwritable. See [method merge_gutters].
func set_gutter_overwritable(gutter: int, overwritable: bool) -> void:
	pass;

#desc Sets the type of gutter.
func set_gutter_type(gutter: int, type: int) -> void:
	pass;

#desc Set the width of the gutter.
func set_gutter_width(gutter: int, width: int) -> void:
	pass;

#desc Sets the text for a specific line.
func set_line(line: int, new_text: String) -> void:
	pass;

#desc Positions the [param wrap_index] of [param line] at the center of the viewport.
func set_line_as_center_visible(line: int, wrap_index: int = 0) -> void:
	pass;

#desc Positions the [param wrap_index] of [param line] at the top of the viewport.
func set_line_as_first_visible(line: int, wrap_index: int = 0) -> void:
	pass;

#desc Positions the [param wrap_index] of [param line] at the bottom of the viewport.
func set_line_as_last_visible(line: int, wrap_index: int = 0) -> void:
	pass;

#desc Sets the current background color of the line. Set to [code]Color(0, 0, 0, 0)[/code] for no color.
func set_line_background_color(line: int, color: Color) -> void:
	pass;

#desc If [param clickable] is [code]true[/code], makes the [param gutter] on [param line] clickable. See [signal gutter_clicked].
func set_line_gutter_clickable(line: int, gutter: int, clickable: bool) -> void:
	pass;

#desc Sets the icon for [param gutter] on [param line] to [param icon].
func set_line_gutter_icon(line: int, gutter: int, icon: Texture2D) -> void:
	pass;

#desc Sets the color for [param gutter] on [param line] to [param color].
func set_line_gutter_item_color(line: int, gutter: int, color: Color) -> void:
	pass;

#desc Sets the metadata for [param gutter] on [param line] to [param metadata].
func set_line_gutter_metadata(line: int, gutter: int, metadata: Variant) -> void:
	pass;

#desc Sets the text for [param gutter] on [param line] to [param text].
func set_line_gutter_text(line: int, gutter: int, text: String) -> void:
	pass;

#desc If [code]true[/code], sets the user into overtype mode. When the user types in this mode, it will override existing text.
func set_overtype_mode_enabled(enabled: bool) -> void:
	pass;

#desc Sets the search [param flags]. This is used with [method set_search_text] to highlight occurrences of the searched text. Search flags can be specified from the [enum SearchFlags] enum.
func set_search_flags(flags: int) -> void:
	pass;

#desc Sets the search text. See [method set_search_flags].
func set_search_text(search_text: String) -> void:
	pass;

#desc Sets the current selection mode.
func set_selection_mode(mode: int, line: int = -1, column: int = -1, caret_index: int = 0) -> void:
	pass;

#desc Sets the tab size for the [TextEdit] to use.
func set_tab_size(size: int) -> void:
	pass;

#desc Provide custom tooltip text. The callback method must take the following args: [code]hovered_word: String[/code].
func set_tooltip_request_func(callback: Callable) -> void:
	pass;

#desc Starts an action, will end the current action if [code]action[/code] is different.
#desc An action will also end after a call to [method end_action], after [member ProjectSettings.gui/timers/text_edit_idle_detect_sec] is triggered or a new undoable step outside the [method start_action] and [method end_action] calls.
func start_action(action: int) -> void:
	pass;

#desc Swaps the two lines.
func swap_lines(from_line: int, to_line: int) -> void:
	pass;

#desc Tag the current version as saved.
func tag_saved_version() -> void:
	pass;

#desc Perform undo operation.
func undo() -> void:
	pass;


func is_caret_blink_enabled() -> bool:
	return caret_blink

func set_caret_blink_enabled(value: bool) -> void:
	caret_blink = value

func get_caret_blink_interval() -> float:
	return caret_blink_interval

func set_caret_blink_interval(value: float) -> void:
	caret_blink_interval = value

func is_caret_mid_grapheme_enabled() -> bool:
	return caret_mid_grapheme

func set_caret_mid_grapheme_enabled(value: bool) -> void:
	caret_mid_grapheme = value

func is_move_caret_on_right_click_enabled() -> bool:
	return caret_move_on_right_click

func set_move_caret_on_right_click_enabled(value: bool) -> void:
	caret_move_on_right_click = value

func is_multiple_carets_enabled() -> bool:
	return caret_multiple

func set_multiple_carets_enabled(value: bool) -> void:
	caret_multiple = value

func get_caret_type() -> int:
	return caret_type

func set_caret_type(value: int) -> void:
	caret_type = value

func is_context_menu_enabled() -> bool:
	return context_menu_enabled

func set_context_menu_enabled(value: bool) -> void:
	context_menu_enabled = value

func is_deselect_on_focus_loss_enabled() -> bool:
	return deselect_on_focus_loss_enabled

func set_deselect_on_focus_loss_enabled(value: bool) -> void:
	deselect_on_focus_loss_enabled = value

func is_drag_and_drop_selection_enabled() -> bool:
	return drag_and_drop_selection_enabled

func set_drag_and_drop_selection_enabled(value: bool) -> void:
	drag_and_drop_selection_enabled = value

func get_draw_control_chars() -> bool:
	return draw_control_chars

func set_draw_control_chars(value: bool) -> void:
	draw_control_chars = value

func is_drawing_spaces() -> bool:
	return draw_spaces

func set_draw_spaces(value: bool) -> void:
	draw_spaces = value

func is_drawing_tabs() -> bool:
	return draw_tabs

func set_draw_tabs(value: bool) -> void:
	draw_tabs = value

func is_editable() -> bool:
	return editable

func set_editable(value: bool) -> void:
	editable = value

func get_focus_mode() -> int:
	return focus_mode

func set_focus_mode(value: int) -> void:
	focus_mode = value

func is_highlight_all_occurrences_enabled() -> bool:
	return highlight_all_occurrences

func set_highlight_all_occurrences(value: bool) -> void:
	highlight_all_occurrences = value

func is_highlight_current_line_enabled() -> bool:
	return highlight_current_line

func set_highlight_current_line(value: bool) -> void:
	highlight_current_line = value

func get_language() -> String:
	return language

func set_language(value: String) -> void:
	language = value

func is_middle_mouse_paste_enabled() -> bool:
	return middle_mouse_paste_enabled

func set_middle_mouse_paste_enabled(value: bool) -> void:
	middle_mouse_paste_enabled = value

func is_drawing_minimap() -> bool:
	return minimap_draw

func set_draw_minimap(value: bool) -> void:
	minimap_draw = value

func get_minimap_width() -> int:
	return minimap_width

func set_minimap_width(value: int) -> void:
	minimap_width = value

func get_default_cursor_shape() -> int:
	return mouse_default_cursor_shape

func set_default_cursor_shape(value: int) -> void:
	mouse_default_cursor_shape = value

func get_placeholder() -> String:
	return placeholder_text

func set_placeholder(value: String) -> void:
	placeholder_text = value

func is_fit_content_height_enabled() -> bool:
	return scroll_fit_content_height

func set_fit_content_height_enabled(value: bool) -> void:
	scroll_fit_content_height = value

func get_h_scroll() -> int:
	return scroll_horizontal

func set_h_scroll(value: int) -> void:
	scroll_horizontal = value

func is_scroll_past_end_of_file_enabled() -> bool:
	return scroll_past_end_of_file

func set_scroll_past_end_of_file_enabled(value: bool) -> void:
	scroll_past_end_of_file = value

func is_smooth_scroll_enabled() -> bool:
	return scroll_smooth

func set_smooth_scroll_enabled(value: bool) -> void:
	scroll_smooth = value

func get_v_scroll_speed() -> float:
	return scroll_v_scroll_speed

func set_v_scroll_speed(value: float) -> void:
	scroll_v_scroll_speed = value

func get_v_scroll() -> float:
	return scroll_vertical

func set_v_scroll(value: float) -> void:
	scroll_vertical = value

func is_selecting_enabled() -> bool:
	return selecting_enabled

func set_selecting_enabled(value: bool) -> void:
	selecting_enabled = value

func is_shortcut_keys_enabled() -> bool:
	return shortcut_keys_enabled

func set_shortcut_keys_enabled(value: bool) -> void:
	shortcut_keys_enabled = value

func get_structured_text_bidi_override() -> int:
	return structured_text_bidi_override

func set_structured_text_bidi_override(value: int) -> void:
	structured_text_bidi_override = value

func get_structured_text_bidi_override_options() -> Array:
	return structured_text_bidi_override_options

func set_structured_text_bidi_override_options(value: Array) -> void:
	structured_text_bidi_override_options = value

func get_syntax_highlighter() -> SyntaxHighlighter:
	return syntax_highlighter

func set_syntax_highlighter(value: SyntaxHighlighter) -> void:
	syntax_highlighter = value

func get_text() -> String:
	return text

func set_text(value: String) -> void:
	text = value

func get_text_direction() -> int:
	return text_direction

func set_text_direction(value: int) -> void:
	text_direction = value

func is_virtual_keyboard_enabled() -> bool:
	return virtual_keyboard_enabled

func set_virtual_keyboard_enabled(value: bool) -> void:
	virtual_keyboard_enabled = value

func get_line_wrapping_mode() -> int:
	return wrap_mode

func set_line_wrapping_mode(value: int) -> void:
	wrap_mode = value

