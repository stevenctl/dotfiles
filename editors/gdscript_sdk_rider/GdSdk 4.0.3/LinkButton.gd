extends BaseButton
#brief Simple button used to represent a link to some resource.
#desc This kind of button is primarily used when the interaction with the button causes a context change (like linking to a web page).
#desc See also [BaseButton] which contains common properties and methods associated with this node.
class_name LinkButton

#desc The LinkButton will always show an underline at the bottom of its text.
#desc The LinkButton will show an underline at the bottom of its text when the mouse cursor is over it.
#desc The LinkButton will never show an underline at the bottom of its text.

#enum UnderlineMode
enum {
    UNDERLINE_MODE_ALWAYS = 0,
    UNDERLINE_MODE_ON_HOVER = 1,
    UNDERLINE_MODE_NEVER = 2,
}
var focus_mode: int:
	get = get_focus_mode, set = set_focus_mode

#desc Language code used for line-breaking and text shaping algorithms, if left empty current locale is used instead.
var language: String:
	get = get_language, set = set_language

var mouse_default_cursor_shape: int:
	get = get_default_cursor_shape, set = set_default_cursor_shape

#desc Set BiDi algorithm override for the structured text.
var structured_text_bidi_override: int:
	get = get_structured_text_bidi_override, set = set_structured_text_bidi_override

#desc Set additional options for BiDi override.
var structured_text_bidi_override_options: Array:
	get = get_structured_text_bidi_override_options, set = set_structured_text_bidi_override_options

#desc The button's text that will be displayed inside the button's area.
var text: String:
	get = get_text, set = set_text

#desc Base text writing direction.
var text_direction: int:
	get = get_text_direction, set = set_text_direction

#desc The underline mode to use for the text. See [enum LinkButton.UnderlineMode] for the available modes.
var underline: int:
	get = get_underline_mode, set = set_underline_mode

#desc The [url=https://en.wikipedia.org/wiki/Uniform_Resource_Identifier]URI[/url] for this [LinkButton]. If set to a valid URI, pressing the button opens the URI using the operating system's default program for the protocol (via [method OS.shell_open]). HTTP and HTTPS URLs open the default web browser.
#desc [b]Examples:[/b]
#desc [codeblocks]
#desc [gdscript]
#desc uri = "https://godotengine.org"  # Opens the URL in the default web browser.
#desc uri = "C:\SomeFolder"  # Opens the file explorer at the given path.
#desc uri = "C:\SomeImage.png"  # Opens the given image in the default viewing app.
#desc [/gdscript]
#desc [csharp]
#desc Uri = "https://godotengine.org"; // Opens the URL in the default web browser.
#desc Uri = "C:\SomeFolder"; // Opens the file explorer at the given path.
#desc Uri = "C:\SomeImage.png"; // Opens the given image in the default viewing app.
#desc [/csharp]
#desc [/codeblocks]
var uri: String:
	get = get_uri, set = set_uri




func get_focus_mode() -> int:
	return focus_mode

func set_focus_mode(value: int) -> void:
	focus_mode = value

func get_language() -> String:
	return language

func set_language(value: String) -> void:
	language = value

func get_default_cursor_shape() -> int:
	return mouse_default_cursor_shape

func set_default_cursor_shape(value: int) -> void:
	mouse_default_cursor_shape = value

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

func get_underline_mode() -> int:
	return underline

func set_underline_mode(value: int) -> void:
	underline = value

func get_uri() -> String:
	return uri

func set_uri(value: String) -> void:
	uri = value

