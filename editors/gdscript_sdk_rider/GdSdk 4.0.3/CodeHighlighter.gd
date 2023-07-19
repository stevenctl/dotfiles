extends SyntaxHighlighter
#brief A syntax highlighter for code.
#desc A syntax highlighter for code.
class_name CodeHighlighter


#desc Sets the color regions. All existing regions will be removed. The [Dictionary] key is the region start and end key, separated by a space. The value is the region color.
var color_regions: Dictionary:
	get = get_color_regions, set = set_color_regions

#desc Sets color for functions. A function is a non-keyword string followed by a '('.
var function_color: Color:
	get = get_function_color, set = set_function_color

#desc Sets the keyword colors. All existing keywords will be removed. The [Dictionary] key is the keyword. The value is the keyword color.
var keyword_colors: Dictionary:
	get = get_keyword_colors, set = set_keyword_colors

#desc Sets the member keyword colors. All existing member keyword will be removed. The [Dictionary] key is the member keyword. The value is the member keyword color.
var member_keyword_colors: Dictionary:
	get = get_member_keyword_colors, set = set_member_keyword_colors

#desc Sets color for member variables. A member variable is non-keyword, non-function string proceeded with a '.'.
var member_variable_color: Color:
	get = get_member_variable_color, set = set_member_variable_color

#desc Sets the color for numbers.
var number_color: Color:
	get = get_number_color, set = set_number_color

#desc Sets the color for symbols.
var symbol_color: Color:
	get = get_symbol_color, set = set_symbol_color



#desc Adds a color region such as comments or strings.
#desc Both the start and end keys must be symbols. Only the start key has to be unique.
#desc [param line_only] denotes if the region should continue until the end of the line or carry over on to the next line. If the end key is blank this is automatically set to [code]true[/code].
func add_color_region(start_key: String, end_key: String, color: Color, line_only: bool = false) -> void:
	pass;

#desc Sets the color for a keyword.
#desc The keyword cannot contain any symbols except '_'.
func add_keyword_color(keyword: String, color: Color) -> void:
	pass;

#desc Sets the color for a member keyword.
#desc The member keyword cannot contain any symbols except '_'.
#desc It will not be highlighted if preceded by a '.'.
func add_member_keyword_color(member_keyword: String, color: Color) -> void:
	pass;

#desc Removes all color regions.
func clear_color_regions() -> void:
	pass;

#desc Removes all keywords.
func clear_keyword_colors() -> void:
	pass;

#desc Removes all member keywords.
func clear_member_keyword_colors() -> void:
	pass;

#desc Returns the color for a keyword.
func get_keyword_color(keyword: String) -> Color:
	pass;

#desc Returns the color for a member keyword.
func get_member_keyword_color(member_keyword: String) -> Color:
	pass;

#desc Returns [code]true[/code] if the start key exists, else [code]false[/code].
func has_color_region(start_key: String) -> bool:
	pass;

#desc Returns [code]true[/code] if the keyword exists, else [code]false[/code].
func has_keyword_color(keyword: String) -> bool:
	pass;

#desc Returns [code]true[/code] if the member keyword exists, else [code]false[/code].
func has_member_keyword_color(member_keyword: String) -> bool:
	pass;

#desc Removes the color region that uses that start key.
func remove_color_region(start_key: String) -> void:
	pass;

#desc Removes the keyword.
func remove_keyword_color(keyword: String) -> void:
	pass;

#desc Removes the member keyword.
func remove_member_keyword_color(member_keyword: String) -> void:
	pass;


func get_color_regions() -> Dictionary:
	return color_regions

func set_color_regions(value: Dictionary) -> void:
	color_regions = value

func get_function_color() -> Color:
	return function_color

func set_function_color(value: Color) -> void:
	function_color = value

func get_keyword_colors() -> Dictionary:
	return keyword_colors

func set_keyword_colors(value: Dictionary) -> void:
	keyword_colors = value

func get_member_keyword_colors() -> Dictionary:
	return member_keyword_colors

func set_member_keyword_colors(value: Dictionary) -> void:
	member_keyword_colors = value

func get_member_variable_color() -> Color:
	return member_variable_color

func set_member_variable_color(value: Color) -> void:
	member_variable_color = value

func get_number_color() -> Color:
	return number_color

func set_number_color(value: Color) -> void:
	number_color = value

func get_symbol_color() -> Color:
	return symbol_color

func set_symbol_color(value: Color) -> void:
	symbol_color = value

