extends Control
#brief Label that displays rich text.
#desc Rich text can contain custom text, fonts, images and some basic formatting. The label manages these as an internal tag stack. It also adapts itself to given width/heights.
#desc [b]Note:[/b] Assignments to [member text] clear the tag stack and reconstruct it from the property's contents. Any edits made to [member text] will erase previous edits made from other manual sources such as [method append_text] and the [code]push_*[/code] / [method pop] methods.
#desc [b]Note:[/b] RichTextLabel doesn't support entangled BBCode tags. For example, instead of using [code][b]bold[i]bold italic[/b]italic[/i][/code], use [code][b]bold[i]bold italic[/i][/b][i]italic[/i][/code].
#desc [b]Note:[/b] [code]push_*/pop[/code] functions won't affect BBCode.
#desc [b]Note:[/b] Unlike [Label], RichTextLabel doesn't have a [i]property[/i] to horizontally align text to the center. Instead, enable [member bbcode_enabled] and surround the text in a [code][center][/code] tag as follows: [code][center]Example[/center][/code]. There is currently no built-in way to vertically align text either, but this can be emulated by relying on anchors/containers and the [member fit_content] property.
#tutorial [BBCode in RichTextLabel] https://docs.godotengine.org/en/stable/tutorials/ui/bbcode_in_richtextlabel.html
#tutorial [GUI Rich Text/BBcode Demo] https://godotengine.org/asset-library/asset/132
#tutorial [OS Test Demo] https://godotengine.org/asset-library/asset/677
class_name RichTextLabel

#desc Triggered when the document is fully loaded.
signal finished
#desc Triggered when the user clicks on content between meta tags. If the meta is defined in text, e.g. [code][url={"data"="hi"}]hi[/url][/code], then the parameter for this signal will be a [String] type. If a particular type or an object is desired, the [method push_meta] method must be used to manually insert the data into the tag stack.
signal meta_clicked(meta: Variant)
#desc Triggers when the mouse exits a meta tag.
signal meta_hover_ended(meta: Variant)
#desc Triggers when the mouse enters a meta tag.
signal meta_hover_started(meta: Variant)
#desc Each list item has a number marker.
#desc Each list item has a letter marker.
#desc Each list item has a roman number marker.
#desc Each list item has a filled circle marker.
#desc Copies the selected text.
#desc Selects the whole [RichTextLabel] text.
#desc Represents the size of the [enum MenuItems] enum.

#enum ListType
enum {
    LIST_NUMBERS = 0,
    LIST_LETTERS = 1,
    LIST_ROMAN = 2,
    LIST_DOTS = 3,
}
#enum MenuItems
enum {
    MENU_COPY = 0,
    MENU_SELECT_ALL = 1,
    MENU_MAX = 2,
}
#desc If set to something other than [constant TextServer.AUTOWRAP_OFF], the text gets wrapped inside the node's bounding rectangle. To see how each mode behaves, see [enum TextServer.AutowrapMode].
var autowrap_mode: int:
	get = get_autowrap_mode, set = set_autowrap_mode

#desc If [code]true[/code], the label uses BBCode formatting.
var bbcode_enabled: bool:
	get = is_using_bbcode, set = set_use_bbcode

var clip_contents: bool:
	get = is_clipping_contents, set = set_clip_contents

#desc If [code]true[/code], a right-click displays the context menu.
var context_menu_enabled: bool:
	get = is_context_menu_enabled, set = set_context_menu_enabled

#desc The currently installed custom effects. This is an array of [RichTextEffect]s.
#desc To add a custom effect, it's more convenient to use [method install_effect].
var custom_effects: Array:
	get = get_effects, set = set_effects

#desc If [code]true[/code], the selected text will be deselected when focus is lost.
var deselect_on_focus_loss_enabled: bool:
	get = is_deselect_on_focus_loss_enabled, set = set_deselect_on_focus_loss_enabled

#desc If [code]true[/code], the label's minimum size will be automatically updated to fit its content, matching the behavior of [Label].
var fit_content: bool:
	get = is_fit_content_enabled, set = set_fit_content

