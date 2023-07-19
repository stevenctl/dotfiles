extends Node3D
#brief Parent of all visual 3D nodes.
#desc The [VisualInstance3D] is used to connect a resource to a visual representation. All visual 3D nodes inherit from the [VisualInstance3D]. In general, you should not access the [VisualInstance3D] properties directly as they are accessed and managed by the nodes that inherit from [VisualInstance3D]. [VisualInstance3D] is the node representation of the [RenderingServer] instance.
class_name VisualInstance3D


#desc The render layer(s) this [VisualInstance3D] is drawn on.
#desc This object will only be visible for [Camera3D]s whose cull mask includes any of the render layers this [VisualInstance3D] is set to.
#desc For [Light3D]s, this can be used to control which [VisualInstance3D]s are affected by a specific light. For [GPUParticles3D], this can be used to control which particles are effected by a specific attractor. For [Decal]s, this can be used to control which [VisualInstance3D]s are affected by a specific decal.
var layers: int:
	get = get_layer_mask, set = set_layer_mask

#desc The amount by which the depth of this [VisualInstance3D] will be adjusted when sorting by depth. Uses the same units as the engine (which are typically meters). Adjusting it to a higher value will make the [VisualInstance3D] reliably draw on top of other [VisualInstance3D]s that are otherwise positioned at the same spot. To ensure it always draws on top of other objects around it (not positioned at the same spot), set the value to be greater than the distance between this [VisualInstance3D] and the other nearby [VisualInstance3D]s.
var sorting_offset: float:
	get = get_sorting_offset, set = set_sorting_offset

#desc If [code]true[/code], the object is sorted based on the [AABB] center. The object will be sorted based on the global position otherwise.
#desc The [AABB] center based sorting is generally more accurate for 3D models. The position based sorting instead allows to better control the drawing order when working with [GPUParticles3D] and [CPUParticles3D].
var sorting_use_aabb_center: bool:
	get = is_sorting_use_aabb_center, set = set_sorting_use_aabb_center



func _get_aabb() -> AABB:
	pass;

#desc Returns the [AABB] (also known as the bounding box) for this [VisualInstance3D].
func get_aabb() -> AABB:
	pass;

#desc Returns the RID of the resource associated with this [VisualInstance3D]. For example, if the Node is a [MeshInstance3D], this will return the RID of the associated [Mesh].
func get_base() -> RID:
	pass;

#desc Returns the RID of this instance. This RID is the same as the RID returned by [method RenderingServer.instance_create]. This RID is needed if you want to call [RenderingServer] functions directly on this [VisualInstance3D].
func get_instance() -> RID:
	pass;

#desc Returns whether or not the specified layer of the [member layers] is enabled, given a [code]layer_number[/code] between 1 and 20.
func get_layer_mask_value(layer_number: int) -> bool:
	pass;

#desc Sets the resource that is instantiated by this [VisualInstance3D], which changes how the engine handles the [VisualInstance3D] under the hood. Equivalent to [method RenderingServer.instance_set_base].
func set_base(base: RID) -> void:
	pass;

#desc Based on [param value], enables or disables the specified layer in the [member layers], given a [param layer_number] between 1 and 20.
func set_layer_mask_value(layer_number: int, value: bool) -> void:
	pass;


func get_layer_mask() -> int:
	return layers

func set_layer_mask(value: int) -> void:
	layers = value

func get_sorting_offset() -> float:
	return sorting_offset

func set_sorting_offset(value: float) -> void:
	sorting_offset = value

func is_sorting_use_aabb_center() -> bool:
	return sorting_use_aabb_center

func set_sorting_use_aabb_center(value: bool) -> void:
	sorting_use_aabb_center = value

