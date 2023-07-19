extends Node
#brief Base class for viewports.
#desc A Viewport creates a different view into the screen, or a sub-view inside another viewport. Children 2D Nodes will display on it, and children Camera3D 3D nodes will render on it too.
#desc Optionally, a viewport can have its own 2D or 3D world, so they don't share what they draw with other viewports.
#desc Viewports can also choose to be audio listeners, so they generate positional audio depending on a 2D or 3D camera child of it.
#desc Also, viewports can be assigned to different screens in case the devices have multiple screens.
#desc Finally, viewports can also behave as render targets, in which case they will not be visible unless the associated texture is used to draw.
#tutorial [Using Viewports] https://docs.godotengine.org/en/stable/tutorials/rendering/viewports.html
#tutorial [Viewport and canvas transforms] https://docs.godotengine.org/en/stable/tutorials/2d/2d_transforms.html
#tutorial [GUI in 3D Demo] https://godotengine.org/asset-library/asset/127
#tutorial [3D in 2D Demo] https://godotengine.org/asset-library/asset/128
#tutorial [2D in 3D Demo] https://godotengine.org/asset-library/asset/129
#tutorial [Screen Capture Demo] https://godotengine.org/asset-library/asset/130
#tutorial [Dynamic Split Screen Demo] https://godotengine.org/asset-library/asset/541
#tutorial [3D Viewport Scaling Demo] https://godotengine.org/asset-library/asset/586
class_name Viewport

#desc Emitted when a Control node grabs keyboard focus.
signal gui_focus_changed(node: Control)
#desc Emitted when the size of the viewport is changed, whether by resizing of window, or some other means.
signal size_changed
#desc This quadrant will not be used.
#desc This quadrant will only be used by one shadow map.
#desc This quadrant will be split in 4 and used by up to 4 shadow maps.
#desc This quadrant will be split 16 ways and used by up to 16 shadow maps.
#desc This quadrant will be split 64 ways and used by up to 64 shadow maps.
#desc This quadrant will be split 256 ways and used by up to 256 shadow maps. Unless the [member positional_shadow_atlas_size] is very high, the shadows in this quadrant will be very low resolution.
#desc This quadrant will be split 1024 ways and used by up to 1024 shadow maps. Unless the [member positional_shadow_atlas_size] is very high, the shadows in this quadrant will be very low resolution.
#desc Represents the size of the [enum PositionalShadowAtlasQuadrantSubdiv] enum.
#desc Use bilinear scaling for the viewport's 3D buffer. The amount of scaling can be set using [member scaling_3d_scale]. Values less than [code]1.0[/code] will result in undersampling while values greater than [code]1.0[/code] will result in supersampling. A value of [code]1.0[/code] disables scaling.
#desc Use AMD FidelityFX Super Resolution 1.0 upscaling for the viewport's 3D buffer. The amount of scaling can be set using [member scaling_3d_scale]. Values less than [code]1.0[/code] will be result in the viewport being upscaled using FSR. Values greater than [code]1.0[/code] are not supported and bilinear downsampling will be used instead. A value of [code]1.0[/code] disables scaling.
#desc Represents the size of the [enum Scaling3DMode] enum.
#desc Multisample antialiasing mode disabled. This is the default value, and is also the fastest setting.
#desc Use 2× Multisample Antialiasing. This has a moderate performance cost. It helps reduce aliasing noticeably, but 4× MSAA still looks substantially better.
#desc Use 4× Multisample Antialiasing. This has a significant performance cost, and is generally a good compromise between performance and quality.
#desc Use 8× Multisample Antialiasing. This has a very high performance cost. The difference between 4× and 8× MSAA may not always be visible in real gameplay conditions. Likely unsupported on low-end and older hardware.
#desc Represents the size of the [enum MSAA] enum.
#desc Do not perform any antialiasing in the full screen post-process.
#desc Use fast approximate antialiasing. FXAA is a popular screen-space antialiasing method, which is fast but will make the image look blurry, especially at lower resolutions. It can still work relatively well at large resolutions such as 1440p and 4K.
#desc Represents the size of the [enum ScreenSpaceAA] enum.
#desc Amount of objects in frame.
#desc Amount of vertices in frame.
#desc Amount of draw calls in frame.
#desc Represents the size of the [enum RenderInfo] enum.
#desc Objects are displayed normally.
#desc Objects are displayed without light information.
#desc Objects are displayed semi-transparent with additive blending so you can see where they are drawing over top of one another. A higher overdraw means you are wasting performance on drawing pixels that are being hidden behind others.
#desc Objects are displayed in wireframe style.
#desc Objects are displayed with only the albedo value from [VoxelGI]s.
#desc Objects are displayed with only the lighting value from [VoxelGI]s.
#desc Objects are displayed with only the emission color from [VoxelGI]s.
#desc Draws the shadow atlas that stores shadows from [OmniLight3D]s and [SpotLight3D]s in the upper left quadrant of the [Viewport].
#desc Draws the shadow atlas that stores shadows from [DirectionalLight3D]s in the upper left quadrant of the [Viewport].
#desc Draws the screen-space ambient occlusion texture instead of the scene so that you can clearly see how it is affecting objects. In order for this display mode to work, you must have [member Environment.ssao_enabled] set in your [WorldEnvironment].
#desc Draws the screen-space indirect lighting texture instead of the scene so that you can clearly see how it is affecting objects. In order for this display mode to work, you must have [member Environment.ssil_enabled] set in your [WorldEnvironment].
#desc Colors each PSSM split for the [DirectionalLight3D]s in the scene a different color so you can see where the splits are. In order, they will be colored red, green, blue, and yellow.
#desc Draws the decal atlas used by [Decal]s and light projector textures in the upper left quadrant of the [Viewport].
#desc The texture filter reads from the nearest pixel only. The simplest and fastest method of filtering, but the texture will look pixelized.
#desc The texture filter blends between the nearest 4 pixels. Use this when you want to avoid a pixelated style, but do not want mipmaps.
#desc The texture filter reads from the nearest pixel in the nearest mipmap. The fastest way to read from textures with mipmaps.
#desc The texture filter blends between the nearest 4 pixels and between the nearest 2 mipmaps.
#desc Max value for [enum DefaultCanvasItemTextureFilter] enum.
#desc Disables textures repeating. Instead, when reading UVs outside the 0-1 range, the value will be clamped to the edge of the texture, resulting in a stretched out look at the borders of the texture.
#desc Enables the texture to repeat when UV coordinates are outside the 0-1 range. If using one of the linear filtering modes, this can result in artifacts at the edges of a texture when the sampler filters across the edges of the texture.
#desc Flip the texture when repeating so that the edge lines up instead of abruptly changing.
#desc Max value for [enum DefaultCanvasItemTextureRepeat] enum.
#desc VRS is disabled.
#desc VRS uses a texture. Note, for stereoscopic use a texture atlas with a texture for each view.
#desc VRS texture is supplied by the primary [XRInterface].
#desc Represents the size of the [enum VRSMode] enum.