#desc If [code]true[/code], the label underlines hint tags such as [code][hint=description]{text}[/hint][/code].
var hint_underlined: bool:
	get = is_hint_underlined, set = set_hint_underline

#desc Language code used for line-breaking and text shaping algorithms, if left empty current locale is used instead.
var language: String:
	get = get_language, set = set_language

#desc If [code]true[/code], the label underlines meta tags such as [code][url]{text}[/url][/code].
var meta_underlined: bool:
	get = is_meta_underlined, set = set_meta_underline

#desc The delay after which the loading progress bar is displayed, in milliseconds. Set to [code]-1[/code] to disable progress bar entirely.
#desc [b]Note:[/b] Progress bar is displayed only if [member threaded] is enabled.
var progress_bar_delay: int:
	get = get_progress_bar_delay, set = set_progress_bar_delay

#desc If [code]true[/code], the scrollbar is visible. Setting this to [code]false[/code] does not block scrolling completely. See [method scroll_to_line].
var scroll_active: bool:
	get = is_scroll_active, set = set_scroll_active

#desc If [code]true[/code], the window scrolls down to display new content automatically.
var scroll_following: bool:
	get = is_scroll_following, set = set_scroll_follow

#desc If [code]true[/code], the label allows text selection.
var selection_enabled: bool:
	get = is_selection_enabled, set = set_selection_enabled

#desc If [code]true[/code], shortcut keys for context menu items are enabled, even if the context menu is disabled.
var shortcut_keys_enabled: bool:
	get = is_shortcut_keys_enabled, set = set_shortcut_keys_enabled

#desc Set BiDi algorithm override for the structured text.
var structured_text_bidi_override: int:
	get = get_structured_text_bidi_override, set = set_structured_text_bidi_override

#desc Set additional options for BiDi override.
var structured_text_bidi_override_options: Array:
	get = get_structured_text_bidi_override_options, set = set_structured_text_bidi_override_options

#desc The number of spaces associated with a single tab length. Does not affect [code]\t[/code] in text tags, only indent tags.
var tab_size: int:
	get = get_tab_size, set = set_tab_size

#desc The label's text in BBCode format. Is not representative of manual modifications to the internal tag stack. Erases changes made by other methods when edited.
#desc [b]Note:[/b] If [member bbcode_enabled] is [code]true[/code], it is unadvised to use the [code]+=[/code] operator with [code]text[/code] (e.g. [code]text += "some string"[/code]) as it replaces the whole text and can cause slowdowns. It will also erase all BBCode that was added to stack using [code]push_*[/code] methods. Use [method append_text] for adding text instead, unless you absolutely need to close a tag that was opened in an earlier method call.
var text: String:
	get = get_text, set = set_text

#desc Base text writing direction.
var text_direction: int:
	get = get_text_direction, set = set_text_direction

#desc If [code]true[/code], text processing is done in a background thread.
var threaded: bool:
	get = is_threaded, set = set_threaded

#desc The number of characters to display. If set to [code]-1[/code], all characters are displayed. This can be useful when animating the text appearing in a dialog box.
#desc [b]Note:[/b] Setting this property updates [member visible_ratio] accordingly.
var visible_characters: int:
	get = get_visible_characters, set = set_visible_characters

#desc Sets the clipping behavior when [member visible_characters] or [member visible_ratio] is set. See [enum TextServer.VisibleCharactersBehavior] for more info.
var visible_characters_behavior: int:
	get = get_visible_characters_behavior, set = set_visible_characters_behavior

#desc The fraction of characters to display, relative to the total number of characters (see [method get_total_character_count]). If set to [code]1.0[/code], all characters are displayed. If set to [code]0.5[/code], only half of the characters will be displayed. This can be useful when animating the text appearing in a dialog box.
#desc [b]Note:[/b] Setting this property updates [member visible_characters] accordingly.
var visible_ratio: float:
	get = get_visible_ratio, set = set_visible_ratio



