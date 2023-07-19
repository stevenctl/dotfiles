extends Resource
#brief Language Translation.
#desc Translations are resources that can be loaded and unloaded on demand. They map a string to another string.
#tutorial [Internationalizing games] https://docs.godotengine.org/en/stable/tutorials/i18n/internationalizing_games.html
#tutorial [Locales] https://docs.godotengine.org/en/stable/tutorials/i18n/locales.html
class_name Translation


#desc The locale of the translation.
var locale: String:
	get = get_locale, set = set_locale



#desc Virtual method to override [method get_message].
func _get_message(src_message: StringName, context: StringName) -> StringName:
	pass;

#desc Virtual method to override [method get_plural_message].
func _get_plural_message(src_message: StringName, src_plural_message: StringName, n: int, context: StringName) -> StringName:
	pass;

#desc Adds a message if nonexistent, followed by its translation.
#desc An additional context could be used to specify the translation context or differentiate polysemic words.
func add_message(src_message: StringName, xlated_message: StringName, context: StringName = "") -> void:
	pass;

#desc Adds a message involving plural translation if nonexistent, followed by its translation.
#desc An additional context could be used to specify the translation context or differentiate polysemic words.
func add_plural_message(src_message: StringName, xlated_messages: PackedStringArray, context: StringName = "") -> void:
	pass;

#desc Erases a message.
func erase_message(src_message: StringName, context: StringName = "") -> void:
	pass;

#desc Returns a message's translation.
func get_message(src_message: StringName, context: StringName = "") -> StringName:
	pass;

#desc Returns the number of existing messages.
func get_message_count() -> int:
	pass;

#desc Returns all the messages (keys).
func get_message_list() -> PackedStringArray:
	pass;

#desc Returns a message's translation involving plurals.
#desc The number [param n] is the number or quantity of the plural object. It will be used to guide the translation system to fetch the correct plural form for the selected language.
func get_plural_message(src_message: StringName, src_plural_message: StringName, n: int, context: StringName = "") -> StringName:
	pass;

#desc Returns all the messages (translated text).
func get_translated_message_list() -> PackedStringArray:
	pass;


func get_locale() -> String:
	return locale

func set_locale(value: String) -> void:
	locale = value

