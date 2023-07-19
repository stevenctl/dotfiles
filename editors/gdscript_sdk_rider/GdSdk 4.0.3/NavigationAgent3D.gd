extends Node
#brief 3D Agent used in navigation for collision avoidance.
#desc 3D Agent that is used in navigation to reach a position while avoiding static and dynamic obstacles. The dynamic obstacles are avoided using RVO collision avoidance. The agent needs navigation data to work correctly. [NavigationAgent3D] is physics safe.
#desc [b]Note:[/b] After setting [member target_position] it is required to use the [method get_next_path_position] function once every physics frame to update the internal path logic of the NavigationAgent. The returned vector position from this function should be used as the next movement position for the agent's parent Node.
#tutorial [Using NavigationAgents] https://docs.godotengine.org/en/stable/tutorials/navigation/navigation_using_navigationagents.html
class_name NavigationAgent3D

#desc Notifies when a navigation link has been reached.
#desc The details dictionary may contain the following keys depending on the value of [member path_metadata_flags]:
#desc - [code]position[/code]: The start position of the link that was reached.
#desc - [code]type[/code]: Always [constant NavigationPathQueryResult3D.PATH_SEGMENT_TYPE_LINK].
#desc - [code]rid[/code]: The [RID] of the link.
#desc - [code]owner[/code]: The object which manages the link (usually [NavigationLink3D]).
#desc - [code]link_entry_position[/code]: If [code]owner[/code] is available and the owner is a [NavigationLink2D], it will contain the global position of the link's point the agent is entering.
#desc - [code]link_exit_position[/code]: If [code]owner[/code] is available and the owner is a [NavigationLink2D], it will contain the global position of the link's point which the agent is exiting.
signal link_reached(details: Dictionary)
#desc Notifies when the final position is reached.
signal navigation_finished
#desc Notifies when the navigation path changes.
signal path_changed
#desc Notifies when the player-defined [member target_position] is reached.
signal target_reached
#desc Notifies when the collision avoidance velocity is calculated. Emitted at the end of the physics frame in which [method set_velocity] is called. Only emitted when [member avoidance_enabled] is true.
signal velocity_computed(safe_velocity: Vector3)
#desc Notifies when a waypoint along the path has been reached.
#desc The details dictionary may contain the following keys depending on the value of [member path_metadata_flags]:
#desc - [code]position[/code]: The position of the waypoint that was reached.
#desc - [code]type[/code]: The type of navigation primitive (region or link) that contains this waypoint.
#desc - [code]rid[/code]: The [RID] of the containing navigation primitive (region or link).
#desc - [code]owner[/code]: The object which manages the containing navigation primitive (region or link).
signal waypoint_reached(details: Dictionary)

#desc The NavigationAgent height offset is subtracted from the y-axis value of any vector path position for this NavigationAgent. The NavigationAgent height offset does not change or influence the navigation mesh or pathfinding query result. Additional navigation maps that use regions with navigation meshes that the developer baked with appropriate agent radius or height values are required to support different-sized agents.
var agent_height_offset: float:
	get = get_agent_height_offset, set = set_agent_height_offset

#desc If [code]true[/code] the agent is registered for an RVO avoidance callback on the [NavigationServer3D]. When [method set_velocity] is used and the processing is completed a [code]safe_velocity[/code] Vector3 is received with a signal connection to [signal velocity_computed]. Avoidance processing with many registered agents has a significant performance cost and should only be enabled on agents that currently require it.
var avoidance_enabled: bool:
	get = get_avoidance_enabled, set = set_avoidance_enabled

#desc If [code]true[/code] shows debug visuals for this agent.
var debug_enabled: bool:
	get = get_debug_enabled, set = set_debug_enabled

#desc If [member debug_use_custom] is [code]true[/code] uses this color for this agent instead of global color.
var debug_path_custom_color: Color:
	get = get_debug_path_custom_color, set = set_debug_path_custom_color

#desc If [member debug_use_custom] is [code]true[/code] uses this rasterized point size for rendering path points for this agent instead of global point size.
var debug_path_custom_point_size: float:
	get = get_debug_path_custom_point_size, set = set_debug_path_custom_point_size

#desc If [code]true[/code] uses the defined [member debug_path_custom_color] for this agent instead of global color.
var debug_use_custom: bool:
	get = get_debug_use_custom, set = set_debug_use_custom

#desc Ignores collisions on the Y axis. Must be true to move on a horizontal plane.
var ignore_y: bool:
	get = get_ignore_y, set = set_ignore_y