#enum PositionalShadowAtlasQuadrantSubdiv
enum {
    SHADOW_ATLAS_QUADRANT_SUBDIV_DISABLED = 0,
    SHADOW_ATLAS_QUADRANT_SUBDIV_1 = 1,
    SHADOW_ATLAS_QUADRANT_SUBDIV_4 = 2,
    SHADOW_ATLAS_QUADRANT_SUBDIV_16 = 3,
    SHADOW_ATLAS_QUADRANT_SUBDIV_64 = 4,
    SHADOW_ATLAS_QUADRANT_SUBDIV_256 = 5,
    SHADOW_ATLAS_QUADRANT_SUBDIV_1024 = 6,
    SHADOW_ATLAS_QUADRANT_SUBDIV_MAX = 7,
}
#enum Scaling3DMode
enum {
    SCALING_3D_MODE_BILINEAR = 0,
    SCALING_3D_MODE_FSR = 1,
    SCALING_3D_MODE_MAX = 2,
}
#enum MSAA
enum {
    MSAA_DISABLED = 0,
    MSAA_2X = 1,
    MSAA_4X = 2,
    MSAA_8X = 3,
    MSAA_MAX = 4,
}
#enum ScreenSpaceAA
enum {
    SCREEN_SPACE_AA_DISABLED = 0,
    SCREEN_SPACE_AA_FXAA = 1,
    SCREEN_SPACE_AA_MAX = 2,
}
#enum RenderInfo
enum {
    RENDER_INFO_OBJECTS_IN_FRAME = 0,
    RENDER_INFO_PRIMITIVES_IN_FRAME = 1,
    RENDER_INFO_DRAW_CALLS_IN_FRAME = 2,
    RENDER_INFO_MAX = 3,
}
#enum RenderInfoType
enum {
    RENDER_INFO_TYPE_VISIBLE = 0,
    RENDER_INFO_TYPE_SHADOW = 1,
    RENDER_INFO_TYPE_MAX = 2,
}
#enum DebugDraw
enum {
    DEBUG_DRAW_DISABLED = 0,
    DEBUG_DRAW_UNSHADED = 1,
    DEBUG_DRAW_LIGHTING = 2,
    DEBUG_DRAW_OVERDRAW = 3,
    DEBUG_DRAW_WIREFRAME = 4,
    DEBUG_DRAW_NORMAL_BUFFER = 5,
    DEBUG_DRAW_VOXEL_GI_ALBEDO = 6,
    DEBUG_DRAW_VOXEL_GI_LIGHTING = 7,
    DEBUG_DRAW_VOXEL_GI_EMISSION = 8,
    DEBUG_DRAW_SHADOW_ATLAS = 9,
    DEBUG_DRAW_DIRECTIONAL_SHADOW_ATLAS = 10,
    DEBUG_DRAW_SCENE_LUMINANCE = 11,
    DEBUG_DRAW_SSAO = 12,
    DEBUG_DRAW_SSIL = 13,
    DEBUG_DRAW_PSSM_SPLITS = 14,
    DEBUG_DRAW_DECAL_ATLAS = 15,
    DEBUG_DRAW_SDFGI = 16,
    DEBUG_DRAW_SDFGI_PROBES = 17,
    DEBUG_DRAW_GI_BUFFER = 18,
    DEBUG_DRAW_DISABLE_LOD = 19,
    DEBUG_DRAW_CLUSTER_OMNI_LIGHTS = 20,
    DEBUG_DRAW_CLUSTER_SPOT_LIGHTS = 21,
    DEBUG_DRAW_CLUSTER_DECALS = 22,
    DEBUG_DRAW_CLUSTER_REFLECTION_PROBES = 23,
    DEBUG_DRAW_OCCLUDERS = 24,
    DEBUG_DRAW_MOTION_VECTORS = 25,
}
#enum DefaultCanvasItemTextureFilter
enum {
    DEFAULT_CANVAS_ITEM_TEXTURE_FILTER_NEAREST = 0,
    DEFAULT_CANVAS_ITEM_TEXTURE_FILTER_LINEAR = 1,
    DEFAULT_CANVAS_ITEM_TEXTURE_FILTER_LINEAR_WITH_MIPMAPS = 2,
    DEFAULT_CANVAS_ITEM_TEXTURE_FILTER_NEAREST_WITH_MIPMAPS = 3,
    DEFAULT_CANVAS_ITEM_TEXTURE_FILTER_MAX = 4,
}
#enum DefaultCanvasItemTextureRepeat
enum {
    DEFAULT_CANVAS_ITEM_TEXTURE_REPEAT_DISABLED = 0,
    DEFAULT_CANVAS_ITEM_TEXTURE_REPEAT_ENABLED = 1,
    DEFAULT_CANVAS_ITEM_TEXTURE_REPEAT_MIRROR = 2,
    DEFAULT_CANVAS_ITEM_TEXTURE_REPEAT_MAX = 3,
}
#enum SDFOversize
enum {
    SDF_OVERSIZE_100_PERCENT = 0,
    SDF_OVERSIZE_120_PERCENT = 1,
    SDF_OVERSIZE_150_PERCENT = 2,
    SDF_OVERSIZE_200_PERCENT = 3,
    SDF_OVERSIZE_MAX = 4,
}
#enum SDFScale
enum {
    SDF_SCALE_100_PERCENT = 0,
    SDF_SCALE_50_PERCENT = 1,
    SDF_SCALE_25_PERCENT = 2,
    SDF_SCALE_MAX = 3,
}
#enum VRSMode
enum {
    VRS_DISABLED = 0,
    VRS_TEXTURE = 1,
    VRS_XR = 2,
    VRS_MAX = 3,
}
#desc If [code]true[/code], the viewport will process 2D audio streams.
var audio_listener_enable_2d: bool:
	get = is_audio_listener_2d, set = set_as_audio_listener_2d

