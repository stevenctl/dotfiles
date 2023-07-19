extends RefCounted
#brief Base class for all resources.
#desc Resource is the base class for all Godot-specific resource types, serving primarily as data containers. Since they inherit from [RefCounted], resources are reference-counted and freed when no longer in use. They can also be nested within other resources, and saved on disk. Once loaded from disk, further attempts to load a resource by [member resource_path] returns the same reference. [PackedScene], one of the most common [Object]s in a Godot project, is also a resource, uniquely capable of storing and instantiating the [Node]s it contains as many times as desired.
#desc In GDScript, resources can loaded from disk by their [member resource_path] using [method @GDScript.load] or [method @GDScript.preload].
#desc [b]Note:[/b] In C#, resources will not be freed instantly after they are no longer in use. Instead, garbage collection will run periodically and will free resources that are no longer in use. This means that unused resources will linger on for a while before being removed.
#tutorial [Resources] https://docs.godotengine.org/en/stable/tutorials/scripting/resources.html
#tutorial [When and how to avoid using nodes for everything] https://docs.godotengine.org/en/stable/tutorials/best_practices/node_alternatives.html
class_name Resource

#desc Emitted when the resource changes, usually when one of its properties is modified. See also [method emit_changed].
#desc [b]Note:[/b] This signal is not emitted automatically for properties of custom resources. If necessary, a setter needs to be created to emit the signal.
signal changed
#desc Emitted when [method setup_local_to_scene] is called, usually by a newly duplicated resource with [member resource_local_to_scene] set to [code]true[/code]. Custom behavior can be defined by connecting this signal.
signal setup_local_to_scene_requested

#desc If [code]true[/code], the resource is duplicated for each instance of all scenes using it. At run-time, the resource can be modified in one scene without affecting other instances (see [method PackedScene.instantiate]).
#desc [b]Note:[/b] Changing this property at run-time has no effect on already created duplicate resources.
var resource_local_to_scene: bool:
	get = is_local_to_scene, set = set_local_to_scene

#desc An optional name for this resource. When defined, its value is displayed to represent the resource in the Inspector dock. For built-in scripts, the name is displayed as part of the tab name in the script editor.
var resource_name: String:
	get = get_name, set = set_name

#desc The unique path to this resource. If it has been saved to disk, the value will be its filepath. If the resource is exclusively contained within a scene, the value will be the [PackedScene]'s filepath, followed by an unique identifier.
#desc [b]Note:[/b] Setting this property manually may fail if a resource with the same path has already been previously loaded. If necessary, use [method take_over_path].
var resource_path: String:
	get = get_path, set = set_path



#desc Override this method to return a custom [RID] when [method get_rid] is called.
func _get_rid() -> RID:
	pass;

#desc Duplicates this resource, returning a new resource with its [code]export[/code]ed or [constant PROPERTY_USAGE_STORAGE] properties copied from the original.
#desc If [param subresources] is [code]false[/code], a shallow copy is returned; nested resources within subresources are not duplicated and are shared from the original resource. If [param subresources] is [code]true[/code], a deep copy is returned; nested subresources will be duplicated and are not shared.
#desc Subresource properties with the [constant PROPERTY_USAGE_ALWAYS_DUPLICATE] flag are always duplicated even with [param subresources] set to [code]false[/code], and properties with the [constant PROPERTY_USAGE_NEVER_DUPLICATE] flag are never duplicated even with [param subresources] set to [code]true[/code].
#desc [b]Note:[/b] For custom resources, this method will fail if [method Object._init] has been defined with required parameters.
func duplicate(subresources: bool = false) -> Resource:
	pass;

#desc Emits the [signal changed] signal. This method is called automatically for built-in resources.
#desc [b]Note:[/b] For custom resources, it's recommended to call this method whenever a meaningful change occurs, such as a modified property. This ensures that custom [Object]s depending on the resource are properly updated.
#desc [codeblock]
#desc var damage:
#desc set(new_value):
#desc if damage != new_value:
#desc damage = new_value
#desc emit_changed()
#desc [/codeblock]
func emit_changed() -> void:
	pass;

#desc If [member resource_local_to_scene] is set to [code]true[/code] and the resource has been loaded from a [PackedScene] instantiation, returns the root [Node] of the scene where this resource is used. Otherwise, returns [code]null[/code].
func get_local_scene() -> Node:
	pass;

#desc Returns the [RID] of this resource (or an empty RID). Many resources (such as [Texture2D], [Mesh], and so on) are high-level abstractions of resources stored in a specialized server ([DisplayServer], [RenderingServer], etc.), so this function will return the original [RID].
func get_rid() -> RID:
	pass;

#desc Emits the [signal setup_local_to_scene_requested] signal. If [member resource_local_to_scene] is set to [code]true[/code], this method is called from [method PackedScene.instantiate] by the newly duplicated resource within the scene instance.
#desc For most resources, this method performs no logic of its own. Custom behavior can be defined by connecting [signal setup_local_to_scene_requested] from a script, [b]not[/b] by overriding this method.
#desc [b]Example:[/b] Assign a random value to [code]health[/code] for every duplicated Resource from an instantiated scene, excluding the original.
#desc [codeblock]
#desc extends Resource
#desc 
#desc var health = 0
#desc 
#desc func _init():
#desc setup_local_to_scene_requested.connect(randomize_health)
#desc 
#desc func randomize_health():
#desc health = randi_range(10, 40)
#desc [/codeblock]
func setup_local_to_scene() -> void:
	pass;

#desc Sets the [member resource_path] to [param path], potentially overriding an existing cache entry for this path. Further attempts to load an overridden resource by path will instead return this resource.
func take_over_path(path: String) -> void:
	pass;


func is_local_to_scene() -> bool:
	return resource_local_to_scene

func set_local_to_scene(value: bool) -> void:
	resource_local_to_scene = value

func get_name() -> String:
	return resource_name

func set_name(value: String) -> void:
	resource_name = value

func get_path() -> String:
	return resource_path

func set_path(value: String) -> void:
	resource_path = value

