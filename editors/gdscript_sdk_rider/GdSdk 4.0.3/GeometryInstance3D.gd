extends VisualInstance3D
#brief Base node for geometry-based visual instances.
#desc Base node for geometry-based visual instances. Shares some common functionality like visibility and custom materials.
class_name GeometryInstance3D

#desc Will not cast any shadows. Use this to improve performance for small geometry that is unlikely to cast noticeable shadows (such as debris).
#desc Will cast shadows from all visible faces in the GeometryInstance3D.
#desc Will take culling into account, so faces not being rendered will not be taken into account when shadow casting.
#desc Will cast shadows from all visible faces in the GeometryInstance3D.
#desc Will not take culling into account, so all faces will be taken into account when shadow casting.
#desc Will only show the shadows casted from this object.
#desc In other words, the actual mesh will not be visible, only the shadows casted from the mesh will be.
#desc Disabled global illumination mode. Use for dynamic objects that do not contribute to global illumination (such as characters). When using [VoxelGI] and SDFGI, the geometry will [i]receive[/i] indirect lighting and reflections but the geometry will not be considered in GI baking. When using [LightmapGI], the object will receive indirect lighting using lightmap probes instead of using the baked lightmap texture.
#desc Baked global illumination mode. Use for static objects that contribute to global illumination (such as level geometry). This GI mode is effective when using [VoxelGI], SDFGI and [LightmapGI].
#desc Dynamic global illumination mode. Use for dynamic objects that contribute to global illumination. This GI mode is only effective when using [VoxelGI], but it has a higher performance impact than [constant GI_MODE_STATIC]. When using other GI methods, this will act the same as [constant GI_MODE_DISABLED].
#desc The standard texel density for lightmapping with [LightmapGI].
#desc Multiplies texel density by 2× for lightmapping with [LightmapGI]. To ensure consistency in texel density, use this when scaling a mesh by a factor between 1.5 and 3.0.
#desc Multiplies texel density by 4× for lightmapping with [LightmapGI]. To ensure consistency in texel density, use this when scaling a mesh by a factor between 3.0 and 6.0.
#desc Multiplies texel density by 8× for lightmapping with [LightmapGI]. To ensure consistency in texel density, use this when scaling a mesh by a factor greater than 6.0.
#desc Represents the size of the [enum LightmapScale] enum.
#desc Will not fade itself nor its visibility dependencies, hysteresis will be used instead. This is the fastest approach to manual LOD, but it can result in noticeable LOD transitions depending on how the LOD meshes are authored. See [member visibility_range_begin] and [member Node3D.visibility_parent] for more information.
#desc Will fade-out itself when reaching the limits of its own visibility range. This is slower than [constant VISIBILITY_RANGE_FADE_DISABLED], but it can provide smoother transitions. The fading range is determined by [member visibility_range_begin_margin] and [member visibility_range_end_margin].
#desc Will fade-in its visibility dependencies (see [member Node3D.visibility_parent]) when reaching the limits of its own visibility range. This is slower than [constant VISIBILITY_RANGE_FADE_DISABLED], but it can provide smoother transitions. The fading range is determined by [member visibility_range_begin_margin] and [member visibility_range_end_margin].

#enum ShadowCastingSetting
enum {
    SHADOW_CASTING_SETTING_OFF = 0,
    SHADOW_CASTING_SETTING_ON = 1,
    SHADOW_CASTING_SETTING_DOUBLE_SIDED = 2,
    SHADOW_CASTING_SETTING_SHADOWS_ONLY = 3,
}
#enum GIMode
enum {
    GI_MODE_DISABLED = 0,
    GI_MODE_STATIC = 1,
    GI_MODE_DYNAMIC = 2,
}
#enum LightmapScale
enum {
    LIGHTMAP_SCALE_1X = 0,
    LIGHTMAP_SCALE_2X = 1,
    LIGHTMAP_SCALE_4X = 2,
    LIGHTMAP_SCALE_8X = 3,
    LIGHTMAP_SCALE_MAX = 4,
}
#enum VisibilityRangeFadeMode
enum {
    VISIBILITY_RANGE_FADE_DISABLED = 0,
    VISIBILITY_RANGE_FADE_SELF = 1,
    VISIBILITY_RANGE_FADE_DEPENDENCIES = 2,
}
#desc The selected shadow casting flag. See [enum ShadowCastingSetting] for possible values.
var cast_shadow: int:
	get = get_cast_shadows_setting, set = set_cast_shadows_setting

