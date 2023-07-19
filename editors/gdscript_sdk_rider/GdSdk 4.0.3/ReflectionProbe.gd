extends VisualInstance3D
#brief Captures its surroundings to create fast, accurate reflections from a given point.
#desc Captures its surroundings as a cubemap, and stores versions of it with increasing levels of blur to simulate different material roughnesses.
#desc The [ReflectionProbe] is used to create high-quality reflections at a low performance cost (when [member update_mode] is [constant UPDATE_ONCE]). [ReflectionProbe]s can be blended together and with the rest of the scene smoothly. [ReflectionProbe]s can also be combined with [VoxelGI], SDFGI ([member Environment.sdfgi_enabled]) and screen-space reflections ([member Environment.ssr_enabled]) to get more accurate reflections in specific areas. [ReflectionProbe]s render all objects within their [member cull_mask], so updating them can be quite expensive. It is best to update them once with the important static objects and then leave them as-is.
#desc [b]Note:[/b] Unlike [VoxelGI] and SDFGI, [ReflectionProbe]s only source their environment from a [WorldEnvironment] node. If you specify an [Environment] resource within a [Camera3D] node, it will be ignored by the [ReflectionProbe]. This can lead to incorrect lighting within the [ReflectionProbe].
#desc [b]Note:[/b] Reflection probes are only supported in the Forward+ and Mobile rendering methods, not Compatibility. When using the Mobile rendering method, only 8 reflection probes can be displayed on each mesh resource. Attempting to display more than 8 reflection probes on a single mesh resource will result in reflection probes flickering in and out as the camera moves.
#desc [b]Note:[/b] When using the Mobile rendering method, reflection probes will only correctly affect meshes whose visibility AABB intersects with the reflection probe's AABB. If using a shader to deform the mesh in a way that makes it go outside its AABB, [member GeometryInstance3D.extra_cull_margin] must be increased on the mesh. Otherwise, the reflection probe may not be visible on the mesh.
#tutorial [Reflection probes] https://docs.godotengine.org/en/stable/tutorials/3d/global_illumination/reflection_probes.html
class_name ReflectionProbe

#desc Update the probe once on the next frame (recommended for most objects). The corresponding radiance map will be generated over the following six frames. This takes more time to update than [constant UPDATE_ALWAYS], but it has a lower performance cost and can result in higher-quality reflections. The ReflectionProbe is updated when its transform changes, but not when nearby geometry changes. You can force a [ReflectionProbe] update by moving the [ReflectionProbe] slightly in any direction.
#desc Update the probe every frame. This provides better results for fast-moving dynamic objects (such as cars). However, it has a significant performance cost. Due to the cost, it's recommended to only use one ReflectionProbe with [constant UPDATE_ALWAYS] at most per scene. For all other use cases, use [constant UPDATE_ONCE].
#desc Do not apply any ambient lighting inside the [ReflectionProbe]'s box defined by its [member size].
#desc Apply automatically-sourced environment lighting inside the [ReflectionProbe]'s box defined by its [member size].
#desc Apply custom ambient lighting inside the [ReflectionProbe]'s box defined by its [member size]. See [member ambient_color] and [member ambient_color_energy].

#enum UpdateMode
enum {
    UPDATE_ONCE = 0,
    UPDATE_ALWAYS = 1,
}
#enum AmbientMode
enum {
    AMBIENT_DISABLED = 0,
    AMBIENT_ENVIRONMENT = 1,
    AMBIENT_COLOR = 2,
}
#desc The custom ambient color to use within the [ReflectionProbe]'s box defined by its [member size]. Only effective if [member ambient_mode] is [constant AMBIENT_COLOR].
var ambient_color: Color:
	get = get_ambient_color, set = set_ambient_color

#desc The custom ambient color energy to use within the [ReflectionProbe]'s box defined by its [member size]. Only effective if [member ambient_mode] is [constant AMBIENT_COLOR].
var ambient_color_energy: float:
	get = get_ambient_color_energy, set = set_ambient_color_energy

#desc The ambient color to use within the [ReflectionProbe]'s box defined by its [member size]. The ambient color will smoothly blend with other [ReflectionProbe]s and the rest of the scene (outside the [ReflectionProbe]'s box defined by its [member size]).
var ambient_mode: int:
	get = get_ambient_mode, set = set_ambient_mode

#desc If [code]true[/code], enables box projection. This makes reflections look more correct in rectangle-shaped rooms by offsetting the reflection center depending on the camera's location.
#desc [b]Note:[/b] To better fit rectangle-shaped rooms that are not aligned to the grid, you can rotate the [ReflectionProbe] node.
var box_projection: bool:
	get = is_box_projection_enabled, set = set_enable_box_projection