#desc Adds an image's opening and closing tags to the tag stack, optionally providing a [param width] and [param height] to resize the image, a [param color] to tint the image and a [param region] to only use parts of the image.
#desc If [param width] or [param height] is set to 0, the image size will be adjusted in order to keep the original aspect ratio.
#desc If [param width] and [param height] are not set, but [param region] is, the region's rect will be used.
func add_image(image: Texture2D, width: int = 0, height: int = 0, color: Color = Color(1, 1, 1, 1), inline_align: int = 5, region: Rect2 = Rect2(0, 0, 0, 0)) -> void:
	pass;

#desc Adds raw non-BBCode-parsed text to the tag stack.
func add_text(text: String) -> void:
	pass;

#desc Parses [param bbcode] and adds tags to the tag stack as needed.
#desc [b]Note:[/b] Using this method, you can't close a tag that was opened in a previous [method append_text] call. This is done to improve performance, especially when updating large RichTextLabels since rebuilding the whole BBCode every time would be slower. If you absolutely need to close a tag in a future method call, append the [member text] instead of using [method append_text].
func append_text(bbcode: String) -> void:
	pass;

#desc Clears the tag stack and sets [member text] to an empty string.
func clear() -> void:
	pass;

#desc Clears the current selection.
func deselect() -> void:
	pass;

#desc Returns the line number of the character position provided.
#desc [b]Note:[/b] If [member threaded] is enabled, this method returns a value for the loaded part of the document. Use [method is_ready] or [signal finished] to determine whether document is fully loaded.
func get_character_line(character: int) -> int:
	pass;

#desc Returns the paragraph number of the character position provided.
#desc [b]Note:[/b] If [member threaded] is enabled, this method returns a value for the loaded part of the document. Use [method is_ready] or [signal finished] to determine whether document is fully loaded.
func get_character_paragraph(character: int) -> int:
	pass;

#desc Returns the height of the content.
#desc [b]Note:[/b] If [member threaded] is enabled, this method returns a value for the loaded part of the document. Use [method is_ready] or [signal finished] to determine whether document is fully loaded.
func get_content_height() -> int:
	pass;

#desc Returns the width of the content.
#desc [b]Note:[/b] If [member threaded] is enabled, this method returns a value for the loaded part of the document. Use [method is_ready] or [signal finished] to determine whether document is fully loaded.
func get_content_width() -> int:
	pass;

#desc Returns the total number of lines in the text. Wrapped text is counted as multiple lines.
#desc [b]Note:[/b] If [member threaded] is enabled, this method returns a value for the loaded part of the document. Use [method is_ready] or [signal finished] to determine whether document is fully loaded.
func get_line_count() -> int:
	pass;

#desc Returns the vertical offset of the line found at the provided index.
#desc [b]Note:[/b] If [member threaded] is enabled, this method returns a value for the loaded part of the document. Use [method is_ready] or [signal finished] to determine whether document is fully loaded.
func get_line_offset(line: int) -> float:
	pass;

#desc Returns the [PopupMenu] of this [RichTextLabel]. By default, this menu is displayed when right-clicking on the [RichTextLabel].
#desc You can add custom menu items or remove standard ones. Make sure your IDs don't conflict with the standard ones (see [enum MenuItems]). For example:
#desc [codeblocks]
#desc [gdscript]
#desc func _ready():
#desc var menu = get_menu()
#desc # Remove "Select All" item.
#desc menu.remove_item(MENU_SELECT_ALL)
#desc # Add custom items.
#desc menu.add_separator()
#desc menu.add_item("Duplicate Text", MENU_MAX + 1)
#desc # Connect callback.
#desc menu.id_pressed.connect(_on_item_pressed)
#desc 
#desc func _on_item_pressed(id):
#desc if id == MENU_MAX + 1:
#desc add_text("\n" + get_parsed_text())
#desc [/gdscript]
#desc [csharp]
#desc public override void _Ready()
#desc {
#desc var menu = GetMenu();
#desc // Remove "Select All" item.
#desc menu.RemoveItem(RichTextLabel.MenuItems.SelectAll);
#desc // Add custom items.
#desc menu.AddSeparator();
#desc menu.AddItem("Duplicate Text", RichTextLabel.MenuItems.Max + 1);
#desc // Add event handler.
#desc menu.IdPressed += OnItemPressed;
#desc }
#desc 
#desc public void OnItemPressed(int id)
#desc {
#desc if (id == TextEdit.MenuItems.Max + 1)
#desc {
#desc AddText("\n" + GetParsedText());
#desc }
#desc }
#desc [/csharp]
#desc [/codeblocks]
#desc [b]Warning:[/b] This is a required internal node, removing and freeing it may cause a crash. If you wish to hide it or any of its children, use their [member Window.visible] property.
func get_menu() -> PopupMenu:
	pass;

