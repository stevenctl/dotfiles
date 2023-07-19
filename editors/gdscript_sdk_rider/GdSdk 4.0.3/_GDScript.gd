#brief Built-in GDScript functions.
#desc A list of GDScript-specific utility functions and annotations accessible from any script.
#desc For the list of the global functions and constants see [@GlobalScope].
#tutorial [GDScript exports] https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_exports.html
class_name _GDScript

#desc Constant that represents how many times the diameter of a circle fits around its perimeter. This is equivalent to [code]TAU / 2[/code], or 180 degrees in rotations.
const PI = 3.14159265358979;

#desc The circle constant, the circumference of the unit circle in radians. This is equivalent to [code]PI * 2[/code], or 360 degrees in rotations.
const TAU = 6.28318530717959;

#desc Positive floating-point infinity. This is the result of floating-point division when the divisor is [code]0.0[/code]. For negative infinity, use [code]-INF[/code]. Dividing by [code]-0.0[/code] will result in negative infinity if the numerator is positive, so dividing by [code]0.0[/code] is not the same as dividing by [code]-0.0[/code] (despite [code]0.0 == -0.0[/code] returning [code]true[/code]).
#desc [b]Warning:[/b] Numeric infinity is only a concept with floating-point numbers, and has no equivalent for integers. Dividing an integer number by [code]0[/code] will not result in [constant INF] and will result in a run-time error instead.
const INF = inf;

#desc "Not a Number", an invalid floating-point value. [constant NAN] has special properties, including that it is not equal to itself ([code]NAN == NAN[/code] returns [code]false[/code]). It is output by some invalid operations, such as dividing floating-point [code]0.0[/code] by [code]0.0[/code].
#desc [b]Warning:[/b] "Not a Number" is only a concept with floating-point numbers, and has no equivalent for integers. Dividing an integer [code]0[/code] by [code]0[/code] will not result in [constant NAN] and will result in a run-time error instead.
const NAN = nan;




#desc Returns a [Color] constructed from red ([param r8]), green ([param g8]), blue ([param b8]), and optionally alpha ([param a8]) integer channels, each divided by [code]255.0[/code] for their final value. Using [method Color8] instead of the standard [Color] constructor is useful when you need to match exact color values in an [Image].
#desc [codeblock]
#desc var red = Color8(255, 0, 0)             # Same as Color(1, 0, 0).
#desc var dark_blue = Color8(0, 0, 51)        # Same as Color(0, 0, 0.2).
#desc var my_color = Color8(306, 255, 0, 102) # Same as Color(1.2, 1, 0, 0.4).
#desc [/codeblock]
#desc [b]Note:[/b] Due to the lower precision of [method Color8] compared to the standard [Color] constructor, a color created with [method Color8] will generally not be equal to the same color created with the standard [Color] constructor. Use [method Color.is_equal_approx] for comparisons to avoid issues with floating-point precision error.
func Color8(r8: int, g8: int, b8: int, a8: int = 255) -> Color:
	pass;

#desc Asserts that the [param condition] is [code]true[/code]. If the [param condition] is [code]false[/code], an error is generated. When running from the editor, the running project will also be paused until you resume it. This can be used as a stronger form of [method @GlobalScope.push_error] for reporting errors to project developers or add-on users.
#desc An optional [param message] can be shown in addition to the generic "Assertion failed" message. You can use this to provide additional details about why the assertion failed.
#desc [b]Warning:[/b] For performance reasons, the code inside [method assert] is only executed in debug builds or when running the project from the editor. Don't include code that has side effects in an [method assert] call. Otherwise, the project will behave differently when exported in release mode.
#desc [codeblock]
#desc # Imagine we always want speed to be between 0 and 20.
#desc var speed = -10
#desc assert(speed < 20) # True, the program will continue.
#desc assert(speed >= 0) # False, the program will stop.
#desc assert(speed >= 0 and speed < 20) # You can also combine the two conditional statements in one check.
#desc assert(speed < 20, "the speed limit is 20") # Show a message.
#desc [/codeblock]
func assert(condition: bool, message: String = "") -> void:
	pass;

#desc Returns a single character (as a [String]) of the given Unicode code point (which is compatible with ASCII code).
#desc [codeblock]
#desc a = char(65)      # a is "A"
#desc a = char(65 + 32) # a is "a"
#desc a = char(8364)    # a is "€"
#desc [/codeblock]
func char(char: int) -> String:
	pass;

#desc Converts [param what] to [param type] in the best way possible. The [param type] uses the [enum Variant.Type] values.
#desc [codeblock]
#desc var a = [4, 2.5, 1.2]
#desc print(a is Array) # Prints true
#desc 
#desc var b = convert(a, TYPE_PACKED_BYTE_ARRAY)
#desc print(b)          # Prints [4, 2, 1]
#desc print(b is Array) # Prints false
#desc [/codeblock]
func convert(what: Variant, type: int) -> Variant:
	pass;