#desc Sets the cull mask which determines what objects are drawn by this probe. Every [VisualInstance3D] with a layer included in this cull mask will be rendered by the probe. To improve performance, it is best to only include large objects which are likely to take up a lot of space in the reflection.
var cull_mask: int:
	get = get_cull_mask, set = set_cull_mask

#desc If [code]true[/code], computes shadows in the reflection probe. This makes the reflection probe slower to render; you may want to disable this if using the [constant UPDATE_ALWAYS] [member update_mode].
var enable_shadows: bool:
	get = are_shadows_enabled, set = set_enable_shadows

#desc Defines the reflection intensity. Intensity modulates the strength of the reflection.
var intensity: float:
	get = get_intensity, set = set_intensity

#desc If [code]true[/code], reflections will ignore sky contribution.
var interior: bool:
	get = is_set_as_interior, set = set_as_interior

#desc The maximum distance away from the [ReflectionProbe] an object can be before it is culled. Decrease this to improve performance, especially when using the [constant UPDATE_ALWAYS] [member update_mode].
#desc [b]Note:[/b] The maximum reflection distance is always at least equal to the probe's extents. This means that decreasing [member max_distance] will not always cull objects from reflections, especially if the reflection probe's box defined by its [member size] is already large.
var max_distance: float:
	get = get_max_distance, set = set_max_distance

#desc The automatic LOD bias to use for meshes rendered within the [ReflectionProbe] (this is analog to [member Viewport.mesh_lod_threshold]). Higher values will use less detailed versions of meshes that have LOD variations generated. If set to [code]0.0[/code], automatic LOD is disabled. Increase [member mesh_lod_threshold] to improve performance at the cost of geometry detail, especially when using the [constant UPDATE_ALWAYS] [member update_mode].
#desc [b]Note:[/b] [member mesh_lod_threshold] does not affect [GeometryInstance3D] visibility ranges (also known as "manual" LOD or hierarchical LOD).
var mesh_lod_threshold: float:
	get = get_mesh_lod_threshold, set = set_mesh_lod_threshold

#desc Sets the origin offset to be used when this [ReflectionProbe] is in [member box_projection] mode. This can be set to a non-zero value to ensure a reflection fits a rectangle-shaped room, while reducing the number of objects that "get in the way" of the reflection.
var origin_offset: Vector3:
	get = get_origin_offset, set = set_origin_offset

#desc The size of the reflection probe. The larger the size, the more space covered by the probe, which will lower the perceived resolution. It is best to keep the size only as large as you need it.
#desc [b]Note:[/b] To better fit areas that are not aligned to the grid, you can rotate the [ReflectionProbe] node.
var size: Vector3:
	get = get_size, set = set_size

#desc Sets how frequently the [ReflectionProbe] is updated. Can be [constant UPDATE_ONCE] or [constant UPDATE_ALWAYS].
var update_mode: int:
	get = get_update_mode, set = set_update_mode




func get_ambient_color() -> Color:
	return ambient_color

func set_ambient_color(value: Color) -> void:
	ambient_color = value

func get_ambient_color_energy() -> float:
	return ambient_color_energy

func set_ambient_color_energy(value: float) -> void:
	ambient_color_energy = value

func get_ambient_mode() -> int:
	return ambient_mode

func set_ambient_mode(value: int) -> void:
	ambient_mode = value

func is_box_projection_enabled() -> bool:
	return box_projection

func set_enable_box_projection(value: bool) -> void:
	box_projection = value

func get_cull_mask() -> int:
	return cull_mask

func set_cull_mask(value: int) -> void:
	cull_mask = value

func are_shadows_enabled() -> bool:
	return enable_shadows

func set_enable_shadows(value: bool) -> void:
	enable_shadows = value

func get_intensity() -> float:
	return intensity

func set_intensity(value: float) -> void:
	intensity = value

func is_set_as_interior() -> bool:
	return interior

func set_as_interior(value: bool) -> void:
	interior = value

func get_max_distance() -> float:
	return max_distance

func set_max_distance(value: float) -> void:
	max_distance = value

func get_mesh_lod_threshold() -> float:
	return mesh_lod_threshold

func set_mesh_lod_threshold(value: float) -> void:
	mesh_lod_threshold = value

func get_origin_offset() -> Vector3:
	return origin_offset

func set_origin_offset(value: Vector3) -> void:
	origin_offset = value

func get_size() -> Vector3:
	return size

func set_size(value: Vector3) -> void:
	size = value

func get_update_mode() -> int:
	return update_mode

func set_update_mode(value: int) -> void:
	update_mode = value