#desc Returns the total number of paragraphs (newlines or [code]p[/code] tags in the tag stack's text tags). Considers wrapped text as one paragraph.
func get_paragraph_count() -> int:
	pass;

#desc Returns the vertical offset of the paragraph found at the provided index.
#desc [b]Note:[/b] If [member threaded] is enabled, this method returns a value for the loaded part of the document. Use [method is_ready] or [signal finished] to determine whether document is fully loaded.
func get_paragraph_offset(paragraph: int) -> float:
	pass;

#desc Returns the text without BBCode mark-up.
func get_parsed_text() -> String:
	pass;

#desc Returns the current selection text. Does not include BBCodes.
func get_selected_text() -> String:
	pass;

#desc Returns the current selection first character index if a selection is active, [code]-1[/code] otherwise. Does not include BBCodes.
func get_selection_from() -> int:
	pass;

#desc Returns the current selection last character index if a selection is active, [code]-1[/code] otherwise. Does not include BBCodes.
func get_selection_to() -> int:
	pass;

#desc Returns the total number of characters from text tags. Does not include BBCodes.
func get_total_character_count() -> int:
	pass;

#desc Returns the vertical scrollbar.
#desc [b]Warning:[/b] This is a required internal node, removing and freeing it may cause a crash. If you wish to hide it or any of its children, use their [member CanvasItem.visible] property.
func get_v_scroll_bar() -> VScrollBar:
	pass;

#desc Returns the number of visible lines.
#desc [b]Note:[/b] If [member threaded] is enabled, this method returns a value for the loaded part of the document. Use [method is_ready] or [signal finished] to determine whether document is fully loaded.
func get_visible_line_count() -> int:
	pass;

#desc Returns the number of visible paragraphs. A paragraph is considered visible if at least one of its lines is visible.
#desc [b]Note:[/b] If [member threaded] is enabled, this method returns a value for the loaded part of the document. Use [method is_ready] or [signal finished] to determine whether document is fully loaded.
func get_visible_paragraph_count() -> int:
	pass;

#desc Installs a custom effect. [param effect] should be a valid [RichTextEffect].
func install_effect(effect: Variant) -> void:
	pass;

#desc Returns whether the menu is visible. Use this instead of [code]get_menu().visible[/code] to improve performance (so the creation of the menu is avoided).
func is_menu_visible() -> bool:
	pass;

#desc If [member threaded] is enabled, returns [code]true[/code] if the background thread has finished text processing, otherwise always return [code]true[/code].
func is_ready() -> bool:
	pass;

#desc Executes a given action as defined in the [enum MenuItems] enum.
func menu_option(option: int) -> void:
	pass;

#desc Adds a newline tag to the tag stack.
func newline() -> void:
	pass;

#desc The assignment version of [method append_text]. Clears the tag stack and inserts the new content.
func parse_bbcode(bbcode: String) -> void:
	pass;

#desc Parses BBCode parameter [param expressions] into a dictionary.
func parse_expressions_for_values(expressions: PackedStringArray) -> Dictionary:
	pass;

#desc Terminates the current tag. Use after [code]push_*[/code] methods to close BBCodes manually. Does not need to follow [code]add_*[/code] methods.
func pop() -> void:
	pass;

#desc Adds a [code][bgcolor][/code] tag to the tag stack.
func push_bgcolor(bgcolor: Color) -> void:
	pass;

#desc Adds a [code][font][/code] tag with a bold font to the tag stack. This is the same as adding a [code][b][/code] tag if not currently in a [code][i][/code] tag.
func push_bold() -> void:
	pass;

#desc Adds a [code][font][/code] tag with a bold italics font to the tag stack.
func push_bold_italics() -> void:
	pass;

