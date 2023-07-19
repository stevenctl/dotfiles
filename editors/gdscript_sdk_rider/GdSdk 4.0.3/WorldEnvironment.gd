extends Node
#brief Default environment properties for the entire scene (post-processing effects, lighting and background settings).
#desc The [WorldEnvironment] node is used to configure the default [Environment] for the scene.
#desc The parameters defined in the [WorldEnvironment] can be overridden by an [Environment] node set on the current [Camera3D]. Additionally, only one [WorldEnvironment] may be instantiated in a given scene at a time.
#desc The [WorldEnvironment] allows the user to specify default lighting parameters (e.g. ambient lighting), various post-processing effects (e.g. SSAO, DOF, Tonemapping), and how to draw the background (e.g. solid color, skybox). Usually, these are added in order to improve the realism/color balance of the scene.
#tutorial [Environment and post-processing] https://docs.godotengine.org/en/stable/tutorials/3d/environment_and_post_processing.html
#tutorial [3D Material Testers Demo] https://godotengine.org/asset-library/asset/123
#tutorial [2D HDR Demo] https://godotengine.org/asset-library/asset/110
#tutorial [Third Person Shooter Demo] https://godotengine.org/asset-library/asset/678
class_name WorldEnvironment


#desc The default [CameraAttributes] resource to use if none set on the [Camera3D].
var camera_attributes: CameraAttributes:
	get = get_camera_attributes, set = set_camera_attributes

#desc The [Environment] resource used by this [WorldEnvironment], defining the default properties.
var environment: Environment:
	get = get_environment, set = set_environment




func get_camera_attributes() -> CameraAttributes:
	return camera_attributes

func set_camera_attributes(value: CameraAttributes) -> void:
	camera_attributes = value

func get_environment() -> Environment:
	return environment

func set_environment(value: Environment) -> void:
	environment = value

