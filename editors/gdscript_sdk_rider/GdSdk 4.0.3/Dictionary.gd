#brief Dictionary type.
#desc Dictionary type. Associative container, which contains values referenced by unique keys. Dictionaries are composed of pairs of keys (which must be unique) and values. Dictionaries will preserve the insertion order when adding new entries. In other programming languages, this data structure is sometimes referred to as a hash map or associative array.
#desc You can define a dictionary by placing a comma-separated list of [code]key: value[/code] pairs in curly braces [code]{}[/code].
#desc [b]Note:[/b] Dictionaries are always passed by reference. To get a copy of a dictionary which can be modified independently of the original dictionary, use [method duplicate].
#desc Creating a dictionary:
#desc [codeblocks]
#desc [gdscript]
#desc var my_dict = {} # Creates an empty dictionary.
#desc 
#desc var dict_variable_key = "Another key name"
#desc var dict_variable_value = "value2"
#desc var another_dict = {
#desc "Some key name": "value1",
#desc dict_variable_key: dict_variable_value,
#desc }
#desc 
#desc var points_dict = {"White": 50, "Yellow": 75, "Orange": 100}
#desc 
#desc # Alternative Lua-style syntax.
#desc # Doesn't require quotes around keys, but only string constants can be used as key names.
#desc # Additionally, key names must start with a letter or an underscore.
#desc # Here, `some_key` is a string literal, not a variable!
#desc another_dict = {
#desc some_key = 42,
#desc }
#desc [/gdscript]
#desc [csharp]
#desc var myDict = new Godot.Collections.Dictionary(); // Creates an empty dictionary.
#desc var pointsDict = new Godot.Collections.Dictionary
#desc {
#desc {"White", 50},
#desc {"Yellow", 75},
#desc {"Orange", 100}
#desc };
#desc [/csharp]
#desc [/codeblocks]
#desc You can access a dictionary's value by referencing its corresponding key. In the above example, [code]points_dict["White"][/code] will return [code]50[/code]. You can also write [code]points_dict.White[/code], which is equivalent. However, you'll have to use the bracket syntax if the key you're accessing the dictionary with isn't a fixed string (such as a number or variable).
#desc [codeblocks]
#desc [gdscript]
#desc @export_enum("White", "Yellow", "Orange") var my_color: String
#desc var points_dict = {"White": 50, "Yellow": 75, "Orange": 100}
#desc func _ready():
#desc # We can't use dot syntax here as `my_color` is a variable.
#desc var points = points_dict[my_color]
#desc [/gdscript]
#desc [csharp]
#desc [Export(PropertyHint.Enum, "White,Yellow,Orange")]
#desc public string MyColor { get; set; }
#desc private Godot.Collections.Dictionary _pointsDict = new Godot.Collections.Dictionary
#desc {
#desc {"White", 50},
#desc {"Yellow", 75},
#desc {"Orange", 100}
#desc };
#desc 
#desc public override void _Ready()
#desc {
#desc int points = (int)_pointsDict[MyColor];
#desc }
#desc [/csharp]
#desc [/codeblocks]
#desc In the above code, [code]points[/code] will be assigned the value that is paired with the appropriate color selected in [code]my_color[/code].
#desc Dictionaries can contain more complex data:
#desc [codeblocks]
#desc [gdscript]
#desc var my_dict = {
#desc "First Array": [1, 2, 3, 4] # Assigns an Array to a String key.
#desc }
#desc [/gdscript]
#desc [csharp]
#desc var myDict = new Godot.Collections.Dictionary
#desc {
#desc {"First Array", new Godot.Collections.Array{1, 2, 3, 4}}
#desc };
#desc [/csharp]
#desc [/codeblocks]
#desc To add a key to an existing dictionary, access it like an existing key and assign to it:
#desc [codeblocks]
#desc [gdscript]
#desc var points_dict = {"White": 50, "Yellow": 75, "Orange": 100}
#desc points_dict["Blue"] = 150 # Add "Blue" as a key and assign 150 as its value.
#desc [/gdscript]
#desc [csharp]
#desc var pointsDict = new Godot.Collections.Dictionary
#desc {
#desc {"White", 50},
#desc {"Yellow", 75},
#desc {"Orange", 100}
#desc };
#desc pointsDict["Blue"] = 150; // Add "Blue" as a key and assign 150 as its value.
#desc [/csharp]
#desc [/codeblocks]
#desc Finally, dictionaries can contain different types of keys and values in the same dictionary:
#desc [codeblocks]
#desc [gdscript]
#desc # This is a valid dictionary.
#desc # To access the string "Nested value" below, use `my_dict.sub_dict.sub_key` or `my_dict["sub_dict"]["sub_key"]`.
#desc # Indexing styles can be mixed and matched depending on your needs.
#desc var my_dict = {
#desc "String Key": 5,
#desc 4: [1, 2, 3],
#desc 7: "Hello",
#desc "sub_dict": {"sub_key": "Nested value"},
#desc }
#desc [/gdscript]
#desc [csharp]
#desc // This is a valid dictionary.
#desc // To access the string "Nested value" below, use `((Godot.Collections.Dictionary)myDict["sub_dict"])["sub_key"]`.
#desc var myDict = new Godot.Collections.Dictionary {
#desc {"String Key", 5},
#desc {4, new Godot.Collections.Array{1,2,3}},
#desc {7, "Hello"},
#desc {"sub_dict", new Godot.Collections.Dictionary{{"sub_key", "Nested value"}}}
#desc };
#desc [/csharp]
#desc [/codeblocks]
#desc The keys of a dictionary can be iterated with the [code]for[/code] keyword:
#desc [codeblocks]
#desc [gdscript]
#desc var groceries = {"Orange": 20, "Apple": 2, "Banana": 4}
#desc for fruit in groceries:
#desc var amount = groceries[fruit]
#desc [/gdscript]
#desc [csharp]
#desc var groceries = new Godot.Collections.Dictionary{{"Orange", 20}, {"Apple", 2}, {"Banana", 4}};
#desc foreach (var (fruit, amount) in groceries)
#desc {
#desc // `fruit` is the key, `amount` is the value.
#desc }
#desc [/csharp]
#desc [/codeblocks]
#desc [b]Note:[/b] Erasing elements while iterating over dictionaries is [b]not[/b] supported and will result in unpredictable behavior.
#tutorial [GDScript basics: Dictionary] https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_basics.html#dictionary
#tutorial [3D Voxel Demo] https://godotengine.org/asset-library/asset/676
#tutorial [OS Test Demo] https://godotengine.org/asset-library/asset/677
class_name Dictionary



