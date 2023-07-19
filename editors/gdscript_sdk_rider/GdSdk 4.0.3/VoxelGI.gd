extends VisualInstance3D
#brief Real-time global illumination (GI) probe.
#desc [VoxelGI]s are used to provide high-quality real-time indirect light and reflections to scenes. They precompute the effect of objects that emit light and the effect of static geometry to simulate the behavior of complex light in real-time. [VoxelGI]s need to be baked before having a visible effect. However, once baked, dynamic objects will receive light from them. Furthermore, lights can be fully dynamic or baked.
#desc [b]Note:[/b] [VoxelGI] is only supported in the Forward+ rendering method, not Mobile or Compatibility.
#desc [b]Procedural generation:[/b] [VoxelGI] can be baked in an exported project, which makes it suitable for procedurally generated or user-built levels as long as all the geometry is generated in advance. For games where geometry is generated at any time during gameplay, SDFGI is more suitable (see [member Environment.sdfgi_enabled]).
#desc [b]Performance:[/b] [VoxelGI] is relatively demanding on the GPU and is not suited to low-end hardware such as integrated graphics (consider [LightmapGI] instead). To improve performance, adjust [member ProjectSettings.rendering/global_illumination/voxel_gi/quality] and enable [member ProjectSettings.rendering/global_illumination/gi/use_half_resolution] in the Project Settings. To provide a fallback for low-end hardware, consider adding an option to disable [VoxelGI] in your project's options menus. A [VoxelGI] node can be disabled by hiding it.
#desc [b]Note:[/b] Meshes should have sufficiently thick walls to avoid light leaks (avoid one-sided walls). For interior levels, enclose your level geometry in a sufficiently large box and bridge the loops to close the mesh. To further prevent light leaks, you can also strategically place temporary [MeshInstance3D] nodes with their [member GeometryInstance3D.gi_mode] set to [constant GeometryInstance3D.GI_MODE_STATIC]. These temporary nodes can then be hidden after baking the [VoxelGI] node.
#tutorial [VoxelGI] https://docs.godotengine.org/en/stable/tutorials/3d/global_illumination/using_voxel_gi.html
#tutorial [Third Person Shooter Demo] https://godotengine.org/asset-library/asset/678
class_name VoxelGI

#desc Use 64 subdivisions. This is the lowest quality setting, but the fastest. Use it if you can, but especially use it on lower-end hardware.
#desc Use 128 subdivisions. This is the default quality setting.
#desc Use 256 subdivisions.
#desc Use 512 subdivisions. This is the highest quality setting, but the slowest. On lower-end hardware, this could cause the GPU to stall.
#desc Represents the size of the [enum Subdiv] enum.

#enum Subdiv
enum {
    SUBDIV_64 = 0,
    SUBDIV_128 = 1,
    SUBDIV_256 = 2,
    SUBDIV_512 = 3,
    SUBDIV_MAX = 4,
}
#desc The [CameraAttributes] resource that specifies exposure levels to bake at. Auto-exposure and non exposure properties will be ignored. Exposure settings should be used to reduce the dynamic range present when baking. If exposure is too high, the [VoxelGI] will have banding artifacts or may have over-exposure artifacts.
var camera_attributes: CameraAttributes:
	get = get_camera_attributes, set = set_camera_attributes

#desc The [VoxelGIData] resource that holds the data for this [VoxelGI].
var data: VoxelGIData:
	get = get_probe_data, set = set_probe_data

#desc The size of the area covered by the [VoxelGI]. If you make the size larger without increasing the subdivisions with [member subdiv], the size of each cell will increase and result in lower detailed lighting.
#desc [b]Note:[/b] Size is clamped to 1.0 unit or more on each axis.
var size: Vector3:
	get = get_size, set = set_size

#desc Number of times to subdivide the grid that the [VoxelGI] operates on. A higher number results in finer detail and thus higher visual quality, while lower numbers result in better performance.
var subdiv: int:
	get = get_subdiv, set = set_subdiv



#desc Bakes the effect from all [GeometryInstance3D]s marked with [constant GeometryInstance3D.GI_MODE_STATIC] and [Light3D]s marked with either [constant Light3D.BAKE_STATIC] or [constant Light3D.BAKE_DYNAMIC]. If [code]create_visual_debug[/code] is [code]true[/code], after baking the light, this will generate a [MultiMesh] that has a cube representing each solid cell with each cube colored to the cell's albedo color. This can be used to visualize the [VoxelGI]'s data and debug any issues that may be occurring.
#desc [b]Note:[/b] [method bake] works from the editor and in exported projects. This makes it suitable for procedurally generated or user-built levels. Baking a [VoxelGI] node generally takes from 5 to 20 seconds in most scenes. Reducing [member subdiv] can speed up baking.
#desc [b]Note:[/b] [GeometryInstance3D]s and [Light3D]s must be fully ready before [method bake] is called. If you are procedurally creating those and some meshes or lights are missing from your baked [VoxelGI], use [code]call_deferred("bake")[/code] instead of calling [method bake] directly.
func bake(from_node: Node = null, create_visual_debug: bool = false) -> void:
	pass;

#desc Calls [method bake] with [code]create_visual_debug[/code] enabled.
func debug_bake() -> void:
	pass;


func get_camera_attributes() -> CameraAttributes:
	return camera_attributes

func set_camera_attributes(value: CameraAttributes) -> void:
	camera_attributes = value

func get_probe_data() -> VoxelGIData:
	return data

func set_probe_data(value: VoxelGIData) -> void:
	data = value

func get_size() -> Vector3:
	return size

func set_size(value: Vector3) -> void:
	size = value

func get_subdiv() -> int:
	return subdiv

func set_subdiv(value: int) -> void:
	subdiv = value

