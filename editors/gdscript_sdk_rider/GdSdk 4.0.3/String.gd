#brief Built-in string Variant type.
#desc This is the built-in string Variant type (and the one used by GDScript). Strings may contain any number of Unicode characters, and expose methods useful for manipulating and generating strings. Strings are reference-counted and use a copy-on-write approach (every modification to a string returns a new [String]), so passing them around is cheap in resources.
#desc Some string methods have corresponding variations. Variations suffixed with [code]n[/code] ([method countn], [method findn], [method replacen], etc.) are [b]case-insensitive[/b] (they make no distinction between uppercase and lowercase letters). Method variations prefixed with [code]r[/code] ([method rfind], [method rsplit], etc.) are reversed, and start from the end of the string, instead of the beginning.
#desc [b]Note:[/b] In a boolean context, a string will evaluate to [code]false[/code] if it is empty ([code]""[/code]). Otherwise, a string will always evaluate to [code]true[/code].
#tutorial [GDScript format strings] https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_format_string.html
class_name String



#desc Constructs an empty [String] ([code]""[/code]).
func String() -> String:
	pass;

#desc Constructs a [String] as a copy of the given [String].
func String(from: String) -> String:
	pass;

#desc Constructs a new [String] from the given [NodePath].
func String(from: NodePath) -> String:
	pass;

#desc Constructs a new [String] from the given [StringName].
func String(from: StringName) -> String:
	pass;


#desc Returns [code]true[/code] if the string begins with the given [param text]. See also [method ends_with].
func begins_with(text: String) -> bool:
	pass;

#desc Returns an array containing the bigrams (pairs of consecutive characters) of this string.
#desc [codeblock]
#desc print("Get up!".bigrams()) # Prints ["Ge", "et", "t ", " u", "up", "p!"]
#desc [/codeblock]
func bigrams() -> PackedStringArray:
	pass;

#desc Converts the string representing a binary number into an [int]. The string may optionally be prefixed with [code]"0b"[/code], and an additional [code]-[/code] prefix for negative numbers.
#desc [codeblocks]
#desc [gdscript]
#desc print("101".bin_to_int())   # Prints 5
#desc print("0b101".bin_to_int()) # Prints 5
#desc print("-0b10".bin_to_int()) # Prints -2
#desc [/gdscript]
#desc [csharp]
#desc GD.Print("101".BinToInt());   // Prints 5
#desc GD.Print("0b101".BinToInt()); // Prints 5
#desc GD.Print("-0b10".BinToInt()); // Prints -2
#desc [/csharp]
#desc [/codeblocks]
func bin_to_int() -> int:
	pass;

#desc Returns a copy of the string with special characters escaped using the C language standard.
func c_escape() -> String:
	pass;

#desc Returns a copy of the string with escaped characters replaced by their meanings. Supported escape sequences are [code]\'[/code], [code]\"[/code], [code]\\[/code], [code]\a[/code], [code]\b[/code], [code]\f[/code], [code]\n[/code], [code]\r[/code], [code]\t[/code], [code]\v[/code].
#desc [b]Note:[/b] Unlike the GDScript parser, this method doesn't support the [code]\uXXXX[/code] escape sequence.
func c_unescape() -> String:
	pass;

#desc Changes the appearance of the string: replaces underscores ([code]_[/code]) with spaces, adds spaces before uppercase letters in the middle of a word, converts all letters to lowercase, then converts the first one and each one following a space to uppercase.
#desc [codeblocks]
#desc [gdscript]
#desc "move_local_x".capitalize()   # Returns "Move Local X"
#desc "sceneFile_path".capitalize() # Returns "Scene File Path"
#desc [/gdscript]
#desc [csharp]
#desc "move_local_x".Capitalize();   // Returns "Move Local X"
#desc "sceneFile_path".Capitalize(); // Returns "Scene File Path"
#desc [/csharp]
#desc [/codeblocks]
#desc [b]Note:[/b] This method not the same as the default appearance of properties in the Inspector dock, as it does not capitalize acronyms ([code]"2D"[/code], [code]"FPS"[/code], [code]"PNG"[/code], etc.) as you may expect.
func capitalize() -> String:
	pass;

#desc Performs a case-sensitive comparison to another string. Returns [code]-1[/code] if less than, [code]1[/code] if greater than, or [code]0[/code] if equal. "Less than" and "greater than" are determined by the [url=https://en.wikipedia.org/wiki/List_of_Unicode_characters]Unicode code points[/url] of each string, which roughly matches the alphabetical order.
#desc With different string lengths, returns [code]1[/code] if this string is longer than the [param to] string, or [code]-1[/code] if shorter. Note that the length of empty strings is [i]always[/i] [code]0[/code].
#desc To get a [bool] result from a string comparison, use the [code]==[/code] operator instead. See also [method nocasecmp_to] and [method naturalnocasecmp_to].
func casecmp_to(to: String) -> int:
	pass;

#desc Returns a single Unicode character from the decimal [param char]. You may use [url=https://unicodelookup.com/]unicodelookup.com[/url] or [url=https://www.unicode.org/charts/]unicode.org[/url] as points of reference.
#desc [codeblock]
#desc print(String.chr(65))     # Prints "A"
#desc print(String.chr(129302)) # Prints "🤖" (robot face emoji)
#desc [/codeblock]
static func chr(char: int) -> String:
	pass;