#desc Constructs an empty [Dictionary].
func Dictionary() -> Dictionary:
	pass;

#desc Returns the same dictionary as [param from]. If you need a copy of the dictionary, use [method duplicate].
func Dictionary(from: Dictionary) -> Dictionary:
	pass;


#desc Clears the dictionary, removing all entries from it.
func clear() -> void:
	pass;

#desc Creates and returns a new copy of the dictionary. If [param deep] is [code]true[/code], inner [Dictionary] and [Array] keys and values are also copied, recursively.
func duplicate(deep: bool = false) -> Dictionary:
	pass;

#desc Removes the dictionary entry by key, if it exists. Returns [code]true[/code] if the given [param key] existed in the dictionary, otherwise [code]false[/code].
#desc [b]Note:[/b] Do not erase entries while iterating over the dictionary. You can iterate over the [method keys] array instead.
func erase(key: Variant) -> bool:
	pass;

#desc Finds and returns the first key whose associated value is equal to [param value], or [code]null[/code] if it is not found.
#desc [b]Note:[/b] [code]null[/code] is also a valid key. If inside the dictionary, [method find_key] may give misleading results.
func find_key(value: Variant) -> Variant:
	pass;

#desc Returns the corresponding value for the given [param key] in the dictionary. If the [param key] does not exist, returns [param default], or [code]null[/code] if the parameter is omitted.
func get(key: Variant, default: Variant = null) -> Variant:
	pass;

