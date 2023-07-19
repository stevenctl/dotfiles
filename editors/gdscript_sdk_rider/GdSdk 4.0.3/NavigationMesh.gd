extends Resource
#brief A mesh to approximate the walkable areas and obstacles.
#desc A navigation mesh is a collection of polygons that define which areas of an environment are traversable to aid agents in pathfinding through complicated spaces.
#tutorial [3D Navmesh Demo] https://godotengine.org/asset-library/asset/124
#tutorial [Using NavigationMeshes] https://docs.godotengine.org/en/stable/tutorials/navigation/navigation_using_navigationmeshes.html
class_name NavigationMesh

#desc Watershed partitioning. Generally the best choice if you precompute the navigation mesh, use this if you have large open areas.
#desc Monotone partitioning. Use this if you want fast navigation mesh generation.
#desc Layer partitioning. Good choice to use for tiled navigation mesh with medium and small sized tiles.
#desc Represents the size of the [enum SamplePartitionType] enum.
#desc Parses mesh instances as geometry. This includes [MeshInstance3D], [CSGShape3D], and [GridMap] nodes.
#desc Parses [StaticBody3D] colliders as geometry. The collider should be in any of the layers specified by [member geometry_collision_mask].
#desc Both [constant PARSED_GEOMETRY_MESH_INSTANCES] and [constant PARSED_GEOMETRY_STATIC_COLLIDERS].
#desc Represents the size of the [enum ParsedGeometryType] enum.
#desc Scans the child nodes of the root node recursively for geometry.
#desc Scans nodes in a group and their child nodes recursively for geometry. The group is specified by [member geometry_source_group_name].
#desc Uses nodes in a group for geometry. The group is specified by [member geometry_source_group_name].
#desc Represents the size of the [enum SourceGeometryMode] enum.

#enum SamplePartitionType
enum {
    SAMPLE_PARTITION_WATERSHED = 0,
    SAMPLE_PARTITION_MONOTONE = 1,
    SAMPLE_PARTITION_LAYERS = 2,
    SAMPLE_PARTITION_MAX = 3,
}
#enum ParsedGeometryType
enum {
    PARSED_GEOMETRY_MESH_INSTANCES = 0,
    PARSED_GEOMETRY_STATIC_COLLIDERS = 1,
    PARSED_GEOMETRY_BOTH = 2,
    PARSED_GEOMETRY_MAX = 3,
}
#enum SourceGeometryMode
enum {
    SOURCE_GEOMETRY_ROOT_NODE_CHILDREN = 0,
    SOURCE_GEOMETRY_GROUPS_WITH_CHILDREN = 1,
    SOURCE_GEOMETRY_GROUPS_EXPLICIT = 2,
    SOURCE_GEOMETRY_MAX = 3,
}
#desc The minimum floor to ceiling height that will still allow the floor area to be considered walkable.
#desc [b]Note:[/b] While baking, this value will be rounded up to the nearest multiple of [member cell_height].
var agent_height: float:
	get = get_agent_height, set = set_agent_height

#desc The minimum ledge height that is considered to still be traversable.
#desc [b]Note:[/b] While baking, this value will be rounded down to the nearest multiple of [member cell_height].
var agent_max_climb: float:
	get = get_agent_max_climb, set = set_agent_max_climb

#desc The maximum slope that is considered walkable, in degrees.
var agent_max_slope: float:
	get = get_agent_max_slope, set = set_agent_max_slope

#desc The distance to erode/shrink the walkable area of the heightfield away from obstructions.
#desc [b]Note:[/b] While baking, this value will be rounded up to the nearest multiple of [member cell_size].
var agent_radius: float:
	get = get_agent_radius, set = set_agent_radius

#desc The Y axis cell size to use for fields.
var cell_height: float:
	get = get_cell_height, set = set_cell_height

#desc The XZ plane cell size to use for fields.
var cell_size: float:
	get = get_cell_size, set = set_cell_size

#desc The sampling distance to use when generating the detail mesh, in cell unit.
var detail_sample_distance: float:
	get = get_detail_sample_distance, set = set_detail_sample_distance

#desc The maximum distance the detail mesh surface should deviate from heightfield, in cell unit.
var detail_sample_max_error: float:
	get = get_detail_sample_max_error, set = set_detail_sample_max_error