#desc Converts a [param dictionary] (created with [method inst_to_dict]) back to an Object instance. Can be useful for deserializing.
func dict_to_inst(dictionary: Dictionary) -> Object:
	pass;

#desc Returns an array of dictionaries representing the current call stack. See also [method print_stack].
#desc [codeblock]
#desc func _ready():
#desc foo()
#desc 
#desc func foo():
#desc bar()
#desc 
#desc func bar():
#desc print(get_stack())
#desc [/codeblock]
#desc Starting from [code]_ready()[/code], [code]bar()[/code] would print:
#desc [codeblock]
#desc [{function:bar, line:12, source:res://script.gd}, {function:foo, line:9, source:res://script.gd}, {function:_ready, line:6, source:res://script.gd}]
#desc [/codeblock]
#desc [b]Note:[/b] This function only works if the running instance is connected to a debugging server (i.e. an editor instance). [method get_stack] will not work in projects exported in release mode, or in projects exported in debug mode if not connected to a debugging server.
#desc [b]Note:[/b] Calling this function from a [Thread] is not supported. Doing so will return an empty array.
func get_stack() -> Array:
	pass;

#desc Returns the passed [param instance] converted to a Dictionary. Can be useful for serializing.
#desc [b]Note:[/b] Cannot be used to serialize objects with built-in scripts attached or objects allocated within built-in scripts.
#desc [codeblock]
#desc var foo = "bar"
#desc func _ready():
#desc var d = inst_to_dict(self)
#desc print(d.keys())
#desc print(d.values())
#desc [/codeblock]
#desc Prints out:
#desc [codeblock]
#desc [@subpath, @path, foo]
#desc [, res://test.gd, bar]
#desc [/codeblock]
func inst_to_dict(instance: Object) -> Dictionary:
	pass;

#desc Returns [code]true[/code] if [param value] is an instance of [param type]. The [param type] value must be one of the following:
#desc - A constant from the [enum Variant.Type] enumeration, for example [constant TYPE_INT].
#desc - An [Object]-derived class which exists in [ClassDB], for example [Node].
#desc - A [Script] (you can use any class, including inner one).
#desc Unlike the right operand of the [code]is[/code] operator, [param type] can be a non-constant value. The [code]is[/code] operator supports more features (such as typed arrays) and is more performant. Use the operator instead of this method if you do not need dynamic type checking.
#desc Examples:
#desc [codeblock]
#desc print(is_instance_of(a, TYPE_INT))
#desc print(is_instance_of(a, Node))
#desc print(is_instance_of(a, MyClass))
#desc print(is_instance_of(a, MyClass.InnerClass))
#desc [/codeblock]
#desc [b]Note:[/b] If [param value] and/or [param type] are freed objects (see [method @GlobalScope.is_instance_valid]), or [param type] is not one of the above options, this method will raise a runtime error.
#desc See also [method @GlobalScope.typeof], [method type_exists], [method Array.is_same_typed] (and other [Array] methods).
func is_instance_of(value: Variant, type: Variant) -> bool:
	pass;

#desc Returns the length of the given Variant [param var]. The length can be the character count of a [String], the element count of any array type or the size of a [Dictionary]. For every other Variant type, a run-time error is generated and execution is stopped.
#desc [codeblock]
#desc a = [1, 2, 3, 4]
#desc len(a) # Returns 4
#desc 
#desc b = "Hello!"
#desc len(b) # Returns 6
#desc [/codeblock]
func len(variable: Variant) -> int:
	pass;

#desc Returns a [Resource] from the filesystem located at the absolute [param path]. Unless it's already referenced elsewhere (such as in another script or in the scene), the resource is loaded from disk on function call, which might cause a slight delay, especially when loading large scenes. To avoid unnecessary delays when loading something multiple times, either store the resource in a variable or use [method preload].
#desc [b]Note:[/b] Resource paths can be obtained by right-clicking on a resource in the FileSystem dock and choosing "Copy Path", or by dragging the file from the FileSystem dock into the current script.
#desc [codeblock]
#desc # Load a scene called "main" located in the root of the project directory and cache it in a variable.
#desc var main = load("res://main.tscn") # main will contain a PackedScene resource.
#desc [/codeblock]
#desc [b]Important:[/b] The path must be absolute. A relative path will always return [code]null[/code].
#desc This function is a simplified version of [method ResourceLoader.load], which can be used for more advanced scenarios.
#desc [b]Note:[/b] Files have to be imported into the engine first to load them using this function. If you want to load [Image]s at run-time, you may use [method Image.load]. If you want to import audio files, you can use the snippet described in [member AudioStreamMP3.data].
#desc [b]Note:[/b] If [member ProjectSettings.editor/export/convert_text_resources_to_binary] is [code]true[/code], [method @GDScript.load] will not be able to read converted files in an exported project. If you rely on run-time loading of files present within the PCK, set [member ProjectSettings.editor/export/convert_text_resources_to_binary] to [code]false[/code].
func load(path: String) -> Resource:
	pass;

