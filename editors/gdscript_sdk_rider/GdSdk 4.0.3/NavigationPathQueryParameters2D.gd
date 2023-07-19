extends RefCounted
#brief Parameters to be sent to a 2D navigation path query.
#desc This class contains the start and target position and other parameters to be used with [method NavigationServer2D.query_path].
#tutorial [Using NavigationPathQueryObjects] https://docs.godotengine.org/en/stable/tutorials/navigation/navigation_using_navigationpathqueryobjects.html
class_name NavigationPathQueryParameters2D

#desc The path query uses the default A* pathfinding algorithm.
#desc Applies a funnel algorithm to the raw path corridor found by the pathfinding algorithm. This will result in the shortest path possible inside the path corridor. This postprocessing very much depends on the navigation mesh polygon layout and the created corridor. Especially tile- or gridbased layouts can face artificial corners with diagonal movement due to a jagged path corridor imposed by the cell shapes.
#desc Centers every path position in the middle of the traveled navigation mesh polygon edge. This creates better paths for tile- or gridbased layouts that restrict the movement to the cells center.
#desc Don't include any additional metadata about the returned path.
#desc Include the type of navigation primitive (region or link) that each point of the path goes through.
#desc Include the [RID]s of the regions and links that each point of the path goes through.
#desc Include the [code]ObjectID[/code]s of the [Object]s which manage the regions and links each point of the path goes through.
#desc Include all available metadata about the returned path.

#enum PathfindingAlgorithm
enum {
    PATHFINDING_ALGORITHM_ASTAR = 0,
}
#enum PathPostProcessing
enum {
    PATH_POSTPROCESSING_CORRIDORFUNNEL = 0,
    PATH_POSTPROCESSING_EDGECENTERED = 1,
}
#enum PathMetadataFlags
enum {
    PATH_METADATA_INCLUDE_NONE = 0,
    PATH_METADATA_INCLUDE_TYPES = 1,
    PATH_METADATA_INCLUDE_RIDS = 2,
    PATH_METADATA_INCLUDE_OWNERS = 4,
    PATH_METADATA_INCLUDE_ALL = 7,
}
#desc The navigation [code]map[/code] [RID] used in the path query.
var map: RID:
	get = get_map, set = set_map

#desc Additional information to include with the navigation path.
var metadata_flags: int:
	get = get_metadata_flags, set = set_metadata_flags

#desc The navigation layers the query will use (as a bitmask).
var navigation_layers: int:
	get = get_navigation_layers, set = set_navigation_layers

#desc The path postprocessing applied to the raw path corridor found by the [member pathfinding_algorithm].
var path_postprocessing: int:
	get = get_path_postprocessing, set = set_path_postprocessing

#desc The pathfinding algorithm used in the path query.
var pathfinding_algorithm: int:
	get = get_pathfinding_algorithm, set = set_pathfinding_algorithm

#desc The pathfinding start position in global coordinates.
var start_position: Vector2:
	get = get_start_position, set = set_start_position

#desc The pathfinding target position in global coordinates.
var target_position: Vector2:
	get = get_target_position, set = set_target_position




func get_map() -> RID:
	return map

func set_map(value: RID) -> void:
	map = value

func get_metadata_flags() -> int:
	return metadata_flags

func set_metadata_flags(value: int) -> void:
	metadata_flags = value

func get_navigation_layers() -> int:
	return navigation_layers

func set_navigation_layers(value: int) -> void:
	navigation_layers = value

func get_path_postprocessing() -> int:
	return path_postprocessing

func set_path_postprocessing(value: int) -> void:
	path_postprocessing = value

func get_pathfinding_algorithm() -> int:
	return pathfinding_algorithm

func set_pathfinding_algorithm(value: int) -> void:
	pathfinding_algorithm = value

func get_start_position() -> Vector2:
	return start_position

func set_start_position(value: Vector2) -> void:
	start_position = value

func get_target_position() -> Vector2:
	return target_position

func set_target_position(value: Vector2) -> void:
	target_position = value