#desc The maximum distance a simplfied contour's border edges should deviate the original raw contour.
var edge_max_error: float:
	get = get_edge_max_error, set = set_edge_max_error

#desc The maximum allowed length for contour edges along the border of the mesh.
#desc [b]Note:[/b] While baking, this value will be rounded up to the nearest multiple of [member cell_size].
var edge_max_length: float:
	get = get_edge_max_length, set = set_edge_max_length

#desc If the baking [AABB] has a volume the navigation mesh baking will be restricted to its enclosing area.
var filter_baking_aabb: AABB:
	get = get_filter_baking_aabb, set = set_filter_baking_aabb

#desc The position offset applied to the [member filter_baking_aabb] [AABB].
var filter_baking_aabb_offset: Vector3:
	get = get_filter_baking_aabb_offset, set = set_filter_baking_aabb_offset

#desc If [code]true[/code], marks spans that are ledges as non-walkable.
var filter_ledge_spans: bool:
	get = get_filter_ledge_spans, set = set_filter_ledge_spans

#desc If [code]true[/code], marks non-walkable spans as walkable if their maximum is within [member agent_max_climb] of a walkable neighbor.
var filter_low_hanging_obstacles: bool:
	get = get_filter_low_hanging_obstacles, set = set_filter_low_hanging_obstacles

#desc If [code]true[/code], marks walkable spans as not walkable if the clearance above the span is less than [member agent_height].
var filter_walkable_low_height_spans: bool:
	get = get_filter_walkable_low_height_spans, set = set_filter_walkable_low_height_spans

#desc The physics layers to scan for static colliders.
#desc Only used when [member geometry_parsed_geometry_type] is [constant PARSED_GEOMETRY_STATIC_COLLIDERS] or [constant PARSED_GEOMETRY_BOTH].
var geometry_collision_mask: int:
	get = get_collision_mask, set = set_collision_mask

#desc Determines which type of nodes will be parsed as geometry. See [enum ParsedGeometryType] for possible values.
var geometry_parsed_geometry_type: int:
	get = get_parsed_geometry_type, set = set_parsed_geometry_type

#desc The source of the geometry used when baking. See [enum SourceGeometryMode] for possible values.
var geometry_source_geometry_mode: int:
	get = get_source_geometry_mode, set = set_source_geometry_mode

#desc The name of the group to scan for geometry.
#desc Only used when [member geometry_source_geometry_mode] is [constant SOURCE_GEOMETRY_GROUPS_WITH_CHILDREN] or [constant SOURCE_GEOMETRY_GROUPS_EXPLICIT].
var geometry_source_group_name: StringName:
	get = get_source_group_name, set = set_source_group_name

#desc Any regions with a size smaller than this will be merged with larger regions if possible.
#desc [b]Note:[/b] This value will be squared to calculate the number of cells. For example, a value of 20 will set the number of cells to 400.
var region_merge_size: float:
	get = get_region_merge_size, set = set_region_merge_size

#desc The minimum size of a region for it to be created.
#desc [b]Note:[/b] This value will be squared to calculate the minimum number of cells allowed to form isolated island areas. For example, a value of 8 will set the number of cells to 64.
var region_min_size: float:
	get = get_region_min_size, set = set_region_min_size

#desc Partitioning algorithm for creating the navigation mesh polys. See [enum SamplePartitionType] for possible values.
var sample_partition_type: int:
	get = get_sample_partition_type, set = set_sample_partition_type

#desc The maximum number of vertices allowed for polygons generated during the contour to polygon conversion process.
var vertices_per_polygon: float:
	get = get_vertices_per_polygon, set = set_vertices_per_polygon



#desc Adds a polygon using the indices of the vertices you get when calling [method get_vertices].
func add_polygon(polygon: PackedInt32Array) -> void:
	pass;

#desc Clears the array of polygons, but it doesn't clear the array of vertices.
func clear_polygons() -> void:
	pass;

#desc Initializes the navigation mesh by setting the vertices and indices according to a [Mesh].
#desc [b]Note:[/b] The given [param mesh] must be of type [constant Mesh.PRIMITIVE_TRIANGLES] and have an index array.
func create_from_mesh(mesh: Mesh) -> void:
	pass;

#desc Returns whether or not the specified layer of the [member geometry_collision_mask] is enabled, given a [param layer_number] between 1 and 32.
func get_collision_mask_value(layer_number: int) -> bool:
	pass;

