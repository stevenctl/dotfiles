extends Node3D
#brief Provides occlusion culling for 3D nodes, which improves performance in closed areas.
#desc Occlusion culling can improve rendering performance in closed/semi-open areas by hiding geometry that is occluded by other objects.
#desc The occlusion culling system is mostly static. [OccluderInstance3D]s can be moved or hidden at run-time, but doing so will trigger a background recomputation that can take several frames. It is recommended to only move [OccluderInstance3D]s sporadically (e.g. for procedural generation purposes), rather than doing so every frame.
#desc The occlusion culling system works by rendering the occluders on the CPU in parallel using [url=https://www.embree.org/]Embree[/url], drawing the result to a low-resolution buffer then using this to cull 3D nodes individually. In the 3D editor, you can preview the occlusion culling buffer by choosing [b]Perspective > Debug Advanced... > Occlusion Culling Buffer[/b] in the top-left corner of the 3D viewport. The occlusion culling buffer quality can be adjusted in the Project Settings.
#desc [b]Baking:[/b] Select an [OccluderInstance3D] node, then use the [b]Bake Occluders[/b] button at the top of the 3D editor. Only opaque materials will be taken into account; transparent materials (alpha-blended or alpha-tested) will be ignored by the occluder generation.
#desc [b]Note:[/b] Occlusion culling is only effective if [member ProjectSettings.rendering/occlusion_culling/use_occlusion_culling] is [code]true[/code]. Enabling occlusion culling has a cost on the CPU. Only enable occlusion culling if you actually plan to use it. Large open scenes with few or no objects blocking the view will generally not benefit much from occlusion culling. Large open scenes generally benefit more from mesh LOD and visibility ranges ([member GeometryInstance3D.visibility_range_begin] and [member GeometryInstance3D.visibility_range_end]) compared to occlusion culling.
class_name OccluderInstance3D


#desc The visual layers to account for when baking for occluders. Only [MeshInstance3D]s whose [member VisualInstance3D.layers] match with this [member bake_mask] will be included in the generated occluder mesh. By default, all objects with [i]opaque[/i] materials are taken into account for the occluder baking.
#desc To improve performance and avoid artifacts, it is recommended to exclude dynamic objects, small objects and fixtures from the baking process by moving them to a separate visual layer and excluding this layer in [member bake_mask].
var bake_mask: int:
	get = get_bake_mask, set = set_bake_mask

#desc The simplification distance to use for simplifying the generated occluder polygon (in 3D units). Higher values result in a less detailed occluder mesh, which improves performance but reduces culling accuracy.
#desc The occluder geometry is rendered on the CPU, so it is important to keep its geometry as simple as possible. Since the buffer is rendered at a low resolution, less detailed occluder meshes generally still work well. The default value is fairly aggressive, so you may have to decrase it if you run into false negatives (objects being occluded even though they are visible by the camera). A value of [code]0.01[/code] will act conservatively, and will keep geometry [i]perceptually[/i] unaffected in the occlusion culling buffer. Depending on the scene, a value of [code]0.01[/code] may still simplify the mesh noticeably compared to disabling simplification entirely.
#desc Setting this to [code]0.0[/code] disables simplification entirely, but vertices in the exact same position will still be merged. The mesh will also be re-indexed to reduce both the number of vertices and indices.
#desc [b]Note:[/b] This uses the [url=https://meshoptimizer.org/]meshoptimizer[/url] library under the hood, similar to LOD generation.
var bake_simplification_distance: float:
	get = get_bake_simplification_distance, set = set_bake_simplification_distance

#desc The occluder resource for this [OccluderInstance3D]. You can generate an occluder resource by selecting an [OccluderInstance3D] node then using the [b]Bake Occluders[/b] button at the top of the editor.
#desc You can also draw your own 2D occluder polygon by adding a new [PolygonOccluder3D] resource to the [member occluder] property in the Inspector.
#desc Alternatively, you can select a primitive occluder to use: [QuadOccluder3D], [BoxOccluder3D] or [SphereOccluder3D].
var occluder: Occluder3D:
	get = get_occluder, set = set_occluder



#desc Returns whether or not the specified layer of the [member bake_mask] is enabled, given a [param layer_number] between 1 and 32.
func get_bake_mask_value(layer_number: int) -> bool:
	pass;

#desc Based on [param value], enables or disables the specified layer in the [member bake_mask], given a [param layer_number] between 1 and 32.
func set_bake_mask_value(layer_number: int, value: bool) -> void:
	pass;


func get_bake_mask() -> int:
	return bake_mask

func set_bake_mask(value: int) -> void:
	bake_mask = value

func get_bake_simplification_distance() -> float:
	return bake_simplification_distance

func set_bake_simplification_distance(value: float) -> void:
	bake_simplification_distance = value

func get_occluder() -> Occluder3D:
	return occluder

func set_occluder(value: Occluder3D) -> void:
	occluder = value