#desc If [code]true[/code], the viewport will process 3D audio streams.
var audio_listener_enable_3d: bool:
	get = is_audio_listener_3d, set = set_as_audio_listener_3d

#desc The rendering layers in which this [Viewport] renders [CanvasItem] nodes.
var canvas_cull_mask: int:
	get = get_canvas_cull_mask, set = set_canvas_cull_mask

#desc Sets the default filter mode used by [CanvasItem]s in this Viewport. See [enum DefaultCanvasItemTextureFilter] for options.
var canvas_item_default_texture_filter: int:
	get = get_default_canvas_item_texture_filter, set = set_default_canvas_item_texture_filter

#desc Sets the default repeat mode used by [CanvasItem]s in this Viewport. See [enum DefaultCanvasItemTextureRepeat] for options.
var canvas_item_default_texture_repeat: int:
	get = get_default_canvas_item_texture_repeat, set = set_default_canvas_item_texture_repeat

#desc The canvas transform of the viewport, useful for changing the on-screen positions of all child [CanvasItem]s. This is relative to the global canvas transform of the viewport.
var canvas_transform: Transform2D:
	get = get_canvas_transform, set = set_canvas_transform

#desc The overlay mode for test rendered geometry in debug purposes.
var debug_draw: int:
	get = get_debug_draw, set = set_debug_draw

#desc Disable 3D rendering (but keep 2D rendering).
var disable_3d: bool:
	get = is_3d_disabled, set = set_disable_3d

#desc Determines how sharp the upscaled image will be when using the FSR upscaling mode. Sharpness halves with every whole number. Values go from 0.0 (sharpest) to 2.0. Values above 2.0 won't make a visible difference.
#desc To control this property on the root viewport, set the [member ProjectSettings.rendering/scaling_3d/fsr_sharpness] project setting.
var fsr_sharpness: float:
	get = get_fsr_sharpness, set = set_fsr_sharpness

#desc The global canvas transform of the viewport. The canvas transform is relative to this.
var global_canvas_transform: Transform2D:
	get = get_global_canvas_transform, set = set_global_canvas_transform

#desc If [code]true[/code], the viewport will not receive input events.
var gui_disable_input: bool:
	get = is_input_disabled, set = set_disable_input

#desc If [code]true[/code], sub-windows (popups and dialogs) will be embedded inside application window as control-like nodes. If [code]false[/code], they will appear as separate windows handled by the operating system.
var gui_embed_subwindows: bool:
	get = is_embedding_subwindows, set = set_embedding_subwindows

#desc If [code]true[/code], the GUI controls on the viewport will lay pixel perfectly.
var gui_snap_controls_to_pixels: bool:
	get = is_snap_controls_to_pixels_enabled, set = set_snap_controls_to_pixels

