#brief Base class for all other classes in the engine.
#desc An advanced [Variant] type. All classes in the engine inherit from Object. Each class may define new properties, methods or signals, which are available to all inheriting classes. For example, a [Sprite2D] instance is able to call [method Node.add_child] because it inherits from [Node].
#desc You can create new instances, using [code]Object.new()[/code] in GDScript, or [code]new Object[/code] in C#.
#desc To delete an Object instance, call [method free]. This is necessary for most classes inheriting Object, because they do not manage memory on their own, and will otherwise cause memory leaks when no longer in use. There are a few classes that perform memory management. For example, [RefCounted] (and by extension [Resource]) deletes itself when no longer referenced, and [Node] deletes its children when freed.
#desc Objects can have a [Script] attached to them. Once the [Script] is instantiated, it effectively acts as an extension to the base class, allowing it to define and inherit new properties, methods and signals.
#desc Inside a [Script], [method _get_property_list] may be overridden to customize properties in several ways. This allows them to be available to the editor, display as lists of options, sub-divide into groups, save on disk, etc. Scripting languages offer easier ways to customize properties, such as with the [annotation @GDScript.@export] annotation.
#desc Godot is very dynamic. An object's script, and therefore its properties, methods and signals, can be changed at run-time. Because of this, there can be occasions where, for example, a property required by a method may not exist. To prevent run-time errors, see methods such as [method set], [method get], [method call], [method has_method], [method has_signal], etc. Note that these methods are [b]much[/b] slower than direct references.
#desc In GDScript, you can also check if a given property, method, or signal name exists in an object with the [code]in[/code] operator:
#desc [codeblock]
#desc var node = Node.new()
#desc print("name" in node)         # Prints true
#desc print("get_parent" in node)   # Prints true
#desc print("tree_entered" in node) # Prints true
#desc print("unknown" in node)      # Prints false
#desc [/codeblock]
#desc Notifications are [int] constants commonly sent and received by objects. For example, on every rendered frame, the [SceneTree] notifies nodes inside the tree with a [constant Node.NOTIFICATION_PROCESS]. The nodes receive it and may call [method Node._process] to update. To make use of notifications, see [method notification] and [method _notification].
#desc Lastly, every object can also contain metadata (data about data). [method set_meta] can be useful to store information that the object itself does not depend on. To keep your code clean, making excessive use of metadata is discouraged.
#desc [b]Note:[/b] Unlike references to a [RefCounted], references to an object stored in a variable can become invalid without being set to [code]null[/code]. To check if an object has been deleted, do [i]not[/i] compare it against [code]null[/code]. Instead, use [method @GlobalScope.is_instance_valid]. It's also recommended to inherit from [RefCounted] for classes storing data instead of [Object].
#desc [b]Note:[/b] The [code]script[/code] is not exposed like most properties. To set or get an object's [Script] in code, use [method set_script] and [method get_script], respectively.
#tutorial [Object class introduction] https://docs.godotengine.org/en/stable/contributing/development/core_and_modules/object_class.html
#tutorial [When and how to avoid using nodes for everything] https://docs.godotengine.org/en/stable/tutorials/best_practices/node_alternatives.html
#tutorial [Object notifications] https://docs.godotengine.org/en/stable/tutorials/best_practices/godot_notifications.html
class_name Object

#desc Emitted when [method notify_property_list_changed] is called.
signal property_list_changed
#desc Emitted when the object's script is changed.
#desc [b]Note:[/b] When this signal is emitted, the new script is not initialized yet. If you need to access the new script, defer connections to this signal with [constant CONNECT_DEFERRED].
signal script_changed
#desc Notification received when the object is initialized, before its script is attached. Used internally.
const NOTIFICATION_POSTINITIALIZE = 0;

#desc Notification received when the object is about to be deleted. Can act as the deconstructor of some programming languages.
const NOTIFICATION_PREDELETE = 1;

#desc Deferred connections trigger their [Callable]s on idle time, rather than instantly.
#desc Persisting connections are stored when the object is serialized (such as when using [method PackedScene.pack]). In the editor, connections created through the Node dock are always persisting.
#desc One-shot connections disconnect themselves after emission.
#desc Reference-counted connections can be assigned to the same [Callable] multiple times. Each disconnection decreases the internal counter. The signal fully disconnects only when the counter reaches 0.

#enum ConnectFlags
enum {
    CONNECT_DEFERRED = 1,
    CONNECT_PERSIST = 2,
    CONNECT_ONE_SHOT = 4,
    CONNECT_REFERENCE_COUNTED = 8,
}


#desc Override this method to customize the behavior of [method get]. Should return the given [param property]'s value, or [code]null[/code] if the [param property] should be handled normally.
#desc Combined with [method _set] and [method _get_property_list], this method allows defining custom properties, which is particularly useful for editor plugins. Note that a property must be present in [method get_property_list], otherwise this method will not be called.
#desc [codeblocks]
#desc [gdscript]
#desc func _get(property):
#desc if (property == "fake_property"):
#desc print("Getting my property!")
#desc return 4
#desc 
#desc func _get_property_list():
#desc return [
#desc { "name": "fake_property", "type": TYPE_INT }
#desc ]
#desc [/gdscript]
#desc [csharp]
#desc public override Variant _Get(StringName property)
#desc {
#desc if (property == "FakeProperty")
#desc {
#desc GD.Print("Getting my property!");
#desc return 4;
#desc }
#desc return default;
#desc }
#desc 
#desc public override Godot.Collections.Array<Godot.Collections.Dictionary> _GetPropertyList()
#desc {
#desc return new Godot.Collections.Array<Godot.Collections.Dictionary>()
#desc {
#desc new Godot.Collections.Dictionary()
#desc {
#desc { "name", "FakeProperty" },
#desc { "type", (int)Variant.Type.Int }
#desc }
#desc };
#desc }
#desc [/csharp]
#desc [/codeblocks]
func _get(property: StringName) -> Variant:
	pass;

