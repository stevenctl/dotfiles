extends Resource
#brief Class that has everything pertaining to a world.
#desc Class that has everything pertaining to a world. A physics space, a visual scenario and a sound space. Node3D nodes register their resources into the current world.
#tutorial [Ray-casting] https://docs.godotengine.org/en/stable/tutorials/physics/ray-casting.html
class_name World3D


#desc The default [CameraAttributes] resource to use if none set on the [Camera3D].
var camera_attributes: CameraAttributes:
	get = get_camera_attributes, set = set_camera_attributes

#desc Direct access to the world's physics 3D space state. Used for querying current and potential collisions. When using multi-threaded physics, access is limited to [method Node._physics_process] in the main thread.
var direct_space_state: PhysicsDirectSpaceState3D:
	get = get_direct_space_state

#desc The World3D's [Environment].
var environment: Environment:
	get = get_environment, set = set_environment

#desc The World3D's fallback environment will be used if [member environment] fails or is missing.
var fallback_environment: Environment:
	get = get_fallback_environment, set = set_fallback_environment

#desc The [RID] of this world's navigation map. Used by the [NavigationServer3D].
var navigation_map: RID:
	get = get_navigation_map

#desc The World3D's visual scenario.
var scenario: RID:
	get = get_scenario

#desc The World3D's physics space.
var space: RID:
	get = get_space




func get_camera_attributes() -> CameraAttributes:
	return camera_attributes

func set_camera_attributes(value: CameraAttributes) -> void:
	camera_attributes = value

func get_direct_space_state() -> PhysicsDirectSpaceState3D:
	return direct_space_state

func get_environment() -> Environment:
	return environment

func set_environment(value: Environment) -> void:
	environment = value

func get_fallback_environment() -> Environment:
	return fallback_environment

func set_fallback_environment(value: Environment) -> void:
	fallback_environment = value

func get_navigation_map() -> RID:
	return navigation_map

func get_scenario() -> RID:
	return scenario

func get_space() -> RID:
	return space