#desc If [code]true[/code], this viewport will mark incoming input events as handled by itself. If [code]false[/code], this is instead done by the first parent viewport that is set to handle input locally.
#desc A [SubViewportContainer] will automatically set this property to [code]false[/code] for the [Viewport] contained inside of it.
#desc See also [method set_input_as_handled] and [method is_input_handled].
var handle_input_locally: bool:
	get = is_handling_input_locally, set = set_handle_input_locally

#desc The automatic LOD bias to use for meshes rendered within the [Viewport] (this is analogous to [member ReflectionProbe.mesh_lod_threshold]). Higher values will use less detailed versions of meshes that have LOD variations generated. If set to [code]0.0[/code], automatic LOD is disabled. Increase [member mesh_lod_threshold] to improve performance at the cost of geometry detail.
#desc To control this property on the root viewport, set the [member ProjectSettings.rendering/mesh_lod/lod_change/threshold_pixels] project setting.
#desc [b]Note:[/b] [member mesh_lod_threshold] does not affect [GeometryInstance3D] visibility ranges (also known as "manual" LOD or hierarchical LOD).
var mesh_lod_threshold: float:
	get = get_mesh_lod_threshold, set = set_mesh_lod_threshold

#desc The multisample anti-aliasing mode for 2D/Canvas rendering. A higher number results in smoother edges at the cost of significantly worse performance. A value of 2 or 4 is best unless targeting very high-end systems. This has no effect on shader-induced aliasing or texture aliasing.
var msaa_2d: int:
	get = get_msaa_2d, set = set_msaa_2d

#desc The multisample anti-aliasing mode for 3D rendering. A higher number results in smoother edges at the cost of significantly worse performance. A value of 2 or 4 is best unless targeting very high-end systems. See also bilinear scaling 3d [member scaling_3d_mode] for supersampling, which provides higher quality but is much more expensive. This has no effect on shader-induced aliasing or texture aliasing.
var msaa_3d: int:
	get = get_msaa_3d, set = set_msaa_3d

#desc If [code]true[/code], the viewport will use a unique copy of the [World3D] defined in [member world_3d].
var own_world_3d: bool:
	get = is_using_own_world_3d, set = set_use_own_world_3d

#desc If [code]true[/code], the objects rendered by viewport become subjects of mouse picking process.
var physics_object_picking: bool:
	get = get_physics_object_picking, set = set_physics_object_picking

#desc If [code]true[/code], objects receive mouse picking events sorted primarily by their [member CanvasItem.z_index] and secondarily by their position in the scene tree. If [code]false[/code], the order is undetermined.
#desc [b]Note:[/b] This setting is disabled by default because of its potential expensive computational cost.
var physics_object_picking_sort: bool:
	get = get_physics_object_picking_sort, set = set_physics_object_picking_sort

#desc Use 16 bits for the omni/spot shadow depth map. Enabling this results in shadows having less precision and may result in shadow acne, but can lead to performance improvements on some devices.
var positional_shadow_atlas_16_bits: bool:
	get = get_positional_shadow_atlas_16_bits, set = set_positional_shadow_atlas_16_bits

#desc The subdivision amount of the first quadrant on the shadow atlas.
var positional_shadow_atlas_quad_0: int:
	get = get_positional_shadow_atlas_quadrant_subdiv, set = set_positional_shadow_atlas_quadrant_subdiv

#desc The subdivision amount of the second quadrant on the shadow atlas.
var positional_shadow_atlas_quad_1: int:
	get = get_positional_shadow_atlas_quadrant_subdiv, set = set_positional_shadow_atlas_quadrant_subdiv

#desc The subdivision amount of the third quadrant on the shadow atlas.
var positional_shadow_atlas_quad_2: int:
	get = get_positional_shadow_atlas_quadrant_subdiv, set = set_positional_shadow_atlas_quadrant_subdiv

#desc The subdivision amount of the fourth quadrant on the shadow atlas.
var positional_shadow_atlas_quad_3: int:
	get = get_positional_shadow_atlas_quadrant_subdiv, set = set_positional_shadow_atlas_quadrant_subdiv

#desc The shadow atlas' resolution (used for omni and spot lights). The value is rounded up to the nearest power of 2.
#desc [b]Note:[/b] If this is set to [code]0[/code], no positional shadows will be visible at all. This can improve performance significantly on low-end systems by reducing both the CPU and GPU load (as fewer draw calls are needed to draw the scene without shadows).
var positional_shadow_atlas_size: int:
	get = get_positional_shadow_atlas_size, set = set_positional_shadow_atlas_size

#desc Sets scaling 3d mode. Bilinear scaling renders at different resolution to either undersample or supersample the viewport. FidelityFX Super Resolution 1.0, abbreviated to FSR, is an upscaling technology that produces high quality images at fast framerates by using a spatially aware upscaling algorithm. FSR is slightly more expensive than bilinear, but it produces significantly higher image quality. FSR should be used where possible.
#desc To control this property on the root viewport, set the [member ProjectSettings.rendering/scaling_3d/mode] project setting.
var scaling_3d_mode: int:
	get = get_scaling_3d_mode, set = set_scaling_3d_mode