#desc Overrides the bounding box of this node with a custom one. This can be used to avoid the expensive [AABB] recalculation that happens when a skeleton is used with a [MeshInstance3D] or to have fine control over the [MeshInstance3D]'s bounding box. To use the default AABB, set value to an [AABB] with all fields set to [code]0.0[/code]. To avoid frustum culling, set [member custom_aabb] to a very large AABB that covers your entire game world such as [code]AABB(-10000, -10000, -10000, 20000, 20000, 20000)[/code]. To disable all forms of culling (including occlusion culling), call [method RenderingServer.instance_set_ignore_culling] on the [GeometryInstance3D]'s [RID].
var custom_aabb: AABB:
	get = get_custom_aabb, set = set_custom_aabb

#desc The extra distance added to the GeometryInstance3D's bounding box ([AABB]) to increase its cull box.
var extra_cull_margin: float:
	get = get_extra_cull_margin, set = set_extra_cull_margin

#desc The texel density to use for lightmapping in [LightmapGI]. Greater scale values provide higher resolution in the lightmap, which can result in sharper shadows for lights that have both direct and indirect light baked. However, greater scale values will also increase the space taken by the mesh in the lightmap texture, which increases the memory, storage, and bake time requirements. When using a single mesh at different scales, consider adjusting this value to keep the lightmap texel density consistent across meshes.
var gi_lightmap_scale: int:
	get = get_lightmap_scale, set = set_lightmap_scale

#desc The global illumination mode to use for the whole geometry. To avoid inconsistent results, use a mode that matches the purpose of the mesh during gameplay (static/dynamic).
#desc [b]Note:[/b] Lights' bake mode will also affect the global illumination rendering. See [member Light3D.light_bake_mode].
var gi_mode: int:
	get = get_gi_mode, set = set_gi_mode

#desc If [code]true[/code], disables occlusion culling for this instance. Useful for gizmos that must be rendered even when occlusion culling is in use.
#desc [b]Note:[/b] [member ignore_occlusion_culling] does not affect frustum culling (which is what happens when an object is not visible given the camera's angle). To avoid frustum culling, set [member custom_aabb] to a very large AABB that covers your entire game world such as [code]AABB(-10000, -10000, -10000, 20000, 20000, 20000)[/code].
var ignore_occlusion_culling: bool:
	get = is_ignoring_occlusion_culling, set = set_ignore_occlusion_culling

#desc Changes how quickly the mesh transitions to a lower level of detail. A value of 0 will force the mesh to its lowest level of detail, a value of 1 will use the default settings, and larger values will keep the mesh in a higher level of detail at farther distances.
#desc Useful for testing level of detail transitions in the editor.
var lod_bias: float:
	get = get_lod_bias, set = set_lod_bias

#desc The material overlay for the whole geometry.
#desc If a material is assigned to this property, it will be rendered on top of any other active material for all the surfaces.
var material_overlay: Material:
	get = get_material_overlay, set = set_material_overlay

#desc The material override for the whole geometry.
#desc If a material is assigned to this property, it will be used instead of any material set in any material slot of the mesh.
var material_override: Material:
	get = get_material_override, set = set_material_override

#desc The transparency applied to the whole geometry (as a multiplier of the materials' existing transparency). [code]0.0[/code] is fully opaque, while [code]1.0[/code] is fully transparent. Values greater than [code]0.0[/code] (exclusive) will force the geometry's materials to go through the transparent pipeline, which is slower to render and can exhibit rendering issues due to incorrect transparency sorting. However, unlike using a transparent material, setting [member transparency] to a value greater than [code]0.0[/code] (exclusive) will [i]not[/i] disable shadow rendering.
#desc In spatial shaders, [code]1.0 - transparency[/code] is set as the default value of the [code]ALPHA[/code] built-in.
#desc [b]Note:[/b] [member transparency] is clamped between [code]0.0[/code] and [code]1.0[/code], so this property cannot be used to make transparent materials more opaque than they originally are.
var transparency: float:
	get = get_transparency, set = set_transparency

#desc Starting distance from which the GeometryInstance3D will be visible, taking [member visibility_range_begin_margin] into account as well. The default value of 0 is used to disable the range check.
var visibility_range_begin: float:
	get = get_visibility_range_begin, set = set_visibility_range_begin

#desc Margin for the [member visibility_range_begin] threshold. The GeometryInstance3D will only change its visibility state when it goes over or under the [member visibility_range_begin] threshold by this amount.
#desc If [member visibility_range_fade_mode] is [constant VISIBILITY_RANGE_FADE_DISABLED], this acts as a hysteresis distance. If [member visibility_range_fade_mode] is [constant VISIBILITY_RANGE_FADE_SELF] or [constant VISIBILITY_RANGE_FADE_DEPENDENCIES], this acts as a fade transition distance and must be set to a value greater than [code]0.0[/code] for the effect to be noticeable.
var visibility_range_begin_margin: float:
	get = get_visibility_range_begin_margin, set = set_visibility_range_begin_margin