#desc Returns [code]true[/code] if the string contains [param what]. In GDScript, this corresponds to the [code]in[/code] operator.
#desc [codeblocks]
#desc [gdscript]
#desc print("Node".contains("de")) # Prints true
#desc print("team".contains("I"))  # Prints false
#desc print("I" in "team")         # Prints false
#desc [/gdscript]
#desc [csharp]
#desc GD.Print("Node".Contains("de")); // Prints true
#desc GD.Print("team".Contains("I"));  // Prints false
#desc [/csharp]
#desc [/codeblocks]
#desc If you need to know where [param what] is within the string, use [method find].
func contains(what: String) -> bool:
	pass;

#desc Returns the number of occurrences of the substring [param what] between [param from] and [param to] positions. If [param to] is 0, the search continues until the end of the string.
func count(what: String, from: int = 0, to: int = 0) -> int:
	pass;

#desc Returns the number of occurrences of the substring [param what] between [param from] and [param to] positions, [b]ignoring case[/b]. If [param to] is 0, the search continues until the end of the string.
func countn(what: String, from: int = 0, to: int = 0) -> int:
	pass;

#desc Returns a copy of the string with indentation (leading tabs and spaces) removed. See also [method indent] to add indentation.
func dedent() -> String:
	pass;

#desc Returns [code]true[/code] if the string ends with the given [param text]. See also [method begins_with].
func ends_with(text: String) -> bool:
	pass;

#desc Returns the index of the [b]first[/b] occurrence of [param what] in this string, or [code]-1[/code] if there are none. The search's start can be specified with [param from], continuing to the end of the string.
#desc [codeblocks]
#desc [gdscript]
#desc print("Team".find("I")) # Prints -1
#desc 
#desc print("Potato".find("t"))    # Prints 2
#desc print("Potato".find("t", 3)) # Prints 4
#desc print("Potato".find("t", 5)) # Prints -1
#desc [/gdscript]
#desc [csharp]
#desc GD.Print("Team".Find("I")); // Prints -1
#desc 
#desc GD.Print("Potato".Find("t"));    // Prints 2
#desc GD.Print("Potato".Find("t", 3)); // Prints 4
#desc GD.Print("Potato".Find("t", 5)); // Prints -1
#desc [/csharp]
#desc [/codeblocks]
#desc [b]Note:[/b] If you just want to know whether the string contains [param what], use [method contains]. In GDScript, you may also use the [code]in[/code] operator.
func find(what: String, from: int = 0) -> int:
	pass;

#desc Returns the index of the [b]first[/b] [b]case-insensitive[/b] occurrence of [param what] in this string, or [code]-1[/code] if there are none. The starting search index can be specified with [param from], continuing to the end of the string.
func findn(what: String, from: int = 0) -> int:
	pass;

#desc Formats the string by replacing all occurrences of [param placeholder] with the elements of [param values].
#desc [param values] can be a [Dictionary] or an [Array]. Any underscores in [param placeholder] will be replaced with the corresponding keys in advance. Array elements use their index as keys.
#desc [codeblock]
#desc # Prints "Waiting for Godot is a play by Samuel Beckett, and Godot Engine is named after it."
#desc var use_array_values = "Waiting for {0} is a play by {1}, and {0} Engine is named after it."
#desc print(use_array_values.format(["Godot", "Samuel Beckett"]))
#desc 
#desc # Prints "User 42 is Godot."
#desc print("User {id} is {name}.".format({"id": 42, "name": "Godot"}))
#desc [/codeblock]
#desc Some additional handling is performed when [param values] is an [Array]. If [param placeholder] does not contain an underscore, the elements of the [param values] array will be used to replace one occurrence of the placeholder in order; If an element of [param values] is another 2-element array, it'll be interpreted as a key-value pair.
#desc [codeblock]
#desc # Prints "User 42 is Godot."
#desc print("User {} is {}.".format([42, "Godot"], "{}"))
#desc print("User {id} is {name}.".format([["id", 42], ["name", "Godot"]]))
#desc [/codeblock]
#desc See also the [url=$DOCS_URL/tutorials/scripting/gdscript/gdscript_format_string.html]GDScript format string[/url] tutorial.
#desc [b]Note:[/b] In C#, it's recommended to [url=https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/tokens/interpolated]interpolate strings with "$"[/url], instead.
func format(values: Variant, placeholder: String = "{_}") -> String:
	pass;

#desc If the string is a valid file path, returns the base directory name.
#desc [codeblock]
#desc var dir_path = "/path/to/file.txt".get_base_dir() # dir_path is "/path/to"
#desc [/codeblock]
func get_base_dir() -> String:
	pass;

#desc If the string is a valid file path, returns the full file path, without the extension.
#desc [codeblock]
#desc var base = "/path/to/file.txt".get_basename() # base is "/path/to/file"
#desc [/codeblock]
func get_basename() -> String:
	pass;

