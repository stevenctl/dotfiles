extends Object
#brief Helper class for creating and clearing navigation meshes.
#desc This class is responsible for creating and clearing 3D navigation meshes used as [NavigationMesh] resources inside [NavigationRegion3D]. The [NavigationMeshGenerator] has very limited to no use for 2D as the navigation mesh baking process expects 3D node types and 3D source geometry to parse.
#desc The entire navigation mesh baking is best done in a separate thread as the voxelization, collision tests and mesh optimization steps involved are very performance and time hungry operations.
#desc Navigation mesh baking happens in multiple steps and the result depends on 3D source geometry and properties of the [NavigationMesh] resource. In the first step, starting from a root node and depending on [NavigationMesh] properties all valid 3D source geometry nodes are collected from the [SceneTree]. Second, all collected nodes are parsed for their relevant 3D geometry data and a combined 3D mesh is build. Due to the many different types of parsable objects, from normal [MeshInstance3D]s to [CSGShape3D]s or various [CollisionObject3D]s, some operations to collect geometry data can trigger [RenderingServer] and [PhysicsServer3D] synchronizations. Server synchronization can have a negative effect on baking time or framerate as it often involves [Mutex] locking for thread security. Many parsable objects and the continuous synchronization with other threaded Servers can increase the baking time significantly. On the other hand only a few but very large and complex objects will take some time to prepare for the Servers which can noticeably stall the next frame render. As a general rule the total number of parsable objects and their individual size and complexity should be balanced to avoid framerate issues or very long baking times. The combined mesh is then passed to the Recast Navigation Object to test the source geometry for walkable terrain suitable to [NavigationMesh] agent properties by creating a voxel world around the meshes bounding area.
#desc The finalized navigation mesh is then returned and stored inside the [NavigationMesh] for use as a resource inside [NavigationRegion3D] nodes.
#desc [b]Note:[/b] Using meshes to not only define walkable surfaces but also obstruct navigation baking does not always work. The navigation baking has no concept of what is a geometry "inside" when dealing with mesh source geometry and this is intentional. Depending on current baking parameters, as soon as the obstructing mesh is large enough to fit a navigation mesh area inside, the baking will generate navigation mesh areas that are inside the obstructing source geometry mesh.
#tutorial [Using NavigationMeshes] https://docs.godotengine.org/en/stable/tutorials/navigation/navigation_using_navigationmeshes.html
class_name NavigationMeshGenerator




#desc Bakes navigation data to the provided [param navigation_mesh] by parsing child nodes under the provided [param root_node] or a specific group of nodes for potential source geometry. The parse behavior can be controlled with the [member NavigationMesh.geometry_parsed_geometry_type] and [member NavigationMesh.geometry_source_geometry_mode] properties on the [NavigationMesh] resource.
func bake(navigation_mesh: NavigationMesh, root_node: Node) -> void:
	pass;

#desc Removes all polygons and vertices from the provided [param navigation_mesh] resource.
func clear(navigation_mesh: NavigationMesh) -> void:
	pass;


