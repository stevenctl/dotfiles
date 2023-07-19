#brief Built-in type representing a signal defined in an object.
#desc [Signal] is a built-in [Variant] type that represents a signal of an [Object] instance. Like all [Variant] types, it can be stored in variables and passed to functions. Signals allow all connected [Callable]s (and by extension their respective objects) to listen and react to events, without directly referencing one another. This keeps the code flexible and easier to manage.
#desc In GDScript, signals can be declared with the [code]signal[/code] keyword. In C#, you may use the [code][Signal][/code] attribute on a delegate.
#desc [codeblocks]
#desc [gdscript]
#desc signal attacked
#desc 
#desc # Additional arguments may be declared.
#desc # These arguments must be passed when the signal is emitted.
#desc signal item_dropped(item_name, amount)
#desc [/gdscript]
#desc [csharp]
#desc [Signal]
#desc delegate void AttackedEventHandler();
#desc 
#desc // Additional arguments may be declared.
#desc // These arguments must be passed when the signal is emitted.
#desc [Signal]
#desc delegate void ItemDroppedEventHandler(string itemName, int amount);
#desc [/csharp]
#desc [/codeblocks]
#tutorial [Using Signals] https://docs.godotengine.org/en/stable/getting_started/step_by_step/signals.html
#tutorial [GDScript Basics] https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_basics.html#signals
class_name Signal



#desc Constructs an empty [Signal] with no object nor signal name bound.
func Signal() -> Signal:
	pass;

#desc Constructs a [Signal] as a copy of the given [Signal].
func Signal(from: Signal) -> Signal:
	pass;

#desc Creates a new [Signal] named [param signal] in the specified [param object].
func Signal(object: Object, signal: StringName) -> Signal:
	pass;


#desc Connects this signal to the specified [param callable]. Optional [param flags] can be also added to configure the connection's behavior (see [enum Object.ConnectFlags] constants). You can provide additional arguments to the connected [param callable] by using [method Callable.bind].
#desc A signal can only be connected once to the same [Callable]. If the signal is already connected, returns [constant ERR_INVALID_PARAMETER] and pushes an error message, unless the signal is connected with [constant Object.CONNECT_REFERENCE_COUNTED]. To prevent this, use [method is_connected] first to check for existing connections.
#desc [codeblock]
#desc for button in $Buttons.get_children():
#desc button.pressed.connect(_on_pressed.bind(button))
#desc 
#desc func _on_pressed(button):
#desc print(button.name, " was pressed")
#desc [/codeblock]
func connect(callable: Callable, flags: int = 0) -> int:
	pass;

#desc Disconnects this signal from the specified [Callable]. If the connection does not exist, generates an error. Use [method is_connected] to make sure that the connection exists.
func disconnect(callable: Callable) -> void:
	pass;

#desc Emits this signal. All [Callable]s connected to this signal will be triggered. This method supports a variable number of arguments, so parameters can be passed as a comma separated list.
vararg func emit() -> void:
	pass;

#desc Returns an [Array] of connections for this signal. Each connection is represented as a [Dictionary] that contains three entries:
#desc - [code]signal[/code] is a reference to this signal;
#desc - [code]callable[/code] is a reference to the connected [Callable];
#desc - [code]flags[/code] is a combination of [enum Object.ConnectFlags].
func get_connections() -> Array:
	pass;

#desc Returns the name of this signal.
func get_name() -> StringName:
	pass;

#desc Returns the object emitting this signal.
func get_object() -> Object:
	pass;

#desc Returns the ID of the object emitting this signal (see [method Object.get_instance_id]).
func get_object_id() -> int:
	pass;

#desc Returns [code]true[/code] if the specified [Callable] is connected to this signal.
func is_connected(callable: Callable) -> bool:
	pass;

#desc Returns [code]true[/code] if the signal's name does not exist in its object, or the object is not valid.
func is_null() -> bool:
	pass;


