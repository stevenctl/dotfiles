extends GeometryInstance3D
#brief Node that instances a [MultiMesh].
#desc [MultiMeshInstance3D] is a specialized node to instance [GeometryInstance3D]s based on a [MultiMesh] resource.
#desc This is useful to optimize the rendering of a high number of instances of a given mesh (for example trees in a forest or grass strands).
#tutorial [Animating thousands of fish with MultiMeshInstance] https://docs.godotengine.org/en/stable/tutorials/performance/vertex_animation/animating_thousands_of_fish.html
#tutorial [Using MultiMeshInstance] https://docs.godotengine.org/en/stable/tutorials/3d/using_multi_mesh_instance.html
#tutorial [Optimization using MultiMeshes] https://docs.godotengine.org/en/stable/tutorials/performance/using_multimesh.html
class_name MultiMeshInstance3D


#desc The [MultiMesh] resource that will be used and shared among all instances of the [MultiMeshInstance3D].
var multimesh: MultiMesh:
	get = get_multimesh, set = set_multimesh




func get_multimesh() -> MultiMesh:
	return multimesh

func set_multimesh(value: MultiMesh) -> void:
	multimesh = value

