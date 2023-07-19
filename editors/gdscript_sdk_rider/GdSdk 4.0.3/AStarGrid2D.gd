extends RefCounted
#brief A* (or "A-Star") pathfinding tailored to find the shortest paths on 2D grids.
#desc Compared to [AStar2D] you don't need to manually create points or connect them together. It also supports multiple type of heuristics and modes for diagonal movement. This class also provides a jumping mode which is faster to calculate than without it in the [AStar2D] class.
#desc In contrast to [AStar2D], you only need set the [member size] of the grid, optionally set the [member cell_size] and then call the [method update] method:
#desc [codeblocks]
#desc [gdscript]
#desc var astar_grid = AStarGrid2D.new()
#desc astar_grid.size = Vector2i(32, 32)
#desc astar_grid.cell_size = Vector2(16, 16)
#desc astar_grid.update()
#desc print(astar_grid.get_id_path(Vector2i(0, 0), Vector2i(3, 4))) # prints (0, 0), (1, 1), (2, 2), (3, 3), (3, 4)
#desc print(astar_grid.get_point_path(Vector2i(0, 0), Vector2i(3, 4))) # prints (0, 0), (16, 16), (32, 32), (48, 48), (48, 64)
#desc [/gdscript]
#desc [csharp]
#desc AStarGrid2D astarGrid = new AStarGrid2D();
#desc astarGrid.Size = new Vector2I(32, 32);
#desc astarGrid.CellSize = new Vector2I(16, 16);
#desc astarGrid.Update();
#desc GD.Print(astarGrid.GetIdPath(Vector2I.Zero, new Vector2I(3, 4))); // prints (0, 0), (1, 1), (2, 2), (3, 3), (3, 4)
#desc GD.Print(astarGrid.GetPointPath(Vector2I.Zero, new Vector2I(3, 4))); // prints (0, 0), (16, 16), (32, 32), (48, 48), (48, 64)
#desc [/csharp]
#desc [/codeblocks]
class_name AStarGrid2D

#desc The [url=https://en.wikipedia.org/wiki/Euclidean_distance]Euclidean heuristic[/url] to be used for the pathfinding using the following formula:
#desc [codeblock]
#desc dx = abs(to_id.x - from_id.x)
#desc dy = abs(to_id.y - from_id.y)
#desc result = sqrt(dx * dx + dy * dy)
#desc [/codeblock]
#desc [b]Note:[/b] This is also the internal heuristic used in [AStar3D] and [AStar2D] by default (with the inclusion of possible z-axis coordinate).
#desc The [url=https://en.wikipedia.org/wiki/Taxicab_geometry]Manhattan heuristic[/url] to be used for the pathfinding using the following formula:
#desc [codeblock]
#desc dx = abs(to_id.x - from_id.x)
#desc dy = abs(to_id.y - from_id.y)
#desc result = dx + dy
#desc [/codeblock]
#desc [b]Note:[/b] This heuristic is intended to be used with 4-side orthogonal movements, provided by setting the [member diagonal_mode] to [constant DIAGONAL_MODE_NEVER].
#desc The Octile heuristic to be used for the pathfinding using the following formula:
#desc [codeblock]
#desc dx = abs(to_id.x - from_id.x)
#desc dy = abs(to_id.y - from_id.y)
#desc f = sqrt(2) - 1
#desc result = (dx < dy) ? f * dx + dy : f * dy + dx;
#desc [/codeblock]
#desc The [url=https://en.wikipedia.org/wiki/Chebyshev_distance]Chebyshev heuristic[/url] to be used for the pathfinding using the following formula:
#desc [codeblock]
#desc dx = abs(to_id.x - from_id.x)
#desc dy = abs(to_id.y - from_id.y)
#desc result = max(dx, dy)
#desc [/codeblock]
#desc Represents the size of the [enum Heuristic] enum.
#desc The pathfinding algorithm will ignore solid neighbors around the target cell and allow passing using diagonals.
#desc The pathfinding algorithm will ignore all diagonals and the way will be always orthogonal.
#desc The pathfinding algorithm will avoid using diagonals if at least two obstacles have been placed around the neighboring cells of the specific path segment.
#desc The pathfinding algorithm will avoid using diagonals if any obstacle has been placed around the neighboring cells of the specific path segment.
#desc Represents the size of the [enum DiagonalMode] enum.

#enum Heuristic
enum {
    HEURISTIC_EUCLIDEAN = 0,
    HEURISTIC_MANHATTAN = 1,
    HEURISTIC_OCTILE = 2,
    HEURISTIC_CHEBYSHEV = 3,
    HEURISTIC_MAX = 4,
}
#enum DiagonalMode
enum {
    DIAGONAL_MODE_ALWAYS = 0,
    DIAGONAL_MODE_NEVER = 1,
    DIAGONAL_MODE_AT_LEAST_ONE_WALKABLE = 2,
    DIAGONAL_MODE_ONLY_IF_NO_OBSTACLES = 3,
    DIAGONAL_MODE_MAX = 4,
}
#desc The size of the point cell which will be applied to calculate the resulting point position returned by [method get_point_path]. If changed, [method update] needs to be called before finding the next path.
var cell_size: Vector2:
	get = get_cell_size, set = set_cell_size

