extends RefCounted
#brief A base class to implement debugger plugins.
#desc [EditorDebuggerPlugin] provides functions related to the editor side of the debugger.
#desc To interact with the debugger, an instance of this class must be added to the editor via [method EditorPlugin.add_debugger_plugin].
#desc Once added, the [method _setup_session] callback will be called for every [EditorDebuggerSession] available to the plugin, and when new ones are created (the sessions may be inactive during this stage).
#desc You can retrieve the available [EditorDebuggerSession]s via [method get_sessions] or get a specific one via [method get_session].
#desc [codeblocks]
#desc [gdscript]
#desc @tool
#desc extends EditorPlugin
#desc 
#desc class ExampleEditorDebugger extends EditorDebuggerPlugin:
#desc 
#desc func _has_capture(prefix):
#desc # Return true if you wish to handle message with this prefix.
#desc return prefix == "my_plugin"
#desc 
#desc func _capture(message, data, session_id):
#desc if message == "my_plugin:ping":
#desc get_session(session_id).send_message("my_plugin:echo", data)
#desc 
#desc func _setup_session(session_id):
#desc # Add a new tab in the debugger session UI containing a label.
#desc var label = Label.new()
#desc label.name = "Example plugin"
#desc label.text = "Example plugin"
#desc var session = get_session(session_id)
#desc # Listens to the session started and stopped signals.
#desc session.started.connect(func (): print("Session started"))
#desc session.stopped.connect(func (): print("Session stopped"))
#desc session.add_session_tab(label)
#desc 
#desc var debugger = ExampleEditorDebugger.new()
#desc 
#desc func _enter_tree():
#desc add_debugger_plugin(debugger)
#desc 
#desc func _exit_tree():
#desc remove_debugger_plugin(debugger)
#desc [/gdscript]
#desc [/codeblocks]
class_name EditorDebuggerPlugin




#desc Override this method to process incoming messages. The [param session_id] is the ID of the [EditorDebuggerSession] that received the message (which you can retrieve via [method get_session]).
func _capture(message: String, data: Array, session_id: int) -> bool:
	pass;

#desc Override this method to enable receiving messages from the debugger. If [param capture] is "my_message" then messages starting with "my_message:" will be passes to the [method _capture] method.
func _has_capture(capture: String) -> bool:
	pass;

#desc Override this method to be notified whenever a new [EditorDebuggerSession] is created (the session may be inactive during this stage).
func _setup_session(session_id: int) -> void:
	pass;

#desc Returns the [EditorDebuggerSession] with the given [param id].
func get_session(id: int) -> EditorDebuggerSession:
	pass;

#desc Returns an array of [EditorDebuggerSession] currently available to this debugger plugin.
#desc Note: Not sessions in the array may be inactive, check their state via [method EditorDebuggerSession.is_active]
func get_sessions() -> Array:
	pass;