#desc Scales the 3D render buffer based on the viewport size uses an image filter specified in [member ProjectSettings.rendering/scaling_3d/mode] to scale the output image to the full viewport size. Values lower than [code]1.0[/code] can be used to speed up 3D rendering at the cost of quality (undersampling). Values greater than [code]1.0[/code] are only valid for bilinear mode and can be used to improve 3D rendering quality at a high performance cost (supersampling). See also [member ProjectSettings.rendering/anti_aliasing/quality/msaa_3d] for multi-sample antialiasing, which is significantly cheaper but only smooths the edges of polygons.
#desc When using FSR upscaling, AMD recommends exposing the following values as preset options to users "Ultra Quality: 0.77", "Quality: 0.67", "Balanced: 0.59", "Performance: 0.5" instead of exposing the entire scale.
#desc To control this property on the root viewport, set the [member ProjectSettings.rendering/scaling_3d/scale] project setting.
var scaling_3d_scale: float:
	get = get_scaling_3d_scale, set = set_scaling_3d_scale

#desc Sets the screen-space antialiasing method used. Screen-space antialiasing works by selectively blurring edges in a post-process shader. It differs from MSAA which takes multiple coverage samples while rendering objects. Screen-space AA methods are typically faster than MSAA and will smooth out specular aliasing, but tend to make scenes appear blurry.
var screen_space_aa: int:
	get = get_screen_space_aa, set = set_screen_space_aa

var sdf_oversize: int:
	get = get_sdf_oversize, set = set_sdf_oversize

var sdf_scale: int:
	get = get_sdf_scale, set = set_sdf_scale

var snap_2d_transforms_to_pixel: bool:
	get = is_snap_2d_transforms_to_pixel_enabled, set = set_snap_2d_transforms_to_pixel

var snap_2d_vertices_to_pixel: bool:
	get = is_snap_2d_vertices_to_pixel_enabled, set = set_snap_2d_vertices_to_pixel

#desc Affects the final texture sharpness by reading from a lower or higher mipmap (also called "texture LOD bias"). Negative values make mipmapped textures sharper but grainier when viewed at a distance, while positive values make mipmapped textures blurrier (even when up close).
#desc Enabling temporal antialiasing ([member use_taa]) will automatically apply a [code]-0.5[/code] offset to this value, while enabling FXAA ([member screen_space_aa]) will automatically apply a [code]-0.25[/code] offset to this value. If both TAA and FXAA are enbled at the same time, an offset of [code]-0.75[/code] is applied to this value.
#desc [b]Note:[/b] If [member scaling_3d_scale] is lower than [code]1.0[/code] (exclusive), [member texture_mipmap_bias] is used to adjust the automatic mipmap bias which is calculated internally based on the scale factor. The formula for this is [code]log2(scaling_3d_scale) + mipmap_bias[/code].
#desc To control this property on the root viewport, set the [member ProjectSettings.rendering/textures/default_filters/texture_mipmap_bias] project setting.
var texture_mipmap_bias: float:
	get = get_texture_mipmap_bias, set = set_texture_mipmap_bias

#desc If [code]true[/code], the viewport should render its background as transparent.
var transparent_bg: bool:
	get = has_transparent_background, set = set_transparent_background

#desc If [code]true[/code], uses a fast post-processing filter to make banding significantly less visible in 3D. 2D rendering is [i]not[/i] affected by debanding unless the [member Environment.background_mode] is [constant Environment.BG_CANVAS]. See also [member ProjectSettings.rendering/anti_aliasing/quality/use_debanding].
#desc In some cases, debanding may introduce a slightly noticeable dithering pattern. It's recommended to enable debanding only when actually needed since the dithering pattern will make lossless-compressed screenshots larger.
var use_debanding: bool:
	get = is_using_debanding, set = set_use_debanding

#desc If [code]true[/code], [OccluderInstance3D] nodes will be usable for occlusion culling in 3D for this viewport. For the root viewport, [member ProjectSettings.rendering/occlusion_culling/use_occlusion_culling] must be set to [code]true[/code] instead.
#desc [b]Note:[/b] Enabling occlusion culling has a cost on the CPU. Only enable occlusion culling if you actually plan to use it, and think whether your scene can actually benefit from occlusion culling. Large, open scenes with few or no objects blocking the view will generally not benefit much from occlusion culling. Large open scenes generally benefit more from mesh LOD and visibility ranges ([member GeometryInstance3D.visibility_range_begin] and [member GeometryInstance3D.visibility_range_end]) compared to occlusion culling.
var use_occlusion_culling: bool:
	get = is_using_occlusion_culling, set = set_use_occlusion_culling

#desc Enables Temporal Anti-Aliasing for this viewport. TAA works by jittering the camera and accumulating the images of the last rendered frames, motion vector rendering is used to account for camera and object motion.
#desc [b]Note:[/b] The implementation is not complete yet, some visual instances such as particles and skinned meshes may show artifacts.
var use_taa: bool:
	get = is_using_taa, set = set_use_taa

#desc If [code]true[/code], the viewport will use the primary XR interface to render XR output. When applicable this can result in a stereoscopic image and the resulting render being output to a headset.
var use_xr: bool:
	get = is_using_xr, set = set_use_xr

#desc The Variable Rate Shading (VRS) mode that is used for this viewport. Note, if hardware does not support VRS this property is ignored.
var vrs_mode: int:
	get = get_vrs_mode, set = set_vrs_mode

