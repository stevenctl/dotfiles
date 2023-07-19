#brief Built-in type representing a method in an object instance or a standalone function.
#desc [Callable] is a built-in [Variant] type that represents a function. It can either be a method within an [Object] instance, or a standalone function not related to any object, like a lambda function. Like all [Variant] types, it can be stored in variables and passed to other functions. It is most commonly used for signal callbacks.
#desc [b]Example:[/b]
#desc [codeblocks]
#desc [gdscript]
#desc func print_args(arg1, arg2, arg3 = ""):
#desc prints(arg1, arg2, arg3)
#desc 
#desc func test():
#desc var callable = Callable(self, "print_args")
#desc callable.call("hello", "world")  # Prints "hello world ".
#desc callable.call(Vector2.UP, 42, callable)  # Prints "(0, -1) 42 Node(node.gd)::print_args".
#desc callable.call("invalid")  # Invalid call, should have at least 2 arguments.
#desc [/gdscript]
#desc [csharp]
#desc // Default parameter values are not supported.
#desc public void PrintArgs(Variant arg1, Variant arg2, Variant arg3 = default)
#desc {
#desc GD.PrintS(arg1, arg2, arg3);
#desc }
#desc 
#desc public void Test()
#desc {
#desc // Invalid calls fail silently.
#desc Callable callable = new Callable(this, MethodName.PrintArgs);
#desc callable.Call("hello", "world"); // Default parameter values are not supported, should have 3 arguments.
#desc callable.Call(Vector2.Up, 42, callable); // Prints "(0, -1) 42 Node(Node.cs)::PrintArgs".
#desc callable.Call("invalid"); // Invalid call, should have 3 arguments.
#desc }
#desc [/csharp]
#desc [/codeblocks]
#desc In GDScript, it's possible to create lambda functions within a method. Lambda functions are custom callables that are not associated with an [Object] instance. Optionally, lambda functions can also be named. The name will be displayed in the debugger, or when calling [method get_method].
#desc [codeblock]
#desc func _init():
#desc var my_lambda = func (message):
#desc print(message)
#desc 
#desc # Prints Hello everyone!
#desc my_lambda.call("Hello everyone!")
#desc 
#desc # Prints "Attack!", when the button_pressed signal is emitted.
#desc button_pressed.connect(func(): print("Attack!"))
#desc [/codeblock]
class_name Callable



#desc Constructs an empty [Callable], with no object nor method bound.
func Callable() -> Callable:
	pass;

#desc Constructs a [Callable] as a copy of the given [Callable].
func Callable(from: Callable) -> Callable:
	pass;

#desc Creates a new [Callable] for the method named [param method] in the specified [param object].
func Callable(object: Object, method: StringName) -> Callable:
	pass;


#desc Returns a copy of this [Callable] with one or more arguments bound. When called, the bound arguments are passed [i]after[/i] the arguments supplied by [method call]. See also [method unbind].
#desc [b]Note:[/b] When this method is chained with other similar methods, the order in which the argument list is modified is read from right to left.
vararg func bind() -> Callable:
	pass;

#desc Returns a copy of this [Callable] with one or more arguments bound, reading them from an array. When called, the bound arguments are passed [i]after[/i] the arguments supplied by [method call]. See also [method unbind].
#desc [b]Note:[/b] When this method is chained with other similar methods, the order in which the argument list is modified is read from right to left.
func bindv(arguments: Array) -> Callable:
	pass;

#desc Calls the method represented by this [Callable]. Arguments can be passed and should match the method's signature.
vararg func call() -> Variant:
	pass;

#desc Calls the method represented by this [Callable] in deferred mode, i.e. during the idle frame. Arguments can be passed and should match the method's signature.
#desc [codeblock]
#desc func _ready():
#desc grab_focus.call_deferred()
#desc [/codeblock]
vararg func call_deferred() -> void:
	pass;

#desc Calls the method represented by this [Callable]. Unlike [method call], this method expects all arguments to be contained inside the [param arguments] [Array].
func callv(arguments: Array) -> Variant:
	pass;

#desc Return the bound arguments (as long as [method get_bound_arguments_count] is greater than zero), or empty (if [method get_bound_arguments_count] is less than or equal to zero).
func get_bound_arguments() -> Array:
	pass;

#desc Returns the total amount of arguments bound (or unbound) via successive [method bind] or [method unbind] calls. If the amount of arguments unbound is greater than the ones bound, this function returns a value less than zero.
func get_bound_arguments_count() -> int:
	pass;

#desc Returns the name of the method represented by this [Callable]. If the callable is a lambda function, returns the function's name.
func get_method() -> StringName:
	pass;

#desc Returns the object on which this [Callable] is called.
func get_object() -> Object:
	pass;

#desc Returns the ID of this [Callable]'s object (see [method Object.get_instance_id]).
func get_object_id() -> int:
	pass;

#desc Returns the 32-bit hash value of this [Callable]'s object.
#desc [b]Note:[/b] [Callable]s with equal content will always produce identical hash values. However, the reverse is not true. Returning identical hash values does [i]not[/i] imply the callables are equal, because different callables can have identical hash values due to hash collisions. The engine uses a 32-bit hash algorithm for [method hash].
func hash() -> int:
	pass;

#desc Returns [code]true[/code] if this [Callable] is a custom callable. Custom callables are created from [method bind] or [method unbind]. In GDScript, lambda functions are also custom callables.
func is_custom() -> bool:
	pass;

#desc Returns [code]true[/code] if this [Callable] has no target to call the method on.
func is_null() -> bool:
	pass;

#desc Returns [code]true[/code] if this [Callable] is a standard callable. This method is the opposite of [method is_custom]. Returns [code]false[/code] if this callable is a lambda function.
func is_standard() -> bool:
	pass;

#desc Returns [code]true[/code] if the callable's object exists and has a valid method name assigned, or is a custom callable.
func is_valid() -> bool:
	pass;

#desc Perform an RPC (Remote Procedure Call). This is used for multiplayer and is normally not available, unless the function being called has been marked as [i]RPC[/i]. Calling this method on unsupported functions will result in an error. See [method Node.rpc].
vararg func rpc() -> void:
	pass;

#desc Perform an RPC (Remote Procedure Call) on a specific peer ID (see multiplayer documentation for reference). This is used for multiplayer and is normally not available unless the function being called has been marked as [i]RPC[/i]. Calling this method on unsupported functions will result in an error. See [method Node.rpc_id].
vararg func rpc_id(peer_id: int) -> void:
	pass;

#desc Returns a copy of this [Callable] with a number of arguments unbound. In other words, when the new callable is called the last few arguments supplied by the user are ignored, according to [param argcount]. The remaining arguments are passed to the callable. This allows to use the original callable in a context that attempts to pass more arguments than this callable can handle, e.g. a signal with a fixed number of arguments. See also [method bind].
#desc [b]Note:[/b] When this method is chained with other similar methods, the order in which the argument list is modified is read from right to left.
#desc [codeblock]
#desc func _ready():
#desc foo.unbind(1).call(1, 2) # Calls foo(1).
#desc foo.bind(3, 4).unbind(1).call(1, 2) # Calls foo(1, 3, 4), note that it does not change the arguments from bind.
#desc [/codeblock]
func unbind(argcount: int) -> Callable:
	pass;