#desc Override this method to customize how script properties should be handled by the engine.
#desc Should return a property list, as an [Array] of dictionaries. The result is added to the array of [method get_property_list], and should be formatted in the same way. Each [Dictionary] must at least contain the [code]name[/code] and [code]type[/code] entries.
#desc The example below displays [code]hammer_type[/code] in the Inspector dock, only if [code]holding_hammer[/code] is [code]true[/code]:
#desc [codeblocks]
#desc [gdscript]
#desc @tool
#desc extends Node2D
#desc 
#desc @export var holding_hammer = false:
#desc set(value):
#desc holding_hammer = value
#desc notify_property_list_changed()
#desc var hammer_type = 0
#desc 
#desc func _get_property_list():
#desc # By default, `hammer_type` is not visible in the editor.
#desc var property_usage = PROPERTY_USAGE_NO_EDITOR
#desc 
#desc if holding_hammer:
#desc property_usage = PROPERTY_USAGE_DEFAULT
#desc 
#desc var properties = []
#desc properties.append({
#desc "name": "hammer_type",
#desc "type": TYPE_INT,
#desc "usage": property_usage, # See above assignment.
#desc "hint": PROPERTY_HINT_ENUM,
#desc "hint_string": "Wooden,Iron,Golden,Enchanted"
#desc })
#desc 
#desc return properties
#desc [/gdscript]
#desc [csharp]
#desc [Tool]
#desc public partial class MyNode2D : Node2D
#desc {
#desc private bool _holdingHammer;
#desc 
#desc [Export]
#desc public bool HoldingHammer
#desc {
#desc get => _holdingHammer;
#desc set
#desc {
#desc _holdingHammer = value;
#desc NotifyPropertyListChanged();
#desc }
#desc }
#desc 
#desc public int HammerType { get; set; }
#desc 
#desc public override Godot.Collections.Array<Godot.Collections.Dictionary> _GetPropertyList()
#desc {
#desc // By default, `HammerType` is not visible in the editor.
#desc var propertyUsage = PropertyUsageFlags.NoEditor;
#desc 
#desc if (HoldingHammer)
#desc {
#desc propertyUsage = PropertyUsageFlags.Default;
#desc }
#desc 
#desc var properties = new Godot.Collections.Array<Godot.Collections.Dictionary>();
#desc properties.Add(new Godot.Collections.Dictionary()
#desc {
#desc { "name", "HammerType" },
#desc { "type", (int)Variant.Type.Int },
#desc { "usage", (int)propertyUsage }, // See above assignment.
#desc { "hint", (int)PropertyHint.Enum },
#desc { "hint_string", "Wooden,Iron,Golden,Enchanted" }
#desc });
#desc 
#desc return properties;
#desc }
#desc }
#desc [/csharp]
#desc [/codeblocks]
#desc [b]Note:[/b] This method is intended for advanced purposes. For most common use cases, the scripting languages offer easier ways to handle properties. See [annotation @GDScript.@export], [annotation @GDScript.@export_enum], [annotation @GDScript.@export_group], etc.
#desc [b]Note:[/b] If the object's script is not [annotation @GDScript.@tool], this method will not be called in the editor.
func _get_property_list() -> Array[Dictionary]:
	pass;

#desc Called when the object's script is instantiated, oftentimes after the object is initialized in memory (through [code]Object.new()[/code] in GDScript, or [code]new Object[/code] in C#). It can be also defined to take in parameters. This method is similar to a constructor in most programming languages.
#desc [b]Note:[/b] If [method _init] is defined with [i]required[/i] parameters, the Object with script may only be created directly. If any other means (such as [method PackedScene.instantiate] or [method Node.duplicate]) are used, the script's initialization will fail.
func _init() -> void:
	pass;

#desc Called when the object receives a notification, which can be identified in [param what] by comparing it with a constant. See also [method notification].
#desc [codeblocks]
#desc [gdscript]
#desc func _notification(what):
#desc if what == NOTIFICATION_PREDELETE:
#desc print("Goodbye!")
#desc [/gdscript]
#desc [csharp]
#desc public override void _Notification(long what)
#desc {
#desc if (what == NotificationPredelete)
#desc {
#desc GD.Print("Goodbye!");
#desc }
#desc }
#desc [/csharp]
#desc [/codeblocks]
#desc [b]Note:[/b] The base [Object] defines a few notifications ([constant NOTIFICATION_POSTINITIALIZE] and [constant NOTIFICATION_PREDELETE]). Inheriting classes such as [Node] define a lot more notifications, which are also received by this method.
func _notification(what: int) -> void:
	pass;

#desc Override this method to customize the given [param property]'s revert behavior. Should return [code]true[/code] if the [param property] can be reverted in the Inspector dock. Use [method _property_get_revert] to specify the [param property]'s default value.
#desc [b]Note:[/b] This method must return consistently, regardless of the current value of the [param property].
func _property_can_revert(property: StringName) -> bool:
	pass;

