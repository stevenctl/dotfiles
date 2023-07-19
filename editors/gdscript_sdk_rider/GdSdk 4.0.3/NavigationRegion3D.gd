extends Node3D
#brief A region of the navigation map.
#desc A region of the navigation map. It tells the [NavigationServer3D] what can be navigated and what cannot, based on its [NavigationMesh] resource.
#desc Two regions can be connected to each other if they share a similar edge. You can set the minimum distance between two vertices required to connect two edges by using [method NavigationServer3D.map_set_edge_connection_margin].
#desc [b]Note:[/b] Overlapping two regions' navigation meshes is not enough for connecting two regions. They must share a similar edge.
#desc The cost of entering this region from another region can be controlled with the [member enter_cost] value.
#desc [b]Note:[/b] This value is not added to the path cost when the start position is already inside this region.
#desc The cost of traveling distances inside this region can be controlled with the [member travel_cost] multiplier.
#desc [b]Note:[/b] This node caches changes to its properties, so if you make changes to the underlying region [RID] in [NavigationServer3D], they will not be reflected in this node's properties.
#tutorial [Using NavigationRegions] https://docs.godotengine.org/en/stable/tutorials/navigation/navigation_using_navigationregions.html
class_name NavigationRegion3D

#desc Notifies when the navigation mesh bake operation is completed.
signal bake_finished
#desc Notifies when the [NavigationMesh] has changed.
signal navigation_mesh_changed

#desc Determines if the [NavigationRegion3D] is enabled or disabled.
var enabled: bool:
	get = is_enabled, set = set_enabled

#desc When pathfinding enters this region's navigation mesh from another regions navigation mesh the [code]enter_cost[/code] value is added to the path distance for determining the shortest path.
var enter_cost: float:
	get = get_enter_cost, set = set_enter_cost

#desc A bitfield determining all navigation layers the region belongs to. These navigation layers can be checked upon when requesting a path with [method NavigationServer3D.map_get_path].
var navigation_layers: int:
	get = get_navigation_layers, set = set_navigation_layers

#desc The [NavigationMesh] resource to use.
var navigation_mesh: NavigationMesh:
	get = get_navigation_mesh, set = set_navigation_mesh

#desc When pathfinding moves inside this region's navigation mesh the traveled distances are multiplied with [code]travel_cost[/code] for determining the shortest path.
var travel_cost: float:
	get = get_travel_cost, set = set_travel_cost



#desc Bakes the [NavigationMesh]. If [param on_thread] is set to [code]true[/code] (default), the baking is done on a separate thread. Baking on separate thread is useful because navigation baking is not a cheap operation. When it is completed, it automatically sets the new [NavigationMesh]. Please note that baking on separate thread may be very slow if geometry is parsed from meshes as async access to each mesh involves heavy synchronization. Also, please note that baking on a separate thread is automatically disabled on operating systems that cannot use threads (such as Web with threads disabled).
func bake_navigation_mesh(on_thread: bool = true) -> void:
	pass;

#desc Returns whether or not the specified layer of the [member navigation_layers] bitmask is enabled, given a [param layer_number] between 1 and 32.
func get_navigation_layer_value(layer_number: int) -> bool:
	pass;

#desc Returns the [RID] of this region on the [NavigationServer3D]. Combined with [method NavigationServer3D.map_get_closest_point_owner] can be used to identify the [NavigationRegion3D] closest to a point on the merged navigation map.
func get_region_rid() -> RID:
	pass;

#desc Based on [param value], enables or disables the specified layer in the [member navigation_layers] bitmask, given a [param layer_number] between 1 and 32.
func set_navigation_layer_value(layer_number: int, value: bool) -> void:
	pass;


func is_enabled() -> bool:
	return enabled

func set_enabled(value: bool) -> void:
	enabled = value

func get_enter_cost() -> float:
	return enter_cost

func set_enter_cost(value: float) -> void:
	enter_cost = value

func get_navigation_layers() -> int:
	return navigation_layers

func set_navigation_layers(value: int) -> void:
	navigation_layers = value

func get_navigation_mesh() -> NavigationMesh:
	return navigation_mesh

func set_navigation_mesh(value: NavigationMesh) -> void:
	navigation_mesh = value

func get_travel_cost() -> float:
	return travel_cost

func set_travel_cost(value: float) -> void:
	travel_cost = value

