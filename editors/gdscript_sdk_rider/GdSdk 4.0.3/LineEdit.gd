extends Control
#brief Control that provides single-line string editing.
#desc LineEdit provides a single-line string editor, used for text fields.
#desc It features many built-in shortcuts which will always be available ([kbd]Ctrl[/kbd] here maps to [kbd]Cmd[/kbd] on macOS):
#desc - [kbd]Ctrl + C[/kbd]: Copy
#desc - [kbd]Ctrl + X[/kbd]: Cut
#desc - [kbd]Ctrl + V[/kbd] or [kbd]Ctrl + Y[/kbd]: Paste/"yank"
#desc - [kbd]Ctrl + Z[/kbd]: Undo
#desc - [kbd]Ctrl + ~[/kbd]: Swap input direction.
#desc - [kbd]Ctrl + Shift + Z[/kbd]: Redo
#desc - [kbd]Ctrl + U[/kbd]: Delete text from the caret position to the beginning of the line
#desc - [kbd]Ctrl + K[/kbd]: Delete text from the caret position to the end of the line
#desc - [kbd]Ctrl + A[/kbd]: Select all text
#desc - [kbd]Up Arrow[/kbd]/[kbd]Down Arrow[/kbd]: Move the caret to the beginning/end of the line
#desc On macOS, some extra keyboard shortcuts are available:
#desc - [kbd]Ctrl + F[/kbd]: Same as [kbd]Right Arrow[/kbd], move the caret one character right
#desc - [kbd]Ctrl + B[/kbd]: Same as [kbd]Left Arrow[/kbd], move the caret one character left
#desc - [kbd]Ctrl + P[/kbd]: Same as [kbd]Up Arrow[/kbd], move the caret to the previous line
#desc - [kbd]Ctrl + N[/kbd]: Same as [kbd]Down Arrow[/kbd], move the caret to the next line
#desc - [kbd]Ctrl + D[/kbd]: Same as [kbd]Delete[/kbd], delete the character on the right side of caret
#desc - [kbd]Ctrl + H[/kbd]: Same as [kbd]Backspace[/kbd], delete the character on the left side of the caret
#desc - [kbd]Ctrl + A[/kbd]: Same as [kbd]Home[/kbd], move the caret to the beginning of the line
#desc - [kbd]Ctrl + E[/kbd]: Same as [kbd]End[/kbd], move the caret to the end of the line
#desc - [kbd]Cmd + Left Arrow[/kbd]: Same as [kbd]Home[/kbd], move the caret to the beginning of the line
#desc - [kbd]Cmd + Right Arrow[/kbd]: Same as [kbd]End[/kbd], move the caret to the end of the line
class_name LineEdit

#desc Emitted when appending text that overflows the [member max_length]. The appended text is truncated to fit [member max_length], and the part that couldn't fit is passed as the [code]rejected_substring[/code] argument.
signal text_change_rejected(rejected_substring: String)
#desc Emitted when the text changes.
signal text_changed(new_text: String)
#desc Emitted when the user presses [constant KEY_ENTER] on the [LineEdit].
signal text_submitted(new_text: String)
#desc Cuts (copies and clears) the selected text.
#desc Copies the selected text.
#desc Pastes the clipboard text over the selected text (or at the caret's position).
#desc Non-printable escape characters are automatically stripped from the OS clipboard via [method String.strip_escapes].
#desc Erases the whole [LineEdit] text.
#desc Selects the whole [LineEdit] text.
#desc Undoes the previous action.
#desc Reverse the last undo action.
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
#desc Default text virtual keyboard.
#desc Multiline virtual keyboard.
#desc Virtual number keypad, useful for PIN entry.
#desc Virtual number keypad, useful for entering fractional numbers.
#desc Virtual phone number keypad.
#desc Virtual keyboard with additional keys to assist with typing email addresses.
#desc Virtual keyboard for entering a password. On most platforms, this should disable autocomplete and autocapitalization.
#desc [b]Note:[/b] This is not supported on Web. Instead, this behaves identically to [constant KEYBOARD_TYPE_DEFAULT].
#desc Virtual keyboard with additional keys to assist with typing URLs.

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
#enum VirtualKeyboardType
enum {
    KEYBOARD_TYPE_DEFAULT = 0,
    KEYBOARD_TYPE_MULTILINE = 1,
    KEYBOARD_TYPE_NUMBER = 2,
    KEYBOARD_TYPE_NUMBER_DECIMAL = 3,
    KEYBOARD_TYPE_PHONE = 4,
    KEYBOARD_TYPE_EMAIL_ADDRESS = 5,
    KEYBOARD_TYPE_PASSWORD = 6,
    KEYBOARD_TYPE_URL = 7,
}
#desc Text alignment as defined in the [enum HorizontalAlignment] enum.
var alignment: int:
	get = get_horizontal_alignment, set = set_horizontal_alignment