#desc Distance from which the GeometryInstance3D will be hidden, taking [member visibility_range_end_margin] into account as well. The default value of 0 is used to disable the range check.
var visibility_range_end: float:
	get = get_visibility_range_end, set = set_visibility_range_end

#desc Margin for the [member visibility_range_end] threshold. The GeometryInstance3D will only change its visibility state when it goes over or under the [member visibility_range_end] threshold by this amount.
#desc If [member visibility_range_fade_mode] is [constant VISIBILITY_RANGE_FADE_DISABLED], this acts as a hysteresis distance. If [member visibility_range_fade_mode] is [constant VISIBILITY_RANGE_FADE_SELF] or [constant VISIBILITY_RANGE_FADE_DEPENDENCIES], this acts as a fade transition distance and must be set to a value greater than [code]0.0[/code] for the effect to be noticeable.
var visibility_range_end_margin: float:
	get = get_visibility_range_end_margin, set = set_visibility_range_end_margin

#desc Controls which instances will be faded when approaching the limits of the visibility range. See [enum VisibilityRangeFadeMode] for possible values.
var visibility_range_fade_mode: int:
	get = get_visibility_range_fade_mode, set = set_visibility_range_fade_mode



#desc Get the value of a shader parameter as set on this instance.
func get_instance_shader_parameter(name: StringName) -> Variant:
	pass;

#desc Set the value of a shader uniform for this instance only ([url=$DOCS_URL/tutorials/shaders/shader_reference/shading_language.html#per-instance-uniforms]per-instance uniform[/url]). See also [method ShaderMaterial.set_shader_parameter] to assign a uniform on all instances using the same [ShaderMaterial].
#desc [b]Note:[/b] For a shader uniform to be assignable on a per-instance basis, it [i]must[/i] be defined with [code]instance uniform ...[/code] rather than [code]uniform ...[/code] in the shader code.
#desc [b]Note:[/b] [param name] is case-sensitive and must match the name of the uniform in the code exactly (not the capitalized name in the inspector).
#desc [b]Note:[/b] Per-instance shader uniforms are currently only available in 3D, so there is no 2D equivalent of this method.
func set_instance_shader_parameter(name: StringName, value: Variant) -> void:
	pass;


func get_cast_shadows_setting() -> int:
	return cast_shadow

func set_cast_shadows_setting(value: int) -> void:
	cast_shadow = value

func get_custom_aabb() -> AABB:
	return custom_aabb

func set_custom_aabb(value: AABB) -> void:
	custom_aabb = value

func get_extra_cull_margin() -> float:
	return extra_cull_margin

func set_extra_cull_margin(value: float) -> void:
	extra_cull_margin = value

func get_lightmap_scale() -> int:
	return gi_lightmap_scale

func set_lightmap_scale(value: int) -> void:
	gi_lightmap_scale = value

func get_gi_mode() -> int:
	return gi_mode

func set_gi_mode(value: int) -> void:
	gi_mode = value

func is_ignoring_occlusion_culling() -> bool:
	return ignore_occlusion_culling

func set_ignore_occlusion_culling(value: bool) -> void:
	ignore_occlusion_culling = value

func get_lod_bias() -> float:
	return lod_bias

func set_lod_bias(value: float) -> void:
	lod_bias = value

func get_material_overlay() -> Material:
	return material_overlay

func set_material_overlay(value: Material) -> void:
	material_overlay = value

func get_material_override() -> Material:
	return material_override

func set_material_override(value: Material) -> void:
	material_override = value

func get_transparency() -> float:
	return transparency

func set_transparency(value: float) -> void:
	transparency = value

func get_visibility_range_begin() -> float:
	return visibility_range_begin

func set_visibility_range_begin(value: float) -> void:
	visibility_range_begin = value

func get_visibility_range_begin_margin() -> float:
	return visibility_range_begin_margin

func set_visibility_range_begin_margin(value: float) -> void:
	visibility_range_begin_margin = value

func get_visibility_range_end() -> float:
	return visibility_range_end

func set_visibility_range_end(value: float) -> void:
	visibility_range_end = value

func get_visibility_range_end_margin() -> float:
	return visibility_range_end_margin

func set_visibility_range_end_margin(value: float) -> void:
	visibility_range_end_margin = value

func get_visibility_range_fade_mode() -> int:
	return visibility_range_fade_mode

func set_visibility_range_fade_mode(value: int) -> void:
	visibility_range_fade_mode = value