#desc Adds a [code][cell][/code] tag to the tag stack. Must be inside a [code][table][/code] tag. See [method push_table] for details.
func push_cell() -> void:
	pass;

#desc Adds a [code][color][/code] tag to the tag stack.
func push_color(color: Color) -> void:
	pass;

#desc Adds a custom effect tag to the tag stack. The effect does not need to be in [member custom_effects]. The environment is directly passed to the effect.
func push_customfx(effect: RichTextEffect, env: Dictionary) -> void:
	pass;

#desc Adds a [code][dropcap][/code] tag to the tag stack. Drop cap (dropped capital) is a decorative element at the beginning of a paragraph that is larger than the rest of the text.
func push_dropcap(string: String, font: Font, size: int, dropcap_margins: Rect2 = Rect2(0, 0, 0, 0), color: Color = Color(1, 1, 1, 1), outline_size: int = 0, outline_color: Color = Color(0, 0, 0, 0)) -> void:
	pass;

#desc Adds a [code][fgcolor][/code] tag to the tag stack.
func push_fgcolor(fgcolor: Color) -> void:
	pass;

#desc Adds a [code][font][/code] tag to the tag stack. Overrides default fonts for its duration.
func push_font(font: Font, font_size: int) -> void:
	pass;

#desc Adds a [code][font_size][/code] tag to the tag stack. Overrides default font size for its duration.
func push_font_size(font_size: int) -> void:
	pass;

#desc Adds a [code][hint][/code] tag to the tag stack. Same as BBCode [code][hint=something]{text}[/hint][/code].
func push_hint(description: String) -> void:
	pass;

#desc Adds an [code][indent][/code] tag to the tag stack. Multiplies [param level] by current [member tab_size] to determine new margin length.
func push_indent(level: int) -> void:
	pass;

#desc Adds a [code][font][/code] tag with an italics font to the tag stack. This is the same as adding an [code][i][/code] tag if not currently in a [code][b][/code] tag.
func push_italics() -> void:
	pass;

#desc Adds [code][ol][/code] or [code][ul][/code] tag to the tag stack. Multiplies [param level] by current [member tab_size] to determine new margin length.
func push_list(level: int, type: int, capitalize: bool) -> void:
	pass;

#desc Adds a meta tag to the tag stack. Similar to the BBCode [code][url=something]{text}[/url][/code], but supports non-[String] metadata types.
func push_meta(data: Variant) -> void:
	pass;

#desc Adds a [code][font][/code] tag with a monospace font to the tag stack.
func push_mono() -> void:
	pass;

#desc Adds a [code][font][/code] tag with a normal font to the tag stack.
func push_normal() -> void:
	pass;

#desc Adds a [code][outline_color][/code] tag to the tag stack. Adds text outline for its duration.
func push_outline_color(color: Color) -> void:
	pass;

#desc Adds a [code][outline_size][/code] tag to the tag stack. Overrides default text outline size for its duration.
func push_outline_size(outline_size: int) -> void:
	pass;

#desc Adds a [code][p][/code] tag to the tag stack.
func push_paragraph(alignment: int, base_direction: int = 0, language: String = "", st_parser: int = 0) -> void:
	pass;

#desc Adds a [code][s][/code] tag to the tag stack.
func push_strikethrough() -> void:
	pass;

#desc Adds a [code][table=columns,inline_align][/code] tag to the tag stack.
func push_table(columns: int, inline_align: int = 0, align_to_row: int = -1) -> void:
	pass;

#desc Adds a [code][u][/code] tag to the tag stack.
func push_underline() -> void:
	pass;

#desc Removes a paragraph of content from the label. Returns [code]true[/code] if the paragraph exists.
#desc The [param paragraph] argument is the index of the paragraph to remove, it can take values in the interval [code][0, get_paragraph_count() - 1][/code].
func remove_paragraph(paragraph: int) -> bool:
	pass;

#desc Scrolls the window's top line to match [param line].
func scroll_to_line(line: int) -> void:
	pass;

