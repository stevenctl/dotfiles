extends RefCounted
#brief A class to interact with the editor debugger.
#desc This class cannot be directly instantiated and must be retrieved via a [EditorDebuggerPlugin].
#desc You can add tabs to the session UI via [method add_session_tab], send messages via [method send_message], and toggle [EngineProfiler]s via [method toggle_profiler].
class_name EditorDebuggerSession

#desc Emitted when the attached remote instance enters a break state. If [param can_debug] is [code]true[/code], the remote instance will enter the debug loop.
signal breaked(can_debug: bool)
#desc Emitted when the attached remote instance exits a break state.
signal continued
#desc Emitted when a remote instance is attached to this session (i.e. the session becomes active).
signal started
#desc Emitted when a remote instance is detached from this session (i.e. the session becomes inactive).
signal stopped



#desc Adds the given [param control] to the debug session UI in the debugger bottom panel.
func add_session_tab(control: Control) -> void:
	pass;

#desc Returns [code]true[/code] if the debug session is currently attached to a remote instance.
func is_active() -> bool:
	pass;

#desc Returns [code]true[/code] if the attached remote instance is currently in the debug loop.
func is_breaked() -> bool:
	pass;

#desc Returns [code]true[/code] if the attached remote instance can be debugged.
func is_debuggable() -> bool:
	pass;

#desc Removes the given [param control] from the debug session UI in the debugger bottom panel.
func remove_session_tab(control: Control) -> void:
	pass;

#desc Sends the given [param message] to the attached remote instance, optionally passing additionally [param data]. See [EngineDebugger] for how to retrieve those messages.
func send_message(message: String, data: Array = []) -> void:
	pass;

#desc Toggle the given [param profiler] on the attached remote instance, optionally passing additionally [param data]. See [EngineProfiler] for more details.
func toggle_profiler(profiler: String, enable: bool, data: Array = []) -> void:
	pass;


