extends Resource
#brief Contains baked voxel global illumination data for use in a [VoxelGI] node.
#desc [VoxelGIData] contains baked voxel global illumination for use in a [VoxelGI] node. [VoxelGIData] also offers several properties to adjust the final appearance of the global illumination. These properties can be adjusted at run-time without having to bake the [VoxelGI] node again.
#desc [b]Note:[/b] To prevent text-based scene files ([code].tscn[/code]) from growing too much and becoming slow to load and save, always save [VoxelGIData] to an external binary resource file ([code].res[/code]) instead of embedding it within the scene. This can be done by clicking the dropdown arrow next to the [VoxelGIData] resource, choosing [b]Edit[/b], clicking the floppy disk icon at the top of the Inspector then choosing [b]Save As...[/b].
#tutorial [Third Person Shooter Demo] https://godotengine.org/asset-library/asset/678
class_name VoxelGIData


#desc The normal bias to use for indirect lighting and reflections. Higher values reduce self-reflections visible in non-rough materials, at the cost of more visible light leaking and flatter-looking indirect lighting. To prioritize hiding self-reflections over lighting quality, set [member bias] to [code]0.0[/code] and [member normal_bias] to a value between [code]1.0[/code] and [code]2.0[/code].
var bias: float:
	get = get_bias, set = set_bias

#desc The dynamic range to use ([code]1.0[/code] represents a low dynamic range scene brightness). Higher values can be used to provide brighter indirect lighting, at the cost of more visible color banding in dark areas (both in indirect lighting and reflections). To avoid color banding, it's recommended to use the lowest value that does not result in visible light clipping.
var dynamic_range: float:
	get = get_dynamic_range, set = set_dynamic_range

#desc The energy of the indirect lighting and reflections produced by the [VoxelGI] node. Higher values result in brighter indirect lighting. If indirect lighting looks too flat, try decreasing [member propagation] while increasing [member energy] at the same time. See also [member use_two_bounces] which influences the indirect lighting's effective brightness.
var energy: float:
	get = get_energy, set = set_energy

#desc If [code]true[/code], [Environment] lighting is ignored by the [VoxelGI] node. If [code]false[/code], [Environment] lighting is taken into account by the [VoxelGI] node. [Environment] lighting updates in real-time, which means it can be changed without having to bake the [VoxelGI] node again.
var interior: bool:
	get = is_interior, set = set_interior

#desc The normal bias to use for indirect lighting and reflections. Higher values reduce self-reflections visible in non-rough materials, at the cost of more visible light leaking and flatter-looking indirect lighting. See also [member bias]. To prioritize hiding self-reflections over lighting quality, set [member bias] to [code]0.0[/code] and [member normal_bias] to a value between [code]1.0[/code] and [code]2.0[/code].
var normal_bias: float:
	get = get_normal_bias, set = set_normal_bias

#desc The multiplier to use when light bounces off a surface. Higher values result in brighter indirect lighting. If indirect lighting looks too flat, try decreasing [member propagation] while increasing [member energy] at the same time. See also [member use_two_bounces] which influences the indirect lighting's effective brightness.
var propagation: float:
	get = get_propagation, set = set_propagation

#desc If [code]true[/code], performs two bounces of indirect lighting instead of one. This makes indirect lighting look more natural and brighter at a small performance cost. The second bounce is also visible in reflections. If the scene appears too bright after enabling [member use_two_bounces], adjust [member propagation] and [member energy].
var use_two_bounces: bool:
	get = is_using_two_bounces, set = set_use_two_bounces



func allocate(to_cell_xform: Transform3D, aabb: AABB, octree_size: Vector3, octree_cells: PackedByteArray, data_cells: PackedByteArray, distance_field: PackedByteArray, level_counts: PackedInt32Array) -> void:
	pass;

#desc Returns the bounds of the baked voxel data as an [AABB], which should match [member VoxelGI.size] after being baked (which only contains the size as a [Vector3]).
#desc [b]Note:[/b] If the size was modified without baking the VoxelGI data, then the value of [method get_bounds] and [member VoxelGI.size] will not match.
func get_bounds() -> AABB:
	pass;

func get_data_cells() -> PackedByteArray:
	pass;

func get_level_counts() -> PackedInt32Array:
	pass;

func get_octree_cells() -> PackedByteArray:
	pass;

func get_octree_size() -> Vector3:
	pass;

func get_to_cell_xform() -> Transform3D:
	pass;


func get_bias() -> float:
	return bias

func set_bias(value: float) -> void:
	bias = value

func get_dynamic_range() -> float:
	return dynamic_range

func set_dynamic_range(value: float) -> void:
	dynamic_range = value

func get_energy() -> float:
	return energy

func set_energy(value: float) -> void:
	energy = value

func is_interior() -> bool:
	return interior

func set_interior(value: bool) -> void:
	interior = value

func get_normal_bias() -> float:
	return normal_bias

func set_normal_bias(value: float) -> void:
	normal_bias = value

func get_propagation() -> float:
	return propagation

func set_propagation(value: float) -> void:
	propagation = value

func is_using_two_bounces() -> bool:
	return use_two_bounces

func set_use_two_bounces(value: bool) -> void:
	use_two_bounces = value