#desc If the string is a valid file name or path, returns the file extension without the leading period ([code].[/code]). Otherwise, returns an empty string.
#desc [codeblock]
#desc var a = "/path/to/file.txt".get_extension() # a is "txt"
#desc var b = "cool.txt".get_extension()          # b is "txt"
#desc var c = "cool.font.tres".get_extension()    # c is "tres"
#desc var d = ".pack1".get_extension()            # d is "pack1"
#desc 
#desc var e = "file.txt.".get_extension()  # e is ""
#desc var f = "file.txt..".get_extension() # f is ""
#desc var g = "txt".get_extension()        # g is ""
#desc var h = "".get_extension()           # h is ""
#desc [/codeblock]
func get_extension() -> String:
	pass;

#desc If the string is a valid file path, returns the file name, including the extension.
#desc [codeblock]
#desc var file = "/path/to/icon.png".get_file() # file is "icon.png"
#desc [/codeblock]
func get_file() -> String:
	pass;

#desc Splits the string using a [param delimiter] and returns the substring at index [param slice]. Returns an empty string if the [param slice] does not exist.
#desc This is faster than [method split], if you only need one substring.
#desc [b]Example:[/b]
#desc [codeblock]
#desc print("i/am/example/hi".get_slice("/", 2)) # Prints "example"
#desc [/codeblock]
func get_slice(delimiter: String, slice: int) -> String:
	pass;

#desc Returns the total number of slices when the string is split with the given [param delimiter] (see [method split]).
func get_slice_count(delimiter: String) -> int:
	pass;

#desc Splits the string using a Unicode character with code [param delimiter] and returns the substring at index [param slice]. Returns an empty string if the [param slice] does not exist.
#desc This is faster than [method split], if you only need one substring.
func get_slicec(delimiter: int, slice: int) -> String:
	pass;

#desc Returns the 32-bit hash value representing the string's contents.
#desc [b]Note:[/b] Strings with equal hash values are [i]not[/i] guaranteed to be the same, as a result of hash collisions. On the countrary, strings with different hash values are guaranteed to be different.
func hash() -> int:
	pass;

#desc Converts the string representing a hexadecimal number into an [int]. The string may be optionally prefixed with [code]"0x"[/code], and an additional [code]-[/code] prefix for negative numbers.
#desc [codeblocks]
#desc [gdscript]
#desc print("0xff".hex_to_int()) # Prints 255
#desc print("ab".hex_to_int())   # Prints 171
#desc [/gdscript]
#desc [csharp]
#desc GD.Print("0xff".HexToInt()); // Prints 255
#desc GD.Print("ab".HexToInt());   // Prints 171
#desc [/csharp]
#desc [/codeblocks]
func hex_to_int() -> int:
	pass;

#desc Converts [param size] which represents a number of bytes into a human-readable form.
#desc The result is in [url=https://en.wikipedia.org/wiki/Binary_prefix#IEC_prefixes]IEC prefix format[/url], which may end in either [code]"B"[/code], [code]"KiB"[/code], [code]"MiB"[/code], [code]"GiB"[/code], [code]"TiB"[/code], [code]"PiB"[/code], or [code]"EiB"[/code].
static func humanize_size(size: int) -> String:
	pass;

#desc Indents every line of the string with the given [param prefix]. Empty lines are not indented. See also [method dedent] to remove indentation.
#desc For example, the string can be indented with two tabulations using [code]"\t\t"[/code], or four spaces using [code]"    "[/code].
func indent(prefix: String) -> String:
	pass;

#desc Inserts [param what] at the given [param position] in the string.
func insert(position: int, what: String) -> String:
	pass;

#desc Returns [code]true[/code] if the string is a path to a file or directory, and its starting point is explicitly defined. This method is the opposite of [method is_relative_path].
#desc This includes all paths starting with [code]"res://"[/code], [code]"user://"[/code], [code]"C:\"[/code], [code]"/"[/code], etc.
func is_absolute_path() -> bool:
	pass;

#desc Returns [code]true[/code] if the string's length is [code]0[/code] ([code]""[/code]). See also [method length].
func is_empty() -> bool:
	pass;

#desc Returns [code]true[/code] if the string is a path, and its starting point is dependent on context. The path could begin from the current directory, or the current [Node] (if the string is derived from a [NodePath]), and may sometimes be prefixed with [code]"./"[/code]. This method is the opposite of [method is_absolute_path].
func is_relative_path() -> bool:
	pass;

#desc Returns [code]true[/code] if all characters of this string can be found in [param text] in their original order.
#desc [codeblock]
#desc var text = "Wow, incredible!"
#desc 
#desc print("inedible".is_subsequence_of(text)) # Prints true
#desc print("Word!".is_subsequence_of(text))    # Prints true
#desc print("Window".is_subsequence_of(text))   # Prints false
#desc print("".is_subsequence_of(text))         # Prints true
#desc [/codeblock]
func is_subsequence_of(text: String) -> bool:
	pass;

#desc Returns [code]true[/code] if all characters of this string can be found in [param text] in their original order, [b]ignoring case[/b].
func is_subsequence_ofn(text: String) -> bool:
	pass;