#desc Texture to use when [member vrs_mode] is set to [constant Viewport.VRS_TEXTURE].
#desc The texture [i]must[/i] use a lossless compression format so that colors can be matched precisely. The following VRS densities are mapped to various colors, with brighter colors representing a lower level of shading precision:
#desc [codeblock]
#desc - 1x1 = rgb(0, 0, 0)     - #000000
#desc - 1x2 = rgb(0, 85, 0)    - #005500
#desc - 2x1 = rgb(85, 0, 0)    - #550000
#desc - 2x2 = rgb(85, 85, 0)   - #555500
#desc - 2x4 = rgb(85, 170, 0)  - #55aa00
#desc - 4x2 = rgb(170, 85, 0)  - #aa5500
#desc - 4x4 = rgb(170, 170, 0) - #aaaa00
#desc - 4x8 = rgb(170, 255, 0) - #aaff00 - Not supported on most hardware
#desc - 8x4 = rgb(255, 170, 0) - #ffaa00 - Not supported on most hardware
#desc - 8x8 = rgb(255, 255, 0) - #ffff00 - Not supported on most hardware
#desc [/codeblock]
var vrs_texture: Texture2D:
	get = get_vrs_texture, set = set_vrs_texture

#desc The custom [World2D] which can be used as 2D environment source.
var world_2d: World2D:
	get = get_world_2d, set = set_world_2d

#desc The custom [World3D] which can be used as 3D environment source.
var world_3d: World3D:
	get = get_world_3d, set = set_world_3d



#desc Returns the first valid [World2D] for this viewport, searching the [member world_2d] property of itself and any Viewport ancestor.
func find_world_2d() -> World2D:
	pass;

#desc Returns the first valid [World3D] for this viewport, searching the [member world_3d] property of itself and any Viewport ancestor.
func find_world_3d() -> World3D:
	pass;

#desc Returns the currently active 2D camera. Returns null if there are no active cameras.
func get_camera_2d() -> Camera2D:
	pass;

#desc Returns the currently active 3D camera.
func get_camera_3d() -> Camera3D:
	pass;

#desc Returns an individual bit on the rendering layer mask.
func get_canvas_cull_mask_bit(layer: int) -> bool:
	pass;

#desc Returns the transform from the viewport's coordinate system to the embedder's coordinate system.
func get_final_transform() -> Transform2D:
	pass;

#desc Returns the mouse's position in this [Viewport] using the coordinate system of this [Viewport].
func get_mouse_position() -> Vector2:
	pass;

#desc Returns the [enum PositionalShadowAtlasQuadrantSubdiv] of the specified quadrant.
func get_positional_shadow_atlas_quadrant_subdiv(quadrant: int) -> int:
	pass;

#desc Returns rendering statistics of the given type. See [enum RenderInfoType] and [enum RenderInfo] for options.
func get_render_info(type: int, info: int) -> int:
	pass;

#desc Returns the transform from the Viewport's coordinates to the screen coordinates of the containing window manager window.
func get_screen_transform() -> Transform2D:
	pass;

#desc Returns the viewport's texture.
#desc [b]Note:[/b] When trying to store the current texture (e.g. in a file), it might be completely black or outdated if used too early, especially when used in e.g. [method Node._ready]. To make sure the texture you get is correct, you can await [signal RenderingServer.frame_post_draw] signal.
#desc [codeblock]
#desc func _ready():
#desc await RenderingServer.frame_post_draw
#desc $Viewport.get_texture().get_image().save_png("user://Screenshot.png")
#desc [/codeblock]
func get_texture() -> ViewportTexture:
	pass;

#desc Returns the viewport's RID from the [RenderingServer].
func get_viewport_rid() -> RID:
	pass;

#desc Returns the visible rectangle in global screen coordinates.
func get_visible_rect() -> Rect2:
	pass;

#desc Returns the drag data from the GUI, that was previously returned by [method Control._get_drag_data].
func gui_get_drag_data() -> Variant:
	pass;

#desc Returns the [Control] having the focus within this viewport. If no [Control] has the focus, returns null.
func gui_get_focus_owner() -> Control:
	pass;

#desc Returns [code]true[/code] if the drag operation is successful.
func gui_is_drag_successful() -> bool:
	pass;

#desc Returns [code]true[/code] if the viewport is currently performing a drag operation.
#desc Alternative to [constant Node.NOTIFICATION_DRAG_BEGIN] and [constant Node.NOTIFICATION_DRAG_END] when you prefer polling the value.
func gui_is_dragging() -> bool:
	pass;

#desc Removes the focus from the currently focused [Control] within this viewport. If no [Control] has the focus, does nothing.
func gui_release_focus() -> void:
	pass;

#desc Returns whether the current [InputEvent] has been handled. Input events are not handled until [method set_input_as_handled] has been called during the lifetime of an [InputEvent].
#desc This is usually done as part of input handling methods like [method Node._input], [method Control._gui_input] or others, as well as in corresponding signal handlers.
#desc If [member handle_input_locally] is set to [code]false[/code], this method will try finding the first parent viewport that is set to handle input locally, and return its value for [method is_input_handled] instead.
func is_input_handled() -> bool:
	pass;