#desc Returns a [PackedInt32Array] containing the indices of the vertices of a created polygon.
func get_polygon(idx: int) -> PackedInt32Array:
	pass;

#desc Returns the number of polygons in the navigation mesh.
func get_polygon_count() -> int:
	pass;

#desc Returns a [PackedVector3Array] containing all the vertices being used to create the polygons.
func get_vertices() -> PackedVector3Array:
	pass;

#desc Based on [param value], enables or disables the specified layer in the [member geometry_collision_mask], given a [param layer_number] between 1 and 32.
func set_collision_mask_value(layer_number: int, value: bool) -> void:
	pass;

#desc Sets the vertices that can be then indexed to create polygons with the [method add_polygon] method.
func set_vertices(vertices: PackedVector3Array) -> void:
	pass;


func get_agent_height() -> float:
	return agent_height

func set_agent_height(value: float) -> void:
	agent_height = value

func get_agent_max_climb() -> float:
	return agent_max_climb

func set_agent_max_climb(value: float) -> void:
	agent_max_climb = value

func get_agent_max_slope() -> float:
	return agent_max_slope

func set_agent_max_slope(value: float) -> void:
	agent_max_slope = value

func get_agent_radius() -> float:
	return agent_radius

func set_agent_radius(value: float) -> void:
	agent_radius = value

func get_cell_height() -> float:
	return cell_height

func set_cell_height(value: float) -> void:
	cell_height = value

func get_cell_size() -> float:
	return cell_size

func set_cell_size(value: float) -> void:
	cell_size = value

func get_detail_sample_distance() -> float:
	return detail_sample_distance

func set_detail_sample_distance(value: float) -> void:
	detail_sample_distance = value

func get_detail_sample_max_error() -> float:
	return detail_sample_max_error

func set_detail_sample_max_error(value: float) -> void:
	detail_sample_max_error = value

func get_edge_max_error() -> float:
	return edge_max_error

func set_edge_max_error(value: float) -> void:
	edge_max_error = value

func get_edge_max_length() -> float:
	return edge_max_length

func set_edge_max_length(value: float) -> void:
	edge_max_length = value

func get_filter_baking_aabb() -> AABB:
	return filter_baking_aabb

func set_filter_baking_aabb(value: AABB) -> void:
	filter_baking_aabb = value

func get_filter_baking_aabb_offset() -> Vector3:
	return filter_baking_aabb_offset

func set_filter_baking_aabb_offset(value: Vector3) -> void:
	filter_baking_aabb_offset = value

func get_filter_ledge_spans() -> bool:
	return filter_ledge_spans

func set_filter_ledge_spans(value: bool) -> void:
	filter_ledge_spans = value

func get_filter_low_hanging_obstacles() -> bool:
	return filter_low_hanging_obstacles

func set_filter_low_hanging_obstacles(value: bool) -> void:
	filter_low_hanging_obstacles = value

func get_filter_walkable_low_height_spans() -> bool:
	return filter_walkable_low_height_spans

func set_filter_walkable_low_height_spans(value: bool) -> void:
	filter_walkable_low_height_spans = value

func get_collision_mask() -> int:
	return geometry_collision_mask

func set_collision_mask(value: int) -> void:
	geometry_collision_mask = value

func get_parsed_geometry_type() -> int:
	return geometry_parsed_geometry_type

func set_parsed_geometry_type(value: int) -> void:
	geometry_parsed_geometry_type = value

func get_source_geometry_mode() -> int:
	return geometry_source_geometry_mode

func set_source_geometry_mode(value: int) -> void:
	geometry_source_geometry_mode = value

func get_source_group_name() -> StringName:
	return geometry_source_group_name

func set_source_group_name(value: StringName) -> void:
	geometry_source_group_name = value

func get_region_merge_size() -> float:
	return region_merge_size

func set_region_merge_size(value: float) -> void:
	region_merge_size = value

func get_region_min_size() -> float:
	return region_min_size

func set_region_min_size(value: float) -> void:
	region_min_size = value

func get_sample_partition_type() -> int:
	return sample_partition_type

func set_sample_partition_type(value: int) -> void:
	sample_partition_type = value

func get_vertices_per_polygon() -> float:
	return vertices_per_polygon

func set_vertices_per_polygon(value: float) -> void:
	vertices_per_polygon = value