#desc If [code]true[/code], the caret (text cursor) blinks.
var caret_blink: bool:
	get = is_caret_blink_enabled, set = set_caret_blink_enabled

#desc Duration (in seconds) of a caret's blinking cycle.
var caret_blink_interval: float:
	get = get_caret_blink_interval, set = set_caret_blink_interval

#desc The caret's column position inside the [LineEdit]. When set, the text may scroll to accommodate it.
var caret_column: int:
	get = get_caret_column, set = set_caret_column

#desc If [code]true[/code], the [LineEdit] will always show the caret, even if focus is lost.
var caret_force_displayed: bool:
	get = is_caret_force_displayed, set = set_caret_force_displayed

#desc Allow moving caret, selecting and removing the individual composite character components.
#desc [b]Note:[/b] [kbd]Backspace[/kbd] is always removing individual composite character components.
var caret_mid_grapheme: bool:
	get = is_caret_mid_grapheme_enabled, set = set_caret_mid_grapheme_enabled

#desc If [code]true[/code], the [LineEdit] will show a clear button if [code]text[/code] is not empty, which can be used to clear the text quickly.
var clear_button_enabled: bool:
	get = is_clear_button_enabled, set = set_clear_button_enabled

#desc If [code]true[/code], the context menu will appear when right-clicked.
var context_menu_enabled: bool:
	get = is_context_menu_enabled, set = set_context_menu_enabled

#desc If [code]true[/code], the selected text will be deselected when focus is lost.
var deselect_on_focus_loss_enabled: bool:
	get = is_deselect_on_focus_loss_enabled, set = set_deselect_on_focus_loss_enabled

#desc If [code]true[/code], control characters are displayed.
var draw_control_chars: bool:
	get = get_draw_control_chars, set = set_draw_control_chars

#desc If [code]false[/code], existing text cannot be modified and new text cannot be added.
var editable: bool:
	get = is_editable, set = set_editable

#desc If [code]true[/code], the [LineEdit] width will increase to stay longer than the [member text]. It will [b]not[/b] compress if the [member text] is shortened.
var expand_to_text_length: bool:
	get = is_expand_to_text_length_enabled, set = set_expand_to_text_length_enabled

#desc If [code]true[/code], the [LineEdit] don't display decoration.
var flat: bool:
	get = is_flat, set = set_flat

var focus_mode: int:
	get = get_focus_mode, set = set_focus_mode

#desc Language code used for line-breaking and text shaping algorithms, if left empty current locale is used instead.
var language: String:
	get = get_language, set = set_language

#desc Maximum number of characters that can be entered inside the [LineEdit]. If [code]0[/code], there is no limit.
#desc When a limit is defined, characters that would exceed [member max_length] are truncated. This happens both for existing [member text] contents when setting the max length, or for new text inserted in the [LineEdit], including pasting. If any input text is truncated, the [signal text_change_rejected] signal is emitted with the truncated substring as parameter.
#desc [b]Example:[/b]
#desc [codeblocks]
#desc [gdscript]
#desc text = "Hello world"
#desc max_length = 5
#desc # `text` becomes "Hello".
#desc max_length = 10
#desc text += " goodbye"
#desc # `text` becomes "Hello good".
#desc # `text_change_rejected` is emitted with "bye" as parameter.
#desc [/gdscript]
#desc [csharp]
#desc Text = "Hello world";
#desc MaxLength = 5;
#desc // `Text` becomes "Hello".
#desc MaxLength = 10;
#desc Text += " goodbye";
#desc // `Text` becomes "Hello good".
#desc // `text_change_rejected` is emitted with "bye" as parameter.
#desc [/csharp]
#desc [/codeblocks]
var max_length: int:
	get = get_max_length, set = set_max_length

#desc If [code]false[/code], using middle mouse button to paste clipboard will be disabled.
#desc [b]Note:[/b] This method is only implemented on Linux.
var middle_mouse_paste_enabled: bool:
	get = is_middle_mouse_paste_enabled, set = set_middle_mouse_paste_enabled

var mouse_default_cursor_shape: int:
	get = get_default_cursor_shape, set = set_default_cursor_shape