#desc Scrolls the window's top line to match first line of the [param paragraph].
func scroll_to_paragraph(paragraph: int) -> void:
	pass;

#desc Scrolls to the beginning of the current selection.
func scroll_to_selection() -> void:
	pass;

#desc Select all the text.
#desc If [member selection_enabled] is [code]false[/code], no selection will occur.
func select_all() -> void:
	pass;

#desc Sets color of a table cell border.
func set_cell_border_color(color: Color) -> void:
	pass;

#desc Sets inner padding of a table cell.
func set_cell_padding(padding: Rect2) -> void:
	pass;

#desc Sets color of a table cell. Separate colors for alternating rows can be specified.
func set_cell_row_background_color(odd_row_bg: Color, even_row_bg: Color) -> void:
	pass;

#desc Sets minimum and maximum size overrides for a table cell.
func set_cell_size_override(min_size: Vector2, max_size: Vector2) -> void:
	pass;

#desc Edits the selected column's expansion options. If [param expand] is [code]true[/code], the column expands in proportion to its expansion ratio versus the other columns' ratios.
#desc For example, 2 columns with ratios 3 and 4 plus 70 pixels in available width would expand 30 and 40 pixels, respectively.
#desc If [param expand] is [code]false[/code], the column will not contribute to the total ratio.
func set_table_column_expand(column: int, expand: bool, ratio: int) -> void:
	pass;


func get_autowrap_mode() -> int:
	return autowrap_mode

func set_autowrap_mode(value: int) -> void:
	autowrap_mode = value

func is_using_bbcode() -> bool:
	return bbcode_enabled

func set_use_bbcode(value: bool) -> void:
	bbcode_enabled = value

func is_clipping_contents() -> bool:
	return clip_contents

func set_clip_contents(value: bool) -> void:
	clip_contents = value

func is_context_menu_enabled() -> bool:
	return context_menu_enabled

func set_context_menu_enabled(value: bool) -> void:
	context_menu_enabled = value

func get_effects() -> Array:
	return custom_effects

func set_effects(value: Array) -> void:
	custom_effects = value

func is_deselect_on_focus_loss_enabled() -> bool:
	return deselect_on_focus_loss_enabled

func set_deselect_on_focus_loss_enabled(value: bool) -> void:
	deselect_on_focus_loss_enabled = value

func is_fit_content_enabled() -> bool:
	return fit_content

func set_fit_content(value: bool) -> void:
	fit_content = value

func is_hint_underlined() -> bool:
	return hint_underlined

func set_hint_underline(value: bool) -> void:
	hint_underlined = value

func get_language() -> String:
	return language

func set_language(value: String) -> void:
	language = value

func is_meta_underlined() -> bool:
	return meta_underlined

func set_meta_underline(value: bool) -> void:
	meta_underlined = value

func get_progress_bar_delay() -> int:
	return progress_bar_delay

func set_progress_bar_delay(value: int) -> void:
	progress_bar_delay = value

func is_scroll_active() -> bool:
	return scroll_active

func set_scroll_active(value: bool) -> void:
	scroll_active = value

func is_scroll_following() -> bool:
	return scroll_following

func set_scroll_follow(value: bool) -> void:
	scroll_following = value

func is_selection_enabled() -> bool:
	return selection_enabled

func set_selection_enabled(value: bool) -> void:
	selection_enabled = value

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

func get_tab_size() -> int:
	return tab_size

func set_tab_size(value: int) -> void:
	tab_size = value

func get_text() -> String:
	return text

func set_text(value: String) -> void:
	text = value

func get_text_direction() -> int:
	return text_direction

func set_text_direction(value: int) -> void:
	text_direction = value

func is_threaded() -> bool:
	return threaded

func set_threaded(value: bool) -> void:
	threaded = value

func get_visible_characters() -> int:
	return visible_characters

func set_visible_characters(value: int) -> void:
	visible_characters = value

func get_visible_characters_behavior() -> int:
	return visible_characters_behavior

func set_visible_characters_behavior(value: int) -> void:
	visible_characters_behavior = value

func get_visible_ratio() -> float:
	return visible_ratio

func set_visible_ratio(value: float) -> void:
	visible_ratio = value

