extends Object
#brief Bridge between Godot and the Mono runtime (Mono-enabled builds only).
#desc This class is a bridge between Godot and the Mono runtime. It exposes several low-level operations and is only available in Mono-enabled Godot builds.
#desc See also [CSharpScript].
class_name GodotSharp




#desc Returns [code]true[/code] if the .NET runtime is initialized, [code]false[/code] otherwise.
func is_runtime_initialized() -> bool:
	pass;


