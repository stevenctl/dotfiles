extends RefCounted
#brief Class for searching text for patterns using regular expressions.
#desc A regular expression (or regex) is a compact language that can be used to recognize strings that follow a specific pattern, such as URLs, email addresses, complete sentences, etc. For example, a regex of [code]ab[0-9][/code] would find any string that is [code]ab[/code] followed by any number from [code]0[/code] to [code]9[/code]. For a more in-depth look, you can easily find various tutorials and detailed explanations on the Internet.
#desc To begin, the RegEx object needs to be compiled with the search pattern using [method compile] before it can be used.
#desc [codeblock]
#desc var regex = RegEx.new()
#desc regex.compile("\\w-(\\d+)")
#desc [/codeblock]
#desc The search pattern must be escaped first for GDScript before it is escaped for the expression. For example, [code]compile("\\d+")[/code] would be read by RegEx as [code]\d+[/code]. Similarly, [code]compile("\"(?:\\\\.|[^\"])*\"")[/code] would be read as [code]"(?:\\.|[^"])*"[/code].
#desc Using [method search], you can find the pattern within the given text. If a pattern is found, [RegExMatch] is returned and you can retrieve details of the results using methods such as [method RegExMatch.get_string] and [method RegExMatch.get_start].
#desc [codeblock]
#desc var regex = RegEx.new()
#desc regex.compile("\\w-(\\d+)")
#desc var result = regex.search("abc n-0123")
#desc if result:
#desc print(result.get_string()) # Would print n-0123
#desc [/codeblock]
#desc The results of capturing groups [code]()[/code] can be retrieved by passing the group number to the various methods in [RegExMatch]. Group 0 is the default and will always refer to the entire pattern. In the above example, calling [code]result.get_string(1)[/code] would give you [code]0123[/code].
#desc This version of RegEx also supports named capturing groups, and the names can be used to retrieve the results. If two or more groups have the same name, the name would only refer to the first one with a match.
#desc [codeblock]
#desc var regex = RegEx.new()
#desc regex.compile("d(?<digit>[0-9]+)|x(?<digit>[0-9a-f]+)")
#desc var result = regex.search("the number is x2f")
#desc if result:
#desc print(result.get_string("digit")) # Would print 2f
#desc [/codeblock]
#desc If you need to process multiple results, [method search_all] generates a list of all non-overlapping results. This can be combined with a [code]for[/code] loop for convenience.
#desc [codeblock]
#desc for result in regex.search_all("d01, d03, d0c, x3f and x42"):
#desc print(result.get_string("digit"))
#desc # Would print 01 03 0 3f 42
#desc [/codeblock]
#desc [b]Example of splitting a string using a RegEx:[/b]
#desc [codeblock]
#desc var regex = RegEx.new()
#desc regex.compile("\\S+") # Negated whitespace character class.
#desc var results = []
#desc for result in regex.search_all("One  Two \n\tThree"):
#desc results.push_back(result.get_string())
#desc # The `results` array now contains "One", "Two", "Three".
#desc [/codeblock]
#desc [b]Note:[/b] Godot's regex implementation is based on the [url=https://www.pcre.org/]PCRE2[/url] library. You can view the full pattern reference [url=https://www.pcre.org/current/doc/html/pcre2pattern.html]here[/url].
#desc [b]Tip:[/b] You can use [url=https://regexr.com/]Regexr[/url] to test regular expressions online.
class_name RegEx




#desc This method resets the state of the object, as if it was freshly created. Namely, it unassigns the regular expression of this object.
func clear() -> void:
	pass;

#desc Compiles and assign the search pattern to use. Returns [constant OK] if the compilation is successful. If an error is encountered, details are printed to standard output and an error is returned.
func compile(pattern: String) -> int:
	pass;

#desc Creates and compiles a new [RegEx] object.
static func create_from_string(pattern: String) -> RegEx:
	pass;

#desc Returns the number of capturing groups in compiled pattern.
func get_group_count() -> int:
	pass;

#desc Returns an array of names of named capturing groups in the compiled pattern. They are ordered by appearance.
func get_names() -> PackedStringArray:
	pass;

#desc Returns the original search pattern that was compiled.
func get_pattern() -> String:
	pass;

#desc Returns whether this object has a valid search pattern assigned.
func is_valid() -> bool:
	pass;

#desc Searches the text for the compiled pattern. Returns a [RegExMatch] container of the first matching result if found, otherwise [code]null[/code].
#desc The region to search within can be specified with [param offset] and [param end]. This is useful when searching for another match in the same [param subject] by calling this method again after a previous success. Note that setting these parameters differs from passing over a shortened string. For example, the start anchor [code]^[/code] is not affected by [param offset], and the character before [param offset] will be checked for the word boundary [code]\b[/code].
func search(subject: String, offset: int = 0, end: int = -1) -> RegExMatch:
	pass;

#desc Searches the text for the compiled pattern. Returns an array of [RegExMatch] containers for each non-overlapping result. If no results were found, an empty array is returned instead.
#desc The region to search within can be specified with [param offset] and [param end]. This is useful when searching for another match in the same [param subject] by calling this method again after a previous success. Note that setting these parameters differs from passing over a shortened string. For example, the start anchor [code]^[/code] is not affected by [param offset], and the character before [param offset] will be checked for the word boundary [code]\b[/code].
func search_all(subject: String, offset: int = 0, end: int = -1) -> Array[RegExMatch]:
	pass;

#desc Searches the text for the compiled pattern and replaces it with the specified string. Escapes and backreferences such as [code]$1[/code] and [code]$name[/code] are expanded and resolved. By default, only the first instance is replaced, but it can be changed for all instances (global replacement).
#desc The region to search within can be specified with [param offset] and [param end]. This is useful when searching for another match in the same [param subject] by calling this method again after a previous success. Note that setting these parameters differs from passing over a shortened string. For example, the start anchor [code]^[/code] is not affected by [param offset], and the character before [param offset] will be checked for the word boundary [code]\b[/code].
func sub(subject: String, replacement: String, all: bool = false, offset: int = 0, end: int = -1) -> String:
	pass;