#desc Override this method to customize the given [param property]'s revert behavior. Should return the default value for the [param property]. If the default value differs from the [param property]'s current value, a revert icon is displayed in the Inspector dock.
#desc [b]Note:[/b] [method _property_can_revert] must also be overridden for this method to be called.
func _property_get_revert(property: StringName) -> Variant:
	pass;

#desc Override this method to customize the behavior of [method set]. Should set the [param property] to [param value] and return [code]true[/code], or [code]false[/code] if the [param property] should be handled normally. The [i]exact[/i] way to set the [param property] is up to this method's implementation.
#desc Combined with [method _get] and [method _get_property_list], this method allows defining custom properties, which is particularly useful for editor plugins. Note that a property [i]must[/i] be present in [method get_property_list], otherwise this method will not be called.
#desc [codeblocks]
#desc [gdscript]
#desc func _set(property, value):
#desc if (property == "fake_property"):
#desc print("Setting my property to ", value)
#desc 
#desc func _get_property_list():
#desc return [
#desc { "name": "fake_property", "type": TYPE_INT }
#desc ]
#desc [/gdscript]
#desc [csharp]
#desc public override void _Set(StringName property, Variant value)
#desc {
#desc if (property == "FakeProperty")
#desc {
#desc GD.Print($"Setting my property to {value}");
#desc return true;
#desc }
#desc 
#desc return false;
#desc }
#desc 
#desc public override Godot.Collections.Array<Godot.Collections.Dictionary> _GetPropertyList()
#desc {
#desc return new Godot.Collections.Array<Godot.Collections.Dictionary>()
#desc {
#desc new Godot.Collections.Dictionary()
#desc {
#desc { "name", "FakeProperty" },
#desc { "type", (int)Variant.Type.Int }
#desc }
#desc };
#desc }
#desc [/csharp]
#desc [/codeblocks]
func _set(property: StringName, value: Variant) -> bool:
	pass;

#desc Override this method to customize the return value of [method to_string], and therefore the object's representation as a [String].
#desc [codeblock]
#desc func _to_string():
#desc return "Welcome to Godot 4!"
#desc 
#desc func _init():
#desc print(self)       # Prints Welcome to Godot 4!"
#desc var a = str(self) # a is "Welcome to Godot 4!"
#desc [/codeblock]
func _to_string() -> String:
	pass;

#desc Adds a user-defined [param signal]. Optional arguments for the signal can be added as an [Array] of dictionaries, each defining a [code]name[/code] [String] and a [code]type[/code] [int] (see [enum Variant.Type]). See also [method has_user_signal].
#desc [codeblocks]
#desc [gdscript]
#desc add_user_signal("hurt", [
#desc { "name": "damage", "type": TYPE_INT },
#desc { "name": "source", "type": TYPE_OBJECT }
#desc ])
#desc [/gdscript]
#desc [csharp]
#desc AddUserSignal("Hurt", new Godot.Collections.Array()
#desc {
#desc new Godot.Collections.Dictionary()
#desc {
#desc { "name", "damage" },
#desc { "type", (int)Variant.Type.Int }
#desc },
#desc new Godot.Collections.Dictionary()
#desc {
#desc { "name", "source" },
#desc { "type", (int)Variant.Type.Object }
#desc }
#desc });
#desc [/csharp]
#desc [/codeblocks]
func add_user_signal(signal: String, arguments: Array = []) -> void:
	pass;

#desc Calls the [param method] on the object and returns the result. This method supports a variable number of arguments, so parameters can be passed as a comma separated list.
#desc [codeblocks]
#desc [gdscript]
#desc var node = Node3D.new()
#desc node.call("rotate", Vector3(1.0, 0.0, 0.0), 1.571)
#desc [/gdscript]
#desc [csharp]
#desc var node = new Node3D();
#desc node.Call(Node3D.MethodName.Rotate, new Vector3(1f, 0f, 0f), 1.571f);
#desc [/csharp]
#desc [/codeblocks]
#desc [b]Note:[/b] In C#, [param method] must be in snake_case when referring to built-in Godot methods. Prefer using the names exposed in the [code]MethodName[/code] class to avoid allocating a new [StringName] on each call.
vararg func call(method: StringName) -> Variant:
	pass;

#desc Calls the [param method] on the object during idle time. This method supports a variable number of arguments, so parameters can be passed as a comma separated list.
#desc [codeblocks]
#desc [gdscript]
#desc var node = Node3D.new()
#desc node.call_deferred("rotate", Vector3(1.0, 0.0, 0.0), 1.571)
#desc [/gdscript]
#desc [csharp]
#desc var node = new Node3D();
#desc node.CallDeferred(Node3D.MethodName.Rotate, new Vector3(1f, 0f, 0f), 1.571f);
#desc [/csharp]
#desc [/codeblocks]
#desc [b]Note:[/b] In C#, [param method] must be in snake_case when referring to built-in Godot methods. Prefer using the names exposed in the [code]MethodName[/code] class to avoid allocating a new [StringName] on each call.
vararg func call_deferred(method: StringName) -> Variant:
	pass;