#desc Text shown when the [LineEdit] is empty. It is [b]not[/b] the [LineEdit]'s default value (see [member text]).
var placeholder_text: String:
	get = get_placeholder, set = set_placeholder

#desc Sets the icon that will appear in the right end of the [LineEdit] if there's no [member text], or always, if [member clear_button_enabled] is set to [code]false[/code].
var right_icon: Texture2D:
	get = get_right_icon, set = set_right_icon

#desc If [code]true[/code], every character is replaced with the secret character (see [member secret_character]).
var secret: bool:
	get = is_secret, set = set_secret

#desc The character to use to mask secret input (defaults to "•"). Only a single character can be used as the secret character.
var secret_character: String:
	get = get_secret_character, set = set_secret_character

#desc If [code]true[/code], the [LineEdit] will select the whole text when it gains focus.
var select_all_on_focus: bool:
	get = is_select_all_on_focus, set = set_select_all_on_focus

#desc If [code]false[/code], it's impossible to select the text using mouse nor keyboard.
var selecting_enabled: bool:
	get = is_selecting_enabled, set = set_selecting_enabled

#desc If [code]false[/code], using shortcuts will be disabled.
var shortcut_keys_enabled: bool:
	get = is_shortcut_keys_enabled, set = set_shortcut_keys_enabled

#desc Set BiDi algorithm override for the structured text.
var structured_text_bidi_override: int:
	get = get_structured_text_bidi_override, set = set_structured_text_bidi_override

#desc Set additional options for BiDi override.
var structured_text_bidi_override_options: Array:
	get = get_structured_text_bidi_override_options, set = set_structured_text_bidi_override_options

#desc String value of the [LineEdit].
#desc [b]Note:[/b] Changing text using this property won't emit the [signal text_changed] signal.
var text: String:
	get = get_text, set = set_text

#desc Base text writing direction.
var text_direction: int:
	get = get_text_direction, set = set_text_direction

#desc If [code]true[/code], the native virtual keyboard is shown when focused on platforms that support it.
var virtual_keyboard_enabled: bool:
	get = is_virtual_keyboard_enabled, set = set_virtual_keyboard_enabled

#desc Specifies the type of virtual keyboard to show.
var virtual_keyboard_type: int:
	get = get_virtual_keyboard_type, set = set_virtual_keyboard_type



#desc Erases the [LineEdit]'s [member text].
func clear() -> void:
	pass;

#desc Deletes one character at the caret's current position (equivalent to pressing [kbd]Delete[/kbd]).
func delete_char_at_caret() -> void:
	pass;

#desc Deletes a section of the [member text] going from position [param from_column] to [param to_column]. Both parameters should be within the text's length.
func delete_text(from_column: int, to_column: int) -> void:
	pass;

#desc Clears the current selection.
func deselect() -> void:
	pass;

#desc Returns the [PopupMenu] of this [LineEdit]. By default, this menu is displayed when right-clicking on the [LineEdit].
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
#desc menu.ItemCount = menu.GetItemIndex(LineEdit.MenuItems.Redo) + 1;
#desc // Add custom items.
#desc menu.AddSeparator();
#desc menu.AddItem("Insert Date", LineEdit.MenuItems.Max + 1);
#desc // Add event handler.
#desc menu.IdPressed += OnItemPressed;
#desc }
#desc 
#desc public void OnItemPressed(int id)
#desc {
#desc if (id == LineEdit.MenuItems.Max + 1)
#desc {
#desc InsertTextAtCaret(Time.GetDateStringFromSystem());
#desc }
#desc }
#desc [/csharp]
#desc [/codeblocks]
#desc [b]Warning:[/b] This is a required internal node, removing and freeing it may cause a crash. If you wish to hide it or any of its children, use their [member Window.visible] property.
func get_menu() -> PopupMenu:
	pass;

#desc Returns the scroll offset due to [member caret_column], as a number of characters.
func get_scroll_offset() -> float:
	pass;

#desc Returns the selection begin column.
func get_selection_from_column() -> int:
	pass;

#desc Returns the selection end column.
func get_selection_to_column() -> int:
	pass;

#desc Returns [code]true[/code] if the user has selected text.
func has_selection() -> bool:
	pass;

#desc Inserts [param text] at the caret. If the resulting value is longer than [member max_length], nothing happens.
func insert_text_at_caret(text: String) -> void:
	pass;