#desc Returns [code]true[/code] if this string does not contain characters that are not allowed in file names ([code]:[/code] [code]/[/code] [code]\[/code] [code]?[/code] [code]*[/code] [code]"[/code] [code]|[/code] [code]%[/code] [code]<[/code] [code]>[/code]).
func is_valid_filename() -> bool:
	pass;

#desc Returns [code]true[/code] if this string represents a valid floating-point number. A valid float may contain only digits, one decimal point ([code].[/code]), and the exponent letter ([code]e[/code]). It may also be prefixed with a positive ([code]+[/code]) or negative ([code]-[/code]) sign. Any valid integer is also a valid float (see [method is_valid_int]). See also [method to_float].
#desc [codeblock]
#desc print("1.7".is_valid_float())   # Prints true
#desc print("24".is_valid_float())    # Prints true
#desc print("7e3".is_valid_float())   # Prints true
#desc print("Hello".is_valid_float()) # Prints false
#desc [/codeblock]
func is_valid_float() -> bool:
	pass;

#desc Returns [code]true[/code] if this string is a valid hexadecimal number. A valid hexadecimal number only contains digits or letters [code]A[/code] to [code]F[/code] (either uppercase or lowercase), and may be prefixed with a positive ([code]+[/code]) or negative ([code]-[/code]) sign.
#desc If [param with_prefix] is [code]true[/code], the hexadecimal number needs to prefixed by [code]"0x"[/code] to be considered valid.
#desc [codeblock]
#desc print("A08E".is_valid_hex_number())    # Prints true
#desc print("-AbCdEf".is_valid_hex_number()) # Prints true
#desc print("2.5".is_valid_hex_number())     # Prints false
#desc 
#desc print("0xDEADC0DE".is_valid_hex_number(true)) # Prints true
#desc [/codeblock]
func is_valid_hex_number(with_prefix: bool = false) -> bool:
	pass;

#desc Returns [code]true[/code] if this string is a valid color in hexadecimal HTML notation. The string must be a hexadecimal value (see [method is_valid_hex_number]) of either 3, 4, 6 or 8 digits, and may be prefixed by a hash sign ([code]#[/code]). Other HTML notations for colors, such as names or [code]hsl()[/code], are not considered valid. See also [method Color.html].
func is_valid_html_color() -> bool:
	pass;

#desc Returns [code]true[/code] if this string is a valid identifier. A valid identifier may contain only letters, digits and underscores ([code]_[/code]), and the first character may not be a digit.
#desc [codeblock]
#desc print("node_2d".is_valid_identifier())    # Prints true
#desc print("TYPE_FLOAT".is_valid_identifier()) # Prints true
#desc print("1st_method".is_valid_identifier()) # Prints false
#desc print("MyMethod#2".is_valid_identifier()) # Prints false
#desc [/codeblock]
func is_valid_identifier() -> bool:
	pass;

#desc Returns [code]true[/code] if this string represents a valid integer. A valid integer only contains digits, and may be prefixed with a positive ([code]+[/code]) or negative ([code]-[/code]) sign. See also [method to_int].
#desc [codeblock]
#desc print("7".is_valid_int())    # Prints true
#desc print("1.65".is_valid_int()) # Prints false
#desc print("Hi".is_valid_int())   # Prints false
#desc print("+3".is_valid_int())   # Prints true
#desc print("-12".is_valid_int())  # Prints true
#desc [/codeblock]
func is_valid_int() -> bool:
	pass;

#desc Returns [code]true[/code] if this string represents a well-formatted IPv4 or IPv6 address. This method considers [url=https://en.wikipedia.org/wiki/Reserved_IP_addresses]reserved IP addresses[/url] such as [code]"0.0.0.0"[/code] and [code]"ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff"[/code] as valid.
func is_valid_ip_address() -> bool:
	pass;

#desc Returns the concatenation of [param parts]' elements, with each element separated by the string calling this method. This method is the opposite of [method split].
#desc [b]Example:[/b]
#desc [codeblocks]
#desc [gdscript]
#desc var fruits = ["Apple", "Orange", "Pear", "Kiwi"]
#desc 
#desc print(", ".join(fruits))  # Prints "Apple, Orange, Pear, Kiwi"
#desc print("---".join(fruits)) # Prints "Apple---Orange---Pear---Kiwi"
#desc [/gdscript]
#desc [csharp]
#desc var fruits = new string[] {"Apple", "Orange", "Pear", "Kiwi"};
#desc 
#desc // In C#, this method is static.
#desc GD.Print(string.Join(", ", fruits));  // Prints "Apple, Orange, Pear, Kiwi"
#desc GD.Print(string.Join("---", fruits)); // Prints "Apple---Orange---Pear---Kiwi"
#desc [/csharp]
#desc [/codeblocks]
func join(parts: PackedStringArray) -> String:
	pass;

#desc Returns a copy of the string with special characters escaped using the JSON standard. Because it closely matches the C standard, it is possible to use [method c_unescape] to unescape the string, if necessary.
func json_escape() -> String:
	pass;

#desc Returns the first [param length] characters from the beginning of the string. If [param length] is negative, strips the last [param length] characters from the string's end.
#desc [codeblock]
#desc print("Hello World!".left(3))  # Prints "Hel"
#desc print("Hello World!".left(-4)) # Prints "Hello Wo"
#desc [/codeblock]
func left(length: int) -> String:
	pass;

