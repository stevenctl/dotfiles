extends Object
#brief An engine singleton providing access to static [Theme] information, such as default and project theme, and fallback values.
#desc This engine singleton provides access to static information about [Theme] resources used by the engine and by your projects. You can fetch the default engine theme, as well as your project configured theme.
#desc [ThemeDB] also contains fallback values for theme properties.
class_name ThemeDB

#desc Emitted when one of the fallback values had been changed. Use it to refresh the look of controls that may rely on the fallback theme items.
signal fallback_changed

#desc The fallback base scale factor of every [Control] node and [Theme] resource. Used when no other value is available to the control.
#desc See also [member Theme.default_base_scale].
var fallback_base_scale: float:
	get = get_fallback_base_scale, set = set_fallback_base_scale

#desc The fallback font of every [Control] node and [Theme] resource. Used when no other value is available to the control.
#desc See also [member Theme.default_font].
var fallback_font: Font:
	get = get_fallback_font, set = set_fallback_font

#desc The fallback font size of every [Control] node and [Theme] resource. Used when no other value is available to the control.
#desc See also [member Theme.default_font_size].
var fallback_font_size: int:
	get = get_fallback_font_size, set = set_fallback_font_size

#desc The fallback icon of every [Control] node and [Theme] resource. Used when no other value is available to the control.
var fallback_icon: Texture2D:
	get = get_fallback_icon, set = set_fallback_icon

#desc The fallback stylebox of every [Control] node and [Theme] resource. Used when no other value is available to the control.
var fallback_stylebox: StyleBox:
	get = get_fallback_stylebox, set = set_fallback_stylebox



#desc Returns a reference to the default engine [Theme]. This theme resource is responsible for the out-of-the-box look of [Control] nodes and cannot be overridden.
func get_default_theme() -> Theme:
	pass;

#desc Returns a reference to the custom project [Theme]. This theme resources allows to override the default engine theme for every control node in the project.
#desc To set the project theme, see [member ProjectSettings.gui/theme/custom].
func get_project_theme() -> Theme:
	pass;


func get_fallback_base_scale() -> float:
	return fallback_base_scale

func set_fallback_base_scale(value: float) -> void:
	fallback_base_scale = value

func get_fallback_font() -> Font:
	return fallback_font

func set_fallback_font(value: Font) -> void:
	fallback_font = value

func get_fallback_font_size() -> int:
	return fallback_font_size

func set_fallback_font_size(value: int) -> void:
	fallback_font_size = value

func get_fallback_icon() -> Texture2D:
	return fallback_icon

func set_fallback_icon(value: Texture2D) -> void:
	fallback_icon = value

func get_fallback_stylebox() -> StyleBox:
	return fallback_stylebox

func set_fallback_stylebox(value: StyleBox) -> void:
	fallback_stylebox = value

