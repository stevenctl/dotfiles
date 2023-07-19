extends Object
#brief Server interface for low-level 2D navigation access.
#desc NavigationServer2D is the server responsible for all 2D navigation. It handles several objects, namely maps, regions and agents.
#desc Maps are made up of regions, which are made of navigation polygons. Together, they define the navigable areas in the 2D world.
#desc [b]Note:[/b] Most NavigationServer changes take effect after the next physics frame and not immediately. This includes all changes made to maps, regions or agents by navigation related Nodes in the SceneTree or made through scripts.
#desc For two regions to be connected to each other, they must share a similar edge. An edge is considered connected to another if both of its two vertices are at a distance less than [code]edge_connection_margin[/code] to the respective other edge's vertex.
#desc You may assign navigation layers to regions with [method NavigationServer2D.region_set_navigation_layers], which then can be checked upon when requesting a path with [method NavigationServer2D.map_get_path]. This allows allowing or forbidding some areas to 2D objects.
#desc To use the collision avoidance system, you may use agents. You can set an agent's target velocity, then the servers will emit a callback with a modified velocity.
#desc [b]Note:[/b] The collision avoidance system ignores regions. Using the modified velocity as-is might lead to pushing an agent outside of a navigable area. This is a limitation of the collision avoidance system, any more complex situation may require the use of the physics engine.
#desc This server keeps tracks of any call and executes them during the sync phase. This means that you can request any change to the map, using any thread, without worrying.
#tutorial [2D Navigation Demo] https://godotengine.org/asset-library/asset/117
#tutorial [Using NavigationServer] https://docs.godotengine.org/en/stable/tutorials/navigation/navigation_using_navigationservers.html
class_name NavigationServer2D

#desc Emitted when a navigation map is updated, when a region moves or is modified.
signal map_changed(map: RID)
#desc Emitted when navigation debug settings are changed. Only available in debug builds.
signal navigation_debug_changed



#desc Creates the agent.
func agent_create() -> RID:
	pass;

#desc Returns the navigation map [RID] the requested [param agent] is currently assigned to.
func agent_get_map(agent: RID) -> RID:
	pass;

#desc Returns true if the map got changed the previous frame.
func agent_is_map_changed(agent: RID) -> bool:
	pass;

#desc Sets the callback that gets called after each avoidance processing step for the [param agent]. The calculated [code]safe_velocity[/code] will be passed as the first parameter just before the physics calculations.
#desc [b]Note:[/b] Created callbacks are always processed independently of the SceneTree state as long as the agent is on a navigation map and not freed. To disable the dispatch of a callback from an agent use [method agent_set_callback] again with an empty [Callable].
func agent_set_callback(agent: RID, callback: Callable) -> void:
	pass;

#desc Puts the agent in the map.
func agent_set_map(agent: RID, map: RID) -> void:
	pass;

#desc Sets the maximum number of other agents the agent takes into account in the navigation. The larger this number, the longer the running time of the simulation. If the number is too low, the simulation will not be safe.
func agent_set_max_neighbors(agent: RID, count: int) -> void:
	pass;

#desc Sets the maximum speed of the agent. Must be positive.
func agent_set_max_speed(agent: RID, max_speed: float) -> void:
	pass;

#desc Sets the maximum distance to other agents this agent takes into account in the navigation. The larger this number, the longer the running time of the simulation. If the number is too low, the simulation will not be safe.
func agent_set_neighbor_distance(agent: RID, distance: float) -> void:
	pass;

#desc Sets the position of the agent in world space.
func agent_set_position(agent: RID, position: Vector2) -> void:
	pass;

#desc Sets the radius of the agent.
func agent_set_radius(agent: RID, radius: float) -> void:
	pass;

#desc Sets the new target velocity.
func agent_set_target_velocity(agent: RID, target_velocity: Vector2) -> void:
	pass;

#desc The minimal amount of time for which the agent's velocities that are computed by the simulation are safe with respect to other agents. The larger this number, the sooner this agent will respond to the presence of other agents, but the less freedom this agent has in choosing its velocities. Must be positive.
func agent_set_time_horizon(agent: RID, time: float) -> void:
	pass;

#desc Sets the current velocity of the agent.
func agent_set_velocity(agent: RID, velocity: Vector2) -> void:
	pass;

#desc Destroys the given RID.
func free_rid(rid: RID) -> void:
	pass;

#desc Returns [code]true[/code] when the NavigationServer has debug enabled.
func get_debug_enabled() -> bool:
	pass;

#desc Returns all created navigation map [RID]s on the NavigationServer. This returns both 2D and 3D created navigation maps as there is technically no distinction between them.
func get_maps() -> Array[RID]:
	pass;

