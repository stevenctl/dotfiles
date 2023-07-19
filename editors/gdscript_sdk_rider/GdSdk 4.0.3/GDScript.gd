extends Script
#brief A script implemented in the GDScript programming language.
#desc A script implemented in the GDScript programming language. The script extends the functionality of all objects that instantiate it.
#desc Calling [method new] creates a new instance of the script. [method Object.set_script] extends an existing object, if that object's class matches one of the script's base classes.
#desc If you are looking for GDScript's built-in functions, see [@GDScript] instead.
#tutorial [GDScript documentation index] https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/index.html
class_name GDScript




#desc Returns a new instance of the script.
#desc For example:
#desc [codeblock]
#desc var MyClass = load("myclass.gd")
#desc var instance = MyClass.new()
#desc assert(instance.get_script() == MyClass)
#desc [/codeblock]
vararg func new() -> Variant:
	pass;