#desc Returns whether the menu is visible. Use this instead of [code]get_menu().visible[/code] to improve performance (so the creation of the menu is avoided).
func is_menu_visible() -> bool:
	pass;

#desc Executes a given action as defined in the [enum MenuItems] enum.
func menu_option(option: int) -> void:
	pass;

#desc Selects characters inside [LineEdit] between [param from] and [param to]. By default, [param from] is at the beginning and [param to] at the end.
#desc [codeblocks]
#desc [gdscript]
#desc text = "Welcome"
#desc select() # Will select "Welcome".
#desc select(4) # Will select "ome".
#desc select(2, 5) # Will select "lco".
#desc [/gdscript]
#desc [csharp]
#desc Text = "Welcome";
#desc Select(); // Will select "Welcome".
#desc Select(4); // Will select "ome".
#desc Select(2, 5); // Will select "lco".
#desc [/csharp]
#desc [/codeblocks]
func select(from: int = 0, to: int = -1) -> void:
	pass;

#desc Selects the whole [String].
func select_all() -> void:
	pass;


func get_horizontal_alignment() -> int:
	return alignment

func set_horizontal_alignment(value: int) -> void:
	alignment = value

func is_caret_blink_enabled() -> bool:
	return caret_blink

func set_caret_blink_enabled(value: bool) -> void:
	caret_blink = value

func get_caret_blink_interval() -> float:
	return caret_blink_interval

func set_caret_blink_interval(value: float) -> void:
	caret_blink_interval = value

func get_caret_column() -> int:
	return caret_column

func set_caret_column(value: int) -> void:
	caret_column = value

func is_caret_force_displayed() -> bool:
	return caret_force_displayed

func set_caret_force_displayed(value: bool) -> void:
	caret_force_displayed = value

func is_caret_mid_grapheme_enabled() -> bool:
	return caret_mid_grapheme

func set_caret_mid_grapheme_enabled(value: bool) -> void:
	caret_mid_grapheme = value

func is_clear_button_enabled() -> bool:
	return clear_button_enabled

func set_clear_button_enabled(value: bool) -> void:
	clear_button_enabled = value

func is_context_menu_enabled() -> bool:
	return context_menu_enabled

func set_context_menu_enabled(value: bool) -> void:
	context_menu_enabled = value

func is_deselect_on_focus_loss_enabled() -> bool:
	return deselect_on_focus_loss_enabled

func set_deselect_on_focus_loss_enabled(value: bool) -> void:
	deselect_on_focus_loss_enabled = value

func get_draw_control_chars() -> bool:
	return draw_control_chars

func set_draw_control_chars(value: bool) -> void:
	draw_control_chars = value

func is_editable() -> bool:
	return editable

func set_editable(value: bool) -> void:
	editable = value

func is_expand_to_text_length_enabled() -> bool:
	return expand_to_text_length

func set_expand_to_text_length_enabled(value: bool) -> void:
	expand_to_text_length = value

func is_flat() -> bool:
	return flat

func set_flat(value: bool) -> void:
	flat = value

func get_focus_mode() -> int:
	return focus_mode

func set_focus_mode(value: int) -> void:
	focus_mode = value

func get_language() -> String:
	return language

func set_language(value: String) -> void:
	language = value

func get_max_length() -> int:
	return max_length

func set_max_length(value: int) -> void:
	max_length = value

func is_middle_mouse_paste_enabled() -> bool:
	return middle_mouse_paste_enabled

func set_middle_mouse_paste_enabled(value: bool) -> void:
	middle_mouse_paste_enabled = value

func get_default_cursor_shape() -> int:
	return mouse_default_cursor_shape

func set_default_cursor_shape(value: int) -> void:
	mouse_default_cursor_shape = value

func get_placeholder() -> String:
	return placeholder_text

func set_placeholder(value: String) -> void:
	placeholder_text = value

func get_right_icon() -> Texture2D:
	return right_icon

func set_right_icon(value: Texture2D) -> void:
	right_icon = value

func is_secret() -> bool:
	return secret

func set_secret(value: bool) -> void:
	secret = value

func get_secret_character() -> String:
	return secret_character

func set_secret_character(value: String) -> void:
	secret_character = value

func is_select_all_on_focus() -> bool:
	return select_all_on_focus

func set_select_all_on_focus(value: bool) -> void:
	select_all_on_focus = value

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

func get_virtual_keyboard_type() -> int:
	return virtual_keyboard_type

func set_virtual_keyboard_type(value: int) -> void:
	virtual_keyboard_type = value