#desc Calls the [param method] on the object and returns the result. Unlike [method call], this method expects all parameters to be contained inside [param arg_array].
#desc [codeblocks]
#desc [gdscript]
#desc var node = Node3D.new()
#desc node.callv("rotate", [Vector3(1.0, 0.0, 0.0), 1.571])
#desc [/gdscript]
#desc [csharp]
#desc var node = new Node3D();
#desc node.Callv(Node3D.MethodName.Rotate, new Godot.Collections.Array { new Vector3(1f, 0f, 0f), 1.571f });
#desc [/csharp]
#desc [/codeblocks]
#desc [b]Note:[/b] In C#, [param method] must be in snake_case when referring to built-in Godot methods. Prefer using the names exposed in the [code]MethodName[/code] class to avoid allocating a new [StringName] on each call.
func callv(method: StringName, arg_array: Array) -> Variant:
	pass;

#desc Returns [code]true[/code] if the object is allowed to translate messages with [method tr] and [method tr_n]. See also [method set_message_translation].
func can_translate_messages() -> bool:
	pass;

#desc Connects a [param signal] by name to a [param callable]. Optional [param flags] can be also added to configure the connection's behavior (see [enum ConnectFlags] constants).
#desc A signal can only be connected once to the same [Callable]. If the signal is already connected, this method returns [constant ERR_INVALID_PARAMETER] and pushes an error message, unless the signal is connected with [constant CONNECT_REFERENCE_COUNTED]. To prevent this, use [method is_connected] first to check for existing connections.
#desc If the [param callable]'s object is freed, the connection will be lost.
#desc [b]Examples with recommended syntax:[/b]
#desc Connecting signals is one of the most common operations in Godot and the API gives many options to do so, which are described further down. The code block below shows the recommended approach.
#desc [codeblocks]
#desc [gdscript]
#desc func _ready():
#desc var button = Button.new()
#desc # `button_down` here is a Signal variant type, and we thus call the Signal.connect() method, not Object.connect().
#desc # See discussion below for a more in-depth overview of the API.
#desc button.button_down.connect(_on_button_down)
#desc 
#desc # This assumes that a `Player` class exists, which defines a `hit` signal.
#desc var player = Player.new()
#desc # We use Signal.connect() again, and we also use the Callable.bind() method,
#desc # which returns a new Callable with the parameter binds.
#desc player.hit.connect(_on_player_hit.bind("sword", 100))
#desc 
#desc func _on_button_down():
#desc print("Button down!")
#desc 
#desc func _on_player_hit(weapon_type, damage):
#desc print("Hit with weapon %s for %d damage." % [weapon_type, damage])
#desc [/gdscript]
#desc [csharp]
#desc public override void _Ready()
#desc {
#desc var button = new Button();
#desc // C# supports passing signals as events, so we can use this idiomatic construct:
#desc button.ButtonDown += OnButtonDown;
#desc 
#desc // This assumes that a `Player` class exists, which defines a `Hit` signal.
#desc var player = new Player();
#desc // We can use lambdas when we need to bind additional parameters.
#desc player.Hit += () => OnPlayerHit("sword", 100);
#desc }
#desc 
#desc private void OnButtonDown()
#desc {
#desc GD.Print("Button down!");
#desc }
#desc 
#desc private void OnPlayerHit(string weaponType, int damage)
#desc {
#desc GD.Print($"Hit with weapon {weaponType} for {damage} damage.");
#desc }
#desc [/csharp]
#desc [/codeblocks]
#desc [b][code]Object.connect()[/code] or [code]Signal.connect()[/code]?[/b]
#desc As seen above, the recommended method to connect signals is not [method Object.connect]. The code block below shows the four options for connecting signals, using either this legacy method or the recommended [method Signal.connect], and using either an implicit [Callable] or a manually defined one.
#desc [codeblocks]
#desc [gdscript]
#desc func _ready():
#desc var button = Button.new()
#desc # Option 1: Object.connect() with an implicit Callable for the defined function.
#desc button.connect("button_down", _on_button_down)
#desc # Option 2: Object.connect() with a constructed Callable using a target object and method name.
#desc button.connect("button_down", Callable(self, "_on_button_down"))
#desc # Option 3: Signal.connect() with an implicit Callable for the defined function.
#desc button.button_down.connect(_on_button_down)
#desc # Option 4: Signal.connect() with a constructed Callable using a target object and method name.
#desc button.button_down.connect(Callable(self, "_on_button_down"))
#desc 
#desc func _on_button_down():
#desc print("Button down!")
#desc [/gdscript]
#desc [csharp]
#desc public override void _Ready()
#desc {
#desc var button = new Button();
#desc // Option 1: In C#, we can use signals as events and connect with this idiomatic syntax:
#desc button.ButtonDown += OnButtonDown;
#desc // Option 2: GodotObject.Connect() with a constructed Callable from a method group.
#desc button.Connect(Button.SignalName.ButtonDown, Callable.From(OnButtonDown));
#desc // Option 3: GodotObject.Connect() with a constructed Callable using a target object and method name.
#desc button.Connect(Button.SignalName.ButtonDown, new Callable(this, MethodName.OnButtonDown));
#desc }
#desc 
#desc private void OnButtonDown()
#desc {
#desc GD.Print("Button down!");
#desc }
#desc [/csharp]
#desc [/codeblocks]
#desc While all options have the same outcome ([code]button[/code]'s [signal BaseButton.button_down] signal will be connected to [code]_on_button_down[/code]), [b]option 3[/b] offers the best validation: it will print a compile-time error if either the [code]button_down[/code] [Signal] or the [code]_on_button_down[/code] [Callable] are not defined. On the other hand, [b]option 2[/b] only relies on string names and will only be able to validate either names at runtime: it will print a runtime error if [code]"button_down"[/code] doesn't correspond to a signal, or if [code]"_on_button_down"[/code] is not a registered method in the object [code]self[/code]. The main reason for using options 1, 2, or 4 would be if you actually need to use strings (e.g. to connect signals programmatically based on strings read from a configuration file). Otherwise, option 3 is the recommended (and fastest) method.
#desc [b]Binding and passing parameters:[/b]
#desc The syntax to bind parameters is through [method Callable.bind], which returns a copy of the [Callable] with its parameters bound.
#desc When calling [method emit_signal], the signal parameters can be also passed. The examples below show the relationship between these signal parameters and bound parameters.
#desc [codeblocks]
#desc [gdscript]
#desc func _ready():
#desc # This assumes that a `Player` class exists, which defines a `hit` signal.
#desc var player = Player.new()
#desc # Using Callable.bind().
#desc player.hit.connect(_on_player_hit.bind("sword", 100))
#desc 
#desc # Parameters added when emitting the signal are passed first.
#desc player.emit_signal("hit", "Dark lord", 5)
#desc 
#desc # We pass two arguments when emitting (`hit_by`, `level`),
#desc # and bind two more arguments when connecting (`weapon_type`, `damage`).
#desc func _on_player_hit(hit_by, level, weapon_type, damage):
#desc print("Hit by %s (level %d) with weapon %s for %d damage." % [hit_by, level, weapon_type, damage])
#desc [/gdscript]
#desc [csharp]
#desc public override void _Ready()
#desc {
#desc // This assumes that a `Player` class exists, which defines a `Hit` signal.
#desc var player = new Player();
#desc // Using lambda expressions that create a closure that captures the additional parameters.
#desc // The lambda only receives the parameters defined by the signal's delegate.
#desc player.Hit += (hitBy, level) => OnPlayerHit(hitBy, level, "sword", 100);
#desc 
#desc // Parameters added when emitting the signal are passed first.
#desc player.EmitSignal(SignalName.Hit, "Dark lord", 5);
#desc }
#desc 
#desc // We pass two arguments when emitting (`hit_by`, `level`),
#desc // and bind two more arguments when connecting (`weapon_type`, `damage`).
#desc private void OnPlayerHit(string hitBy, int level, string weaponType, int damage)
#desc {
#desc GD.Print($"Hit by {hitBy} (level {level}) with weapon {weaponType} for {damage} damage.");
#desc }
#desc [/csharp]
#desc [/codeblocks]
func connect(signal: StringName, callable: Callable, flags: int = 0) -> int:
	pass;

