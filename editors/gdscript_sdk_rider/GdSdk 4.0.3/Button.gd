extends BaseButton
#brief Standard themed Button.
#desc Button is the standard themed button. It can contain text and an icon, and will display them according to the current [Theme].
#desc [b]Example of creating a button and assigning an action when pressed by code:[/b]
#desc [codeblocks]
#desc [gdscript]
#desc func _ready():
#desc var button = Button.new()
#desc button.text = "Click me"
#desc button.pressed.connect(self._button_pressed)
#desc add_child(button)
#desc 
#desc func _button_pressed():
#desc print("Hello world!")
#desc [/gdscript]
#desc [csharp]
#desc public override void _Ready()
#desc {
#desc var button = new Button();
#desc button.Text = "Click me";
#desc button.Pressed += ButtonPressed;
#desc AddChild(button);
#desc }
#desc 
#desc private void ButtonPressed()
#desc {
#desc GD.Print("Hello world!");
#desc }
#desc [/csharp]
#desc [/codeblocks]
#desc Buttons (like all Control nodes) can also be created in the editor, but some situations may require creating them from code.
#desc See also [BaseButton] which contains common properties and methods associated with this node.
#desc [b]Note:[/b] Buttons do not interpret touch input and therefore don't support multitouch, since mouse emulation can only press one button at a given time. Use [TouchScreenButton] for buttons that trigger gameplay movement or actions, as [TouchScreenButton] supports multitouch.
#tutorial [2D Dodge The Creeps Demo] https://godotengine.org/asset-library/asset/515
#tutorial [OS Test Demo] https://godotengine.org/asset-library/asset/677
class_name Button


#desc Text alignment policy for the button's text, use one of the [enum HorizontalAlignment] constants.
var alignment: int:
	get = get_text_alignment, set = set_text_alignment

#desc When this property is enabled, text that is too large to fit the button is clipped, when disabled the Button will always be wide enough to hold the text.
var clip_text: bool:
	get = get_clip_text, set = set_clip_text

#desc When enabled, the button's icon will expand/shrink to fit the button's size while keeping its aspect.
var expand_icon: bool:
	get = is_expand_icon, set = set_expand_icon

#desc Flat buttons don't display decoration.
var flat: bool:
	get = is_flat, set = set_flat

#desc Button's icon, if text is present the icon will be placed before the text.
#desc To edit margin and spacing of the icon, use [theme_item h_separation] theme property and [code]content_margin_*[/code] properties of the used [StyleBox]es.
var icon: Texture2D:
	get = get_button_icon, set = set_button_icon

#desc Specifies if the icon should be aligned to the left, right, or center of a button. Uses the same [enum HorizontalAlignment] constants as the text alignment. If centered, text will draw on top of the icon.
var icon_alignment: int:
	get = get_icon_alignment, set = set_icon_alignment

#desc Language code used for line-breaking and text shaping algorithms, if left empty current locale is used instead.
var language: String:
	get = get_language, set = set_language

#desc The button's text that will be displayed inside the button's area.
var text: String:
	get = get_text, set = set_text

#desc Base text writing direction.
var text_direction: int:
	get = get_text_direction, set = set_text_direction

#desc Sets the clipping behavior when the text exceeds the node's bounding rectangle. See [enum TextServer.OverrunBehavior] for a description of all modes.
var text_overrun_behavior: int:
	get = get_text_overrun_behavior, set = set_text_overrun_behavior




func get_text_alignment() -> int:
	return alignment

func set_text_alignment(value: int) -> void:
	alignment = value

func get_clip_text() -> bool:
	return clip_text

func set_clip_text(value: bool) -> void:
	clip_text = value

func is_expand_icon() -> bool:
	return expand_icon

func set_expand_icon(value: bool) -> void:
	expand_icon = value

func is_flat() -> bool:
	return flat

func set_flat(value: bool) -> void:
	flat = value

func get_button_icon() -> Texture2D:
	return icon

func set_button_icon(value: Texture2D) -> void:
	icon = value

func get_icon_alignment() -> int:
	return icon_alignment

func set_icon_alignment(value: int) -> void:
	icon_alignment = value

func get_language() -> String:
	return language

func set_language(value: String) -> void:
	language = value

func get_text() -> String:
	return text

func set_text(value: String) -> void:
	text = value

func get_text_direction() -> int:
	return text_direction

func set_text_direction(value: int) -> void:
	text_direction = value

func get_text_overrun_behavior() -> int:
	return text_overrun_behavior

func set_text_overrun_behavior(value: int) -> void:
	text_overrun_behavior = value

