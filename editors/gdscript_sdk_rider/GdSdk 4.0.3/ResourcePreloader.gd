extends Node
#brief Preloads a list of resources inside a scene.
#desc This node is used to preload sub-resources inside a scene, so when the scene is loaded, all the resources are ready to use and can be retrieved from the preloader. You can add the resources using the ResourcePreloader tab when the node is selected.
#desc GDScript has a simplified [method @GDScript.preload] built-in method which can be used in most situations, leaving the use of [ResourcePreloader] for more advanced scenarios.
class_name ResourcePreloader




#desc Adds a resource to the preloader with the given [param name]. If a resource with the given [param name] already exists, the new resource will be renamed to "[param name] N" where N is an incrementing number starting from 2.
func add_resource(name: StringName, resource: Resource) -> void:
	pass;

#desc Returns the resource associated to [param name].
func get_resource(name: StringName) -> Resource:
	pass;

#desc Returns the list of resources inside the preloader.
func get_resource_list() -> PackedStringArray:
	pass;

#desc Returns [code]true[/code] if the preloader contains a resource associated to [param name].
func has_resource(name: StringName) -> bool:
	pass;

#desc Removes the resource associated to [param name] from the preloader.
func remove_resource(name: StringName) -> void:
	pass;

#desc Renames a resource inside the preloader from [param name] to [param newname].
func rename_resource(name: StringName, newname: StringName) -> void:
	pass;