#desc Returns a [Resource] from the filesystem located at [param path]. During run-time, the resource is loaded when the script is being parsed. This function effectively acts as a reference to that resource. Note that this function requires [param path] to be a constant [String]. If you want to load a resource from a dynamic/variable path, use [method load].
#desc [b]Note:[/b] Resource paths can be obtained by right-clicking on a resource in the Assets Panel and choosing "Copy Path", or by dragging the file from the FileSystem dock into the current script.
#desc [codeblock]
#desc # Create instance of a scene.
#desc var diamond = preload("res://diamond.tscn").instantiate()
#desc [/codeblock]
func preload(path: String) -> Resource:
	pass;

#desc Like [method @GlobalScope.print], but includes the current stack frame when running with the debugger turned on.
#desc The output in the console may look like the following:
#desc [codeblock]
#desc Test print
#desc At: res://test.gd:15:_process()
#desc [/codeblock]
#desc [b]Note:[/b] Calling this function from a [Thread] is not supported. Doing so will instead print the thread ID.
vararg func print_debug() -> void:
	pass;

#desc Prints a stack trace at the current code location. See also [method get_stack].
#desc The output in the console may look like the following:
#desc [codeblock]
#desc Frame 0 - res://test.gd:16 in function '_process'
#desc [/codeblock]
#desc [b]Note:[/b] This function only works if the running instance is connected to a debugging server (i.e. an editor instance). [method print_stack] will not work in projects exported in release mode, or in projects exported in debug mode if not connected to a debugging server.
#desc [b]Note:[/b] Calling this function from a [Thread] is not supported. Doing so will instead print the thread ID.
func print_stack() -> void:
	pass;

#desc Returns an array with the given range. [method range] can be called in three ways:
#desc [code]range(n: int)[/code]: Starts from 0, increases by steps of 1, and stops [i]before[/i] [code]n[/code]. The argument [code]n[/code] is [b]exclusive[/b].
#desc [code]range(b: int, n: int)[/code]: Starts from [code]b[/code], increases by steps of 1, and stops [i]before[/i] [code]n[/code]. The arguments [code]b[/code] and [code]n[/code] are [b]inclusive[/b] and [b]exclusive[/b], respectively.
#desc [code]range(b: int, n: int, s: int)[/code]: Starts from [code]b[/code], increases/decreases by steps of [code]s[/code], and stops [i]before[/i] [code]n[/code]. The arguments [code]b[/code] and [code]n[/code] are [b]inclusive[/b] and [b]exclusive[/b], respectively. The argument [code]s[/code] [b]can[/b] be negative, but not [code]0[/code]. If [code]s[/code] is [code]0[/code], an error message is printed.
#desc [method range] converts all arguments to [int] before processing.
#desc [b]Note:[/b] Returns an empty array if no value meets the value constraint (e.g. [code]range(2, 5, -1)[/code] or [code]range(5, 5, 1)[/code]).
#desc Examples:
#desc [codeblock]
#desc print(range(4))        # Prints [0, 1, 2, 3]
#desc print(range(2, 5))     # Prints [2, 3, 4]
#desc print(range(0, 6, 2))  # Prints [0, 2, 4]
#desc print(range(4, 1, -1)) # Prints [4, 3, 2]
#desc [/codeblock]
#desc To iterate over an [Array] backwards, use:
#desc [codeblock]
#desc var array = [3, 6, 9]
#desc for i in range(array.size(), 0, -1):
#desc print(array[i - 1])
#desc [/codeblock]
#desc Output:
#desc [codeblock]
#desc 9
#desc 6
#desc 3
#desc [/codeblock]
#desc To iterate over [float], convert them in the loop.
#desc [codeblock]
#desc for i in range (3, 0, -1):
#desc print(i / 10.0)
#desc [/codeblock]
#desc Output:
#desc [codeblock]
#desc 0.3
#desc 0.2
#desc 0.1
#desc [/codeblock]
vararg func range() -> Array:
	pass;

#desc Returns [code]true[/code] if the given [Object]-derived class exists in [ClassDB]. Note that [Variant] data types are not registered in [ClassDB].
#desc [codeblock]
#desc type_exists("Sprite2D") # Returns true
#desc type_exists("NonExistentClass") # Returns false
#desc [/codeblock]
func type_exists(type: StringName) -> bool:
	pass;


