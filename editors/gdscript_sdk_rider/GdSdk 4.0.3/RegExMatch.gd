extends RefCounted
#brief Contains the results of a [RegEx] search.
#desc Contains the results of a single [RegEx] match returned by [method RegEx.search] and [method RegEx.search_all]. It can be used to find the position and range of the match and its capturing groups, and it can extract its substring for you.
class_name RegExMatch


#desc A dictionary of named groups and its corresponding group number. Only groups that were matched are included. If multiple groups have the same name, that name would refer to the first matching one.
var names: Dictionary:
	get = get_names

#desc An [Array] of the match and its capturing groups.
var strings: PackedStringArray:
	get = get_strings

#desc The source string used with the search pattern to find this matching result.
var subject: String:
	get = get_subject



#desc Returns the end position of the match within the source string. The end position of capturing groups can be retrieved by providing its group number as an integer or its string name (if it's a named group). The default value of 0 refers to the whole pattern.
#desc Returns -1 if the group did not match or doesn't exist.
func get_end(name: Variant = 0) -> int:
	pass;

#desc Returns the number of capturing groups.
func get_group_count() -> int:
	pass;

#desc Returns the starting position of the match within the source string. The starting position of capturing groups can be retrieved by providing its group number as an integer or its string name (if it's a named group). The default value of 0 refers to the whole pattern.
#desc Returns -1 if the group did not match or doesn't exist.
func get_start(name: Variant = 0) -> int:
	pass;

#desc Returns the substring of the match from the source string. Capturing groups can be retrieved by providing its group number as an integer or its string name (if it's a named group). The default value of 0 refers to the whole pattern.
#desc Returns an empty string if the group did not match or doesn't exist.
func get_string(name: Variant = 0) -> String:
	pass;


func get_names() -> Dictionary:
	return names

func get_strings() -> PackedStringArray:
	return strings

func get_subject() -> String:
	return subject