#desc The default [enum Heuristic] which will be used to calculate the cost between two points if [method _compute_cost] was not overridden.
var default_compute_heuristic: int:
	get = get_default_compute_heuristic, set = set_default_compute_heuristic

#desc The default [enum Heuristic] which will be used to calculate the cost between the point and the end point if [method _estimate_cost] was not overridden.
var default_estimate_heuristic: int:
	get = get_default_estimate_heuristic, set = set_default_estimate_heuristic

#desc A specific [enum DiagonalMode] mode which will force the path to avoid or accept the specified diagonals.
var diagonal_mode: int:
	get = get_diagonal_mode, set = set_diagonal_mode

#desc Enables or disables jumping to skip up the intermediate points and speeds up the searching algorithm.
#desc [b]Note:[/b] Currently, toggling it on disables the consideration of weight scaling in pathfinding.
var jumping_enabled: bool:
	get = is_jumping_enabled, set = set_jumping_enabled

#desc The offset of the grid which will be applied to calculate the resulting point position returned by [method get_point_path]. If changed, [method update] needs to be called before finding the next path.
var offset: Vector2:
	get = get_offset, set = set_offset

#desc The size of the grid (number of cells of size [member cell_size] on each axis). If changed, [method update] needs to be called before finding the next path.
var size: Vector2i:
	get = get_size, set = set_size



#desc Called when computing the cost between two connected points.
#desc Note that this function is hidden in the default [code]AStarGrid2D[/code] class.
func _compute_cost(from_id: Vector2i, to_id: Vector2i) -> float:
	pass;

#desc Called when estimating the cost between a point and the path's ending point.
#desc Note that this function is hidden in the default [code]AStarGrid2D[/code] class.
func _estimate_cost(from_id: Vector2i, to_id: Vector2i) -> float:
	pass;

#desc Clears the grid and sets the [member size] to [constant Vector2i.ZERO].
func clear() -> void:
	pass;

#desc Returns an array with the IDs of the points that form the path found by AStar2D between the given points. The array is ordered from the starting point to the ending point of the path.
func get_id_path(from_id: Vector2i, to_id: Vector2i) -> Array[Vector2i]:
	pass;

#desc Returns an array with the points that are in the path found by AStarGrid2D between the given points. The array is ordered from the starting point to the ending point of the path.
#desc [b]Note:[/b] This method is not thread-safe. If called from a [Thread], it will return an empty [PackedVector3Array] and will print an error message.
func get_point_path(from_id: Vector2i, to_id: Vector2i) -> PackedVector2Array:
	pass;

#desc Returns the position of the point associated with the given [param id].
func get_point_position(id: Vector2i) -> Vector2:
	pass;

#desc Returns the weight scale of the point associated with the given [param id].
func get_point_weight_scale(id: Vector2i) -> float:
	pass;

#desc Indicates that the grid parameters were changed and [method update] needs to be called.
func is_dirty() -> bool:
	pass;

#desc Returns [code]true[/code] if the [param x] and [param y] is a valid grid coordinate (id).
func is_in_bounds(x: int, y: int) -> bool:
	pass;

#desc Returns [code]true[/code] if the [param id] vector is a valid grid coordinate.
func is_in_boundsv(id: Vector2i) -> bool:
	pass;

#desc Returns [code]true[/code] if a point is disabled for pathfinding. By default, all points are enabled.
func is_point_solid(id: Vector2i) -> bool:
	pass;

#desc Disables or enables the specified point for pathfinding. Useful for making an obstacle. By default, all points are enabled.
#desc [b]Note:[/b] Calling [method update] is not needed after the call of this function.
func set_point_solid(id: Vector2i, solid: bool = true) -> void:
	pass;

#desc Sets the [param weight_scale] for the point with the given [param id]. The [param weight_scale] is multiplied by the result of [method _compute_cost] when determining the overall cost of traveling across a segment from a neighboring point to this point.
#desc [b]Note:[/b] Calling [method update] is not needed after the call of this function.
func set_point_weight_scale(id: Vector2i, weight_scale: float) -> void:
	pass;

#desc Updates the internal state of the grid according to the parameters to prepare it to search the path. Needs to be called if parameters like [member size], [member cell_size] or [member offset] are changed. [method is_dirty] will return [code]true[/code] if this is the case and this needs to be called.
func update() -> void:
	pass;


func get_cell_size() -> Vector2:
	return cell_size

func set_cell_size(value: Vector2) -> void:
	cell_size = value

func get_default_compute_heuristic() -> int:
	return default_compute_heuristic

func set_default_compute_heuristic(value: int) -> void:
	default_compute_heuristic = value

func get_default_estimate_heuristic() -> int:
	return default_estimate_heuristic

func set_default_estimate_heuristic(value: int) -> void:
	default_estimate_heuristic = value

func get_diagonal_mode() -> int:
	return diagonal_mode

func set_diagonal_mode(value: int) -> void:
	diagonal_mode = value

func is_jumping_enabled() -> bool:
	return jumping_enabled

func set_jumping_enabled(value: bool) -> void:
	jumping_enabled = value

func get_offset() -> Vector2:
	return offset

func set_offset(value: Vector2) -> void:
	offset = value

func get_size() -> Vector2i:
	return size

func set_size(value: Vector2i) -> void:
	size = value