#desc Triggers the given [param event] in this [Viewport]. This can be used to pass an [InputEvent] between viewports, or to locally apply inputs that were sent over the network or saved to a file.
#desc If [param in_local_coords] is [code]false[/code], the event's position is in the embedder's coordinates and will be converted to viewport coordinates. If [param in_local_coords] is [code]true[/code], the event's position is in viewport coordinates.
#desc While this method serves a similar purpose as [method Input.parse_input_event], it does not remap the specified [param event] based on project settings like [member ProjectSettings.input_devices/pointing/emulate_touch_from_mouse].
#desc Calling this method will propagate calls to child nodes for following methods in the given order:
#desc - [method Node._input]
#desc - [method Control._gui_input] for [Control] nodes
#desc If an earlier method marks the input as handled via [method set_input_as_handled], any later method in this list will not be called.
func push_input(event: InputEvent, in_local_coords: bool = false) -> void:
	pass;

#desc Helper method which calls the [code]set_text()[/code] method on the currently focused [Control], provided that it is defined (e.g. if the focused Control is [Button] or [LineEdit]).
func push_text_input(text: String) -> void:
	pass;

#desc Triggers the given [InputEvent] in this [Viewport]. This can be used to pass input events between viewports, or to locally apply inputs that were sent over the network or saved to a file.
#desc If [param in_local_coords] is [code]false[/code], the event's position is in the embedder's coordinates and will be converted to viewport coordinates. If [param in_local_coords] is [code]true[/code], the event's position is in viewport coordinates.
#desc While this method serves a similar purpose as [method Input.parse_input_event], it does not remap the specified [param event] based on project settings like [member ProjectSettings.input_devices/pointing/emulate_touch_from_mouse].
#desc Calling this method will propagate calls to child nodes for following methods in the given order:
#desc - [method Node._shortcut_input]
#desc - [method Node._unhandled_input]
#desc - [method Node._unhandled_key_input]
#desc If an earlier method marks the input as handled via [method set_input_as_handled], any later method in this list will not be called.
#desc If none of the methods handle the event and [member physics_object_picking] is [code]true[/code], the event is used for physics object picking.
func push_unhandled_input(event: InputEvent, in_local_coords: bool = false) -> void:
	pass;

#desc Set/clear individual bits on the rendering layer mask. This simplifies editing this [Viewport]'s layers.
func set_canvas_cull_mask_bit(layer: int, enable: bool) -> void:
	pass;

#desc Stops the input from propagating further down the [SceneTree].
#desc [b]Note:[/b] This does not affect the methods in [Input], only the way events are propagated.
func set_input_as_handled() -> void:
	pass;

#desc Sets the number of subdivisions to use in the specified quadrant. A higher number of subdivisions allows you to have more shadows in the scene at once, but reduces the quality of the shadows. A good practice is to have quadrants with a varying number of subdivisions and to have as few subdivisions as possible.
func set_positional_shadow_atlas_quadrant_subdiv(quadrant: int, subdiv: int) -> void:
	pass;

#desc Moves the mouse pointer to the specified position in this [Viewport] using the coordinate system of this [Viewport].
#desc [b]Note:[/b] [method warp_mouse] is only supported on Windows, macOS and Linux. It has no effect on Android, iOS and Web.
func warp_mouse(position: Vector2) -> void:
	pass;


func is_audio_listener_2d() -> bool:
	return audio_listener_enable_2d

func set_as_audio_listener_2d(value: bool) -> void:
	audio_listener_enable_2d = value

func is_audio_listener_3d() -> bool:
	return audio_listener_enable_3d

func set_as_audio_listener_3d(value: bool) -> void:
	audio_listener_enable_3d = value

func get_canvas_cull_mask() -> int:
	return canvas_cull_mask

func set_canvas_cull_mask(value: int) -> void:
	canvas_cull_mask = value

func get_default_canvas_item_texture_filter() -> int:
	return canvas_item_default_texture_filter

func set_default_canvas_item_texture_filter(value: int) -> void:
	canvas_item_default_texture_filter = value

func get_default_canvas_item_texture_repeat() -> int:
	return canvas_item_default_texture_repeat

func set_default_canvas_item_texture_repeat(value: int) -> void:
	canvas_item_default_texture_repeat = value

func get_canvas_transform() -> Transform2D:
	return canvas_transform

func set_canvas_transform(value: Transform2D) -> void:
	canvas_transform = value

func get_debug_draw() -> int:
	return debug_draw

func set_debug_draw(value: int) -> void:
	debug_draw = value

func is_3d_disabled() -> bool:
	return disable_3d

func set_disable_3d(value: bool) -> void:
	disable_3d = value

func get_fsr_sharpness() -> float:
	return fsr_sharpness

func set_fsr_sharpness(value: float) -> void:
	fsr_sharpness = value

func get_global_canvas_transform() -> Transform2D:
	return global_canvas_transform

func set_global_canvas_transform(value: Transform2D) -> void:
	global_canvas_transform = value

func is_input_disabled() -> bool:
	return gui_disable_input

func set_disable_input(value: bool) -> void:
	gui_disable_input = value

func is_embedding_subwindows() -> bool:
	return gui_embed_subwindows

func set_embedding_subwindows(value: bool) -> void:
	gui_embed_subwindows = value