#desc Returns the number of characters in the string. Empty strings ([code]""[/code]) always return [code]0[/code]. See also [method is_empty].
func length() -> int:
	pass;

#desc Formats the string to be at least [param min_length] long by adding [param character]s to the left of the string, if necessary. See also [method rpad].
func lpad(min_length: int, character: String = " ") -> String:
	pass;

#desc Removes a set of characters defined in [param chars] from the string's beginning. See also [method rstrip].
#desc [b]Note:[/b] [param chars] is not a prefix. Use [method trim_prefix] to remove a single prefix, rather than a set of characters.
func lstrip(chars: String) -> String:
	pass;

#desc Does a simple expression match (also called "glob" or "globbing"), where [code]*[/code] matches zero or more arbitrary characters and [code]?[/code] matches any single character except a period ([code].[/code]). An empty string or empty expression always evaluates to [code]false[/code].
func match(expr: String) -> bool:
	pass;

#desc Does a simple [b]case-insensitive[/b] expression match, where [code]*[/code] matches zero or more arbitrary characters and [code]?[/code] matches any single character except a period ([code].[/code]). An empty string or empty expression always evaluates to [code]false[/code].
func matchn(expr: String) -> bool:
	pass;

#desc Returns the [url=https://en.wikipedia.org/wiki/MD5]MD5 hash[/url] of the string as a [PackedByteArray].
func md5_buffer() -> PackedByteArray:
	pass;

#desc Returns the [url=https://en.wikipedia.org/wiki/MD5]MD5 hash[/url] of the string as another [String].
func md5_text() -> String:
	pass;

#desc Performs a [b]case-insensitive[/b], [i]natural order[/i] comparison to another string. Returns [code]-1[/code] if less than, [code]1[/code] if greater than, or [code]0[/code] if equal. "Less than" or "greater than" are determined by the [url=https://en.wikipedia.org/wiki/List_of_Unicode_characters]Unicode code points[/url] of each string, which roughly matches the alphabetical order. Internally, lowercase characters are converted to uppercase for the comparison.
#desc When used for sorting, natural order comparison orders sequences of numbers by the combined value of each digit as is often expected, instead of the single digit's value. A sorted sequence of numbered strings will be [code]["1", "2", "3", ...][/code], not [code]["1", "10", "2", "3", ...][/code].
#desc With different string lengths, returns [code]1[/code] if this string is longer than the [param to] string, or [code]-1[/code] if shorter. Note that the length of empty strings is [i]always[/i] [code]0[/code].
#desc To get a [bool] result from a string comparison, use the [code]==[/code] operator instead. See also [method nocasecmp_to] and [method casecmp_to].
func naturalnocasecmp_to(to: String) -> int:
	pass;

#desc Performs a [b]case-insensitive[/b] comparison to another string. Returns [code]-1[/code] if less than, [code]1[/code] if greater than, or [code]0[/code] if equal. "Less than" or "greater than" are determined by the [url=https://en.wikipedia.org/wiki/List_of_Unicode_characters]Unicode code points[/url] of each string, which roughly matches the alphabetical order. Internally, lowercase characters are converted to uppercase for the comparison.
#desc With different string lengths, returns [code]1[/code] if this string is longer than the [param to] string, or [code]-1[/code] if shorter. Note that the length of empty strings is [i]always[/i] [code]0[/code].
#desc To get a [bool] result from a string comparison, use the [code]==[/code] operator instead. See also [method casecmp_to] and [method naturalnocasecmp_to].
func nocasecmp_to(to: String) -> int:
	pass;

#desc Converts a [float] to a string representation of a decimal number, with the number of decimal places specified in [param decimals].
#desc If [param decimals] is [code]-1[/code] as by default, the string representation may only have up to 14 significant digits, with digits before the decimal point having priority over digits after.
#desc Trailing zeros are not included in the string. The last digit is rounded, not truncated.
#desc [b]Example:[/b]
#desc [codeblock]
#desc String.num(3.141593)     # Returns "3.141593"
#desc String.num(3.141593, 3)  # Returns "3.142"
#desc String.num(3.14159300)   # Returns "3.141593"
#desc 
#desc # Here, the last digit will be rounded up,
#desc # which reduces the total digit count, since trailing zeros are removed:
#desc String.num(42.129999, 5) # Returns "42.13"
#desc 
#desc # If `decimals` is not specified, the maximum number of significant digits is 14:
#desc String.num(-0.0000012345432123454321)     # Returns "-0.00000123454321"
#desc String.num(-10000.0000012345432123454321) # Returns "-10000.0000012345"
#desc [/codeblock]
static func num(number: float, decimals: int = -1) -> String:
	pass;

#desc Converts the given [param number] to a string representation, with the given [param base].
#desc By default, [param base] is set to decimal ([code]10[/code]). Other common bases in programming include binary ([code]2[/code]), [url=https://en.wikipedia.org/wiki/Octal]octal[/url] ([code]8[/code]), hexadecimal ([code]16[/code]).
#desc If [param capitalize_hex] is [code]true[/code], digits higher than 9 are represented in uppercase.
static func num_int64(number: int, base: int = 10, capitalize_hex: bool = false) -> String:
	pass;

