extends Node
#brief 3D Obstacle used in navigation for collision avoidance.
#desc 3D Obstacle used in navigation for collision avoidance. The obstacle needs navigation data to work correctly. [NavigationObstacle3D] is physics safe.
#desc Obstacles [b]don't[/b] change the resulting path from the pathfinding, they only affect the navigation agent movement in a radius. Therefore, using obstacles for the static walls in your level won't work because those walls don't exist in the pathfinding. The navigation agent will be pushed in a semi-random direction away while moving inside that radius. Obstacles are intended as a last resort option for constantly moving objects that cannot be (re)baked to a navigation mesh efficiently.
#tutorial [Using NavigationObstacles] https://docs.godotengine.org/en/stable/tutorials/navigation/navigation_using_navigationobstacles.html
class_name NavigationObstacle3D


#desc Enables radius estimation algorithm which uses parent's collision shapes to determine the obstacle radius.
var estimate_radius: bool:
	get = is_radius_estimated, set = set_estimate_radius

#desc The radius of the agent. Used only if [member estimate_radius] is set to false.
var radius: float:
	get = get_radius, set = set_radius



#desc Returns the [RID] of the navigation map for this NavigationObstacle node. This function returns always the map set on the NavigationObstacle node and not the map of the abstract agent on the NavigationServer. If the agent map is changed directly with the NavigationServer API the NavigationObstacle node will not be aware of the map change. Use [method set_navigation_map] to change the navigation map for the NavigationObstacle and also update the agent on the NavigationServer.
func get_navigation_map() -> RID:
	pass;

#desc Returns the [RID] of this obstacle on the [NavigationServer3D].
func get_rid() -> RID:
	pass;

#desc Sets the [RID] of the navigation map this NavigationObstacle node should use and also updates the [code]agent[/code] on the NavigationServer.
func set_navigation_map(navigation_map: RID) -> void:
	pass;


func is_radius_estimated() -> bool:
	return estimate_radius

func set_estimate_radius(value: bool) -> void:
	estimate_radius = value

func get_radius() -> float:
	return radius

func set_radius(value: float) -> void:
	radius = value