#desc The maximum number of neighbors for the agent to consider.
var max_neighbors: int:
	get = get_max_neighbors, set = set_max_neighbors

#desc The maximum speed that an agent can move.
var max_speed: float:
	get = get_max_speed, set = set_max_speed

#desc A bitfield determining what navigation layers of navigation regions this agent will use to calculate path. Changing it runtime will clear current navigation path and generate new one, according to new navigation layers.
var navigation_layers: int:
	get = get_navigation_layers, set = set_navigation_layers

#desc The distance to search for other agents.
var neighbor_distance: float:
	get = get_neighbor_distance, set = set_neighbor_distance

#desc The distance threshold before a path point is considered to be reached. This will allow an agent to not have to hit a path point on the path exactly, but in the area. If this value is set to high the NavigationAgent will skip points on the path which can lead to leaving the navigation mesh. If this value is set to low the NavigationAgent will be stuck in a repath loop cause it will constantly overshoot or undershoot the distance to the next point on each physics frame update.
var path_desired_distance: float:
	get = get_path_desired_distance, set = set_path_desired_distance

#desc The maximum distance the agent is allowed away from the ideal path to the final position. This can happen due to trying to avoid collisions. When the maximum distance is exceeded, it recalculates the ideal path.
var path_max_distance: float:
	get = get_path_max_distance, set = set_path_max_distance

#desc Additional information to return with the navigation path.
var path_metadata_flags: int:
	get = get_path_metadata_flags, set = set_path_metadata_flags

#desc The path postprocessing applied to the raw path corridor found by the [member pathfinding_algorithm].
var path_postprocessing: int:
	get = get_path_postprocessing, set = set_path_postprocessing

#desc The pathfinding algorithm used in the path query.
var pathfinding_algorithm: int:
	get = get_pathfinding_algorithm, set = set_pathfinding_algorithm

#desc The radius of the avoidance agent. This is the "body" of the avoidance agent and not the avoidance maneuver starting radius (which is controlled by [member neighbor_distance]).
#desc Does not affect normal pathfinding. To change an actor's pathfinding radius bake [NavigationMesh] resources with a different [member NavigationMesh.agent_radius] property and use different navigation maps for each actor size.
var radius: float:
	get = get_radius, set = set_radius

#desc The distance threshold before the final target point is considered to be reached. This will allow an agent to not have to hit the point of the final target exactly, but only the area. If this value is set to low the NavigationAgent will be stuck in a repath loop cause it will constantly overshoot or undershoot the distance to the final target point on each physics frame update.
var target_desired_distance: float:
	get = get_target_desired_distance, set = set_target_desired_distance

#desc The user-defined target position. Setting this property will clear the current navigation path.
var target_position: Vector3:
	get = get_target_position, set = set_target_position

#desc The minimal amount of time for which this agent's velocities, that are computed with the collision avoidance algorithm, are safe with respect to other agents. The larger the number, the sooner the agent will respond to other agents, but less freedom in choosing its velocities. Must be positive.
var time_horizon: float:
	get = get_time_horizon, set = set_time_horizon



#desc Returns the distance to the target position, using the agent's global position. The user must set [member target_position] in order for this to be accurate.
func distance_to_target() -> float:
	pass;

#desc Returns this agent's current path from start to finish in global coordinates. The path only updates when the target position is changed or the agent requires a repath. The path array is not intended to be used in direct path movement as the agent has its own internal path logic that would get corrupted by changing the path array manually. Use the intended [method get_next_path_position] once every physics frame to receive the next path point for the agents movement as this function also updates the internal path logic.
func get_current_navigation_path() -> PackedVector3Array:
	pass;

#desc Returns which index the agent is currently on in the navigation path's [PackedVector3Array].
func get_current_navigation_path_index() -> int:
	pass;

#desc Returns the path query result for the path the agent is currently following.
func get_current_navigation_result() -> NavigationPathQueryResult3D:
	pass;

#desc Returns the reachable final position in global coordinates. This can change if the navigation path is altered in any way. Because of this, it would be best to check this each frame.
func get_final_position() -> Vector3:
	pass;

#desc Returns whether or not the specified layer of the [member navigation_layers] bitmask is enabled, given a [param layer_number] between 1 and 32.
func get_navigation_layer_value(layer_number: int) -> bool:
	pass;

#desc Returns the [RID] of the navigation map for this NavigationAgent node. This function returns always the map set on the NavigationAgent node and not the map of the abstract agent on the NavigationServer. If the agent map is changed directly with the NavigationServer API the NavigationAgent node will not be aware of the map change. Use [method set_navigation_map] to change the navigation map for the NavigationAgent and also update the agent on the NavigationServer.
func get_navigation_map() -> RID:
	pass;

