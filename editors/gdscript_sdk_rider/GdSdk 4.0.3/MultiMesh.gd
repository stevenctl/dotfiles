extends Resource
#brief Provides high-performance drawing of a mesh multiple times using GPU instancing.
#desc MultiMesh provides low-level mesh instancing. Drawing thousands of [MeshInstance3D] nodes can be slow, since each object is submitted to the GPU then drawn individually.
#desc MultiMesh is much faster as it can draw thousands of instances with a single draw call, resulting in less API overhead.
#desc As a drawback, if the instances are too far away from each other, performance may be reduced as every single instance will always render (they are spatially indexed as one, for the whole object).
#desc Since instances may have any behavior, the AABB used for visibility must be provided by the user.
#desc [b]Note:[/b] A MultiMesh is a single object, therefore the same maximum lights per object restriction applies. This means, that once the maximum lights are consumed by one or more instances, the rest of the MultiMesh instances will [b]not[/b] receive any lighting.
#desc [b]Note:[/b] Blend Shapes will be ignored if used in a MultiMesh.
#tutorial [Animating thousands of fish with MultiMeshInstance] https://docs.godotengine.org/en/stable/tutorials/performance/vertex_animation/animating_thousands_of_fish.html
#tutorial [Optimization using MultiMeshes] https://docs.godotengine.org/en/stable/tutorials/performance/using_multimesh.html
class_name MultiMesh

#desc Use this when using 2D transforms.
#desc Use this when using 3D transforms.

#enum TransformFormat
enum {
    TRANSFORM_2D = 0,
    TRANSFORM_3D = 1,
}
var buffer: PackedFloat32Array:
	get = get_buffer, set = set_buffer

#desc See [method set_instance_color].
var color_array: PackedColorArray:
	get = _get_color_array, set = _set_color_array

#desc See [method set_instance_custom_data].
var custom_data_array: PackedColorArray:
	get = _get_custom_data_array, set = _set_custom_data_array

#desc Number of instances that will get drawn. This clears and (re)sizes the buffers. Setting data format or flags afterwards will have no effect.
#desc By default, all instances are drawn but you can limit this with [member visible_instance_count].
var instance_count: int:
	get = get_instance_count, set = set_instance_count

#desc [Mesh] resource to be instanced.
#desc The looks of the individual instances can be modified using [method set_instance_color] and [method set_instance_custom_data].
var mesh: Mesh:
	get = get_mesh, set = set_mesh

#desc See [method set_instance_transform_2d].
var transform_2d_array: PackedVector2Array:
	get = _get_transform_2d_array, set = _set_transform_2d_array

#desc See [method set_instance_transform].
var transform_array: PackedVector3Array:
	get = _get_transform_array, set = _set_transform_array

#desc Format of transform used to transform mesh, either 2D or 3D.
var transform_format: int:
	get = get_transform_format, set = set_transform_format

#desc If [code]true[/code], the [MultiMesh] will use color data (see [method set_instance_color]). Can only be set when [member instance_count] is [code]0[/code] or less. This means that you need to call this method before setting the instance count, or temporarily reset it to [code]0[/code].
var use_colors: bool:
	get = is_using_colors, set = set_use_colors

#desc If [code]true[/code], the [MultiMesh] will use custom data (see [method set_instance_custom_data]). Can only be set when [member instance_count] is [code]0[/code] or less. This means that you need to call this method before setting the instance count, or temporarily reset it to [code]0[/code].
var use_custom_data: bool:
	get = is_using_custom_data, set = set_use_custom_data

#desc Limits the number of instances drawn, -1 draws all instances. Changing this does not change the sizes of the buffers.
var visible_instance_count: int:
	get = get_visible_instance_count, set = set_visible_instance_count



#desc Returns the visibility axis-aligned bounding box in local space.
func get_aabb() -> AABB:
	pass;

#desc Gets a specific instance's color multiplier.
func get_instance_color(instance: int) -> Color:
	pass;

#desc Returns the custom data that has been set for a specific instance.
func get_instance_custom_data(instance: int) -> Color:
	pass;

#desc Returns the [Transform3D] of a specific instance.
func get_instance_transform(instance: int) -> Transform3D:
	pass;

#desc Returns the [Transform2D] of a specific instance.
func get_instance_transform_2d(instance: int) -> Transform2D:
	pass;

#desc Sets the color of a specific instance by [i]multiplying[/i] the mesh's existing vertex colors. This allows for different color tinting per instance.
#desc For the color to take effect, ensure that [member use_colors] is [code]true[/code] on the [MultiMesh] and [member BaseMaterial3D.vertex_color_use_as_albedo] is [code]true[/code] on the material. If you intend to set an absolute color instead of tinting, make sure the material's albedo color is set to pure white ([code]Color(1, 1, 1)[/code]).
func set_instance_color(instance: int, color: Color) -> void:
	pass;

#desc Sets custom data for a specific instance. Although [Color] is used, it is just a container for 4 floating point numbers.
#desc For the custom data to be used, ensure that [member use_custom_data] is [code]true[/code].
#desc This custom instance data has to be manually accessed in your custom shader using [code]INSTANCE_CUSTOM[/code].
func set_instance_custom_data(instance: int, custom_data: Color) -> void:
	pass;

#desc Sets the [Transform3D] for a specific instance.
func set_instance_transform(instance: int, transform: Transform3D) -> void:
	pass;

#desc Sets the [Transform2D] for a specific instance.
func set_instance_transform_2d(instance: int, transform: Transform2D) -> void:
	pass;


func get_buffer() -> PackedFloat32Array:
	return buffer

func set_buffer(value: PackedFloat32Array) -> void:
	buffer = value

func _get_color_array() -> PackedColorArray:
	return color_array

func _set_color_array(value: PackedColorArray) -> void:
	color_array = value

func _get_custom_data_array() -> PackedColorArray:
	return custom_data_array

func _set_custom_data_array(value: PackedColorArray) -> void:
	custom_data_array = value

func get_instance_count() -> int:
	return instance_count

func set_instance_count(value: int) -> void:
	instance_count = value

func get_mesh() -> Mesh:
	return mesh

func set_mesh(value: Mesh) -> void:
	mesh = value

func _get_transform_2d_array() -> PackedVector2Array:
	return transform_2d_array

func _set_transform_2d_array(value: PackedVector2Array) -> void:
	transform_2d_array = value

func _get_transform_array() -> PackedVector3Array:
	return transform_array

func _set_transform_array(value: PackedVector3Array) -> void:
	transform_array = value

func get_transform_format() -> int:
	return transform_format

func set_transform_format(value: int) -> void:
	transform_format = value

func is_using_colors() -> bool:
	return use_colors

func set_use_colors(value: bool) -> void:
	use_colors = value

func is_using_custom_data() -> bool:
	return use_custom_data

func set_use_custom_data(value: bool) -> void:
	use_custom_data = value

func get_visible_instance_count() -> int:
	return visible_instance_count

func set_visible_instance_count(value: int) -> void:
	visible_instance_count = value