#desc Converts the given [param number] to a string representation, in scientific notation.
#desc [codeblocks]
#desc [gdscript]
#desc var n = -5.2e8
#desc print(n)                       # Prints -520000000
#desc print(String.NumScientific(n)) # Prints -5.2e+08
#desc [/gdscript]
#desc [csharp]
#desc // This method is not implemented in C#.
#desc // Use `string.ToString()` with "e" to achieve similar results.
#desc var n = -5.2e8f;
#desc GD.Print(n);                // Prints -520000000
#desc GD.Print(n.ToString("e1")); // Prints -5.2e+008
#desc [/csharp]
#desc [/codeblocks]
#desc [b]Note:[/b] In C#, this method is not implemented. To achieve similar results, see C#'s [url=https://learn.microsoft.com/en-us/dotnet/standard/base-types/standard-numeric-format-strings]Standard numeric format strings[/url]
static func num_scientific(number: float) -> String:
	pass;

#desc Converts the given unsigned [int] to a string representation, with the given [param base].
#desc By default, [param base] is set to decimal ([code]10[/code]). Other common bases in programming include binary ([code]2[/code]), [url=https://en.wikipedia.org/wiki/Octal]octal[/url] ([code]8[/code]), hexadecimal ([code]16[/code]).
#desc If [param capitalize_hex] is [code]true[/code], digits higher than 9 are represented in uppercase.
static func num_uint64(number: int, base: int = 10, capitalize_hex: bool = false) -> String:
	pass;

#desc Formats the string representing a number to have an exact number of [param digits] [i]after[/i] the decimal point.
func pad_decimals(digits: int) -> String:
	pass;

#desc Formats the string representing a number to have an exact number of [param digits] [i]before[/i] the decimal point.
func pad_zeros(digits: int) -> String:
	pass;

#desc Concatenates [param file] at the end of the string as a subpath, adding [code]/[/code] if necessary.
#desc [b]Example:[/b] [code]"this/is".path_join("path") == "this/is/path"[/code].
func path_join(file: String) -> String:
	pass;

#desc Repeats this string a number of times. [param count] needs to be greater than [code]0[/code]. Otherwise, returns an empty string.
func repeat(count: int) -> String:
	pass;

#desc Replaces all occurrences of [param what] inside the string with the given [param forwhat].
func replace(what: String, forwhat: String) -> String:
	pass;

#desc Replaces all [b]case-insensitive[/b] occurrences of [param what] inside the string with the given [param forwhat].
func replacen(what: String, forwhat: String) -> String:
	pass;

#desc Returns the index of the [b]last[/b] occurrence of [param what] in this string, or [code]-1[/code] if there are none. The search's start can be specified with [param from], continuing to the beginning of the string. This method is the reverse of [method find].
func rfind(what: String, from: int = -1) -> int:
	pass;

#desc Returns the index of the [b]last[/b] [b]case-insensitive[/b] occurrence of [param what] in this string, or [code]-1[/code] if there are none. The starting search index can be specified with [param from], continuing to the beginning of the string. This method is the reverse of [method findn].
func rfindn(what: String, from: int = -1) -> int:
	pass;

#desc Returns the last [param length] characters from the end of the string. If [param length] is negative, strips the first [param length] characters from the string's beginning.
#desc [codeblock]
#desc print("Hello World!".right(3))  # Prints "ld!"
#desc print("Hello World!".right(-4)) # Prints "o World!"
#desc [/codeblock]
func right(length: int) -> String:
	pass;

#desc Formats the string to be at least [param min_length] long, by adding [param character]s to the right of the string, if necessary. See also [method lpad].
func rpad(min_length: int, character: String = " ") -> String:
	pass;

#desc Splits the string using a [param delimiter] and returns an array of the substrings, starting from the end of the string. The splits in the returned array appear in the same order as the original string. If [param delimiter] is an empty string, each substring will be a single character.
#desc If [param allow_empty] is [code]false[/code], empty strings between adjacent delimiters are excluded from the array.
#desc If [param maxsplit] is greater than [code]0[/code], the number of splits may not exceed [param maxsplit]. By default, the entire string is split, which is mostly identical to [method split].
#desc [b]Example:[/b]
#desc [codeblocks]
#desc [gdscript]
#desc var some_string = "One,Two,Three,Four"
#desc var some_array = some_string.rsplit(",", true, 1)
#desc 
#desc print(some_array.size()) # Prints 2
#desc print(some_array[0])     # Prints "One,Two,Three"
#desc print(some_array[1])     # Prints "Four"
#desc [/gdscript]
#desc [csharp]
#desc // In C#, there is no String.RSplit() method.
#desc [/csharp]
#desc [/codeblocks]
func rsplit(delimiter: String = "", allow_empty: bool = true, maxsplit: int = 0) -> PackedStringArray:
	pass;

#desc Removes a set of characters defined in [param chars] from the string's end. See also [method lstrip].
#desc [b]Note:[/b] [param chars] is not a suffix. Use [method trim_suffix] to remove a single suffix, rather than a set of characters.
func rstrip(chars: String) -> String:
	pass;