func is_snap_controls_to_pixels_enabled() -> bool:
	return gui_snap_controls_to_pixels

func set_snap_controls_to_pixels(value: bool) -> void:
	gui_snap_controls_to_pixels = value

func is_handling_input_locally() -> bool:
	return handle_input_locally

func set_handle_input_locally(value: bool) -> void:
	handle_input_locally = value

func get_mesh_lod_threshold() -> float:
	return mesh_lod_threshold

func set_mesh_lod_threshold(value: float) -> void:
	mesh_lod_threshold = value

func get_msaa_2d() -> int:
	return msaa_2d

func set_msaa_2d(value: int) -> void:
	msaa_2d = value

func get_msaa_3d() -> int:
	return msaa_3d

func set_msaa_3d(value: int) -> void:
	msaa_3d = value

func is_using_own_world_3d() -> bool:
	return own_world_3d

func set_use_own_world_3d(value: bool) -> void:
	own_world_3d = value

func get_physics_object_picking() -> bool:
	return physics_object_picking

func set_physics_object_picking(value: bool) -> void:
	physics_object_picking = value

func get_physics_object_picking_sort() -> bool:
	return physics_object_picking_sort

func set_physics_object_picking_sort(value: bool) -> void:
	physics_object_picking_sort = value

func get_positional_shadow_atlas_16_bits() -> bool:
	return positional_shadow_atlas_16_bits

func set_positional_shadow_atlas_16_bits(value: bool) -> void:
	positional_shadow_atlas_16_bits = value

func get_positional_shadow_atlas_quadrant_subdiv() -> int:
	return positional_shadow_atlas_quad_0

func set_positional_shadow_atlas_quadrant_subdiv(value: int) -> void:
	positional_shadow_atlas_quad_0 = value

func get_positional_shadow_atlas_quadrant_subdiv() -> int:
	return positional_shadow_atlas_quad_1

func set_positional_shadow_atlas_quadrant_subdiv(value: int) -> void:
	positional_shadow_atlas_quad_1 = value

func get_positional_shadow_atlas_quadrant_subdiv() -> int:
	return positional_shadow_atlas_quad_2

func set_positional_shadow_atlas_quadrant_subdiv(value: int) -> void:
	positional_shadow_atlas_quad_2 = value

func get_positional_shadow_atlas_quadrant_subdiv() -> int:
	return positional_shadow_atlas_quad_3

func set_positional_shadow_atlas_quadrant_subdiv(value: int) -> void:
	positional_shadow_atlas_quad_3 = value

func get_positional_shadow_atlas_size() -> int:
	return positional_shadow_atlas_size

func set_positional_shadow_atlas_size(value: int) -> void:
	positional_shadow_atlas_size = value

func get_scaling_3d_mode() -> int:
	return scaling_3d_mode

func set_scaling_3d_mode(value: int) -> void:
	scaling_3d_mode = value

func get_scaling_3d_scale() -> float:
	return scaling_3d_scale

func set_scaling_3d_scale(value: float) -> void:
	scaling_3d_scale = value

func get_screen_space_aa() -> int:
	return screen_space_aa

func set_screen_space_aa(value: int) -> void:
	screen_space_aa = value

func get_sdf_oversize() -> int:
	return sdf_oversize

func set_sdf_oversize(value: int) -> void:
	sdf_oversize = value

func get_sdf_scale() -> int:
	return sdf_scale

func set_sdf_scale(value: int) -> void:
	sdf_scale = value

func is_snap_2d_transforms_to_pixel_enabled() -> bool:
	return snap_2d_transforms_to_pixel

func set_snap_2d_transforms_to_pixel(value: bool) -> void:
	snap_2d_transforms_to_pixel = value

func is_snap_2d_vertices_to_pixel_enabled() -> bool:
	return snap_2d_vertices_to_pixel

func set_snap_2d_vertices_to_pixel(value: bool) -> void:
	snap_2d_vertices_to_pixel = value

func get_texture_mipmap_bias() -> float:
	return texture_mipmap_bias

func set_texture_mipmap_bias(value: float) -> void:
	texture_mipmap_bias = value

func has_transparent_background() -> bool:
	return transparent_bg

func set_transparent_background(value: bool) -> void:
	transparent_bg = value

func is_using_debanding() -> bool:
	return use_debanding

func set_use_debanding(value: bool) -> void:
	use_debanding = value

func is_using_occlusion_culling() -> bool:
	return use_occlusion_culling

func set_use_occlusion_culling(value: bool) -> void:
	use_occlusion_culling = value

func is_using_taa() -> bool:
	return use_taa

func set_use_taa(value: bool) -> void:
	use_taa = value

func is_using_xr() -> bool:
	return use_xr

func set_use_xr(value: bool) -> void:
	use_xr = value

func get_vrs_mode() -> int:
	return vrs_mode

func set_vrs_mode(value: int) -> void:
	vrs_mode = value

func get_vrs_texture() -> Texture2D:
	return vrs_texture

func set_vrs_texture(value: Texture2D) -> void:
	vrs_texture = value

func get_world_2d() -> World2D:
	return world_2d

func set_world_2d(value: World2D) -> void:
	world_2d = value

func get_world_3d() -> World3D:
	return world_3d

func set_world_3d(value: World3D) -> void:
	world_3d = value