#desc Disconnects a [param signal] by name from a given [param callable]. If the connection does not exist, generates an error. Use [method is_connected] to make sure that the connection exists.
func disconnect(signal: StringName, callable: Callable) -> void:
	pass;

#desc Emits the given [param signal] by name. The signal must exist, so it should be a built-in signal of this class or one of its inherited classes, or a user-defined signal (see [method add_user_signal]). This method supports a variable number of arguments, so parameters can be passed as a comma separated list.
#desc Returns [constant ERR_UNAVAILABLE] if [param signal] does not exist or the parameters are invalid.
#desc [codeblocks]
#desc [gdscript]
#desc emit_signal("hit", "sword", 100)
#desc emit_signal("game_over")
#desc [/gdscript]
#desc [csharp]
#desc EmitSignal(SignalName.Hit, "sword", 100);
#desc EmitSignal(SignalName.GameOver);
#desc [/csharp]
#desc [/codeblocks]
#desc [b]Note:[/b] In C#, [param signal] must be in snake_case when referring to built-in Godot signals. Prefer using the names exposed in the [code]SignalName[/code] class to avoid allocating a new [StringName] on each call.
vararg func emit_signal(signal: StringName) -> int:
	pass;

#desc Deletes the object from memory. Pre-existing references to the object become invalid, and any attempt to access them will result in a run-time error. Checking the references with [method @GlobalScope.is_instance_valid] will return [code]false[/code].
func free() -> void:
	pass;

#desc Returns the [Variant] value of the given [param property]. If the [param property] does not exist, this method returns [code]null[/code].
#desc [codeblocks]
#desc [gdscript]
#desc var node = Node2D.new()
#desc node.rotation = 1.5
#desc var a = node.get("rotation") # a is 1.5
#desc [/gdscript]
#desc [csharp]
#desc var node = new Node2D();
#desc node.Rotation = 1.5f;
#desc var a = node.Get("rotation"); // a is 1.5
#desc [/csharp]
#desc [/codeblocks]
#desc [b]Note:[/b] In C#, [param property] must be in snake_case when referring to built-in Godot properties. Prefer using the names exposed in the [code]PropertyName[/code] class to avoid allocating a new [StringName] on each call.
func get(property: StringName) -> Variant:
	pass;

#desc Returns the object's built-in class name, as a [String]. See also [method is_class].
#desc [b]Note:[/b] This method ignores [code]class_name[/code] declarations. If this object's script has defined a [code]class_name[/code], the base, built-in class name is returned instead.
func get_class() -> String:
	pass;