#desc Create a new link between two positions on a map.
func link_create() -> RID:
	pass;

#desc Returns the ending position of this [code]link[/code].
func link_get_end_position(link: RID) -> Vector2:
	pass;

#desc Returns the enter cost of this [param link].
func link_get_enter_cost(link: RID) -> float:
	pass;

#desc Returns the navigation map [RID] the requested [code]link[/code] is currently assigned to.
func link_get_map(link: RID) -> RID:
	pass;

#desc Returns the navigation layers for this [code]link[/code].
func link_get_navigation_layers(link: RID) -> int:
	pass;

#desc Returns the [code]ObjectID[/code] of the object which manages this link.
func link_get_owner_id(link: RID) -> int:
	pass;

#desc Returns the starting position of this [code]link[/code].
func link_get_start_position(link: RID) -> Vector2:
	pass;

#desc Returns the travel cost of this [param link].
func link_get_travel_cost(link: RID) -> float:
	pass;

#desc Returns whether this [code]link[/code] can be travelled in both directions.
func link_is_bidirectional(link: RID) -> bool:
	pass;

#desc Sets whether this [code]link[/code] can be travelled in both directions.
func link_set_bidirectional(link: RID, bidirectional: bool) -> void:
	pass;

#desc Sets the exit position for the [code]link[/code].
func link_set_end_position(link: RID, position: Vector2) -> void:
	pass;

#desc Sets the [code]enter_cost[/code] for this [code]link[/code].
func link_set_enter_cost(link: RID, enter_cost: float) -> void:
	pass;

#desc Sets the navigation map [RID] for the link.
func link_set_map(link: RID, map: RID) -> void:
	pass;

#desc Set the links's navigation layers. This allows selecting links from a path request (when using [method NavigationServer2D.map_get_path]).
func link_set_navigation_layers(link: RID, navigation_layers: int) -> void:
	pass;

#desc Set the [code]ObjectID[/code] of the object which manages this link.
func link_set_owner_id(link: RID, owner_id: int) -> void:
	pass;

#desc Sets the entry position for this [code]link[/code].
func link_set_start_position(link: RID, position: Vector2) -> void:
	pass;

#desc Sets the [code]travel_cost[/code] for this [code]link[/code].
func link_set_travel_cost(link: RID, travel_cost: float) -> void:
	pass;

#desc Create a new map.
func map_create() -> RID:
	pass;

#desc This function immediately forces synchronization of the specified navigation [param map] [RID]. By default navigation maps are only synchronized at the end of each physics frame. This function can be used to immediately (re)calculate all the navigation meshes and region connections of the navigation map. This makes it possible to query a navigation path for a changed map immediately and in the same frame (multiple times if needed).
#desc Due to technical restrictions the current NavigationServer command queue will be flushed. This means all already queued update commands for this physics frame will be executed, even those intended for other maps, regions and agents not part of the specified map. The expensive computation of the navigation meshes and region connections of a map will only be done for the specified map. Other maps will receive the normal synchronization at the end of the physics frame. Should the specified map receive changes after the forced update it will update again as well when the other maps receive their update.
#desc Avoidance processing and dispatch of the [code]safe_velocity[/code] signals is untouched by this function and continues to happen for all maps and agents at the end of the physics frame.
#desc [b]Note:[/b] With great power comes great responsibility. This function should only be used by users that really know what they are doing and have a good reason for it. Forcing an immediate update of a navigation map requires locking the NavigationServer and flushing the entire NavigationServer command queue. Not only can this severely impact the performance of a game but it can also introduce bugs if used inappropriately without much foresight.
func map_force_update(map: RID) -> void:
	pass;

#desc Returns all navigation agents [RID]s that are currently assigned to the requested navigation [param map].
func map_get_agents(map: RID) -> Array[RID]:
	pass;

#desc Returns the map cell size.
func map_get_cell_size(map: RID) -> float:
	pass;

#desc Returns the point closest to the provided [param to_point] on the navigation mesh surface.
func map_get_closest_point(map: RID, to_point: Vector2) -> Vector2:
	pass;

#desc Returns the owner region RID for the point returned by [method map_get_closest_point].
func map_get_closest_point_owner(map: RID, to_point: Vector2) -> RID:
	pass;

#desc Returns the edge connection margin of the map. The edge connection margin is a distance used to connect two regions.
func map_get_edge_connection_margin(map: RID) -> float:
	pass;

#desc Returns the link connection radius of the map. This distance is the maximum range any link will search for navigation mesh polygons to connect to.
func map_get_link_connection_radius(map: RID) -> float:
	pass;