#desc Returns [code]true[/code] if the dictionary contains an entry with the given [param key].
#desc [codeblocks]
#desc [gdscript]
#desc var my_dict = {
#desc "Godot" : 4,
#desc 210 : null,
#desc }
#desc 
#desc print(my_dict.has("Godot")) # Prints true
#desc print(my_dict.has(210))     # Prints true
#desc print(my_dict.has(4))       # Prints false
#desc [/gdscript]
#desc [csharp]
#desc var myDict = new Godot.Collections.Dictionary
#desc {
#desc { "Godot", 4 },
#desc { 210, default },
#desc };
#desc 
#desc GD.Print(myDict.Contains("Godot")); // Prints true
#desc GD.Print(myDict.Contains(210));     // Prints true
#desc GD.Print(myDict.Contains(4));       // Prints false
#desc [/csharp]
#desc [/codeblocks]
#desc In GDScript, this is equivalent to the [code]in[/code] operator:
#desc [codeblock]
#desc if "Godot" in {"Godot": 4}:
#desc print("The key is here!") # Will be printed.
#desc [/codeblock]
#desc [b]Note:[/b] This method returns [code]true[/code] as long as the [param key] exists, even if its corresponding value is [code]null[/code].
func has(key: Variant) -> bool:
	pass;

#desc Returns [code]true[/code] if the dictionary contains all keys in the given [param keys] array.
#desc [codeblock]
#desc var data = {"width" : 10, "height" : 20}
#desc data.has_all(["height", "width"]) # Returns true
#desc [/codeblock]
func has_all(keys: Array) -> bool:
	pass;

#desc Returns a hashed 32-bit integer value representing the dictionary contents.
#desc [codeblocks]
#desc [gdscript]
#desc var dict1 = {"A": 10, "B": 2}
#desc var dict2 = {"A": 10, "B": 2}
#desc 
#desc print(dict1.hash() == dict2.hash()) # Prints true
#desc [/gdscript]
#desc [csharp]
#desc var dict1 = new Godot.Collections.Dictionary{{"A", 10}, {"B", 2}};
#desc var dict2 = new Godot.Collections.Dictionary{{"A", 10}, {"B", 2}};
#desc 
#desc // Godot.Collections.Dictionary has no Hash() method. Use GD.Hash() instead.
#desc GD.Print(GD.Hash(dict1) == GD.Hash(dict2)); // Prints true
#desc [/csharp]
#desc [/codeblocks]
#desc [b]Note:[/b] Dictionaries with the same entries but in a different order will not have the same hash.
#desc [b]Note:[/b] Dictionaries with equal hash values are [i]not[/i] guaranteed to be the same, because of hash collisions. On the countrary, dictionaries with different hash values are guaranteed to be different.
func hash() -> int:
	pass;

#desc Returns [code]true[/code] if the dictionary is empty (its size is [code]0[/code]). See also [method size].
func is_empty() -> bool:
	pass;

#desc Returns [code]true[/code] if the dictionary is read-only. See [method make_read_only]. Dictionaries are automatically read-only if declared with [code]const[/code] keyword.
func is_read_only() -> bool:
	pass;

#desc Returns the list of keys in the dictionary.
func keys() -> Array:
	pass;

#desc Makes the dictionary read-only, i.e. disables modification of the dictionary's contents. Does not apply to nested content, e.g. content of nested dictionaries.
func make_read_only() -> void:
	pass;

#desc Adds entries from [param dictionary] to this dictionary. By default, duplicate keys are not copied over, unless [param overwrite] is [code]true[/code].
func merge(dictionary: Dictionary, overwrite: bool = false) -> void:
	pass;

#desc Returns the number of entries in the dictionary. Empty dictionaries ([code]{ }[/code]) always return [code]0[/code]. See also [method is_empty].
func size() -> int:
	pass;

#desc Returns the list of values in this dictionary.
func values() -> Array:
	pass;