#desc Returns the next position in global coordinates that can be moved to, making sure that there are no static objects in the way. If the agent does not have a navigation path, it will return the position of the agent's parent. The use of this function once every physics frame is required to update the internal path logic of the NavigationAgent.
func get_next_path_position() -> Vector3:
	pass;

#desc Returns the [RID] of this agent on the [NavigationServer3D].
func get_rid() -> RID:
	pass;

#desc Returns true if the navigation path's final position has been reached.
func is_navigation_finished() -> bool:
	pass;

#desc Returns true if [member target_position] is reachable.
func is_target_reachable() -> bool:
	pass;

#desc Returns true if [member target_position] is reached. It may not always be possible to reach the target position. It should always be possible to reach the final position though. See [method get_final_position].
func is_target_reached() -> bool:
	pass;

#desc Based on [param value], enables or disables the specified layer in the [member navigation_layers] bitmask, given a [param layer_number] between 1 and 32.
func set_navigation_layer_value(layer_number: int, value: bool) -> void:
	pass;

#desc Sets the [RID] of the navigation map this NavigationAgent node should use and also updates the [code]agent[/code] on the NavigationServer.
func set_navigation_map(navigation_map: RID) -> void:
	pass;

#desc Sends the passed in velocity to the collision avoidance algorithm. It will adjust the velocity to avoid collisions. Once the adjustment to the velocity is complete, it will emit the [signal velocity_computed] signal.
func set_velocity(velocity: Vector3) -> void:
	pass;


func get_agent_height_offset() -> float:
	return agent_height_offset

func set_agent_height_offset(value: float) -> void:
	agent_height_offset = value

func get_avoidance_enabled() -> bool:
	return avoidance_enabled

func set_avoidance_enabled(value: bool) -> void:
	avoidance_enabled = value

func get_debug_enabled() -> bool:
	return debug_enabled

func set_debug_enabled(value: bool) -> void:
	debug_enabled = value

func get_debug_path_custom_color() -> Color:
	return debug_path_custom_color

func set_debug_path_custom_color(value: Color) -> void:
	debug_path_custom_color = value

func get_debug_path_custom_point_size() -> float:
	return debug_path_custom_point_size

func set_debug_path_custom_point_size(value: float) -> void:
	debug_path_custom_point_size = value

func get_debug_use_custom() -> bool:
	return debug_use_custom

func set_debug_use_custom(value: bool) -> void:
	debug_use_custom = value

func get_ignore_y() -> bool:
	return ignore_y

func set_ignore_y(value: bool) -> void:
	ignore_y = value

func get_max_neighbors() -> int:
	return max_neighbors

func set_max_neighbors(value: int) -> void:
	max_neighbors = value

func get_max_speed() -> float:
	return max_speed

func set_max_speed(value: float) -> void:
	max_speed = value

func get_navigation_layers() -> int:
	return navigation_layers

func set_navigation_layers(value: int) -> void:
	navigation_layers = value

func get_neighbor_distance() -> float:
	return neighbor_distance

func set_neighbor_distance(value: float) -> void:
	neighbor_distance = value

func get_path_desired_distance() -> float:
	return path_desired_distance

func set_path_desired_distance(value: float) -> void:
	path_desired_distance = value

func get_path_max_distance() -> float:
	return path_max_distance

func set_path_max_distance(value: float) -> void:
	path_max_distance = value

func get_path_metadata_flags() -> int:
	return path_metadata_flags

func set_path_metadata_flags(value: int) -> void:
	path_metadata_flags = value

func get_path_postprocessing() -> int:
	return path_postprocessing

func set_path_postprocessing(value: int) -> void:
	path_postprocessing = value

func get_pathfinding_algorithm() -> int:
	return pathfinding_algorithm

func set_pathfinding_algorithm(value: int) -> void:
	pathfinding_algorithm = value

func get_radius() -> float:
	return radius

func set_radius(value: float) -> void:
	radius = value

func get_target_desired_distance() -> float:
	return target_desired_distance

func set_target_desired_distance(value: float) -> void:
	target_desired_distance = value

func get_target_position() -> Vector3:
	return target_position

func set_target_position(value: Vector3) -> void:
	target_position = value

func get_time_horizon() -> float:
	return time_horizon

func set_time_horizon(value: float) -> void:
	time_horizon = value

