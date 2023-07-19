extends RefCounted
#brief Post-processes scenes after import.
#desc Imported scenes can be automatically modified right after import by setting their [b]Custom Script[/b] Import property to a [code]tool[/code] script that inherits from this class.
#desc The [method _post_import] callback receives the imported scene's root node and returns the modified version of the scene. Usage example:
#desc [codeblocks]
#desc [gdscript]
#desc @tool # Needed so it runs in editor.
#desc extends EditorScenePostImport
#desc 
#desc # This sample changes all node names.
#desc # Called right after the scene is imported and gets the root node.
#desc func _post_import(scene):
#desc # Change all node names to "modified_[oldnodename]"
#desc iterate(scene)
#desc return scene # Remember to return the imported scene
#desc 
#desc func iterate(node):
#desc if node != null:
#desc node.name = "modified_" + node.name
#desc for child in node.get_children():
#desc iterate(child)
#desc [/gdscript]
#desc [csharp]
#desc using Godot;
#desc 
#desc // This sample changes all node names.
#desc // Called right after the scene is imported and gets the root node.
#desc [Tool]
#desc public partial class NodeRenamer : EditorScenePostImport
#desc {
#desc public override GodotObject _PostImport(Node scene)
#desc {
#desc // Change all node names to "modified_[oldnodename]"
#desc Iterate(scene);
#desc return scene; // Remember to return the imported scene
#desc }
#desc 
#desc public void Iterate(Node node)
#desc {
#desc if (node != null)
#desc {
#desc node.Name = $"modified_{node.Name}";
#desc foreach (Node child in node.GetChildren())
#desc {
#desc Iterate(child);
#desc }
#desc }
#desc }
#desc }
#desc [/csharp]
#desc [/codeblocks]
#tutorial [Importing 3D scenes: Custom script] https://docs.godotengine.org/en/stable/tutorials/assets_pipeline/importing_scenes.html#custom-script
class_name EditorScenePostImport




#desc Called after the scene was imported. This method must return the modified version of the scene.
func _post_import(scene: Node) -> Object:
	pass;

#desc Returns the source file path which got imported (e.g. [code]res://scene.dae[/code]).
func get_source_file() -> String:
	pass;


