extends Node2D
#brief Creates a link between two positions that [NavigationServer2D] can route agents through.
#desc Creates a link between two positions that [NavigationServer2D] can route agents through. Links can be used to express navigation methods that aren't just traveling along the surface of the navigation mesh, like zip-lines, teleporters, or jumping across gaps.
#tutorial [Using NavigationLinks] https://docs.godotengine.org/en/stable/tutorials/navigation/navigation_using_navigationlinks.html
class_name NavigationLink2D


#desc Whether this link can be traveled in both directions or only from [member start_position] to [member end_position].
var bidirectional: bool:
	get = is_bidirectional, set = set_bidirectional

#desc Whether this link is currently active. If [code]false[/code], [method NavigationServer2D.map_get_path] will ignore this link.
var enabled: bool:
	get = is_enabled, set = set_enabled

#desc Ending position of the link.
#desc This position will search out the nearest polygon in the navigation mesh to attach to.
#desc The distance the link will search is controlled by [method NavigationServer2D.map_set_link_connection_radius].
var end_position: Vector2:
	get = get_end_position, set = set_end_position

#desc When pathfinding enters this link from another regions navigation mesh the [code]enter_cost[/code] value is added to the path distance for determining the shortest path.
var enter_cost: float:
	get = get_enter_cost, set = set_enter_cost

#desc A bitfield determining all navigation layers the link belongs to. These navigation layers will be checked when requesting a path with [method NavigationServer2D.map_get_path].
var navigation_layers: int:
	get = get_navigation_layers, set = set_navigation_layers

#desc Starting position of the link.
#desc This position will search out the nearest polygon in the navigation mesh to attach to.
#desc The distance the link will search is controlled by [method NavigationServer2D.map_set_link_connection_radius].
var start_position: Vector2:
	get = get_start_position, set = set_start_position

#desc When pathfinding moves along the link the traveled distance is multiplied with [code]travel_cost[/code] for determining the shortest path.
var travel_cost: float:
	get = get_travel_cost, set = set_travel_cost



#desc Returns the [member end_position] that is relative to the link as a global position.
func get_global_end_position() -> Vector2:
	pass;

#desc Returns the [member start_position] that is relative to the link as a global position.
func get_global_start_position() -> Vector2:
	pass;

#desc Returns whether or not the specified layer of the [member navigation_layers] bitmask is enabled, given a [code]layer_number[/code] between 1 and 32.
func get_navigation_layer_value(layer_number: int) -> bool:
	pass;

#desc Sets the [member end_position] that is relative to the link from a global [param position].
func set_global_end_position(position: Vector2) -> void:
	pass;

#desc Sets the [member start_position] that is relative to the link from a global [param position].
func set_global_start_position(position: Vector2) -> void:
	pass;

#desc Based on [code]value[/code], enables or disables the specified layer in the [member navigation_layers] bitmask, given a [code]layer_number[/code] between 1 and 32.
func set_navigation_layer_value(layer_number: int, value: bool) -> void:
	pass;


func is_bidirectional() -> bool:
	return bidirectional

func set_bidirectional(value: bool) -> void:
	bidirectional = value

func is_enabled() -> bool:
	return enabled

func set_enabled(value: bool) -> void:
	enabled = value

func get_end_position() -> Vector2:
	return end_position

func set_end_position(value: Vector2) -> void:
	end_position = value

func get_enter_cost() -> float:
	return enter_cost

func set_enter_cost(value: float) -> void:
	enter_cost = value

func get_navigation_layers() -> int:
	return navigation_layers

func set_navigation_layers(value: int) -> void:
	navigation_layers = value

func get_start_position() -> Vector2:
	return start_position

func set_start_position(value: Vector2) -> void:
	start_position = value

func get_travel_cost() -> float:
	return travel_cost

func set_travel_cost(value: float) -> void:
	travel_cost = value

