extends Object
#brief General-purpose helper to manage undo/redo operations.
#desc UndoRedo works by registering methods and property changes inside "actions".
#desc Common behavior is to create an action, then add do/undo calls to functions or property changes, then committing the action.
#desc Here's an example on how to add an UndoRedo action:
#desc [codeblocks]
#desc [gdscript]
#desc var undo_redo = UndoRedo.new()
#desc 
#desc func do_something():
#desc pass # Put your code here.
#desc 
#desc func undo_something():
#desc pass # Put here the code that reverts what's done by "do_something()".
#desc 
#desc func _on_my_button_pressed():
#desc var node = get_node("MyNode2D")
#desc undo_redo.create_action("Move the node")
#desc undo_redo.add_do_method(do_something)
#desc undo_redo.add_undo_method(undo_something)
#desc undo_redo.add_do_property(node, "position", Vector2(100,100))
#desc undo_redo.add_undo_property(node, "position", node.position)
#desc undo_redo.commit_action()
#desc [/gdscript]
#desc [csharp]
#desc private UndoRedo _undoRedo;
#desc 
#desc public override void _Ready()
#desc {
#desc _undoRedo = new UndoRedo();
#desc }
#desc 
#desc public void DoSomething()
#desc {
#desc // Put your code here.
#desc }
#desc 
#desc public void UndoSomething()
#desc {
#desc // Put here the code that reverts what's done by "DoSomething()".
#desc }
#desc 
#desc private void OnMyButtonPressed()
#desc {
#desc var node = GetNode<Node2D>("MyNode2D");
#desc _undoRedo.CreateAction("Move the node");
#desc _undoRedo.AddDoMethod(new Callable(this, MethodName.DoSomething));
#desc _undoRedo.AddUndoMethod(new Callable(this, MethodName.UndoSomething));
#desc _undoRedo.AddDoProperty(node, "position", new Vector2(100, 100));
#desc _undoRedo.AddUndoProperty(node, "position", node.Position);
#desc _undoRedo.CommitAction();
#desc }
#desc [/csharp]
#desc [/codeblocks]
#desc [method create_action], [method add_do_method], [method add_undo_method], [method add_do_property], [method add_undo_property], and [method commit_action] should be called one after the other, like in the example. Not doing so could lead to crashes.
#desc If you don't need to register a method, you can leave [method add_do_method] and [method add_undo_method] out; the same goes for properties. You can also register more than one method/property.
#desc If you are making an [EditorPlugin] and want to integrate into the editor's undo history, use [EditorUndoRedoManager] instead.
class_name UndoRedo

#desc Called when [method undo] or [method redo] was called.
signal version_changed
#desc Makes "do"/"undo" operations stay in separate actions.
#desc Makes so that the action's "undo" operations are from the first action created and the "do" operations are from the last subsequent action with the same name.
#desc Makes subsequent actions with the same name be merged into one.

#enum MergeMode
enum {
    MERGE_DISABLE = 0,
    MERGE_ENDS = 1,
    MERGE_ALL = 2,
}


#desc Register a [Callable] that will be called when the action is committed.
func add_do_method(callable: Callable) -> void:
	pass;

#desc Register a [param property] that would change its value to [param value] when the action is committed.
func add_do_property(object: Object, property: StringName, value: Variant) -> void:
	pass;

#desc Register a reference for "do" that will be erased if the "do" history is lost. This is useful mostly for new nodes created for the "do" call. Do not use for resources.
#desc [codeblock]
#desc var node = Node2D.new()
#desc undo_redo.create_action("Add node")
#desc undo_redo.add_do_method(add_child.bind(node))
#desc undo_redo.add_do_reference(node)
#desc undo_redo.add_undo_method(remove_child.bind(node))
#desc undo_redo.commit_action()
#desc [/codeblock]
func add_do_reference(object: Object) -> void:
	pass;

#desc Register a [Callable] that will be called when the action is undone.
func add_undo_method(callable: Callable) -> void:
	pass;

#desc Register a [param property] that would change its value to [param value] when the action is undone.
func add_undo_property(object: Object, property: StringName, value: Variant) -> void:
	pass;

#desc Register a reference for "undo" that will be erased if the "undo" history is lost. This is useful mostly for nodes removed with the "do" call (not the "undo" call!).
#desc [codeblock]
#desc var node = $Node2D
#desc undo_redo.create_action("Remove node")
#desc undo_redo.add_do_method(remove_child.bind(node))
#desc undo_redo.add_undo_method(add_child.bind(node))
#desc undo_redo.add_undo_reference(node)
#desc undo_redo.commit_action()
#desc [/codeblock]
func add_undo_reference(object: Object) -> void:
	pass;

#desc Clear the undo/redo history and associated references.
#desc Passing [code]false[/code] to [param increase_version] will prevent the version number from increasing when the history is cleared.
func clear_history(increase_version: bool = true) -> void:
	pass;

#desc Commit the action. If [param execute] is [code]true[/code] (which it is by default), all "do" methods/properties are called/set when this function is called.
func commit_action(execute: bool = true) -> void:
	pass;

#desc Create a new action. After this is called, do all your calls to [method add_do_method], [method add_undo_method], [method add_do_property], and [method add_undo_property], then commit the action with [method commit_action].
#desc The way actions are merged is dictated by [param merge_mode]. See [enum MergeMode] for details.
func create_action(name: String, merge_mode: int = 0) -> void:
	pass;

#desc Stops marking operations as to be processed even if the action gets merged with another in the [constant MERGE_ENDS] mode. See [method start_force_keep_in_merge_ends].
func end_force_keep_in_merge_ends() -> void:
	pass;

#desc Gets the action name from its index.
func get_action_name(id: int) -> String:
	pass;

#desc Gets the index of the current action.
func get_current_action() -> int:
	pass;

#desc Gets the name of the current action, equivalent to [code]get_action_name(get_current_action())[/code].
func get_current_action_name() -> String:
	pass;

#desc Returns how many elements are in the history.
func get_history_count() -> int:
	pass;

#desc Gets the version. Every time a new action is committed, the [UndoRedo]'s version number is increased automatically.
#desc This is useful mostly to check if something changed from a saved version.
func get_version() -> int:
	pass;

#desc Returns [code]true[/code] if a "redo" action is available.
func has_redo() -> bool:
	pass;

#desc Returns [code]true[/code] if an "undo" action is available.
func has_undo() -> bool:
	pass;

#desc Returns [code]true[/code] if the [UndoRedo] is currently committing the action, i.e. running its "do" method or property change (see [method commit_action]).
func is_committing_action() -> bool:
	pass;

#desc Redo the last action.
func redo() -> bool:
	pass;

#desc Marks the next "do" and "undo" operations to be processed even if the action gets merged with another in the [constant MERGE_ENDS] mode. Return to normal operation using [method end_force_keep_in_merge_ends].
func start_force_keep_in_merge_ends() -> void:
	pass;

#desc Undo the last action.
func undo() -> bool:
	pass;