#desc Returns all navigation link [RID]s that are currently assigned to the requested navigation [code]map[/code].
func map_get_links(map: RID) -> Array[RID]:
	pass;

#desc Returns the navigation path to reach the destination from the origin. [param navigation_layers] is a bitmask of all region navigation layers that are allowed to be in the path.
func map_get_path(map: RID, origin: Vector2, destination: Vector2, optimize: bool, navigation_layers: int = 1) -> PackedVector2Array:
	pass;

#desc Returns all navigation regions [RID]s that are currently assigned to the requested navigation [param map].
func map_get_regions(map: RID) -> Array[RID]:
	pass;

#desc Returns true if the map is active.
func map_is_active(map: RID) -> bool:
	pass;

#desc Sets the map active.
func map_set_active(map: RID, active: bool) -> void:
	pass;

#desc Set the map cell size used to weld the navigation mesh polygons.
func map_set_cell_size(map: RID, cell_size: float) -> void:
	pass;

#desc Set the map edge connection margin used to weld the compatible region edges.
func map_set_edge_connection_margin(map: RID, margin: float) -> void:
	pass;

#desc Set the map's link connection radius used to connect links to navigation polygons.
func map_set_link_connection_radius(map: RID, radius: float) -> void:
	pass;

#desc Queries a path in a given navigation map. Start and target position and other parameters are defined through [NavigationPathQueryParameters2D]. Updates the provided [NavigationPathQueryResult2D] result object with the path among other results requested by the query.
func query_path(parameters: NavigationPathQueryParameters2D, result: NavigationPathQueryResult2D) -> void:
	pass;

#desc Creates a new region.
func region_create() -> RID:
	pass;

#desc Returns the ending point of a connection door. [param connection] is an index between 0 and the return value of [method region_get_connections_count].
func region_get_connection_pathway_end(region: RID, connection: int) -> Vector2:
	pass;

#desc Returns the starting point of a connection door. [param connection] is an index between 0 and the return value of [method region_get_connections_count].
func region_get_connection_pathway_start(region: RID, connection: int) -> Vector2:
	pass;

#desc Returns how many connections this [param region] has with other regions in the map.
func region_get_connections_count(region: RID) -> int:
	pass;

#desc Returns the enter cost of this [param region].
func region_get_enter_cost(region: RID) -> float:
	pass;

#desc Returns the navigation map [RID] the requested [param region] is currently assigned to.
func region_get_map(region: RID) -> RID:
	pass;

#desc Returns the region's navigation layers.
func region_get_navigation_layers(region: RID) -> int:
	pass;

#desc Returns the [code]ObjectID[/code] of the object which manages this region.
func region_get_owner_id(region: RID) -> int:
	pass;

#desc Returns the travel cost of this [param region].
func region_get_travel_cost(region: RID) -> float:
	pass;

#desc Returns [code]true[/code] if the provided [param point] in world space is currently owned by the provided navigation [param region]. Owned in this context means that one of the region's navigation mesh polygon faces has a possible position at the closest distance to this point compared to all other navigation meshes from other navigation regions that are also registered on the navigation map of the provided region.
#desc If multiple navigation meshes have positions at equal distance the navigation region whose polygons are processed first wins the ownership. Polygons are processed in the same order that navigation regions were registered on the NavigationServer.
#desc [b]Note:[/b] If navigation meshes from different navigation regions overlap (which should be avoided in general) the result might not be what is expected.
func region_owns_point(region: RID, point: Vector2) -> bool:
	pass;

#desc Sets the [param enter_cost] for this [param region].
func region_set_enter_cost(region: RID, enter_cost: float) -> void:
	pass;

#desc Sets the map for the region.
func region_set_map(region: RID, map: RID) -> void:
	pass;

#desc Set the region's navigation layers. This allows selecting regions from a path request (when using [method NavigationServer2D.map_get_path]).
func region_set_navigation_layers(region: RID, navigation_layers: int) -> void:
	pass;

#desc Sets the [param navigation_polygon] for the region.
func region_set_navigation_polygon(region: RID, navigation_polygon: NavigationPolygon) -> void:
	pass;

#desc Set the [code]ObjectID[/code] of the object which manages this region.
func region_set_owner_id(region: RID, owner_id: int) -> void:
	pass;

#desc Sets the global transformation for the region.
func region_set_transform(region: RID, transform: Transform2D) -> void:
	pass;

#desc Sets the [param travel_cost] for this [param region].
func region_set_travel_cost(region: RID, travel_cost: float) -> void:
	pass;

#desc If [code]true[/code] enables debug mode on the NavigationServer.
func set_debug_enabled(enabled: bool) -> void:
	pass;


