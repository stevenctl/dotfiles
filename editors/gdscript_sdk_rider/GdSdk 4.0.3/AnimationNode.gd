extends Resource
#brief Base resource for [AnimationTree] nodes.
#desc Base resource for [AnimationTree] nodes. In general, it's not used directly, but you can create custom ones with custom blending formulas.
#desc Inherit this when creating nodes mainly for use in [AnimationNodeBlendTree], otherwise [AnimationRootNode] should be used instead.
#tutorial [AnimationTree] https://docs.godotengine.org/en/stable/tutorials/animation/animation_tree.html
class_name AnimationNode

#desc Emitted by nodes that inherit from this class and that have an internal tree when one of their nodes removes. The nodes that emit this signal are [AnimationNodeBlendSpace1D], [AnimationNodeBlendSpace2D], [AnimationNodeStateMachine], and [AnimationNodeBlendTree].
signal animation_node_removed(object_id: int, name: String)
#desc Emitted by nodes that inherit from this class and that have an internal tree when one of their node names changes. The nodes that emit this signal are [AnimationNodeBlendSpace1D], [AnimationNodeBlendSpace2D], [AnimationNodeStateMachine], and [AnimationNodeBlendTree].
signal animation_node_renamed(object_id: int, old_name: String, new_name: String)
#desc Emitted by nodes that inherit from this class and that have an internal tree when one of their nodes changes. The nodes that emit this signal are [AnimationNodeBlendSpace1D], [AnimationNodeBlendSpace2D], [AnimationNodeStateMachine], [AnimationNodeBlendTree] and [AnimationNodeTransition].
signal tree_changed
#desc Do not use filtering.
#desc Paths matching the filter will be allowed to pass.
#desc Paths matching the filter will be discarded.
#desc Paths matching the filter will be blended (by the blend value).

#enum FilterAction
enum {
    FILTER_IGNORE = 0,
    FILTER_PASS = 1,
    FILTER_STOP = 2,
    FILTER_BLEND = 3,
}
#desc If [code]true[/code], filtering is enabled.
var filter_enabled: bool:
	get = is_filter_enabled, set = set_filter_enabled



#desc When inheriting from [AnimationRootNode], implement this virtual method to override the text caption for this node.
func _get_caption() -> String:
	pass;

#desc When inheriting from [AnimationRootNode], implement this virtual method to return a child node by its [param name].
func _get_child_by_name(name: StringName) -> AnimationNode:
	pass;

#desc When inheriting from [AnimationRootNode], implement this virtual method to return all children nodes in order as a [code]name: node[/code] dictionary.
func _get_child_nodes() -> Dictionary:
	pass;

#desc When inheriting from [AnimationRootNode], implement this virtual method to return the default value of a [param parameter]. Parameters are custom local memory used for your nodes, given a resource can be reused in multiple trees.
func _get_parameter_default_value(parameter: StringName) -> Variant:
	pass;

#desc When inheriting from [AnimationRootNode], implement this virtual method to return a list of the properties on this node. Parameters are custom local memory used for your nodes, given a resource can be reused in multiple trees. Format is similar to [method Object.get_property_list].
func _get_parameter_list() -> Array:
	pass;

#desc When inheriting from [AnimationRootNode], implement this virtual method to return whether the blend tree editor should display filter editing on this node.
func _has_filter() -> bool:
	pass;

#desc When inheriting from [AnimationRootNode], implement this virtual method to return whether the [param parameter] is read-only. Parameters are custom local memory used for your nodes, given a resource can be reused in multiple trees.
func _is_parameter_read_only(parameter: StringName) -> bool:
	pass;

#desc When inheriting from [AnimationRootNode], implement this virtual method to run some code when this node is processed. The [param time] parameter is a relative delta, unless [param seek] is [code]true[/code], in which case it is absolute.
#desc Here, call the [method blend_input], [method blend_node] or [method blend_animation] functions. You can also use [method get_parameter] and [method set_parameter] to modify local memory.
#desc This function should return the time left for the current animation to finish (if unsure, pass the value from the main blend being called).
func _process(time: float, seek: bool, is_external_seeking: bool) -> float:
	pass;

#desc Adds an input to the node. This is only useful for nodes created for use in an [AnimationNodeBlendTree]. If the addition fails, returns [code]false[/code].
func add_input(name: String) -> bool:
	pass;

#desc Blend an animation by [param blend] amount (name must be valid in the linked [AnimationPlayer]). A [param time] and [param delta] may be passed, as well as whether [param seeked] happened.
#desc A [param looped_flag] is used by internal processing immediately after the loop. See also [enum Animation.LoopedFlag].
func blend_animation(animation: StringName, time: float, delta: float, seeked: bool, is_external_seeking: bool, blend: float, looped_flag: int = 0) -> void:
	pass;

#desc Blend an input. This is only useful for nodes created for an [AnimationNodeBlendTree]. The [param time] parameter is a relative delta, unless [param seek] is [code]true[/code], in which case it is absolute. A filter mode may be optionally passed (see [enum FilterAction] for options).
func blend_input(input_index: int, time: float, seek: bool, is_external_seeking: bool, blend: float, filter: int = 0, sync: bool = true) -> float:
	pass;

#desc Blend another animation node (in case this node contains children animation nodes). This function is only useful if you inherit from [AnimationRootNode] instead, else editors will not display your node for addition.
func blend_node(name: StringName, node: AnimationNode, time: float, seek: bool, is_external_seeking: bool, blend: float, filter: int = 0, sync: bool = true) -> float:
	pass;

#desc Returns the input index which corresponds to [param name]. If not found, returns [code]-1[/code].
func find_input(name: String) -> int:
	pass;

#desc Amount of inputs in this node, only useful for nodes that go into [AnimationNodeBlendTree].
func get_input_count() -> int:
	pass;

#desc Gets the name of an input by index.
func get_input_name(input: int) -> String:
	pass;

#desc Gets the value of a parameter. Parameters are custom local memory used for your nodes, given a resource can be reused in multiple trees.
func get_parameter(name: StringName) -> Variant:
	pass;

#desc Returns whether the given path is filtered.
func is_path_filtered(path: NodePath) -> bool:
	pass;

#desc Removes an input, call this only when inactive.
func remove_input(index: int) -> void:
	pass;

#desc Adds or removes a path for the filter.
func set_filter_path(path: NodePath, enable: bool) -> void:
	pass;

#desc Sets the name of the input at the given [param input] index. If the setting fails, returns [code]false[/code].
func set_input_name(input: int, name: String) -> bool:
	pass;

#desc Sets a custom parameter. These are used as local memory, because resources can be reused across the tree or scenes.
func set_parameter(name: StringName, value: Variant) -> void:
	pass;


func is_filter_enabled() -> bool:
	return filter_enabled

func set_filter_enabled(value: bool) -> void:
	filter_enabled = value