#desc Returns an [Array] of signal connections received by this object. Each connection is represented as a [Dictionary] that contains three entries:
#desc - [code]signal[/code] is a reference to the [Signal];
#desc - [code]callable[/code] is a reference to the [Callable];
#desc - [code]flags[/code] is a combination of [enum ConnectFlags].
func get_incoming_connections() -> Array[Dictionary]:
	pass;

#desc Gets the object's property indexed by the given [param property_path]. The path should be a [NodePath] relative to the current object and can use the colon character ([code]:[/code]) to access nested properties.
#desc [b]Examples:[/b] [code]"position:x"[/code] or [code]"material:next_pass:blend_mode"[/code].
#desc [codeblocks]
#desc [gdscript]
#desc var node = Node2D.new()
#desc node.position = Vector2(5, -10)
#desc var a = node.get_indexed("position")   # a is Vector2(5, -10)
#desc var b = node.get_indexed("position:y") # b is -10
#desc [/gdscript]
#desc [csharp]
#desc var node = new Node2D();
#desc node.Position = new Vector2(5, -10);
#desc var a = node.GetIndexed("position");   // a is Vector2(5, -10)
#desc var b = node.GetIndexed("position:y"); // b is -10
#desc [/csharp]
#desc [/codeblocks]
#desc [b]Note:[/b] In C#, [param property_path] must be in snake_case when referring to built-in Godot properties. Prefer using the names exposed in the [code]PropertyName[/code] class to avoid allocating a new [StringName] on each call.
#desc [b]Note:[/b] This method does not support actual paths to nodes in the [SceneTree], only sub-property paths. In the context of nodes, use [method Node.get_node_and_resource] instead.
func get_indexed(property_path: NodePath) -> Variant:
	pass;

#desc Returns the object's unique instance ID. This ID can be saved in [EncodedObjectAsID], and can be used to retrieve this object instance with [method @GlobalScope.instance_from_id].
func get_instance_id() -> int:
	pass;

#desc Returns the object's metadata value for the given entry [param name]. If the entry does not exist, returns [param default]. If [param default] is [code]null[/code], an error is also generated.
#desc [b]Note:[/b] Metadata that has a [param name] starting with an underscore ([code]_[/code]) is considered editor-only. Editor-only metadata is not displayed in the Inspector dock and should not be edited.
func get_meta(name: StringName, default: Variant = null) -> Variant:
	pass;

#desc Returns the object's metadata entry names as a [PackedStringArray].
func get_meta_list() -> PackedStringArray:
	pass;

#desc Returns this object's methods and their signatures as an [Array] of dictionaries. Each [Dictionary] contains the following entries:
#desc - [code]name[/code] is the name of the method, as a [String];
#desc - [code]args[/code] is an [Array] of dictionaries representing the arguments;
#desc - [code]default_args[/code] is the default arguments as an [Array] of variants;
#desc - [code]flags[/code] is a combination of [enum MethodFlags];
#desc - [code]id[/code] is the method's internal identifier [int];
#desc - [code]return[/code] is the returned value, as a [Dictionary];
#desc [b]Note:[/b] The dictionaries of [code]args[/code] and [code]return[/code] are formatted identically to the results of [method get_property_list], although not all entries are used.
func get_method_list() -> Array[Dictionary]:
	pass;

#desc Returns the object's property list as an [Array] of dictionaries. Each [Dictionary] contains the following entries:
#desc - [code]name[/code] is the property's name, as a [String];
#desc - [code]class_name[/code] is an empty [StringName], unless the property is [constant TYPE_OBJECT] and it inherits from a class;
#desc - [code]type[/code] is the property's type, as an [int] (see [enum Variant.Type]);
#desc - [code]hint[/code] is [i]how[/i] the property is meant to be edited (see [enum PropertyHint]);
#desc - [code]hint_string[/code] depends on the hint (see [enum PropertyHint]);
#desc - [code]usage[/code] is a combination of [enum PropertyUsageFlags].
func get_property_list() -> Array[Dictionary]:
	pass;

#desc Returns the object's [Script] instance, or [code]null[/code] if no script is attached.
func get_script() -> Variant:
	pass;

#desc Returns an [Array] of connections for the given [param signal] name. Each connection is represented as a [Dictionary] that contains three entries:
#desc - [code]signal[/code] is a reference to the [Signal];
#desc - [code]callable[/code] is a reference to the connected [Callable];
#desc - [code]flags[/code] is a combination of [enum ConnectFlags].
func get_signal_connection_list(signal: StringName) -> Array[Dictionary]:
	pass;

#desc Returns the list of existing signals as an [Array] of dictionaries.
#desc [b]Note:[/b] Due of the implementation, each [Dictionary] is formatted very similarly to the returned values of [method get_method_list].
func get_signal_list() -> Array[Dictionary]:
	pass;

#desc Returns [code]true[/code] if a metadata entry is found with the given [param name]. See also [method get_meta], [method set_meta] and [method remove_meta].
#desc [b]Note:[/b] Metadata that has a [param name] starting with an underscore ([code]_[/code]) is considered editor-only. Editor-only metadata is not displayed in the Inspector and should not be edited, although it can still be found by this method.
func has_meta(name: StringName) -> bool:
	pass;