#desc Returns the [url=https://en.wikipedia.org/wiki/SHA-1]SHA-1[/url] hash of the string as a [PackedByteArray].
func sha1_buffer() -> PackedByteArray:
	pass;

#desc Returns the [url=https://en.wikipedia.org/wiki/SHA-1]SHA-1[/url] hash of the string as another [String].
func sha1_text() -> String:
	pass;

#desc Returns the [url=https://en.wikipedia.org/wiki/SHA-2]SHA-256[/url] hash of the string as a [PackedByteArray].
func sha256_buffer() -> PackedByteArray:
	pass;

#desc Returns the [url=https://en.wikipedia.org/wiki/SHA-2]SHA-256[/url] hash of the string as another [String].
func sha256_text() -> String:
	pass;

#desc Returns the similarity index ([url=https://en.wikipedia.org/wiki/S%C3%B8rensen%E2%80%93Dice_coefficient]Sorensen-Dice coefficient[/url]) of this string compared to another. A result of [code]1.0[/code] means totally similar, while [code]0.0[/code] means totally dissimilar.
#desc [codeblock]
#desc print("ABC123".similarity("ABC123")) # Prints 1.0
#desc print("ABC123".similarity("XYZ456")) # Prints 0.0
#desc print("ABC123".similarity("123ABC")) # Prints 0.8
#desc print("ABC123".similarity("abc123")) # Prints 0.4
#desc [/codeblock]
func similarity(text: String) -> float:
	pass;

#desc If the string is a valid file path, converts the string into a canonical path. This is the shortest possible path, without [code]"./"[/code], and all the unnecessary [code]".."[/code] and [code]"/"[/code].
#desc [codeblock]
#desc var simple_path = "./path/to///../file".simplify_path()
#desc print(simple_path) # Prints "path/file"
#desc [/codeblock]
func simplify_path() -> String:
	pass;

#desc Splits the string using a [param delimiter] and returns an array of the substrings. If [param delimiter] is an empty string, each substring will be a single character. This method is the opposite of [method join].
#desc If [param allow_empty] is [code]false[/code], empty strings between adjacent delimiters are excluded from the array.
#desc If [param maxsplit] is greater than [code]0[/code], the number of splits may not exceed [param maxsplit]. By default, the entire string is split.
#desc [b]Example:[/b]
#desc [codeblocks]
#desc [gdscript]
#desc var some_array = "One,Two,Three,Four".split(",", true, 2)
#desc 
#desc print(some_array.size()) # Prints 3
#desc print(some_array[0])     # Prints "One"
#desc print(some_array[1])     # Prints "Two"
#desc print(some_array[2])     # Prints "Three,Four"
#desc [/gdscript]
#desc [csharp]
#desc // C#'s `Split()` does not support the `maxsplit` parameter.
#desc var someArray = "One,Two,Three".Split(",");
#desc 
#desc GD.Print(someArray[0]); // Prints "One"
#desc GD.Print(someArray[1]); // Prints "Two"
#desc GD.Print(someArray[2]); // Prints "Three"
#desc [/csharp]
#desc [/codeblocks]
#desc [b]Note:[/b] If you only need one substring from the array, consider using [method get_slice] which is faster. If you need to split strings with more complex rules, use the [RegEx] class instead.
func split(delimiter: String = "", allow_empty: bool = true, maxsplit: int = 0) -> PackedStringArray:
	pass;

#desc Splits the string into floats by using a [param delimiter] and returns a [PackedFloat64Array].
#desc If [param allow_empty] is [code]false[/code], empty or invalid [float] conversions between adjacent delimiters are excluded.
#desc [codeblock]
#desc var a = "1,2,4.5".split_floats(",")         # a is [1.0, 2.0, 4.5]
#desc var c = "1| ||4.5".split_floats("|")        # c is [1.0, 0.0, 0.0, 4.5]
#desc var b = "1| ||4.5".split_floats("|", false) # b is [1.0, 4.5]
#desc [/codeblock]
func split_floats(delimiter: String, allow_empty: bool = true) -> PackedFloat64Array:
	pass;

#desc Strips all non-printable characters from the beginning and the end of the string. These include spaces, tabulations ([code]\t[/code]), and newlines ([code]\n[/code] [code]\r[/code]).
#desc If [param left] is [code]false[/code], ignores the string's beginning. Likewise, if [param right] is [code]false[/code], ignores the string's end.
func strip_edges(left: bool = true, right: bool = true) -> String:
	pass;

#desc Strips all escape characters from the string. These include all non-printable control characters of the first page of the ASCII table (values from 0 to 31), such as tabulation ([code]\t[/code]) and newline ([code]\n[/code], [code]\r[/code]) characters, but [i]not[/i] spaces.
func strip_escapes() -> String:
	pass;

#desc Returns part of the string from the position [param from] with length [param len]. If [param len] is [code]-1[/code] (as by default), returns the rest of the string starting from the given position.
func substr(from: int, len: int = -1) -> String:
	pass;

#desc Converts the string to an [url=https://en.wikipedia.org/wiki/ASCII]ASCII[/url]/Latin-1 encoded [PackedByteArray]. This method is slightly faster than [method to_utf8_buffer], but replaces all unsupported characters with spaces.
func to_ascii_buffer() -> PackedByteArray:
	pass;

