#brief Built-in integer Variant type.
#desc Signed 64-bit integer type. This means that it can take values from [code]-2^63[/code] to [code]2^63 - 1[/code], i.e. from [code]-9223372036854775808[/code] to [code]9223372036854775807[/code]. When it exceeds these bounds, it will wrap around.
#desc [int]s can be automatically converted to [float]s when necessary, for example when passing them as arguments in functions. The [float] will be as close to the original integer as possible.
#desc Likewise, [float]s can be automatically converted into [int]s. This will truncate the [float], discarding anything after the floating point.
#desc [b]Note:[/b] In a boolean context, an [int] will evaluate to [code]false[/code] if it equals [code]0[/code], and to [code]true[/code] otherwise.
#desc [codeblocks]
#desc [gdscript]
#desc var x: int = 1 # x is 1
#desc x = 4.2 # x is 4, because 4.2 gets truncated
#desc var max_int = 9223372036854775807 # Biggest value an int can store
#desc max_int += 1 # max_int is -9223372036854775808, because it wrapped around
#desc [/gdscript]
#desc [csharp]
#desc int x = 1; // x is 1
#desc x = 4.2; // x is 4, because 4.2 gets truncated
#desc // We use long below, because GDScript's int is 64-bit while C#'s int is 32-bit.
#desc long maxLong = 9223372036854775807; // Biggest value a long can store
#desc maxLong++; // maxLong is now -9223372036854775808, because it wrapped around.
#desc 
#desc // Alternatively with C#'s 32-bit int type, which has a smaller maximum value.
#desc int maxInt = 2147483647; // Biggest value an int can store
#desc maxInt++; // maxInt is now -2147483648, because it wrapped around
#desc [/csharp]
#desc [/codeblocks]
#desc In GDScript, you can use the [code]0b[/code] literal for binary representation, the [code]0x[/code] literal for hexadecimal representation, and the [code]_[/code] symbol to separate long numbers and improve readability.
#desc [codeblock]
#desc var x = 0b1001 # x is 9
#desc var y = 0xF5 # y is 245
#desc var z = 10_000_000 # z is 10000000
#desc [/codeblock]
class_name int



#desc Constructs an [int] set to [code]0[/code].
func int() -> int:
	pass;

#desc Constructs an [int] as a copy of the given [int].
func int(from: int) -> int:
	pass;

#desc Constructs a new [int] from a [String], following the same rules as [method String.to_int].
func int(from: String) -> int:
	pass;

#desc Constructs a new [int] from a [bool]. [code]true[/code] is converted to [code]1[/code] and [code]false[/code] is converted to [code]0[/code].
func int(from: bool) -> int:
	pass;

#desc Constructs a new [int] from a [float]. This will truncate the [float], discarding anything after the floating point.
func int(from: float) -> int:
	pass;