#desc Returns [code]true[/code] if the given [param method] name exists in the object.
#desc [b]Note:[/b] In C#, [param method] must be in snake_case when referring to built-in Godot methods. Prefer using the names exposed in the [code]MethodName[/code] class to avoid allocating a new [StringName] on each call.
func has_method(method: StringName) -> bool:
	pass;

#desc Returns [code]true[/code] if the given [param signal] name exists in the object.
#desc [b]Note:[/b] In C#, [param signal] must be in snake_case when referring to built-in Godot methods. Prefer using the names exposed in the [code]SignalName[/code] class to avoid allocating a new [StringName] on each call.
func has_signal(signal: StringName) -> bool:
	pass;

#desc Returns [code]true[/code] if the given user-defined [param signal] name exists. Only signals added with [method add_user_signal] are included.
func has_user_signal(signal: StringName) -> bool:
	pass;

#desc Returns [code]true[/code] if the object is blocking its signals from being emitted. See [method set_block_signals].
func is_blocking_signals() -> bool:
	pass;

#desc Returns [code]true[/code] if the object inherits from the given [param class]. See also [method get_class].
#desc [codeblocks]
#desc [gdscript]
#desc var sprite2d = Sprite2D.new()
#desc sprite2d.is_class("Sprite2D") # Returns true
#desc sprite2d.is_class("Node")     # Returns true
#desc sprite2d.is_class("Node3D")   # Returns false
#desc [/gdscript]
#desc [csharp]
#desc var sprite2D = new Sprite2D();
#desc sprite2D.IsClass("Sprite2D"); // Returns true
#desc sprite2D.IsClass("Node");     // Returns true
#desc sprite2D.IsClass("Node3D");   // Returns false
#desc [/csharp]
#desc [/codeblocks]
#desc [b]Note:[/b] This method ignores [code]class_name[/code] declarations in the object's script.
func is_class(class: String) -> bool:
	pass;

#desc Returns [code]true[/code] if a connection exists between the given [param signal] name and [param callable].
#desc [b]Note:[/b] In C#, [param signal] must be in snake_case when referring to built-in Godot methods. Prefer using the names exposed in the [code]SignalName[/code] class to avoid allocating a new [StringName] on each call.
func is_connected(signal: StringName, callable: Callable) -> bool:
	pass;

#desc Returns [code]true[/code] if the [method Node.queue_free] method was called for the object.
func is_queued_for_deletion() -> bool:
	pass;

#desc Sends the given [param what] notification to all classes inherited by the object, triggering calls to [method _notification], starting from the highest ancestor (the [Object] class) and going down to the object's script.
#desc If [param reversed] is [code]true[/code], the call order is reversed.
#desc [codeblocks]
#desc [gdscript]
#desc var player = Node2D.new()
#desc player.set_script(load("res://player.gd"))
#desc 
#desc player.notification(NOTIFICATION_ENTER_TREE)
#desc # The call order is Object -> Node -> Node2D -> player.gd.
#desc 
#desc player.notification(NOTIFICATION_ENTER_TREE, true)
#desc # The call order is player.gd -> Node2D -> Node -> Object.
#desc [/gdscript]
#desc [csharp]
#desc var player = new Node2D();
#desc player.SetScript(GD.Load("res://player.gd"));
#desc 
#desc player.Notification(NotificationEnterTree);
#desc // The call order is GodotObject -> Node -> Node2D -> player.gd.
#desc 
#desc player.Notification(NotificationEnterTree, true);
#desc // The call order is player.gd -> Node2D -> Node -> GodotObject.
#desc [/csharp]
#desc [/codeblocks]
func notification(what: int, reversed: bool = false) -> void:
	pass;

#desc Emits the [signal property_list_changed] signal. This is mainly used to refresh the editor, so that the Inspector and editor plugins are properly updated.
func notify_property_list_changed() -> void:
	pass;

#desc Returns [code]true[/code] if the given [param property] has a custom default value. Use [method property_get_revert] to get the [param property]'s default value.
#desc [b]Note:[/b] This method is used by the Inspector dock to display a revert icon. The object must implement [method _property_can_revert] to customize the default value. If [method _property_can_revert] is not implemented, this method returns [code]false[/code].
func property_can_revert(property: StringName) -> bool:
	pass;

#desc Returns the custom default value of the given [param property]. Use [method property_can_revert] to check if the [param property] has a custom default value.
#desc [b]Note:[/b] This method is used by the Inspector dock to display a revert icon. The object must implement [method _property_get_revert] to customize the default value. If [method _property_get_revert] is not implemented, this method returns [code]null[/code].
func property_get_revert(property: StringName) -> Variant:
	pass;

#desc Removes the given entry [param name] from the object's metadata. See also [method has_meta], [method get_meta] and [method set_meta].
#desc [b]Note:[/b] Metadata that has a [param name] starting with an underscore ([code]_[/code]) is considered editor-only. Editor-only metadata is not displayed in the Inspector and should not be edited.
func remove_meta(name: StringName) -> void:
	pass;

#desc Assigns [param value] to the given [param property]. If the property does not exist or the given [param value]'s type doesn't match, nothing happens.
#desc [codeblocks]
#desc [gdscript]
#desc var node = Node2D.new()
#desc node.set("global_scale", Vector2(8, 2.5))
#desc print(node.global_scale) # Prints (8, 2.5)
#desc [/gdscript]
#desc [csharp]
#desc var node = new Node2D();
#desc node.Set("global_scale", new Vector2(8, 2.5));
#desc GD.Print(node.GlobalScale); // Prints Vector2(8, 2.5)
#desc [/csharp]
#desc [/codeblocks]
#desc [b]Note:[/b] In C#, [param property] must be in snake_case when referring to built-in Godot properties. Prefer using the names exposed in the [code]PropertyName[/code] class to avoid allocating a new [StringName] on each call.
func set(property: StringName, value: Variant) -> void:
	pass;

