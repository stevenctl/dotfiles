#brief The most important data type in Godot.
#desc In computer programming, a Variant class is a class that is designed to store a variety of other types. Dynamic programming languages like PHP, Lua, JavaScript and GDScript like to use them to store variables' data on the backend. With these Variants, properties are able to change value types freely.
#desc [codeblocks]
#desc [gdscript]
#desc var foo = 2 # foo is dynamically an integer
#desc foo = "Now foo is a string!"
#desc foo = RefCounted.new() # foo is an Object
#desc var bar: int = 2 # bar is a statically typed integer.
#desc # bar = "Uh oh! I can't make static variables become a different type!"
#desc [/gdscript]
#desc [csharp]
#desc // C# is statically typed. Once a variable has a type it cannot be changed. You can use the `var` keyword to let the compiler infer the type automatically.
#desc var foo = 2; // Foo is a 32-bit integer (int). Be cautious, integers in GDScript are 64-bit and the direct C# equivalent is `long`.
#desc // foo = "foo was and will always be an integer. It cannot be turned into a string!";
#desc var boo = "Boo is a string!";
#desc var ref = new RefCounted(); // var is especially useful when used together with a constructor.
#desc 
#desc // Godot also provides a Variant type that works like an union of all the Variant-compatible types.
#desc Variant fooVar = 2; // fooVar is dynamically an integer (stored as a `long` in the Variant type).
#desc fooVar = "Now fooVar is a string!";
#desc fooVar = new RefCounted(); // fooVar is a GodotObject.
#desc [/csharp]
#desc [/codeblocks]
#desc Godot tracks all scripting API variables within Variants. Without even realizing it, you use Variants all the time. When a particular language enforces its own rules for keeping data typed, then that language is applying its own custom logic over the base Variant scripting API.
#desc - GDScript automatically wrap values in them. It keeps all data in plain Variants by default and then optionally enforces custom static typing rules on variable types.
#desc - C# is statically typed, but uses its own implementation of the [code]Variant[/code] type in place of Godot's Variant class when it needs to represent a dynamic value. A [code]Variant[/code] can be assigned any compatible type implicitly but converting requires an explicit cast.
#desc The global [method @GlobalScope.typeof] function returns the enumerated value of the Variant type stored in the current variable (see [enum Variant.Type]).
#desc [codeblocks]
#desc [gdscript]
#desc var foo = 2
#desc match typeof(foo):
#desc TYPE_NIL:
#desc print("foo is null")
#desc TYPE_INTEGER:
#desc print("foo is an integer")
#desc TYPE_OBJECT:
#desc # Note that Objects are their own special category.
#desc # To get the name of the underlying Object type, you need the `get_class()` method.
#desc print("foo is a(n) %s" % foo.get_class()) # inject the class name into a formatted string.
#desc # Note also that there is not yet any way to get a script's `class_name` string easily.
#desc # To fetch that value, you can use [member ProjectSettings.get_global_class_list].
#desc # Open your project.godot file to see it up close.
#desc [/gdscript]
#desc [csharp]
#desc Variant foo = 2;
#desc switch (foo.VariantType)
#desc {
#desc case Variant.Type.Nil:
#desc GD.Print("foo is null");
#desc break;
#desc case Variant.Type.Int:
#desc GD.Print("foo is an integer");
#desc break;
#desc case Variant.Type.Object:
#desc // Note that Objects are their own special category.
#desc // You can convert a Variant to a GodotObject and use reflection to get its name.
#desc GD.Print($"foo is a(n) {foo.AsGodotObject().GetType().Name}");
#desc break;
#desc }
#desc [/csharp]
#desc [/codeblocks]
#desc A Variant takes up only 20 bytes and can store almost any engine datatype inside of it. Variants are rarely used to hold information for long periods of time. Instead, they are used mainly for communication, editing, serialization and moving data around.
#desc Godot has specifically invested in making its Variant class as flexible as possible; so much so that it is used for a multitude of operations to facilitate communication between all of Godot's systems.
#desc A Variant:
#desc - Can store almost any datatype.
#desc - Can perform operations between many variants. GDScript uses Variant as its atomic/native datatype.
#desc - Can be hashed, so it can be compared quickly to other variants.
#desc - Can be used to convert safely between datatypes.
#desc - Can be used to abstract calling methods and their arguments. Godot exports all its functions through variants.
#desc - Can be used to defer calls or move data between threads.
#desc - Can be serialized as binary and stored to disk, or transferred via network.
#desc - Can be serialized to text and use it for printing values and editable settings.
#desc - Can work as an exported property, so the editor can edit it universally.
#desc - Can be used for dictionaries, arrays, parsers, etc.
#desc [b]Containers (Array and Dictionary):[/b] Both are implemented using variants. A [Dictionary] can match any datatype used as key to any other datatype. An [Array] just holds an array of Variants. Of course, a Variant can also hold a [Dictionary] and an [Array] inside, making it even more flexible.
#desc Modifications to a container will modify all references to it. A [Mutex] should be created to lock it if multi-threaded access is desired.
#tutorial [Variant class introduction] https://docs.godotengine.org/en/stable/contributing/development/core_and_modules/variant_class.html
class_name Variant





