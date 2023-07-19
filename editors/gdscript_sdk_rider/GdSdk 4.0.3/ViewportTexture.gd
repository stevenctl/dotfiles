extends Texture2D
#brief Texture which displays the content of a [Viewport].
#desc Displays the content of a [Viewport] node as a dynamic [Texture2D]. This can be used to mix controls, 2D, and 3D elements in the same scene.
#desc To create a ViewportTexture in code, use the [method Viewport.get_texture] method on the target viewport.
#desc [b]Note:[/b] When local to scene, this texture uses [method Resource.setup_local_to_scene] to set the proxy texture and flags in the local viewport. Local to scene viewport textures will return incorrect data until the scene root is ready (see [signal Node.ready]).
#tutorial [GUI in 3D Demo] https://godotengine.org/asset-library/asset/127
#tutorial [3D in 2D Demo] https://godotengine.org/asset-library/asset/128
#tutorial [2D in 3D Demo] https://godotengine.org/asset-library/asset/129
#tutorial [3D Viewport Scaling Demo] https://godotengine.org/asset-library/asset/586
class_name ViewportTexture


#desc The path to the [Viewport] node to display. This is relative to the scene root, not to the node which uses the texture.
var viewport_path: NodePath:
	get = get_viewport_path_in_scene, set = set_viewport_path_in_scene




func get_viewport_path_in_scene() -> NodePath:
	return viewport_path

func set_viewport_path_in_scene(value: NodePath) -> void:
	viewport_path = value