#desc Returns the string converted to [code]camelCase[/code].
func to_camel_case() -> String:
	pass;

#desc Converts the string representing a decimal number into a [float]. This method stops on the first non-number character, except the first decimal point ([code].[/code]) and the exponent letter ([code]e[/code]). See also [method is_valid_float].
#desc [codeblock]
#desc var a = "12.35".to_float() # a is 12.35
#desc var b = "1.2.3".to_float() # b is 1.2
#desc var c = "12xy3".to_float() # c is 12.0
#desc var d = "1e3".to_float()   # d is 1000.0
#desc var e = "Hello!".to_int()  # e is 0.0
#desc [/codeblock]
func to_float() -> float:
	pass;

#desc Converts the string representing an integer number into an [int]. This method removes any non-number character and stops at the first decimal point ([code].[/code]). See also [method is_valid_int].
#desc [codeblock]
#desc var a = "123".to_int()    # a is 123
#desc var b = "x1y2z3".to_int() # b is 123
#desc var c = "-1.2.3".to_int() # c is -1
#desc var d = "Hello!".to_int() # d is 0
#desc [/codeblock]
func to_int() -> int:
	pass;

#desc Returns the string converted to lowercase.
func to_lower() -> String:
	pass;

#desc Returns the string converted to [code]PascalCase[/code].
func to_pascal_case() -> String:
	pass;

#desc Returns the string converted to [code]snake_case[/code].
func to_snake_case() -> String:
	pass;

#desc Returns the string converted to uppercase.
func to_upper() -> String:
	pass;

#desc Converts the string to a [url=https://en.wikipedia.org/wiki/UTF-16]UTF-16[/url] encoded [PackedByteArray].
func to_utf16_buffer() -> PackedByteArray:
	pass;

#desc Converts the string to a [url=https://en.wikipedia.org/wiki/UTF-32]UTF-32[/url] encoded [PackedByteArray].
func to_utf32_buffer() -> PackedByteArray:
	pass;

#desc Converts the string to a [url=https://en.wikipedia.org/wiki/UTF-8]UTF-8[/url] encoded [PackedByteArray]. This method is slightly slower than [method to_ascii_buffer], but supports all UTF-8 characters. For most cases, prefer using this method.
func to_utf8_buffer() -> PackedByteArray:
	pass;

#desc Removes the given [param prefix] from the start of the string, or returns the string unchanged.
func trim_prefix(prefix: String) -> String:
	pass;

#desc Removes the given [param suffix] from the end of the string, or returns the string unchanged.
func trim_suffix(suffix: String) -> String:
	pass;

#desc Returns the character code at position [param at].
func unicode_at(at: int) -> int:
	pass;

#desc Decodes the string from its URL-encoded format. This method is meant to properly decode the parameters in a URL when receiving an HTTP request. See also [method uri_encode].
#desc [codeblocks]
#desc [gdscript]
#desc var url = "$DOCS_URL/?highlight=Godot%20Engine%3%docs"
#desc print(url.uri_decode()) # Prints "$DOCS_URL/?highlight=Godot Engine:docs"
#desc [/gdscript]
#desc [csharp]
#desc var url = "$DOCS_URL/?highlight=Godot%20Engine%3%docs"
#desc GD.Print(url.URIDecode()) // Prints "$DOCS_URL/?highlight=Godot Engine:docs"
#desc [/csharp]
#desc [/codeblocks]
func uri_decode() -> String:
	pass;

#desc Encodes the string to URL-friendly format. This method is meant to properly encode the parameters in a URL when sending an HTTP request. See also [method uri_decode].
#desc [codeblocks]
#desc [gdscript]
#desc var prefix = "$DOCS_URL/?highlight="
#desc var url = prefix + "Godot Engine:docs".uri_encode()
#desc 
#desc print(url) # Prints "$DOCS_URL/?highlight=Godot%20Engine%3%docs"
#desc [/gdscript]
#desc [csharp]
#desc var prefix = "$DOCS_URL/?highlight=";
#desc var url = prefix + "Godot Engine:docs".URIEncode();
#desc 
#desc GD.Print(url); // Prints "$DOCS_URL/?highlight=Godot%20Engine%3%docs"
#desc [/csharp]
#desc [/codeblocks]
func uri_encode() -> String:
	pass;

#desc Returns a copy of the string with all characters that are not allowed in [method is_valid_filename] replaced with underscores.
func validate_filename() -> String:
	pass;

#desc Returns a copy of the string with all characters that are not allowed in [member Node.name] removed ([code].[/code] [code]:[/code] [code]@[/code] [code]/[/code] [code]"[/code] [code]%[/code]).
func validate_node_name() -> String:
	pass;

#desc Returns a copy of the string with special characters escaped using the XML standard. If [param escape_quotes] is [code]true[/code], the single quote ([code]'[/code]) and double quote ([code]"[/code]) characters are also escaped.
func xml_escape(escape_quotes: bool = false) -> String:
	pass;

#desc Returns a copy of the string with escaped characters replaced by their meanings according to the XML standard.
func xml_unescape() -> String:
	pass;