#desc If set to [code]true[/code], the object becomes unable to emit signals. As such, [method emit_signal] and signal connections will not work, until it is set to [code]false[/code].
func set_block_signals(enable: bool) -> void:
	pass;

#desc Assigns [param value] to the given [param property], after the current frame's physics step. This is equivalent to calling [method set] through [method call_deferred].
#desc [codeblocks]
#desc [gdscript]
#desc var node = Node2D.new()
#desc add_child(node)
#desc 
#desc node.rotation = 45.0
#desc node.set_deferred("rotation", 90.0)
#desc print(node.rotation) # Prints 45.0
#desc 
#desc await get_tree().process_frame
#desc print(node.rotation) # Prints 90.0
#desc [/gdscript]
#desc [csharp]
#desc var node = new Node2D();
#desc node.Rotation = 45f;
#desc node.SetDeferred("rotation", 90f);
#desc GD.Print(node.Rotation); // Prints 45.0
#desc 
#desc await ToSignal(GetTree(), SceneTree.SignalName.ProcessFrame);
#desc GD.Print(node.Rotation); // Prints 90.0
#desc [/csharp]
#desc [/codeblocks]
#desc [b]Note:[/b] In C#, [param property] must be in snake_case when referring to built-in Godot properties. Prefer using the names exposed in the [code]PropertyName[/code] class to avoid allocating a new [StringName] on each call.
func set_deferred(property: StringName, value: Variant) -> void:
	pass;

#desc Assigns a new [param value] to the property identified by the [param property_path]. The path should be a [NodePath] relative to this object, and can use the colon character ([code]:[/code]) to access nested properties.
#desc [codeblocks]
#desc [gdscript]
#desc var node = Node2D.new()
#desc node.set_indexed("position", Vector2(42, 0))
#desc node.set_indexed("position:y", -10)
#desc print(node.position) # Prints (42, -10)
#desc [/gdscript]
#desc [csharp]
#desc var node = new Node2D();
#desc node.SetIndexed("position", new Vector2(42, 0));
#desc node.SetIndexed("position:y", -10);
#desc GD.Print(node.Position); // Prints (42, -10)
#desc [/csharp]
#desc [/codeblocks]
#desc [b]Note:[/b] In C#, [param property_path] must be in snake_case when referring to built-in Godot properties. Prefer using the names exposed in the [code]PropertyName[/code] class to avoid allocating a new [StringName] on each call.
func set_indexed(property_path: NodePath, value: Variant) -> void:
	pass;

#desc If set to [code]true[/code], allows the object to translate messages with [method tr] and [method tr_n]. Enabled by default. See also [method can_translate_messages].
func set_message_translation(enable: bool) -> void:
	pass;

#desc Adds or changes the entry [param name] inside the object's metadata. The metadata [param value] can be any [Variant], although some types cannot be serialized correctly.
#desc If [param value] is [code]null[/code], the entry is removed. This is the equivalent of using [method remove_meta]. See also [method has_meta] and [method get_meta].
#desc [b]Note:[/b] Metadata that has a [param name] starting with an underscore ([code]_[/code]) is considered editor-only. Editor-only metadata is not displayed in the Inspector dock and should not be edited.
func set_meta(name: StringName, value: Variant) -> void:
	pass;

#desc Attaches [param script] to the object, and instantiates it. As a result, the script's [method _init] is called. A [Script] is used to extend the object's functionality.
#desc If a script already exists, its instance is detached, and its property values and state are lost. Built-in property values are still kept.
func set_script(script: Variant) -> void:
	pass;

#desc Returns a [String] representing the object. Defaults to [code]"<ClassName#RID>"[/code]. Override [method _to_string] to customize the string representation of the object.
func to_string() -> String:
	pass;

#desc Translates a [param message], using the translation catalogs configured in the Project Settings. Further [param context] can be specified to help with the translation.
#desc If [method can_translate_messages] is [code]false[/code], or no translation is available, this method returns the [param message] without changes. See [method set_message_translation].
#desc For detailed examples, see [url=$DOCS_URL/tutorials/i18n/internationalizing_games.html]Internationalizing games[/url].
func tr(message: StringName, context: StringName = "") -> String:
	pass;

#desc Translates a [param message] or [param plural_message], using the translation catalogs configured in the Project Settings. Further [param context] can be specified to help with the translation.
#desc If [method can_translate_messages] is [code]false[/code], or no translation is available, this method returns [param message] or [param plural_message], without changes. See [method set_message_translation].
#desc The [param n] is the number, or amount, of the message's subject. It is used by the translation system to fetch the correct plural form for the current language.
#desc For detailed examples, see [url=$DOCS_URL/tutorials/i18n/localization_using_gettext.html]Localization using gettext[/url].
#desc [b]Note:[/b] Negative and [float] numbers may not properly apply to some countable subjects. It's recommended handling these cases with [method tr].
func tr_n(message: StringName, plural_message: StringName, n: int, context: StringName = "") -> String:
	pass;


