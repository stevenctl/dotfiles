extends InputEvent
#brief [InputEvent] that signifies a triggered keyboard [Shortcut].
#desc InputEventShortcut is a special event that can be received in [method Node._unhandled_key_input]. It's typically sent by the editor's Command Palette to trigger actions, but can also be sent manually using [method Viewport.push_unhandled_input].
class_name InputEventShortcut


#desc The [Shortcut] represented by this event. Its [method Shortcut.matches_event] method will always return [code]true[/code] for this event.
var shortcut: Shortcut:
	get = get_shortcut, set = set_shortcut




func get_shortcut() -> Shortcut:
	return shortcut

func set_shortcut(value: Shortcut) -> void:
	shortcut = value

