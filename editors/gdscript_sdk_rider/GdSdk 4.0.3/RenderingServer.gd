extends Object
#brief Server for anything visible.
#desc The rendering server is the API backend for everything visible. The whole scene system mounts on it to display. The rendering server is completely opaque: the internals are entirely implementation-specific and cannot be accessed.
#desc The rendering server can be used to bypass the scene/[Node] system entirely. This can improve performance in cases where the scene system is the bottleneck, but won't improve performance otherwise (for instance, if the GPU is already fully utilized).
#desc Resources are created using the [code]*_create[/code] functions. These functions return [RID]s which are not references to the objects themselves, but opaque [i]pointers[/i] towards these objects.
#desc All objects are drawn to a viewport. You can use the [Viewport] attached to the [SceneTree] or you can create one yourself with [method viewport_create]. When using a custom scenario or canvas, the scenario or canvas needs to be attached to the viewport using [method viewport_set_scenario] or [method viewport_attach_canvas].
#desc [b]Scenarios:[/b] In 3D, all visual objects must be associated with a scenario. The scenario is a visual representation of the world. If accessing the rendering server from a running game, the scenario can be accessed from the scene tree from any [Node3D] node with [method Node3D.get_world_3d]. Otherwise, a scenario can be created with [method scenario_create].
#desc Similarly, in 2D, a canvas is needed to draw all canvas items.
#desc [b]3D:[/b] In 3D, all visible objects are comprised of a resource and an instance. A resource can be a mesh, a particle system, a light, or any other 3D object. In order to be visible resources must be attached to an instance using [method instance_set_base]. The instance must also be attached to the scenario using [method instance_set_scenario] in order to be visible. RenderingServer methods that don't have a prefix are usually 3D-specific (but not always).
#desc [b]2D:[/b] In 2D, all visible objects are some form of canvas item. In order to be visible, a canvas item needs to be the child of a canvas attached to a viewport, or it needs to be the child of another canvas item that is eventually attached to the canvas. 2D-specific RenderingServer methods generally start with [code]canvas_*[/code].
#desc [b]Headless mode:[/b] Starting the engine with the [code]--headless[/code] [url=$DOCS_URL/tutorials/editor/command_line_tutorial.html]command line argument[/url] disables all rendering and window management functions. Most functions from [RenderingServer] will return dummy values in this case.
#tutorial [Optimization using Servers] https://docs.godotengine.org/en/stable/tutorials/performance/using_servers.html
class_name RenderingServer

#desc Emitted at the end of the frame, after the RenderingServer has finished updating all the Viewports.
signal frame_post_draw
#desc Emitted at the beginning of the frame, before the RenderingServer updates all the Viewports.
signal frame_pre_draw
#desc Marks an error that shows that the index array is empty.
const NO_INDEX_ARRAY = -1;

#desc Number of weights/bones per vertex.
const ARRAY_WEIGHTS_SIZE = 4;

#desc The minimum Z-layer for canvas items.
const CANVAS_ITEM_Z_MIN = -4096;

#desc The maximum Z-layer for canvas items.
const CANVAS_ITEM_Z_MAX = 4096;

#desc The maximum number of glow levels that can be used with the glow post-processing effect.
const MAX_GLOW_LEVELS = 7;

#desc [i]Deprecated.[/i] This constant is unused.
const MAX_CURSORS = 8;

#desc The maximum number of directional lights that can be rendered at a given time in 2D.
const MAX_2D_DIRECTIONAL_LIGHTS = 8;

#desc Array of 2-dimensional textures (see [Texture2DArray]).
#desc Cubemap texture (see [Cubemap]).
#desc Array of cubemap textures (see [CubemapArray]).
#desc Left face of a [Cubemap].
#desc Right face of a [Cubemap].
#desc Bottom face of a [Cubemap].
#desc Top face of a [Cubemap].
#desc Front face of a [Cubemap].
#desc Back face of a [Cubemap].
#desc Shader is a 3D shader.
#desc Shader is a 2D shader.
#desc Shader is a particle shader (can be used in both 2D and 3D).
#desc Shader is a 3D sky shader.
#desc Shader is a 3D fog shader.
#desc Represents the size of the [enum ShaderMode] enum.
#desc The minimum renderpriority of all materials.
const MATERIAL_RENDER_PRIORITY_MIN = -128;

#desc The maximum renderpriority of all materials.
const MATERIAL_RENDER_PRIORITY_MAX = 127;

#desc Array is a vertex position array.
#desc Array is a normal array.
#desc Array is a tangent array.
#desc Array is a vertex color array.
#desc Array is an UV coordinates array.
#desc Array is an UV coordinates array for the second set of UV coordinates.
#desc Array is a custom data array for the first set of custom data.
#desc Array is a custom data array for the second set of custom data.
#desc Array is a custom data array for the third set of custom data.
#desc Array is a custom data array for the fourth set of custom data.
#desc Array contains bone information.
#desc Array is weight information.
#desc Array is an index array.
#desc Represents the size of the [enum ArrayType] enum.
#desc The number of custom data arrays available ([constant ARRAY_CUSTOM0], [constant ARRAY_CUSTOM1], [constant ARRAY_CUSTOM2], [constant ARRAY_CUSTOM3]).
const ARRAY_CUSTOM_COUNT = 4;

#desc Custom data array contains 8-bit-per-channel red/green/blue/alpha color data. Values are normalized, unsigned floating-point in the [code][0.0, 1.0][/code] range.
#desc Custom data array contains 8-bit-per-channel red/green/blue/alpha color data. Values are normalized, signed floating-point in the [code][-1.0, 1.0][/code] range.
#desc Custom data array contains 16-bit-per-channel red/green color data. Values are floating-point in half precision.
#desc Custom data array contains 16-bit-per-channel red/green/blue/alpha color data. Values are floating-point in half precision.
#desc Custom data array contains 32-bit-per-channel red color data. Values are floating-point in single precision.
#desc Custom data array contains 32-bit-per-channel red/green color data. Values are floating-point in single precision.
#desc Custom data array contains 32-bit-per-channel red/green/blue color data. Values are floating-point in single precision.
#desc Custom data array contains 32-bit-per-channel red/green/blue/alpha color data. Values are floating-point in single precision.
#desc Represents the size of the [enum ArrayCustomFormat] enum.
#desc Flag used to mark a vertex position array.
#desc Flag used to mark a normal array.
#desc Flag used to mark a tangent array.
#desc Flag used to mark a vertex color array.
#desc Flag used to mark an UV coordinates array.
#desc Flag used to mark an UV coordinates array for the second UV coordinates.
#desc Flag used to mark an array of custom per-vertex data for the first set of custom data.
#desc Flag used to mark an array of custom per-vertex data for the second set of custom data.
#desc Flag used to mark an array of custom per-vertex data for the third set of custom data.
#desc Flag used to mark an array of custom per-vertex data for the fourth set of custom data.
#desc Flag used to mark a bone information array.
#desc Flag used to mark a weights array.
#desc Flag used to mark an index array.
#desc Flag used to mark that the array contains 2D vertices.
#desc Flag used to mark that the array uses 8 bone weighs instead of 4.
#desc Primitive to draw consists of points.
#desc Primitive to draw consists of lines.
#desc Primitive to draw consists of a line strip from start to end.
#desc Primitive to draw consists of triangles.
#desc Primitive to draw consists of a triangle strip (the last 3 vertices are always combined to make a triangle).
#desc Represents the size of the [enum PrimitiveType] enum.
#desc Blend shapes are normalized.
#desc Blend shapes are relative to base weight.
#desc Use [Transform2D] to store MultiMesh transform.
#desc Use [Transform3D] to store MultiMesh transform.
#desc Nearest-neighbor filter for light projectors (use for pixel art light projectors). No mipmaps are used for rendering, which means light projectors at a distance will look sharp but grainy. This has roughly the same performance cost as using mipmaps.
#desc Linear filter for light projectors (use for non-pixel art light projectors). No mipmaps are used for rendering, which means light projectors at a distance will look smooth but blurry. This has roughly the same performance cost as using mipmaps.
#desc Nearest-neighbor filter for light projectors (use for pixel art light projectors). Isotropic mipmaps are used for rendering, which means light projectors at a distance will look smooth but blurry. This has roughly the same performance cost as not using mipmaps.
#desc Linear filter for light projectors (use for non-pixel art light projectors). Isotropic mipmaps are used for rendering, which means light projectors at a distance will look smooth but blurry. This has roughly the same performance cost as not using mipmaps.
#desc Nearest-neighbor filter for light projectors (use for pixel art light projectors). Anisotropic mipmaps are used for rendering, which means light projectors at a distance will look smooth and sharp when viewed from oblique angles. This looks better compared to isotropic mipmaps, but is slower. The level of anisotropic filtering is defined by [member ProjectSettings.rendering/textures/default_filters/anisotropic_filtering_level].
#desc Linear filter for light projectors (use for non-pixel art light projectors). Anisotropic mipmaps are used for rendering, which means light projectors at a distance will look smooth and sharp when viewed from oblique angles. This looks better compared to isotropic mipmaps, but is slower. The level of anisotropic filtering is defined by [member ProjectSettings.rendering/textures/default_filters/anisotropic_filtering_level].
#desc Directional (sun/moon) light (see [DirectionalLight3D]).
#desc Omni light (see [OmniLight3D]).
#desc Spot light (see [SpotLight3D]).
#desc The light's energy multiplier.
#desc The light's indirect energy multiplier (final indirect energy is [constant LIGHT_PARAM_ENERGY] * [constant LIGHT_PARAM_INDIRECT_ENERGY]).
#desc The light's volumetric fog energy multiplier (final volumetric fog energy is [constant LIGHT_PARAM_ENERGY] * [constant LIGHT_PARAM_VOLUMETRIC_FOG_ENERGY]).
#desc The light's influence on specularity.
#desc The light's range.
#desc The size of the light when using spot light or omni light. The angular size of the light when using directional light.
#desc The light's attenuation.
#desc The spotlight's angle.
#desc The spotlight's attenuation.
#desc The maximum distance for shadow splits. Increasing this value will make directional shadows visible from further away, at the cost of lower overall shadow detail and performance (since more objects need to be included in the directional shadow rendering).
#desc Proportion of shadow atlas occupied by the first split.
#desc Proportion of shadow atlas occupied by the second split.
#desc Proportion of shadow atlas occupied by the third split. The fourth split occupies the rest.
#desc Proportion of shadow max distance where the shadow will start to fade out.
#desc Normal bias used to offset shadow lookup by object normal. Can be used to fix self-shadowing artifacts.
#desc Bias the shadow lookup to fix self-shadowing artifacts.
#desc Sets the size of the directional shadow pancake. The pancake offsets the start of the shadow's camera frustum to provide a higher effective depth resolution for the shadow. However, a high pancake size can cause artifacts in the shadows of large objects that are close to the edge of the frustum. Reducing the pancake size can help. Setting the size to [code]0[/code] turns off the pancaking effect.
#desc The light's shadow opacity. Values lower than [code]1.0[/code] make the light appear through shadows. This can be used to fake global illumination at a low performance cost.
#desc Blurs the edges of the shadow. Can be used to hide pixel artifacts in low resolution shadow maps. A high value can make shadows appear grainy and can cause other unwanted artifacts. Try to keep as near default as possible.
#desc Represents the size of the [enum LightParam] enum.
#desc Light is ignored when baking. This is the fastest mode, but the light will be taken into account when baking global illumination. This mode should generally be used for dynamic lights that change quickly, as the effect of global illumination is less noticeable on those lights.
#desc Light is taken into account in static baking ([VoxelGI], [LightmapGI], SDFGI ([member Environment.sdfgi_enabled])). The light can be moved around or modified, but its global illumination will not update in real-time. This is suitable for subtle changes (such as flickering torches), but generally not large changes such as toggling a light on and off.
#desc Light is taken into account in dynamic baking ([VoxelGI] and SDFGI ([member Environment.sdfgi_enabled]) only). The light can be moved around or modified with global illumination updating in real-time. The light's global illumination appearance will be slightly different compared to [constant LIGHT_BAKE_STATIC]. This has a greater performance cost compared to [constant LIGHT_BAKE_STATIC]. When using SDFGI, the update speed of dynamic lights is affected by [member ProjectSettings.rendering/global_illumination/sdfgi/frames_to_update_lights].
#desc Use a dual paraboloid shadow map for omni lights.
#desc Use a cubemap shadow map for omni lights. Slower but better quality than dual paraboloid.
#desc Use orthogonal shadow projection for directional light.
#desc Use 2 splits for shadow projection when using directional light.
#desc Use 4 splits for shadow projection when using directional light.
#desc Use DirectionalLight3D in both sky rendering and scene lighting.
#desc Only use DirectionalLight3D in scene lighting.
#desc Only use DirectionalLight3D in sky rendering.
#desc Lowest shadow filtering quality (fastest). Soft shadows are not available with this quality setting, which means the [member Light3D.shadow_blur] property is ignored if [member Light3D.light_size] and [member Light3D.light_angular_distance] is [code]0.0[/code].
#desc [b]Note:[/b] The variable shadow blur performed by [member Light3D.light_size] and [member Light3D.light_angular_distance] is still effective when using hard shadow filtering. In this case, [member Light3D.shadow_blur] [i]is[/i] taken into account. However, the results will not be blurred, instead the blur amount is treated as a maximum radius for the penumbra.
#desc Very low shadow filtering quality (faster). When using this quality setting, [member Light3D.shadow_blur] is automatically multiplied by 0.75× to avoid introducing too much noise. This division only applies to lights whose [member Light3D.light_size] or [member Light3D.light_angular_distance] is [code]0.0[/code]).
#desc Low shadow filtering quality (fast).
#desc Medium low shadow filtering quality (average).
#desc High low shadow filtering quality (slow). When using this quality setting, [member Light3D.shadow_blur] is automatically multiplied by 1.5× to better make use of the high sample count. This increased blur also improves the stability of dynamic object shadows. This multiplier only applies to lights whose [member Light3D.light_size] or [member Light3D.light_angular_distance] is [code]0.0[/code]).
#desc Highest low shadow filtering quality (slowest). When using this quality setting, [member Light3D.shadow_blur] is automatically multiplied by 2× to better make use of the high sample count. This increased blur also improves the stability of dynamic object shadows. This multiplier only applies to lights whose [member Light3D.light_size] or [member Light3D.light_angular_distance] is [code]0.0[/code]).
#desc Represents the size of the [enum ShadowQuality] enum.
#desc Reflection probe will update reflections once and then stop.
#desc Reflection probe will update each frame. This mode is necessary to capture moving objects.
#desc Do not apply any ambient lighting inside the reflection probe's box defined by its size.
#desc Apply automatically-sourced environment lighting inside the reflection probe's box defined by its size.
#desc Apply custom ambient lighting inside the reflection probe's box defined by its size. See [method reflection_probe_set_ambient_color] and [method reflection_probe_set_ambient_energy].
#desc Albedo texture slot in a decal ([member Decal.texture_albedo]).
#desc Normal map texture slot in a decal ([member Decal.texture_normal]).
#desc Occlusion/Roughness/Metallic texture slot in a decal ([member Decal.texture_orm]).
#desc Emission texture slot in a decal ([member Decal.texture_emission]).
#desc Represents the size of the [enum DecalTexture] enum.
#desc Nearest-neighbor filter for decals (use for pixel art decals). No mipmaps are used for rendering, which means decals at a distance will look sharp but grainy. This has roughly the same performance cost as using mipmaps.
#desc Linear filter for decals (use for non-pixel art decals). No mipmaps are used for rendering, which means decals at a distance will look smooth but blurry. This has roughly the same performance cost as using mipmaps.
#desc Nearest-neighbor filter for decals (use for pixel art decals). Isotropic mipmaps are used for rendering, which means decals at a distance will look smooth but blurry. This has roughly the same performance cost as not using mipmaps.
#desc Linear filter for decals (use for non-pixel art decals). Isotropic mipmaps are used for rendering, which means decals at a distance will look smooth but blurry. This has roughly the same performance cost as not using mipmaps.
#desc Nearest-neighbor filter for decals (use for pixel art decals). Anisotropic mipmaps are used for rendering, which means decals at a distance will look smooth and sharp when viewed from oblique angles. This looks better compared to isotropic mipmaps, but is slower. The level of anisotropic filtering is defined by [member ProjectSettings.rendering/textures/default_filters/anisotropic_filtering_level].
#desc Linear filter for decals (use for non-pixel art decals). Anisotropic mipmaps are used for rendering, which means decals at a distance will look smooth and sharp when viewed from oblique angles. This looks better compared to isotropic mipmaps, but is slower. The level of anisotropic filtering is defined by [member ProjectSettings.rendering/textures/default_filters/anisotropic_filtering_level].
#desc Low [VoxelGI] rendering quality using 4 cones.
#desc High [VoxelGI] rendering quality using 6 cones.
#desc 2D particles.
#desc 3D particles.
const PARTICLES_EMIT_FLAG_POSITION = 1;

const PARTICLES_EMIT_FLAG_ROTATION_SCALE = 2;

const PARTICLES_EMIT_FLAG_VELOCITY = 4;

const PARTICLES_EMIT_FLAG_COLOR = 8;

const PARTICLES_EMIT_FLAG_CUSTOM = 16;

#desc Draw particles in the order that they appear in the particles array.
#desc Sort particles based on their lifetime.
#desc Sort particles based on their distance to the camera.
#desc Represents the size of the [enum ParticlesCollisionHeightfieldResolution] enum.
#desc [FogVolume] will be shaped like an ellipsoid (stretched sphere).
#desc [FogVolume] will be shaped like a cone pointing upwards (in local coordinates). The cone's angle is set automatically to fill the size. The cone will be adjusted to fit within the size. Rotate the [FogVolume] node to reorient the cone. Non-uniform scaling via size is not supported (scale the [FogVolume] node instead).
#desc [FogVolume] will be shaped like an upright cylinder (in local coordinates). Rotate the [FogVolume] node to reorient the cylinder. The cylinder will be adjusted to fit within the size. Non-uniform scaling via size is not supported (scale the [FogVolume] node instead).
#desc [FogVolume] will be shaped like a box.
#desc [FogVolume] will have no shape, will cover the whole world and will not be culled.
#desc Represents the size of the [enum FogVolumeShape] enum.
#desc Use bilinear scaling for the viewport's 3D buffer. The amount of scaling can be set using [member Viewport.scaling_3d_scale]. Values less than [code]1.0[/code] will result in undersampling while values greater than [code]1.0[/code] will result in supersampling. A value of [code]1.0[/code] disables scaling.
#desc Use AMD FidelityFX Super Resolution 1.0 upscaling for the viewport's 3D buffer. The amount of scaling can be set using [member Viewport.scaling_3d_scale]. Values less than [code]1.0[/code] will be result in the viewport being upscaled using FSR. Values greater than [code]1.0[/code] are not supported and bilinear downsampling will be used instead. A value of [code]1.0[/code] disables scaling.
#desc Represents the size of the [enum ViewportScaling3DMode] enum.
#desc Do not update the viewport's render target.
#desc Update the viewport's render target once, then switch to [constant VIEWPORT_UPDATE_DISABLED].
#desc Update the viewport's render target only when it is visible. This is the default value.
#desc Update the viewport's render target only when its parent is visible.
#desc Always update the viewport's render target.
#desc Always clear the viewport's render target before drawing.
#desc Never clear the viewport's render target.
#desc Clear the viewport's render target on the next frame, then switch to [constant VIEWPORT_CLEAR_NEVER].
#desc Disable rendering of 3D environment over 2D canvas.
#desc Enable rendering of 3D environment over 2D canvas.
#desc Inherit enable/disable value from parent. If the topmost parent is also set to [constant VIEWPORT_ENVIRONMENT_INHERIT], then this has the same behavior as [constant VIEWPORT_ENVIRONMENT_ENABLED].
#desc Represents the size of the [enum ViewportEnvironmentMode] enum.
#desc Do not oversize the 2D signed distance field. Occluders may disappear when touching the viewport's edges, and [GPUParticles3D] collision may stop working earlier than intended. This has the lowest GPU requirements.
#desc 2D signed distance field covers 20% of the viewport's size outside the viewport on each side (top, right, bottom, left).
#desc 2D signed distance field covers 50% of the viewport's size outside the viewport on each side (top, right, bottom, left).
#desc 2D signed distance field covers 100% of the viewport's size outside the viewport on each side (top, right, bottom, left). This has the highest GPU requirements.
#desc Represents the size of the [enum ViewportSDFOversize] enum.
#desc Full resolution 2D signed distance field scale. This has the highest GPU requirements.
#desc Half resolution 2D signed distance field scale on each axis (25% of the viewport pixel count).
#desc Quarter resolution 2D signed distance field scale on each axis (6.25% of the viewport pixel count). This has the lowest GPU requirements.
#desc Represents the size of the [enum ViewportSDFScale] enum.
#desc Multisample antialiasing for 3D is disabled. This is the default value, and also the fastest setting.
#desc Multisample antialiasing uses 2 samples per pixel for 3D. This has a moderate impact on performance.
#desc Multisample antialiasing uses 4 samples per pixel for 3D. This has a high impact on performance.
#desc Multisample antialiasing uses 8 samples per pixel for 3D. This has a very high impact on performance. Likely unsupported on low-end and older hardware.
#desc Represents the size of the [enum ViewportMSAA] enum.
#desc Do not perform any antialiasing in the full screen post-process.
#desc Use fast approximate antialiasing. FXAA is a popular screen-space antialiasing method, which is fast but will make the image look blurry, especially at lower resolutions. It can still work relatively well at large resolutions such as 1440p and 4K.
#desc Represents the size of the [enum ViewportScreenSpaceAA] enum.
#desc Low occlusion culling BVH build quality (as defined by Embree). Results in the lowest CPU usage, but least effective culling.
#desc Medium occlusion culling BVH build quality (as defined by Embree).
#desc High occlusion culling BVH build quality (as defined by Embree). Results in the highest CPU usage, but most effective culling.
#desc Number of objects drawn in a single frame.
#desc Number of vertices drawn in a single frame.
#desc Number of draw calls during this frame.
#desc Represents the size of the [enum ViewportRenderInfo] enum.
#desc Visible render pass (excluding shadows).
#desc Shadow render pass. Objects will be rendered several times depending on the number of amounts of lights with shadows and the number of directional shadow splits.
#desc Represents the size of the [enum ViewportRenderInfoType] enum.
#desc Debug draw is disabled. Default setting.
#desc Objects are displayed without light information.
#desc Objects are displayed with only light information.
#desc Objects are displayed semi-transparent with additive blending so you can see where they are drawing over top of one another. A higher overdraw (represented by brighter colors) means you are wasting performance on drawing pixels that are being hidden behind others.
#desc [b]Note:[/b] When using this debug draw mode, custom shaders will be ignored. This means vertex displacement won't be visible anymore.
#desc Debug draw draws objects in wireframe.
#desc Normal buffer is drawn instead of regular scene so you can see the per-pixel normals that will be used by post-processing effects.
#desc Objects are displayed with only the albedo value from [VoxelGI]s.
#desc Objects are displayed with only the lighting value from [VoxelGI]s.
#desc Objects are displayed with only the emission color from [VoxelGI]s.
#desc Draws the shadow atlas that stores shadows from [OmniLight3D]s and [SpotLight3D]s in the upper left quadrant of the [Viewport].
#desc Draws the shadow atlas that stores shadows from [DirectionalLight3D]s in the upper left quadrant of the [Viewport].
#desc Draws the estimated scene luminance. This is a 1×1 texture that is generated when autoexposure is enabled to control the scene's exposure.
#desc Draws the screen space ambient occlusion texture instead of the scene so that you can clearly see how it is affecting objects. In order for this display mode to work, you must have [member Environment.ssao_enabled] set in your [WorldEnvironment].
#desc Draws the screen space indirect lighting texture instead of the scene so that you can clearly see how it is affecting objects. In order for this display mode to work, you must have [member Environment.ssil_enabled] set in your [WorldEnvironment].
#desc Colors each PSSM split for the [DirectionalLight3D]s in the scene a different color so you can see where the splits are. In order they will be colored red, green, blue, yellow.
#desc Draws the decal atlas that stores decal textures from [Decal]s.
#desc Draws SDFGI cascade data. This is the data structure that is used to bounce lighting against and create reflections.
#desc Draws SDFGI probe data. This is the data structure that is used to give indirect lighting dynamic objects moving within the scene.
#desc Draws the global illumination buffer ([VoxelGI] or SDFGI).
#desc Disable mesh LOD. All meshes are drawn with full detail, which can be used to compare performance.
#desc Draws the [OmniLight3D] cluster. Clustering determines where lights are positioned in screen-space, which allows the engine to only process these portions of the screen for lighting.
#desc Draws the [SpotLight3D] cluster. Clustering determines where lights are positioned in screen-space, which allows the engine to only process these portions of the screen for lighting.
#desc Draws the [Decal] cluster. Clustering determines where decals are positioned in screen-space, which allows the engine to only process these portions of the screen for decals.
#desc Draws the [ReflectionProbe] cluster. Clustering determines where reflection probes are positioned in screen-space, which allows the engine to only process these portions of the screen for reflection probes.
#desc Draws the occlusion culling buffer. This low-resolution occlusion culling buffer is rasterized on the CPU and is used to check whether instances are occluded by other objects.
#desc Draws the motion vectors buffer. This is used by temporal antialiasing to correct for motion that occurs during gameplay.
#desc Variable rate shading is disabled.
#desc Variable rate shading uses a texture. Note, for stereoscopic use a texture atlas with a texture for each view.
#desc Variable rate shading texture is supplied by the primary [XRInterface].
#desc Represents the size of the [enum ViewportVRSMode] enum.
#desc Automatically selects the appropriate process mode based on your sky shader. If your shader uses [code]TIME[/code] or [code]POSITION[/code], this will use [constant SKY_MODE_REALTIME]. If your shader uses any of the [code]LIGHT_*[/code] variables or any custom uniforms, this uses [constant SKY_MODE_INCREMENTAL]. Otherwise, this defaults to [constant SKY_MODE_QUALITY].
#desc Uses high quality importance sampling to process the radiance map. In general, this results in much higher quality than [constant SKY_MODE_REALTIME] but takes much longer to generate. This should not be used if you plan on changing the sky at runtime. If you are finding that the reflection is not blurry enough and is showing sparkles or fireflies, try increasing [member ProjectSettings.rendering/reflections/sky_reflections/ggx_samples].
#desc Uses the same high quality importance sampling to process the radiance map as [constant SKY_MODE_QUALITY], but updates over several frames. The number of frames is determined by [member ProjectSettings.rendering/reflections/sky_reflections/roughness_layers]. Use this when you need highest quality radiance maps, but have a sky that updates slowly.
#desc Uses the fast filtering algorithm to process the radiance map. In general this results in lower quality, but substantially faster run times. If you need better quality, but still need to update the sky every frame, consider turning on [member ProjectSettings.rendering/reflections/sky_reflections/fast_filter_high_quality].
#desc [b]Note:[/b] The fast filtering algorithm is limited to 256×256 cubemaps, so [method sky_set_radiance_size] must be set to [code]256[/code]. Otherwise, a warning is printed and the overridden radiance size is ignored.
#desc Use the clear color as background.
#desc Use a specified color as the background.
#desc Use a sky resource for the background.
#desc Use a specified canvas layer as the background. This can be useful for instantiating a 2D scene in a 3D world.
#desc Do not clear the background, use whatever was rendered last frame as the background.
#desc Displays a camera feed in the background.
#desc Represents the size of the [enum EnvironmentBG] enum.
#desc Gather ambient light from whichever source is specified as the background.
#desc Disable ambient light.
#desc Specify a specific [Color] for ambient light.
#desc Gather ambient light from the [Sky] regardless of what the background is.
#desc Use the background for reflections.
#desc Disable reflections.
#desc Use the [Sky] for reflections regardless of what the background is.
#desc Additive glow blending mode. Mostly used for particles, glows (bloom), lens flare, bright sources.
#desc Screen glow blending mode. Increases brightness, used frequently with bloom.
#desc Soft light glow blending mode. Modifies contrast, exposes shadows and highlights (vivid bloom).
#desc Replace glow blending mode. Replaces all pixels' color by the glow value. This can be used to simulate a full-screen blur effect by tweaking the glow parameters to match the original image's brightness.
#desc Mixes the glow with the underlying color to avoid increasing brightness as much while still maintaining a glow effect.
#desc Output color as they came in. This can cause bright lighting to look blown out, with noticeable clipping in the output colors.
#desc Use the Reinhard tonemapper. Performs a variation on rendered pixels' colors by this formula: [code]color = color / (1 + color)[/code]. This avoids clipping bright highlights, but the resulting image can look a bit dull.
#desc Use the filmic tonemapper. This avoids clipping bright highlights, with a resulting image that usually looks more vivid than [constant ENV_TONE_MAPPER_REINHARD].
#desc Use the Academy Color Encoding System tonemapper. ACES is slightly more expensive than other options, but it handles bright lighting in a more realistic fashion by desaturating it as it becomes brighter. ACES typically has a more contrasted output compared to [constant ENV_TONE_MAPPER_REINHARD] and [constant ENV_TONE_MAPPER_FILMIC].
#desc [b]Note:[/b] This tonemapping operator is called "ACES Fitted" in Godot 3.x.
#desc Lowest quality of roughness filter for screen-space reflections. Rough materials will not have blurrier screen-space reflections compared to smooth (non-rough) materials. This is the fastest option.
#desc Low quality of roughness filter for screen-space reflections.
#desc Medium quality of roughness filter for screen-space reflections.
#desc High quality of roughness filter for screen-space reflections. This is the slowest option.
#desc Lowest quality of screen-space ambient occlusion.
#desc Low quality screen-space ambient occlusion.
#desc Medium quality screen-space ambient occlusion.
#desc High quality screen-space ambient occlusion.
#desc Highest quality screen-space ambient occlusion. Uses the adaptive target setting which can be dynamically adjusted to smoothly balance performance and visual quality.
#desc Lowest quality of screen-space indirect lighting.
#desc Low quality screen-space indirect lighting.
#desc High quality screen-space indirect lighting.
#desc High quality screen-space indirect lighting.
#desc Highest quality screen-space indirect lighting. Uses the adaptive target setting which can be dynamically adjusted to smoothly balance performance and visual quality.
#desc Use 50% scale for SDFGI on the Y (vertical) axis. SDFGI cells will be twice as short as they are wide. This allows providing increased GI detail and reduced light leaking with thin floors and ceilings. This is usually the best choice for scenes that don't feature much verticality.
#desc Use 75% scale for SDFGI on the Y (vertical) axis. This is a balance between the 50% and 100% SDFGI Y scales.
#desc Use 100% scale for SDFGI on the Y (vertical) axis. SDFGI cells will be as tall as they are wide. This is usually the best choice for highly vertical scenes. The downside is that light leaking may become more noticeable with thin floors and ceilings.
#desc Throw 4 rays per frame when converging SDFGI. This has the lowest GPU requirements, but creates the most noisy result.
#desc Throw 8 rays per frame when converging SDFGI.
#desc Throw 16 rays per frame when converging SDFGI.
#desc Throw 32 rays per frame when converging SDFGI.
#desc Throw 64 rays per frame when converging SDFGI.
#desc Throw 96 rays per frame when converging SDFGI. This has high GPU requirements.
#desc Throw 128 rays per frame when converging SDFGI. This has very high GPU requirements, but creates the least noisy result.
#desc Represents the size of the [enum EnvironmentSDFGIRayCount] enum.
#desc Converge SDFGI over 5 frames. This is the most responsive, but creates the most noisy result with a given ray count.
#desc Configure SDFGI to fully converge over 10 frames.
#desc Configure SDFGI to fully converge over 15 frames.
#desc Configure SDFGI to fully converge over 20 frames.
#desc Configure SDFGI to fully converge over 25 frames.
#desc Configure SDFGI to fully converge over 30 frames. This is the least responsive, but creates the least noisy result with a given ray count.
#desc Represents the size of the [enum EnvironmentSDFGIFramesToConverge] enum.
#desc Update indirect light from dynamic lights in SDFGI over 1 frame. This is the most responsive, but has the highest GPU requirements.
#desc Update indirect light from dynamic lights in SDFGI over 2 frames.
#desc Update indirect light from dynamic lights in SDFGI over 4 frames.
#desc Update indirect light from dynamic lights in SDFGI over 8 frames.
#desc Update indirect light from dynamic lights in SDFGI over 16 frames. This is the least responsive, but has the lowest GPU requirements.
#desc Represents the size of the [enum EnvironmentSDFGIFramesToUpdateLight] enum.
#desc Disables subsurface scattering entirely, even on materials that have [member BaseMaterial3D.subsurf_scatter_enabled] set to [code]true[/code]. This has the lowest GPU requirements.
#desc Low subsurface scattering quality.
#desc Medium subsurface scattering quality.
#desc High subsurface scattering quality. This has the highest GPU requirements.
#desc Calculate the DOF blur using a box filter. The fastest option, but results in obvious lines in blur pattern.
#desc Calculates DOF blur using a hexagon shaped filter.
#desc Calculates DOF blur using a circle shaped filter. Best quality and most realistic, but slowest. Use only for areas where a lot of performance can be dedicated to post-processing (e.g. cutscenes).
#desc Lowest quality DOF blur. This is the fastest setting, but you may be able to see filtering artifacts.
#desc Low quality DOF blur.
#desc Medium quality DOF blur.
#desc Highest quality DOF blur. Results in the smoothest looking blur by taking the most samples, but is also significantly slower.
#desc The instance does not have a type.
#desc The instance is a mesh.
#desc The instance is a multimesh.
#desc The instance is a particle emitter.
#desc The instance is a GPUParticles collision shape.
#desc The instance is a light.
#desc The instance is a reflection probe.
#desc The instance is a decal.
#desc The instance is a VoxelGI.
#desc The instance is a lightmap.
#desc The instance is an occlusion culling occluder.
#desc The instance is a visible on-screen notifier.
#desc The instance is a fog volume.
#desc Represents the size of the [enum InstanceType] enum.
#desc A combination of the flags of geometry instances (mesh, multimesh, immediate and particles).
#desc Allows the instance to be used in baked lighting.
#desc Allows the instance to be used with dynamic global illumination.
#desc When set, manually requests to draw geometry on next frame.
#desc Always draw, even if the instance would be culled by occlusion culling. Does not affect view frustum culling.
#desc Represents the size of the [enum InstanceFlags] enum.
#desc Disable shadows from this instance.
#desc Cast shadows from this instance.
#desc Disable backface culling when rendering the shadow of the object. This is slightly slower but may result in more correct shadows.
#desc Only render the shadows from the object. The object itself will not be drawn.
#desc Disable visibility range fading for the given instance.
#desc Fade-out the given instance when it approaches its visibility range limits.
#desc Fade-in the given instance's dependencies when reaching its visibility range limits.
#desc Index of [Image] in array of [Image]s returned by [method bake_render_uv2]. Image uses [constant Image.FORMAT_RGBA8] and contains albedo color in the [code].rgb[/code] channels and alpha in the [code].a[/code] channel.
#desc Index of [Image] in array of [Image]s returned by [method bake_render_uv2]. Image uses [constant Image.FORMAT_RGBA8] and contains the per-pixel normal of the object in the [code].rgb[/code] channels and nothing in the [code].a[/code] channel. The per-pixel normal is encoded as [code]normal * 0.5 + 0.5[/code].
#desc Index of [Image] in array of [Image]s returned by [method bake_render_uv2]. Image uses [constant Image.FORMAT_RGBA8] and contains ambient occlusion (from material and decals only) in the [code].r[/code] channel, roughness in the [code].g[/code] channel, metallic in the [code].b[/code] channel and sub surface scattering amount in the [code].a[/code] channel.
#desc Index of [Image] in array of [Image]s returned by [method bake_render_uv2]. Image uses [constant Image.FORMAT_RGBAH] and contains emission color in the [code].rgb[/code] channels and nothing in the [code].a[/code] channel.
#desc Diffuse canvas texture ([member CanvasTexture.diffuse_texture]).
#desc Normal map canvas texture ([member CanvasTexture.normal_texture]).
#desc Specular map canvas texture ([member CanvasTexture.specular_texture]).
#desc The nine patch gets stretched where needed.
#desc The nine patch gets filled with tiles where needed.
#desc The nine patch gets filled with tiles where needed and stretches them a bit if needed.
#desc Uses the default filter mode for this [Viewport].
#desc The texture filter reads from the nearest pixel only. The simplest and fastest method of filtering, but the texture will look pixelized.
#desc The texture filter blends between the nearest 4 pixels. Use this when you want to avoid a pixelated style, but do not want mipmaps.
#desc The texture filter reads from the nearest pixel in the nearest mipmap. The fastest way to read from textures with mipmaps.
#desc The texture filter blends between the nearest 4 pixels and between the nearest 2 mipmaps.
#desc The texture filter reads from the nearest pixel, but selects a mipmap based on the angle between the surface and the camera view. This reduces artifacts on surfaces that are almost in line with the camera.
#desc The texture filter blends between the nearest 4 pixels and selects a mipmap based on the angle between the surface and the camera view. This reduces artifacts on surfaces that are almost in line with the camera. This is the slowest of the filtering options, but results in the highest quality texturing.
#desc Max value for [enum CanvasItemTextureFilter] enum.
#desc Uses the default repeat mode for this [Viewport].
#desc Disables textures repeating. Instead, when reading UVs outside the 0-1 range, the value will be clamped to the edge of the texture, resulting in a stretched out look at the borders of the texture.
#desc Enables the texture to repeat when UV coordinates are outside the 0-1 range. If using one of the linear filtering modes, this can result in artifacts at the edges of a texture when the sampler filters across the edges of the texture.
#desc Flip the texture when repeating so that the edge lines up instead of abruptly changing.
#desc Max value for [enum CanvasItemTextureRepeat] enum.
#desc Child draws over parent and is not clipped.
#desc Parent is used for the purposes of clipping only. Child is clipped to the parent's visible area, parent is not drawn.
#desc Parent is used for clipping child, but parent is also drawn underneath child as normal before clipping child to its visible area.
#desc 2D point light (see [PointLight2D]).
#desc 2D directional (sun/moon) light (see [DirectionalLight2D]).
#desc Adds light color additive to the canvas.
#desc Adds light color subtractive to the canvas.
#desc The light adds color depending on transparency.
#desc Do not apply a filter to canvas light shadows.
#desc Use PCF5 filtering to filter canvas light shadows.
#desc Use PCF13 filtering to filter canvas light shadows.
#desc Max value of the [enum CanvasLightShadowFilter] enum.
#desc Culling of the canvas occluder is disabled.
#desc Culling of the canvas occluder is clockwise.
#desc Culling of the canvas occluder is counterclockwise.
#desc Boolean global shader parameter ([code]global uniform bool ...[/code]).
#desc 2-dimensional boolean vector global shader parameter ([code]global uniform bvec2 ...[/code]).
#desc 3-dimensional boolean vector global shader parameter ([code]global uniform bvec3 ...[/code]).
#desc 4-dimensional boolean vector global shader parameter ([code]global uniform bvec4 ...[/code]).
#desc Integer global shader parameter ([code]global uniform int ...[/code]).
#desc 2-dimensional integer vector global shader parameter ([code]global uniform ivec2 ...[/code]).
#desc 3-dimensional integer vector global shader parameter ([code]global uniform ivec3 ...[/code]).
#desc 4-dimensional integer vector global shader parameter ([code]global uniform ivec4 ...[/code]).
#desc 2-dimensional integer rectangle global shader parameter ([code]global uniform ivec4 ...[/code]). Equivalent to [constant GLOBAL_VAR_TYPE_IVEC4] in shader code, but exposed as a [Rect2i] in the editor UI.
#desc Unsigned integer global shader parameter ([code]global uniform uint ...[/code]).
#desc 2-dimensional unsigned integer vector global shader parameter ([code]global uniform uvec2 ...[/code]).
#desc 3-dimensional unsigned integer vector global shader parameter ([code]global uniform uvec3 ...[/code]).
#desc 4-dimensional unsigned integer vector global shader parameter ([code]global uniform uvec4 ...[/code]).
#desc Single-precision floating-point global shader parameter ([code]global uniform float ...[/code]).
#desc 2-dimensional floating-point vector global shader parameter ([code]global uniform vec2 ...[/code]).
#desc 3-dimensional floating-point vector global shader parameter ([code]global uniform vec3 ...[/code]).
#desc 4-dimensional floating-point vector global shader parameter ([code]global uniform vec4 ...[/code]).
#desc Color global shader parameter ([code]global uniform vec4 ...[/code]). Equivalent to [constant GLOBAL_VAR_TYPE_VEC4] in shader code, but exposed as a [Color] in the editor UI.
#desc 2-dimensional floating-point rectangle global shader parameter ([code]global uniform vec4 ...[/code]). Equivalent to [constant GLOBAL_VAR_TYPE_VEC4] in shader code, but exposed as a [Rect2] in the editor UI.
#desc 2×2 matrix global shader parameter ([code]global uniform mat2 ...[/code]). Exposed as a [PackedInt32Array] in the editor UI.
#desc 3×3 matrix global shader parameter ([code]global uniform mat3 ...[/code]). Exposed as a [Basis] in the editor UI.
#desc 4×4 matrix global shader parameter ([code]global uniform mat4 ...[/code]). Exposed as a [Projection] in the editor UI.
#desc 2-dimensional transform global shader parameter ([code]global uniform mat2x3 ...[/code]). Exposed as a [Transform2D] in the editor UI.
#desc 3-dimensional transform global shader parameter ([code]global uniform mat3x4 ...[/code]). Exposed as a [Transform3D] in the editor UI.
#desc 2D sampler global shader parameter ([code]global uniform sampler2D ...[/code]). Exposed as a [Texture2D] in the editor UI.
#desc 2D sampler array global shader parameter ([code]global uniform sampler2DArray ...[/code]). Exposed as a [Texture2DArray] in the editor UI.
#desc 3D sampler global shader parameter ([code]global uniform sampler3D ...[/code]). Exposed as a [Texture3D] in the editor UI.
#desc Cubemap sampler global shader parameter ([code]global uniform samplerCube ...[/code]). Exposed as a [Cubemap] in the editor UI.
#desc Represents the size of the [enum GlobalShaderParameterType] enum.
#desc Number of objects rendered in the current 3D scene. This varies depending on camera position and rotation.
#desc Number of vertices/indices rendered in the current 3D scene. This varies depending on camera position and rotation.
#desc Number of draw calls performed to render in the current 3D scene. This varies depending on camera position and rotation.
#desc Texture memory used (in bytes).
#desc Buffer memory used (in bytes).
#desc Video memory used (in bytes). This is always greater than the sum of [constant RENDERING_INFO_TEXTURE_MEM_USED] and [constant RENDERING_INFO_BUFFER_MEM_USED], since there is miscellaneous data not accounted for by those two metrics.
#desc Hardware supports shaders. This enum is currently unused in Godot 3.x.
#desc Hardware supports multithreading. This enum is currently unused in Godot 3.x.

#enum TextureLayeredType
enum {
    TEXTURE_LAYERED_2D_ARRAY = 0,
    TEXTURE_LAYERED_CUBEMAP = 1,
    TEXTURE_LAYERED_CUBEMAP_ARRAY = 2,
}
#enum CubeMapLayer
enum {
    CUBEMAP_LAYER_LEFT = 0,
    CUBEMAP_LAYER_RIGHT = 1,
    CUBEMAP_LAYER_BOTTOM = 2,
    CUBEMAP_LAYER_TOP = 3,
    CUBEMAP_LAYER_FRONT = 4,
    CUBEMAP_LAYER_BACK = 5,
}
#enum ShaderMode
enum {
    SHADER_SPATIAL = 0,
    SHADER_CANVAS_ITEM = 1,
    SHADER_PARTICLES = 2,
    SHADER_SKY = 3,
    SHADER_FOG = 4,
    SHADER_MAX = 5,
}
#enum ArrayType
enum {
    ARRAY_VERTEX = 0,
    ARRAY_NORMAL = 1,
    ARRAY_TANGENT = 2,
    ARRAY_COLOR = 3,
    ARRAY_TEX_UV = 4,
    ARRAY_TEX_UV2 = 5,
    ARRAY_CUSTOM0 = 6,
    ARRAY_CUSTOM1 = 7,
    ARRAY_CUSTOM2 = 8,
    ARRAY_CUSTOM3 = 9,
    ARRAY_BONES = 10,
    ARRAY_WEIGHTS = 11,
    ARRAY_INDEX = 12,
    ARRAY_MAX = 13,
}
#enum ArrayCustomFormat
enum {
    ARRAY_CUSTOM_RGBA8_UNORM = 0,
    ARRAY_CUSTOM_RGBA8_SNORM = 1,
    ARRAY_CUSTOM_RG_HALF = 2,
    ARRAY_CUSTOM_RGBA_HALF = 3,
    ARRAY_CUSTOM_R_FLOAT = 4,
    ARRAY_CUSTOM_RG_FLOAT = 5,
    ARRAY_CUSTOM_RGB_FLOAT = 6,
    ARRAY_CUSTOM_RGBA_FLOAT = 7,
    ARRAY_CUSTOM_MAX = 8,
}
#enum ArrayFormat
enum {
    ARRAY_FORMAT_VERTEX = 1,
    ARRAY_FORMAT_NORMAL = 2,
    ARRAY_FORMAT_TANGENT = 4,
    ARRAY_FORMAT_COLOR = 8,
    ARRAY_FORMAT_TEX_UV = 16,
    ARRAY_FORMAT_TEX_UV2 = 32,
    ARRAY_FORMAT_CUSTOM0 = 64,
    ARRAY_FORMAT_CUSTOM1 = 128,
    ARRAY_FORMAT_CUSTOM2 = 256,
    ARRAY_FORMAT_CUSTOM3 = 512,
    ARRAY_FORMAT_BONES = 1024,
    ARRAY_FORMAT_WEIGHTS = 2048,
    ARRAY_FORMAT_INDEX = 4096,
    ARRAY_FORMAT_BLEND_SHAPE_MASK = 7,
    ARRAY_FORMAT_CUSTOM_BASE = 13,
    ARRAY_FORMAT_CUSTOM_BITS = 3,
    ARRAY_FORMAT_CUSTOM0_SHIFT = 13,
    ARRAY_FORMAT_CUSTOM1_SHIFT = 16,
    ARRAY_FORMAT_CUSTOM2_SHIFT = 19,
    ARRAY_FORMAT_CUSTOM3_SHIFT = 22,
    ARRAY_FORMAT_CUSTOM_MASK = 7,
    ARRAY_COMPRESS_FLAGS_BASE = 25,
    ARRAY_FLAG_USE_2D_VERTICES = 33554432,
    ARRAY_FLAG_USE_DYNAMIC_UPDATE = 67108864,
    ARRAY_FLAG_USE_8_BONE_WEIGHTS = 134217728,
    ARRAY_FLAG_USES_EMPTY_VERTEX_ARRAY = 268435456,
}
#enum PrimitiveType
enum {
    PRIMITIVE_POINTS = 0,
    PRIMITIVE_LINES = 1,
    PRIMITIVE_LINE_STRIP = 2,
    PRIMITIVE_TRIANGLES = 3,
    PRIMITIVE_TRIANGLE_STRIP = 4,
    PRIMITIVE_MAX = 5,
}
#enum BlendShapeMode
enum {
    BLEND_SHAPE_MODE_NORMALIZED = 0,
    BLEND_SHAPE_MODE_RELATIVE = 1,
}
#enum MultimeshTransformFormat
enum {
    MULTIMESH_TRANSFORM_2D = 0,
    MULTIMESH_TRANSFORM_3D = 1,
}
#enum LightProjectorFilter
enum {
    LIGHT_PROJECTOR_FILTER_NEAREST = 0,
    LIGHT_PROJECTOR_FILTER_LINEAR = 1,
    LIGHT_PROJECTOR_FILTER_NEAREST_MIPMAPS = 2,
    LIGHT_PROJECTOR_FILTER_LINEAR_MIPMAPS = 3,
    LIGHT_PROJECTOR_FILTER_NEAREST_MIPMAPS_ANISOTROPIC = 4,
    LIGHT_PROJECTOR_FILTER_LINEAR_MIPMAPS_ANISOTROPIC = 5,
}
#enum LightType
enum {
    LIGHT_DIRECTIONAL = 0,
    LIGHT_OMNI = 1,
    LIGHT_SPOT = 2,
}
#enum LightParam
enum {
    LIGHT_PARAM_ENERGY = 0,
    LIGHT_PARAM_INDIRECT_ENERGY = 1,
    LIGHT_PARAM_VOLUMETRIC_FOG_ENERGY = 2,
    LIGHT_PARAM_SPECULAR = 3,
    LIGHT_PARAM_RANGE = 4,
    LIGHT_PARAM_SIZE = 5,
    LIGHT_PARAM_ATTENUATION = 6,
    LIGHT_PARAM_SPOT_ANGLE = 7,
    LIGHT_PARAM_SPOT_ATTENUATION = 8,
    LIGHT_PARAM_SHADOW_MAX_DISTANCE = 9,
    LIGHT_PARAM_SHADOW_SPLIT_1_OFFSET = 10,
    LIGHT_PARAM_SHADOW_SPLIT_2_OFFSET = 11,
    LIGHT_PARAM_SHADOW_SPLIT_3_OFFSET = 12,
    LIGHT_PARAM_SHADOW_FADE_START = 13,
    LIGHT_PARAM_SHADOW_NORMAL_BIAS = 14,
    LIGHT_PARAM_SHADOW_BIAS = 15,
    LIGHT_PARAM_SHADOW_PANCAKE_SIZE = 16,
    LIGHT_PARAM_SHADOW_OPACITY = 17,
    LIGHT_PARAM_SHADOW_BLUR = 18,
    LIGHT_PARAM_TRANSMITTANCE_BIAS = 19,
    LIGHT_PARAM_MAX = 21,
}
#enum LightBakeMode
enum {
    LIGHT_BAKE_DISABLED = 0,
    LIGHT_BAKE_STATIC = 1,
    LIGHT_BAKE_DYNAMIC = 2,
}
#enum LightOmniShadowMode
enum {
    LIGHT_OMNI_SHADOW_DUAL_PARABOLOID = 0,
    LIGHT_OMNI_SHADOW_CUBE = 1,
}
#enum LightDirectionalShadowMode
enum {
    LIGHT_DIRECTIONAL_SHADOW_ORTHOGONAL = 0,
    LIGHT_DIRECTIONAL_SHADOW_PARALLEL_2_SPLITS = 1,
    LIGHT_DIRECTIONAL_SHADOW_PARALLEL_4_SPLITS = 2,
}
#enum LightDirectionalSkyMode
enum {
    LIGHT_DIRECTIONAL_SKY_MODE_LIGHT_AND_SKY = 0,
    LIGHT_DIRECTIONAL_SKY_MODE_LIGHT_ONLY = 1,
    LIGHT_DIRECTIONAL_SKY_MODE_SKY_ONLY = 2,
}
#enum ShadowQuality
enum {
    SHADOW_QUALITY_HARD = 0,
    SHADOW_QUALITY_SOFT_VERY_LOW = 1,
    SHADOW_QUALITY_SOFT_LOW = 2,
    SHADOW_QUALITY_SOFT_MEDIUM = 3,
    SHADOW_QUALITY_SOFT_HIGH = 4,
    SHADOW_QUALITY_SOFT_ULTRA = 5,
    SHADOW_QUALITY_MAX = 6,
}
#enum ReflectionProbeUpdateMode
enum {
    REFLECTION_PROBE_UPDATE_ONCE = 0,
    REFLECTION_PROBE_UPDATE_ALWAYS = 1,
}
#enum ReflectionProbeAmbientMode
enum {
    REFLECTION_PROBE_AMBIENT_DISABLED = 0,
    REFLECTION_PROBE_AMBIENT_ENVIRONMENT = 1,
    REFLECTION_PROBE_AMBIENT_COLOR = 2,
}
#enum DecalTexture
enum {
    DECAL_TEXTURE_ALBEDO = 0,
    DECAL_TEXTURE_NORMAL = 1,
    DECAL_TEXTURE_ORM = 2,
    DECAL_TEXTURE_EMISSION = 3,
    DECAL_TEXTURE_MAX = 4,
}
#enum DecalFilter
enum {
    DECAL_FILTER_NEAREST = 0,
    DECAL_FILTER_LINEAR = 1,
    DECAL_FILTER_NEAREST_MIPMAPS = 2,
    DECAL_FILTER_LINEAR_MIPMAPS = 3,
    DECAL_FILTER_NEAREST_MIPMAPS_ANISOTROPIC = 4,
    DECAL_FILTER_LINEAR_MIPMAPS_ANISOTROPIC = 5,
}
#enum VoxelGIQuality
enum {
    VOXEL_GI_QUALITY_LOW = 0,
    VOXEL_GI_QUALITY_HIGH = 1,
}
#enum ParticlesMode
enum {
    PARTICLES_MODE_2D = 0,
    PARTICLES_MODE_3D = 1,
}
#enum ParticlesTransformAlign
enum {
    PARTICLES_TRANSFORM_ALIGN_DISABLED = 0,
    PARTICLES_TRANSFORM_ALIGN_Z_BILLBOARD = 1,
    PARTICLES_TRANSFORM_ALIGN_Y_TO_VELOCITY = 2,
    PARTICLES_TRANSFORM_ALIGN_Z_BILLBOARD_Y_TO_VELOCITY = 3,
}
#enum ParticlesDrawOrder
enum {
    PARTICLES_DRAW_ORDER_INDEX = 0,
    PARTICLES_DRAW_ORDER_LIFETIME = 1,
    PARTICLES_DRAW_ORDER_REVERSE_LIFETIME = 2,
    PARTICLES_DRAW_ORDER_VIEW_DEPTH = 3,
}
#enum ParticlesCollisionType
enum {
    PARTICLES_COLLISION_TYPE_SPHERE_ATTRACT = 0,
    PARTICLES_COLLISION_TYPE_BOX_ATTRACT = 1,
    PARTICLES_COLLISION_TYPE_VECTOR_FIELD_ATTRACT = 2,
    PARTICLES_COLLISION_TYPE_SPHERE_COLLIDE = 3,
    PARTICLES_COLLISION_TYPE_BOX_COLLIDE = 4,
    PARTICLES_COLLISION_TYPE_SDF_COLLIDE = 5,
    PARTICLES_COLLISION_TYPE_HEIGHTFIELD_COLLIDE = 6,
}
#enum ParticlesCollisionHeightfieldResolution
enum {
    PARTICLES_COLLISION_HEIGHTFIELD_RESOLUTION_256 = 0,
    PARTICLES_COLLISION_HEIGHTFIELD_RESOLUTION_512 = 1,
    PARTICLES_COLLISION_HEIGHTFIELD_RESOLUTION_1024 = 2,
    PARTICLES_COLLISION_HEIGHTFIELD_RESOLUTION_2048 = 3,
    PARTICLES_COLLISION_HEIGHTFIELD_RESOLUTION_4096 = 4,
    PARTICLES_COLLISION_HEIGHTFIELD_RESOLUTION_8192 = 5,
    PARTICLES_COLLISION_HEIGHTFIELD_RESOLUTION_MAX = 6,
}
#enum FogVolumeShape
enum {
    FOG_VOLUME_SHAPE_ELLIPSOID = 0,
    FOG_VOLUME_SHAPE_CONE = 1,
    FOG_VOLUME_SHAPE_CYLINDER = 2,
    FOG_VOLUME_SHAPE_BOX = 3,
    FOG_VOLUME_SHAPE_WORLD = 4,
    FOG_VOLUME_SHAPE_MAX = 5,
}
#enum ViewportScaling3DMode
enum {
    VIEWPORT_SCALING_3D_MODE_BILINEAR = 0,
    VIEWPORT_SCALING_3D_MODE_FSR = 1,
    VIEWPORT_SCALING_3D_MODE_MAX = 2,
}
#enum ViewportUpdateMode
enum {
    VIEWPORT_UPDATE_DISABLED = 0,
    VIEWPORT_UPDATE_ONCE = 1,
    VIEWPORT_UPDATE_WHEN_VISIBLE = 2,
    VIEWPORT_UPDATE_WHEN_PARENT_VISIBLE = 3,
    VIEWPORT_UPDATE_ALWAYS = 4,
}
#enum ViewportClearMode
enum {
    VIEWPORT_CLEAR_ALWAYS = 0,
    VIEWPORT_CLEAR_NEVER = 1,
    VIEWPORT_CLEAR_ONLY_NEXT_FRAME = 2,
}
#enum ViewportEnvironmentMode
enum {
    VIEWPORT_ENVIRONMENT_DISABLED = 0,
    VIEWPORT_ENVIRONMENT_ENABLED = 1,
    VIEWPORT_ENVIRONMENT_INHERIT = 2,
    VIEWPORT_ENVIRONMENT_MAX = 3,
}
#enum ViewportSDFOversize
enum {
    VIEWPORT_SDF_OVERSIZE_100_PERCENT = 0,
    VIEWPORT_SDF_OVERSIZE_120_PERCENT = 1,
    VIEWPORT_SDF_OVERSIZE_150_PERCENT = 2,
    VIEWPORT_SDF_OVERSIZE_200_PERCENT = 3,
    VIEWPORT_SDF_OVERSIZE_MAX = 4,
}
#enum ViewportSDFScale
enum {
    VIEWPORT_SDF_SCALE_100_PERCENT = 0,
    VIEWPORT_SDF_SCALE_50_PERCENT = 1,
    VIEWPORT_SDF_SCALE_25_PERCENT = 2,
    VIEWPORT_SDF_SCALE_MAX = 3,
}
#enum ViewportMSAA
enum {
    VIEWPORT_MSAA_DISABLED = 0,
    VIEWPORT_MSAA_2X = 1,
    VIEWPORT_MSAA_4X = 2,
    VIEWPORT_MSAA_8X = 3,
    VIEWPORT_MSAA_MAX = 4,
}
#enum ViewportScreenSpaceAA
enum {
    VIEWPORT_SCREEN_SPACE_AA_DISABLED = 0,
    VIEWPORT_SCREEN_SPACE_AA_FXAA = 1,
    VIEWPORT_SCREEN_SPACE_AA_MAX = 2,
}
#enum ViewportOcclusionCullingBuildQuality
enum {
    VIEWPORT_OCCLUSION_BUILD_QUALITY_LOW = 0,
    VIEWPORT_OCCLUSION_BUILD_QUALITY_MEDIUM = 1,
    VIEWPORT_OCCLUSION_BUILD_QUALITY_HIGH = 2,
}
#enum ViewportRenderInfo
enum {
    VIEWPORT_RENDER_INFO_OBJECTS_IN_FRAME = 0,
    VIEWPORT_RENDER_INFO_PRIMITIVES_IN_FRAME = 1,
    VIEWPORT_RENDER_INFO_DRAW_CALLS_IN_FRAME = 2,
    VIEWPORT_RENDER_INFO_MAX = 3,
}
#enum ViewportRenderInfoType
enum {
    VIEWPORT_RENDER_INFO_TYPE_VISIBLE = 0,
    VIEWPORT_RENDER_INFO_TYPE_SHADOW = 1,
    VIEWPORT_RENDER_INFO_TYPE_MAX = 2,
}
#enum ViewportDebugDraw
enum {
    VIEWPORT_DEBUG_DRAW_DISABLED = 0,
    VIEWPORT_DEBUG_DRAW_UNSHADED = 1,
    VIEWPORT_DEBUG_DRAW_LIGHTING = 2,
    VIEWPORT_DEBUG_DRAW_OVERDRAW = 3,
    VIEWPORT_DEBUG_DRAW_WIREFRAME = 4,
    VIEWPORT_DEBUG_DRAW_NORMAL_BUFFER = 5,
    VIEWPORT_DEBUG_DRAW_VOXEL_GI_ALBEDO = 6,
    VIEWPORT_DEBUG_DRAW_VOXEL_GI_LIGHTING = 7,
    VIEWPORT_DEBUG_DRAW_VOXEL_GI_EMISSION = 8,
    VIEWPORT_DEBUG_DRAW_SHADOW_ATLAS = 9,
    VIEWPORT_DEBUG_DRAW_DIRECTIONAL_SHADOW_ATLAS = 10,
    VIEWPORT_DEBUG_DRAW_SCENE_LUMINANCE = 11,
    VIEWPORT_DEBUG_DRAW_SSAO = 12,
    VIEWPORT_DEBUG_DRAW_SSIL = 13,
    VIEWPORT_DEBUG_DRAW_PSSM_SPLITS = 14,
    VIEWPORT_DEBUG_DRAW_DECAL_ATLAS = 15,
    VIEWPORT_DEBUG_DRAW_SDFGI = 16,
    VIEWPORT_DEBUG_DRAW_SDFGI_PROBES = 17,
    VIEWPORT_DEBUG_DRAW_GI_BUFFER = 18,
    VIEWPORT_DEBUG_DRAW_DISABLE_LOD = 19,
    VIEWPORT_DEBUG_DRAW_CLUSTER_OMNI_LIGHTS = 20,
    VIEWPORT_DEBUG_DRAW_CLUSTER_SPOT_LIGHTS = 21,
    VIEWPORT_DEBUG_DRAW_CLUSTER_DECALS = 22,
    VIEWPORT_DEBUG_DRAW_CLUSTER_REFLECTION_PROBES = 23,
    VIEWPORT_DEBUG_DRAW_OCCLUDERS = 24,
    VIEWPORT_DEBUG_DRAW_MOTION_VECTORS = 25,
}
#enum ViewportVRSMode
enum {
    VIEWPORT_VRS_DISABLED = 0,
    VIEWPORT_VRS_TEXTURE = 1,
    VIEWPORT_VRS_XR = 2,
    VIEWPORT_VRS_MAX = 3,
}
#enum SkyMode
enum {
    SKY_MODE_AUTOMATIC = 0,
    SKY_MODE_QUALITY = 1,
    SKY_MODE_INCREMENTAL = 2,
    SKY_MODE_REALTIME = 3,
}
#enum EnvironmentBG
enum {
    ENV_BG_CLEAR_COLOR = 0,
    ENV_BG_COLOR = 1,
    ENV_BG_SKY = 2,
    ENV_BG_CANVAS = 3,
    ENV_BG_KEEP = 4,
    ENV_BG_CAMERA_FEED = 5,
    ENV_BG_MAX = 6,
}
#enum EnvironmentAmbientSource
enum {
    ENV_AMBIENT_SOURCE_BG = 0,
    ENV_AMBIENT_SOURCE_DISABLED = 1,
    ENV_AMBIENT_SOURCE_COLOR = 2,
    ENV_AMBIENT_SOURCE_SKY = 3,
}
#enum EnvironmentReflectionSource
enum {
    ENV_REFLECTION_SOURCE_BG = 0,
    ENV_REFLECTION_SOURCE_DISABLED = 1,
    ENV_REFLECTION_SOURCE_SKY = 2,
}
#enum EnvironmentGlowBlendMode
enum {
    ENV_GLOW_BLEND_MODE_ADDITIVE = 0,
    ENV_GLOW_BLEND_MODE_SCREEN = 1,
    ENV_GLOW_BLEND_MODE_SOFTLIGHT = 2,
    ENV_GLOW_BLEND_MODE_REPLACE = 3,
    ENV_GLOW_BLEND_MODE_MIX = 4,
}
#enum EnvironmentToneMapper
enum {
    ENV_TONE_MAPPER_LINEAR = 0,
    ENV_TONE_MAPPER_REINHARD = 1,
    ENV_TONE_MAPPER_FILMIC = 2,
    ENV_TONE_MAPPER_ACES = 3,
}
#enum EnvironmentSSRRoughnessQuality
enum {
    ENV_SSR_ROUGHNESS_QUALITY_DISABLED = 0,
    ENV_SSR_ROUGHNESS_QUALITY_LOW = 1,
    ENV_SSR_ROUGHNESS_QUALITY_MEDIUM = 2,
    ENV_SSR_ROUGHNESS_QUALITY_HIGH = 3,
}
#enum EnvironmentSSAOQuality
enum {
    ENV_SSAO_QUALITY_VERY_LOW = 0,
    ENV_SSAO_QUALITY_LOW = 1,
    ENV_SSAO_QUALITY_MEDIUM = 2,
    ENV_SSAO_QUALITY_HIGH = 3,
    ENV_SSAO_QUALITY_ULTRA = 4,
}
#enum EnvironmentSSILQuality
enum {
    ENV_SSIL_QUALITY_VERY_LOW = 0,
    ENV_SSIL_QUALITY_LOW = 1,
    ENV_SSIL_QUALITY_MEDIUM = 2,
    ENV_SSIL_QUALITY_HIGH = 3,
    ENV_SSIL_QUALITY_ULTRA = 4,
}
#enum EnvironmentSDFGIYScale
enum {
    ENV_SDFGI_Y_SCALE_50_PERCENT = 0,
    ENV_SDFGI_Y_SCALE_75_PERCENT = 1,
    ENV_SDFGI_Y_SCALE_100_PERCENT = 2,
}
#enum EnvironmentSDFGIRayCount
enum {
    ENV_SDFGI_RAY_COUNT_4 = 0,
    ENV_SDFGI_RAY_COUNT_8 = 1,
    ENV_SDFGI_RAY_COUNT_16 = 2,
    ENV_SDFGI_RAY_COUNT_32 = 3,
    ENV_SDFGI_RAY_COUNT_64 = 4,
    ENV_SDFGI_RAY_COUNT_96 = 5,
    ENV_SDFGI_RAY_COUNT_128 = 6,
    ENV_SDFGI_RAY_COUNT_MAX = 7,
}
#enum EnvironmentSDFGIFramesToConverge
enum {
    ENV_SDFGI_CONVERGE_IN_5_FRAMES = 0,
    ENV_SDFGI_CONVERGE_IN_10_FRAMES = 1,
    ENV_SDFGI_CONVERGE_IN_15_FRAMES = 2,
    ENV_SDFGI_CONVERGE_IN_20_FRAMES = 3,
    ENV_SDFGI_CONVERGE_IN_25_FRAMES = 4,
    ENV_SDFGI_CONVERGE_IN_30_FRAMES = 5,
    ENV_SDFGI_CONVERGE_MAX = 6,
}
#enum EnvironmentSDFGIFramesToUpdateLight
enum {
    ENV_SDFGI_UPDATE_LIGHT_IN_1_FRAME = 0,
    ENV_SDFGI_UPDATE_LIGHT_IN_2_FRAMES = 1,
    ENV_SDFGI_UPDATE_LIGHT_IN_4_FRAMES = 2,
    ENV_SDFGI_UPDATE_LIGHT_IN_8_FRAMES = 3,
    ENV_SDFGI_UPDATE_LIGHT_IN_16_FRAMES = 4,
    ENV_SDFGI_UPDATE_LIGHT_MAX = 5,
}
#enum SubSurfaceScatteringQuality
enum {
    SUB_SURFACE_SCATTERING_QUALITY_DISABLED = 0,
    SUB_SURFACE_SCATTERING_QUALITY_LOW = 1,
    SUB_SURFACE_SCATTERING_QUALITY_MEDIUM = 2,
    SUB_SURFACE_SCATTERING_QUALITY_HIGH = 3,
}
#enum DOFBokehShape
enum {
    DOF_BOKEH_BOX = 0,
    DOF_BOKEH_HEXAGON = 1,
    DOF_BOKEH_CIRCLE = 2,
}
#enum DOFBlurQuality
enum {
    DOF_BLUR_QUALITY_VERY_LOW = 0,
    DOF_BLUR_QUALITY_LOW = 1,
    DOF_BLUR_QUALITY_MEDIUM = 2,
    DOF_BLUR_QUALITY_HIGH = 3,
}
#enum InstanceType
enum {
    INSTANCE_NONE = 0,
    INSTANCE_MESH = 1,
    INSTANCE_MULTIMESH = 2,
    INSTANCE_PARTICLES = 3,
    INSTANCE_PARTICLES_COLLISION = 4,
    INSTANCE_LIGHT = 5,
    INSTANCE_REFLECTION_PROBE = 6,
    INSTANCE_DECAL = 7,
    INSTANCE_VOXEL_GI = 8,
    INSTANCE_LIGHTMAP = 9,
    INSTANCE_OCCLUDER = 10,
    INSTANCE_VISIBLITY_NOTIFIER = 11,
    INSTANCE_FOG_VOLUME = 12,
    INSTANCE_MAX = 13,
    INSTANCE_GEOMETRY_MASK = 14,
}
#enum InstanceFlags
enum {
    INSTANCE_FLAG_USE_BAKED_LIGHT = 0,
    INSTANCE_FLAG_USE_DYNAMIC_GI = 1,
    INSTANCE_FLAG_DRAW_NEXT_FRAME_IF_VISIBLE = 2,
    INSTANCE_FLAG_IGNORE_OCCLUSION_CULLING = 3,
    INSTANCE_FLAG_MAX = 4,
}
#enum ShadowCastingSetting
enum {
    SHADOW_CASTING_SETTING_OFF = 0,
    SHADOW_CASTING_SETTING_ON = 1,
    SHADOW_CASTING_SETTING_DOUBLE_SIDED = 2,
    SHADOW_CASTING_SETTING_SHADOWS_ONLY = 3,
}
#enum VisibilityRangeFadeMode
enum {
    VISIBILITY_RANGE_FADE_DISABLED = 0,
    VISIBILITY_RANGE_FADE_SELF = 1,
    VISIBILITY_RANGE_FADE_DEPENDENCIES = 2,
}
#enum BakeChannels
enum {
    BAKE_CHANNEL_ALBEDO_ALPHA = 0,
    BAKE_CHANNEL_NORMAL = 1,
    BAKE_CHANNEL_ORM = 2,
    BAKE_CHANNEL_EMISSION = 3,
}
#enum CanvasTextureChannel
enum {
    CANVAS_TEXTURE_CHANNEL_DIFFUSE = 0,
    CANVAS_TEXTURE_CHANNEL_NORMAL = 1,
    CANVAS_TEXTURE_CHANNEL_SPECULAR = 2,
}
#enum NinePatchAxisMode
enum {
    NINE_PATCH_STRETCH = 0,
    NINE_PATCH_TILE = 1,
    NINE_PATCH_TILE_FIT = 2,
}
#enum CanvasItemTextureFilter
enum {
    CANVAS_ITEM_TEXTURE_FILTER_DEFAULT = 0,
    CANVAS_ITEM_TEXTURE_FILTER_NEAREST = 1,
    CANVAS_ITEM_TEXTURE_FILTER_LINEAR = 2,
    CANVAS_ITEM_TEXTURE_FILTER_NEAREST_WITH_MIPMAPS = 3,
    CANVAS_ITEM_TEXTURE_FILTER_LINEAR_WITH_MIPMAPS = 4,
    CANVAS_ITEM_TEXTURE_FILTER_NEAREST_WITH_MIPMAPS_ANISOTROPIC = 5,
    CANVAS_ITEM_TEXTURE_FILTER_LINEAR_WITH_MIPMAPS_ANISOTROPIC = 6,
    CANVAS_ITEM_TEXTURE_FILTER_MAX = 7,
}
#enum CanvasItemTextureRepeat
enum {
    CANVAS_ITEM_TEXTURE_REPEAT_DEFAULT = 0,
    CANVAS_ITEM_TEXTURE_REPEAT_DISABLED = 1,
    CANVAS_ITEM_TEXTURE_REPEAT_ENABLED = 2,
    CANVAS_ITEM_TEXTURE_REPEAT_MIRROR = 3,
    CANVAS_ITEM_TEXTURE_REPEAT_MAX = 4,
}
#enum CanvasGroupMode
enum {
    CANVAS_GROUP_MODE_DISABLED = 0,
    CANVAS_GROUP_MODE_CLIP_ONLY = 1,
    CANVAS_GROUP_MODE_CLIP_AND_DRAW = 2,
    CANVAS_GROUP_MODE_TRANSPARENT = 3,
}
#enum CanvasLightMode
enum {
    CANVAS_LIGHT_MODE_POINT = 0,
    CANVAS_LIGHT_MODE_DIRECTIONAL = 1,
}
#enum CanvasLightBlendMode
enum {
    CANVAS_LIGHT_BLEND_MODE_ADD = 0,
    CANVAS_LIGHT_BLEND_MODE_SUB = 1,
    CANVAS_LIGHT_BLEND_MODE_MIX = 2,
}
#enum CanvasLightShadowFilter
enum {
    CANVAS_LIGHT_FILTER_NONE = 0,
    CANVAS_LIGHT_FILTER_PCF5 = 1,
    CANVAS_LIGHT_FILTER_PCF13 = 2,
    CANVAS_LIGHT_FILTER_MAX = 3,
}
#enum CanvasOccluderPolygonCullMode
enum {
    CANVAS_OCCLUDER_POLYGON_CULL_DISABLED = 0,
    CANVAS_OCCLUDER_POLYGON_CULL_CLOCKWISE = 1,
    CANVAS_OCCLUDER_POLYGON_CULL_COUNTER_CLOCKWISE = 2,
}
#enum GlobalShaderParameterType
enum {
    GLOBAL_VAR_TYPE_BOOL = 0,
    GLOBAL_VAR_TYPE_BVEC2 = 1,
    GLOBAL_VAR_TYPE_BVEC3 = 2,
    GLOBAL_VAR_TYPE_BVEC4 = 3,
    GLOBAL_VAR_TYPE_INT = 4,
    GLOBAL_VAR_TYPE_IVEC2 = 5,
    GLOBAL_VAR_TYPE_IVEC3 = 6,
    GLOBAL_VAR_TYPE_IVEC4 = 7,
    GLOBAL_VAR_TYPE_RECT2I = 8,
    GLOBAL_VAR_TYPE_UINT = 9,
    GLOBAL_VAR_TYPE_UVEC2 = 10,
    GLOBAL_VAR_TYPE_UVEC3 = 11,
    GLOBAL_VAR_TYPE_UVEC4 = 12,
    GLOBAL_VAR_TYPE_FLOAT = 13,
    GLOBAL_VAR_TYPE_VEC2 = 14,
    GLOBAL_VAR_TYPE_VEC3 = 15,
    GLOBAL_VAR_TYPE_VEC4 = 16,
    GLOBAL_VAR_TYPE_COLOR = 17,
    GLOBAL_VAR_TYPE_RECT2 = 18,
    GLOBAL_VAR_TYPE_MAT2 = 19,
    GLOBAL_VAR_TYPE_MAT3 = 20,
    GLOBAL_VAR_TYPE_MAT4 = 21,
    GLOBAL_VAR_TYPE_TRANSFORM_2D = 22,
    GLOBAL_VAR_TYPE_TRANSFORM = 23,
    GLOBAL_VAR_TYPE_SAMPLER2D = 24,
    GLOBAL_VAR_TYPE_SAMPLER2DARRAY = 25,
    GLOBAL_VAR_TYPE_SAMPLER3D = 26,
    GLOBAL_VAR_TYPE_SAMPLERCUBE = 27,
    GLOBAL_VAR_TYPE_MAX = 28,
}
#enum RenderingInfo
enum {
    RENDERING_INFO_TOTAL_OBJECTS_IN_FRAME = 0,
    RENDERING_INFO_TOTAL_PRIMITIVES_IN_FRAME = 1,
    RENDERING_INFO_TOTAL_DRAW_CALLS_IN_FRAME = 2,
    RENDERING_INFO_TEXTURE_MEM_USED = 3,
    RENDERING_INFO_BUFFER_MEM_USED = 4,
    RENDERING_INFO_VIDEO_MEM_USED = 5,
}
#enum Features
enum {
    FEATURE_SHADERS = 0,
    FEATURE_MULTITHREADED = 1,
}
#desc If [code]false[/code], disables rendering completely, but the engine logic is still being processed. You can call [method force_draw] to draw a frame even with rendering disabled.
var render_loop_enabled: bool:
	get = is_render_loop_enabled, set = set_render_loop_enabled



#desc Bakes the material data of the Mesh passed in the [param base] parameter with optional [param material_overrides] to a set of [Image]s of size [param image_size]. Returns an array of [Image]s containing material properties as specified in [enum BakeChannels].
func bake_render_uv2(base: RID, material_overrides: RID[], image_size: Vector2i) -> Array[Image]:
	pass;

#desc Creates a camera attributes object and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all [code]camera_attributes_[/code] RenderingServer functions.
#desc Once finished with your RID, you will want to free the RID using the RenderingServer's [method free_rid] method.
#desc [b]Note:[/b] The equivalent resource is [CameraAttributes].
func camera_attributes_create() -> RID:
	pass;

#desc Sets the parameters to use with the auto-exposure effect. These parameters take on the same meaning as their counterparts in [CameraAttributes] and [CameraAttributesPractical].
func camera_attributes_set_auto_exposure(camera_attributes: RID, enable: bool, min_sensitivity: float, max_sensitivity: float, speed: float, scale: float) -> void:
	pass;

#desc Sets the parameters to use with the DOF blur effect. These parameters take on the same meaning as their counterparts in [CameraAttributesPractical].
func camera_attributes_set_dof_blur(camera_attributes: RID, far_enable: bool, far_distance: float, far_transition: float, near_enable: bool, near_distance: float, near_transition: float, amount: float) -> void:
	pass;

#desc Sets the shape of the DOF bokeh pattern. Different shapes may be used to achieve artistic effect, or to meet performance targets. For more detail on available options see [enum DOFBokehShape].
func camera_attributes_set_dof_blur_bokeh_shape(shape: int) -> void:
	pass;

#desc Sets the quality level of the DOF blur effect to one of the options in [enum DOFBlurQuality]. [param use_jitter] can be used to jitter samples taken during the blur pass to hide artifacts at the cost of looking more fuzzy.
func camera_attributes_set_dof_blur_quality(quality: int, use_jitter: bool) -> void:
	pass;

#desc Sets the exposure values that will be used by the renderers. The normalization amount is used to bake a given Exposure Value (EV) into rendering calculations to reduce the dynamic range of the scene.
#desc The normalization factor can be calculated from exposure value (EV100) as follows:
#desc [codeblock]
#desc func get_exposure_normalization(float ev100):
#desc return 1.0 / (pow(2.0, ev100) * 1.2)
#desc [/codeblock]
#desc The exposure value can be calculated from aperture (in f-stops), shutter speed (in seconds), and sensitivity (in ISO) as follows:
#desc [codeblock]
#desc func get_exposure(float aperture, float shutter_speed, float sensitivity):
#desc return log2((aperture * aperture) / shutterSpeed * (100.0 / sensitivity))
#desc [/codeblock]
func camera_attributes_set_exposure(camera_attributes: RID, multiplier: float, normalization: float) -> void:
	pass;

#desc Creates a 3D camera and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all [code]camera_*[/code] RenderingServer functions.
#desc Once finished with your RID, you will want to free the RID using the RenderingServer's [method free_rid] method.
#desc [b]Note:[/b] The equivalent node is [Camera3D].
func camera_create() -> RID:
	pass;

#desc Sets the camera_attributes created with [method camera_attributes_create] to the given camera.
func camera_set_camera_attributes(camera: RID, effects: RID) -> void:
	pass;

#desc Sets the cull mask associated with this camera. The cull mask describes which 3D layers are rendered by this camera. Equivalent to [member Camera3D.cull_mask].
func camera_set_cull_mask(camera: RID, layers: int) -> void:
	pass;

#desc Sets the environment used by this camera. Equivalent to [member Camera3D.environment].
func camera_set_environment(camera: RID, env: RID) -> void:
	pass;

#desc Sets camera to use frustum projection. This mode allows adjusting the [param offset] argument to create "tilted frustum" effects.
func camera_set_frustum(camera: RID, size: float, offset: Vector2, z_near: float, z_far: float) -> void:
	pass;

#desc Sets camera to use orthogonal projection, also known as orthographic projection. Objects remain the same size on the screen no matter how far away they are.
func camera_set_orthogonal(camera: RID, size: float, z_near: float, z_far: float) -> void:
	pass;

#desc Sets camera to use perspective projection. Objects on the screen becomes smaller when they are far away.
func camera_set_perspective(camera: RID, fovy_degrees: float, z_near: float, z_far: float) -> void:
	pass;

#desc Sets [Transform3D] of camera.
func camera_set_transform(camera: RID, transform: Transform3D) -> void:
	pass;

#desc If [code]true[/code], preserves the horizontal aspect ratio which is equivalent to [constant Camera3D.KEEP_WIDTH]. If [code]false[/code], preserves the vertical aspect ratio which is equivalent to [constant Camera3D.KEEP_HEIGHT].
func camera_set_use_vertical_aspect(camera: RID, enable: bool) -> void:
	pass;

#desc Creates a canvas and returns the assigned [RID]. It can be accessed with the RID that is returned. This RID will be used in all [code]canvas_*[/code] RenderingServer functions.
#desc Once finished with your RID, you will want to free the RID using the RenderingServer's [method free_rid] method.
#desc Canvas has no [Resource] or [Node] equivalent.
func canvas_create() -> RID:
	pass;

#desc Subsequent drawing commands will be ignored unless they fall within the specified animation slice. This is a faster way to implement animations that loop on background rather than redrawing constantly.
func canvas_item_add_animation_slice(item: RID, animation_length: float, slice_begin: float, slice_end: float, offset: float = 0.0) -> void:
	pass;

#desc Draws a circle on the [CanvasItem] pointed to by the [param item] [RID]. See also [method CanvasItem.draw_circle].
func canvas_item_add_circle(item: RID, pos: Vector2, radius: float, color: Color) -> void:
	pass;

#desc If [param ignore] is [code]true[/code], ignore clipping on items drawn with this canvas item until this is called again with [param ignore] set to false.
func canvas_item_add_clip_ignore(item: RID, ignore: bool) -> void:
	pass;

#desc See also [method CanvasItem.draw_lcd_texture_rect_region].
func canvas_item_add_lcd_texture_rect_region(item: RID, rect: Rect2, texture: RID, src_rect: Rect2, modulate: Color) -> void:
	pass;

#desc Draws a line on the [CanvasItem] pointed to by the [param item] [RID]. See also [method CanvasItem.draw_line].
func canvas_item_add_line(item: RID, from: Vector2, to: Vector2, color: Color, width: float = -1.0, antialiased: bool = false) -> void:
	pass;

#desc Draws a mesh created with [method mesh_create] with given [param transform], [param modulate] color, and [param texture]. This is used internally by [MeshInstance2D].
func canvas_item_add_mesh(item: RID, mesh: RID, transform: Transform2D = Transform2D(1, 0, 0, 1, 0, 0), modulate: Color = Color(1, 1, 1, 1), texture: RID) -> void:
	pass;

#desc See also [method CanvasItem.draw_msdf_texture_rect_region].
func canvas_item_add_msdf_texture_rect_region(item: RID, rect: Rect2, texture: RID, src_rect: Rect2, modulate: Color = Color(1, 1, 1, 1), outline_size: int = 0, px_range: float = 1.0, scale: float = 1.0) -> void:
	pass;

#desc Draws a 2D [MultiMesh] on the [CanvasItem] pointed to by the [param item] [RID]. See also [method CanvasItem.draw_multimesh].
func canvas_item_add_multimesh(item: RID, mesh: RID, texture: RID) -> void:
	pass;

#desc Draws a nine-patch rectangle on the [CanvasItem] pointed to by the [param item] [RID].
func canvas_item_add_nine_patch(item: RID, rect: Rect2, source: Rect2, texture: RID, topleft: Vector2, bottomright: Vector2, x_axis_mode: int = 0, y_axis_mode: int = 0, draw_center: bool = true, modulate: Color = Color(1, 1, 1, 1)) -> void:
	pass;

#desc Draws particles on the [CanvasItem] pointed to by the [param item] [RID].
func canvas_item_add_particles(item: RID, particles: RID, texture: RID) -> void:
	pass;

#desc Draws a 2D polygon on the [CanvasItem] pointed to by the [param item] [RID]. If you need more flexibility (such as being able to use bones), use [method canvas_item_add_triangle_array] instead. See also [method CanvasItem.draw_polygon].
func canvas_item_add_polygon(item: RID, points: PackedVector2Array, colors: PackedColorArray, uvs: PackedVector2Array = PackedVector2Array(), texture: RID) -> void:
	pass;

#desc Draws a 2D polyline on the [CanvasItem] pointed to by the [param item] [RID]. See also [method CanvasItem.draw_polyline].
func canvas_item_add_polyline(item: RID, points: PackedVector2Array, colors: PackedColorArray, width: float = -1.0, antialiased: bool = false) -> void:
	pass;

#desc Draws a 2D primitive on the [CanvasItem] pointed to by the [param item] [RID]. See also [method CanvasItem.draw_primitive].
func canvas_item_add_primitive(item: RID, points: PackedVector2Array, colors: PackedColorArray, uvs: PackedVector2Array, texture: RID) -> void:
	pass;

#desc Draws a rectangle on the [CanvasItem] pointed to by the [param item] [RID]. See also [method CanvasItem.draw_rect].
func canvas_item_add_rect(item: RID, rect: Rect2, color: Color) -> void:
	pass;

#desc Sets a [Transform2D] that will be used to transform subsequent canvas item commands.
func canvas_item_add_set_transform(item: RID, transform: Transform2D) -> void:
	pass;

#desc Draws a 2D textured rectangle on the [CanvasItem] pointed to by the [param item] [RID]. See also [method CanvasItem.draw_texture_rect] and [method Texture2D.draw_rect].
func canvas_item_add_texture_rect(item: RID, rect: Rect2, texture: RID, tile: bool = false, modulate: Color = Color(1, 1, 1, 1), transpose: bool = false) -> void:
	pass;

#desc Draws the specified region of a 2D textured rectangle on the [CanvasItem] pointed to by the [param item] [RID]. See also [method CanvasItem.draw_texture_rect_region] and [method Texture2D.draw_rect_region].
func canvas_item_add_texture_rect_region(item: RID, rect: Rect2, texture: RID, src_rect: Rect2, modulate: Color = Color(1, 1, 1, 1), transpose: bool = false, clip_uv: bool = true) -> void:
	pass;

#desc Draws a triangle array on the [CanvasItem] pointed to by the [param item] [RID]. This is internally used by [Line2D] and [StyleBoxFlat] for rendering. [method canvas_item_add_triangle_array] is highly flexible, but more complex to use than [method canvas_item_add_polygon].
#desc [b]Note:[/b] [param count] is unused and can be left unspecified.
func canvas_item_add_triangle_array(item: RID, indices: PackedInt32Array, points: PackedVector2Array, colors: PackedColorArray, uvs: PackedVector2Array = PackedVector2Array(), bones: PackedInt32Array = PackedInt32Array(), weights: PackedFloat32Array = PackedFloat32Array(), texture: RID, count: int = -1) -> void:
	pass;

#desc Clears the [CanvasItem] and removes all commands in it.
func canvas_item_clear(item: RID) -> void:
	pass;

#desc Creates a new CanvasItem instance and returns its [RID]. It can be accessed with the RID that is returned. This RID will be used in all [code]canvas_item_*[/code] RenderingServer functions.
#desc Once finished with your RID, you will want to free the RID using the RenderingServer's [method free_rid] method.
#desc [b]Note:[/b] The equivalent node is [CanvasItem].
func canvas_item_create() -> RID:
	pass;

#desc Sets the canvas group mode used during 2D rendering for the canvas item specified by the [param item] RID. For faster but more limited clipping, use [method canvas_item_set_clip] instead.
#desc [b]Note:[/b] The equivalent node functionality is found in [CanvasGroup] and [member CanvasItem.clip_children].
func canvas_item_set_canvas_group_mode(item: RID, mode: int, clear_margin: float = 5.0, fit_empty: bool = false, fit_margin: float = 0.0, blur_mipmaps: bool = false) -> void:
	pass;

#desc If [param clip] is [code]true[/code], makes the canvas item specified by the [param item] RID not draw anything outside of its rect's coordinates. This clipping is fast, but works only with axis-aligned rectangles. This means that rotation is ignored by the clipping rectangle. For more advanced clipping shapes, use [method canvas_item_set_canvas_group_mode] instead.
#desc [b]Note:[/b] The equivalent node functionality is found in [member Label.clip_text], [RichTextLabel] (always enabled) and more.
func canvas_item_set_clip(item: RID, clip: bool) -> void:
	pass;

#desc Sets the [CanvasItem] to copy a rect to the backbuffer.
func canvas_item_set_copy_to_backbuffer(item: RID, enabled: bool, rect: Rect2) -> void:
	pass;

#desc If [param use_custom_rect] is [code]true[/code], sets the custom visibility rectangle (used for culling) to [param rect] for the canvas item specified by [param item]. Setting a custom visibility rect can reduce CPU load when drawing lots of 2D instances. If [param use_custom_rect] is [code]false[/code], automatically computes a visibility rectangle based on the canvas item's draw commands.
func canvas_item_set_custom_rect(item: RID, use_custom_rect: bool, rect: Rect2 = Rect2(0, 0, 0, 0)) -> void:
	pass;

#desc Sets the default texture filter mode for the canvas item specified by the [param item] RID. Equivalent to [member CanvasItem.texture_filter].
func canvas_item_set_default_texture_filter(item: RID, filter: int) -> void:
	pass;

#desc Sets the default texture repeat mode for the canvas item specified by the [param item] RID. Equivalent to [member CanvasItem.texture_repeat].
func canvas_item_set_default_texture_repeat(item: RID, repeat: int) -> void:
	pass;

#desc If [param enabled] is [code]true[/code], enables multichannel signed distance field rendering mode for the canvas item specified by the [param item] RID. This is meant to be used for font rendering, or with specially generated images using [url=https://github.com/Chlumsky/msdfgen]msdfgen[/url].
func canvas_item_set_distance_field_mode(item: RID, enabled: bool) -> void:
	pass;

#desc If [param enabled] is [code]true[/code], draws the canvas item specified by the [param item] RID behind its parent. Equivalent to [member CanvasItem.show_behind_parent].
func canvas_item_set_draw_behind_parent(item: RID, enabled: bool) -> void:
	pass;

#desc Sets the index for the [CanvasItem].
func canvas_item_set_draw_index(item: RID, index: int) -> void:
	pass;

#desc Sets the light [param mask] for the canvas item specified by the [param item] RID. Equivalent to [member CanvasItem.light_mask].
func canvas_item_set_light_mask(item: RID, mask: int) -> void:
	pass;

#desc Sets a new [param material] to the canvas item specified by the [param item] RID. Equivalent to [member CanvasItem.material].
func canvas_item_set_material(item: RID, material: RID) -> void:
	pass;

#desc Multiplies the color of the canvas item specified by the [param item] RID, while affecting its children. See also [method canvas_item_set_self_modulate]. Equivalent to [member CanvasItem.modulate].
func canvas_item_set_modulate(item: RID, color: Color) -> void:
	pass;

#desc Sets a parent [CanvasItem] to the [CanvasItem]. The item will inherit transform, modulation and visibility from its parent, like [CanvasItem] nodes in the scene tree.
func canvas_item_set_parent(item: RID, parent: RID) -> void:
	pass;

#desc Multiplies the color of the canvas item specified by the [param item] RID, without affecting its children. See also [method canvas_item_set_modulate]. Equivalent to [member CanvasItem.self_modulate].
func canvas_item_set_self_modulate(item: RID, color: Color) -> void:
	pass;

#desc If [param enabled] is [code]true[/code], child nodes with the lowest Y position are drawn before those with a higher Y position. Y-sorting only affects children that inherit from the canvas item specified by the [param item] RID, not the canvas item itself. Equivalent to [member CanvasItem.y_sort_enabled].
func canvas_item_set_sort_children_by_y(item: RID, enabled: bool) -> void:
	pass;

#desc Sets the [param transform] of the canvas item specified by the [param item] RID. This affects where and how the item will be drawn. Child canvas items' transforms are multiplied by their parent's transform. Equivalent to [member Node2D.transform].
func canvas_item_set_transform(item: RID, transform: Transform2D) -> void:
	pass;

#desc Sets if the [CanvasItem] uses its parent's material.
func canvas_item_set_use_parent_material(item: RID, enabled: bool) -> void:
	pass;

#desc Sets the rendering visibility layer associated with this [CanvasItem]. Only [Viewport] nodes with a matching rendering mask will render this [CanvasItem].
func canvas_item_set_visibility_layer(item: RID, visibility_layer: int) -> void:
	pass;

#desc Sets the given [CanvasItem] as visibility notifier. [param area] defines the area of detecting visibility. [param enter_callable] is called when the [CanvasItem] enters the screen, [param exit_callable] is called when the [CanvasItem] exits the screen. If [param enable] is [code]false[/code], the item will no longer function as notifier.
#desc This method can be used to manually mimic [VisibleOnScreenNotifier2D].
func canvas_item_set_visibility_notifier(item: RID, enable: bool, area: Rect2, enter_callable: Callable, exit_callable: Callable) -> void:
	pass;

#desc Sets the visibility of the [CanvasItem].
func canvas_item_set_visible(item: RID, visible: bool) -> void:
	pass;

#desc If this is enabled, the Z index of the parent will be added to the children's Z index.
func canvas_item_set_z_as_relative_to_parent(item: RID, enabled: bool) -> void:
	pass;

#desc Sets the [CanvasItem]'s Z index, i.e. its draw order (lower indexes are drawn first).
func canvas_item_set_z_index(item: RID, z_index: int) -> void:
	pass;

#desc Attaches the canvas light to the canvas. Removes it from its previous canvas.
func canvas_light_attach_to_canvas(light: RID, canvas: RID) -> void:
	pass;

#desc Creates a canvas light and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all [code]canvas_light_*[/code] RenderingServer functions.
#desc Once finished with your RID, you will want to free the RID using the RenderingServer's [method free_rid] method.
#desc [b]Note:[/b] The equivalent node is [Light2D].
func canvas_light_create() -> RID:
	pass;

#desc Attaches a light occluder to the canvas. Removes it from its previous canvas.
func canvas_light_occluder_attach_to_canvas(occluder: RID, canvas: RID) -> void:
	pass;

#desc Creates a light occluder and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all [code]canvas_light_occluder_*[/code] RenderingServer functions.
#desc Once finished with your RID, you will want to free the RID using the RenderingServer's [method free_rid] method.
#desc [b]Note:[/b] The equivalent node is [LightOccluder2D].
func canvas_light_occluder_create() -> RID:
	pass;

func canvas_light_occluder_set_as_sdf_collision(occluder: RID, enable: bool) -> void:
	pass;

#desc Enables or disables light occluder.
func canvas_light_occluder_set_enabled(occluder: RID, enabled: bool) -> void:
	pass;

#desc The light mask. See [LightOccluder2D] for more information on light masks.
func canvas_light_occluder_set_light_mask(occluder: RID, mask: int) -> void:
	pass;

#desc Sets a light occluder's polygon.
func canvas_light_occluder_set_polygon(occluder: RID, polygon: RID) -> void:
	pass;

#desc Sets a light occluder's [Transform2D].
func canvas_light_occluder_set_transform(occluder: RID, transform: Transform2D) -> void:
	pass;

#desc Sets the blend mode for the given canvas light. See [enum CanvasLightBlendMode] for options. Equivalent to [member Light2D.blend_mode].
func canvas_light_set_blend_mode(light: RID, mode: int) -> void:
	pass;

#desc Sets the color for a light.
func canvas_light_set_color(light: RID, color: Color) -> void:
	pass;

#desc Enables or disables a canvas light.
func canvas_light_set_enabled(light: RID, enabled: bool) -> void:
	pass;

#desc Sets a canvas light's energy.
func canvas_light_set_energy(light: RID, energy: float) -> void:
	pass;

#desc Sets a canvas light's height.
func canvas_light_set_height(light: RID, height: float) -> void:
	pass;

#desc The light mask. See [LightOccluder2D] for more information on light masks.
func canvas_light_set_item_cull_mask(light: RID, mask: int) -> void:
	pass;

#desc The binary mask used to determine which layers this canvas light's shadows affects. See [LightOccluder2D] for more information on light masks.
func canvas_light_set_item_shadow_cull_mask(light: RID, mask: int) -> void:
	pass;

#desc The layer range that gets rendered with this light.
func canvas_light_set_layer_range(light: RID, min_layer: int, max_layer: int) -> void:
	pass;

#desc The mode of the light, see [enum CanvasLightMode] constants.
func canvas_light_set_mode(light: RID, mode: int) -> void:
	pass;

#desc Sets the color of the canvas light's shadow.
func canvas_light_set_shadow_color(light: RID, color: Color) -> void:
	pass;

#desc Enables or disables the canvas light's shadow.
func canvas_light_set_shadow_enabled(light: RID, enabled: bool) -> void:
	pass;

#desc Sets the canvas light's shadow's filter, see [enum CanvasLightShadowFilter] constants.
func canvas_light_set_shadow_filter(light: RID, filter: int) -> void:
	pass;

#desc Smoothens the shadow. The lower, the smoother.
func canvas_light_set_shadow_smooth(light: RID, smooth: float) -> void:
	pass;

#desc Sets the texture to be used by a [PointLight2D]. Equivalent to [member PointLight2D.texture].
func canvas_light_set_texture(light: RID, texture: RID) -> void:
	pass;

#desc Sets the offset of a [PointLight2D]'s texture. Equivalent to [member PointLight2D.offset].
func canvas_light_set_texture_offset(light: RID, offset: Vector2) -> void:
	pass;

#desc Sets the scale factor of a [PointLight2D]'s texture. Equivalent to [member PointLight2D.texture_scale].
func canvas_light_set_texture_scale(light: RID, scale: float) -> void:
	pass;

#desc Sets the canvas light's [Transform2D].
func canvas_light_set_transform(light: RID, transform: Transform2D) -> void:
	pass;

#desc Sets the Z range of objects that will be affected by this light. Equivalent to [member Light2D.range_z_min] and [member Light2D.range_z_max].
func canvas_light_set_z_range(light: RID, min_z: int, max_z: int) -> void:
	pass;

#desc Creates a new light occluder polygon and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all [code]canvas_occluder_polygon_*[/code] RenderingServer functions.
#desc Once finished with your RID, you will want to free the RID using the RenderingServer's [method free_rid] method.
#desc [b]Note:[/b] The equivalent resource is [OccluderPolygon2D].
func canvas_occluder_polygon_create() -> RID:
	pass;

#desc Sets an occluder polygons cull mode. See [enum CanvasOccluderPolygonCullMode] constants.
func canvas_occluder_polygon_set_cull_mode(occluder_polygon: RID, mode: int) -> void:
	pass;

#desc Sets the shape of the occluder polygon.
func canvas_occluder_polygon_set_shape(occluder_polygon: RID, shape: PackedVector2Array, closed: bool) -> void:
	pass;

func canvas_set_disable_scale(disable: bool) -> void:
	pass;

#desc A copy of the canvas item will be drawn with a local offset of the mirroring [Vector2].
func canvas_set_item_mirroring(canvas: RID, item: RID, mirroring: Vector2) -> void:
	pass;

#desc Modulates all colors in the given canvas.
func canvas_set_modulate(canvas: RID, color: Color) -> void:
	pass;

#desc Sets the [member ProjectSettings.rendering/2d/shadow_atlas/size] to use for [Light2D] shadow rendering (in pixels). The value is rounded up to the nearest power of 2.
func canvas_set_shadow_texture_size(size: int) -> void:
	pass;

#desc Creates a canvas texture and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all [code]canvas_texture_*[/code] RenderingServer functions.
#desc Once finished with your RID, you will want to free the RID using the RenderingServer's [method free_rid] method. See also [method texture_2d_create].
#desc [b]Note:[/b] The equivalent resource is [CanvasTexture] and is only meant to be used in 2D rendering, not 3D.
func canvas_texture_create() -> RID:
	pass;

#desc Sets the [param channel]'s [param texture] for the canvas texture specified by the [param canvas_texture] RID. Equivalent to [member CanvasTexture.diffuse_texture], [member CanvasTexture.normal_texture] and [member CanvasTexture.specular_texture].
func canvas_texture_set_channel(canvas_texture: RID, channel: int, texture: RID) -> void:
	pass;

#desc Sets the [param base_color] and [param shininess] to use for the canvas texture specified by the [param canvas_texture] RID. Equivalent to [member CanvasTexture.specular_color] and [member CanvasTexture.specular_shininess].
func canvas_texture_set_shading_parameters(canvas_texture: RID, base_color: Color, shininess: float) -> void:
	pass;

#desc Sets the texture [param filter] mode to use for the canvas texture specified by the [param canvas_texture] RID.
func canvas_texture_set_texture_filter(canvas_texture: RID, filter: int) -> void:
	pass;

#desc Sets the texture [param repeat] mode to use for the canvas texture specified by the [param canvas_texture] RID.
func canvas_texture_set_texture_repeat(canvas_texture: RID, repeat: int) -> void:
	pass;

#desc Creates a RenderingDevice that can be used to do draw and compute operations on a separate thread. Cannot draw to the screen nor share data with the global RenderingDevice.
#desc [b]Note:[/b] When using the OpenGL backend or when running in headless mode, this function always returns [code]null[/code].
func create_local_rendering_device() -> RenderingDevice:
	pass;

#desc Creates a decal and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all [code]decal_*[/code] RenderingServer functions.
#desc Once finished with your RID, you will want to free the RID using the RenderingServer's [method free_rid] method.
#desc To place in a scene, attach this decal to an instance using [method instance_set_base] using the returned RID.
#desc [b]Note:[/b] The equivalent node is [Decal].
func decal_create() -> RID:
	pass;

#desc Sets the [param albedo_mix] in the decal specified by the [param decal] RID. Equivalent to [member Decal.albedo_mix].
func decal_set_albedo_mix(decal: RID, albedo_mix: float) -> void:
	pass;

#desc Sets the cull [param mask] in the decal specified by the [param decal] RID. Equivalent to [member Decal.cull_mask].
func decal_set_cull_mask(decal: RID, mask: int) -> void:
	pass;

#desc Sets the distance fade parameters in the decal specified by the [param decal] RID. Equivalent to [member Decal.distance_fade_enabled], [member Decal.distance_fade_begin] and [member Decal.distance_fade_length].
func decal_set_distance_fade(decal: RID, enabled: bool, begin: float, length: float) -> void:
	pass;

#desc Sets the emission [param energy] in the decal specified by the [param decal] RID. Equivalent to [member Decal.emission_energy].
func decal_set_emission_energy(decal: RID, energy: float) -> void:
	pass;

#desc Sets the upper fade ([param above]) and lower fade ([param below]) in the decal specified by the [param decal] RID. Equivalent to [member Decal.upper_fade] and [member Decal.lower_fade].
func decal_set_fade(decal: RID, above: float, below: float) -> void:
	pass;

#desc Sets the color multiplier in the decal specified by the [param decal] RID to [param color]. Equivalent to [member Decal.modulate].
func decal_set_modulate(decal: RID, color: Color) -> void:
	pass;

#desc Sets the normal [param fade] in the decal specified by the [param decal] RID. Equivalent to [member Decal.normal_fade].
func decal_set_normal_fade(decal: RID, fade: float) -> void:
	pass;

#desc Sets the [param size] of the decal specified by the [param decal] RID. Equivalent to [member Decal.size].
func decal_set_size(decal: RID, size: Vector3) -> void:
	pass;

#desc Sets the [param texture] in the given texture [param type] slot for the specified decal. Equivalent to [method Decal.set_texture].
func decal_set_texture(decal: RID, type: int, texture: RID) -> void:
	pass;

#desc Sets the texture [param filter] mode to use when rendering decals. This parameter is global and cannot be set on a per-decal basis.
func decals_set_filter(filter: int) -> void:
	pass;

#desc Creates a directional light and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID can be used in most [code]light_*[/code] RenderingServer functions.
#desc Once finished with your RID, you will want to free the RID using the RenderingServer's [method free_rid] method.
#desc To place in a scene, attach this directional light to an instance using [method instance_set_base] using the returned RID.
#desc [b]Note:[/b] The equivalent node is [DirectionalLight3D].
func directional_light_create() -> RID:
	pass;

#desc Sets the [param size] of the directional light shadows in 3D. See also [member ProjectSettings.rendering/lights_and_shadows/directional_shadow/size]. This parameter is global and cannot be set on a per-viewport basis.
func directional_shadow_atlas_set_size(size: int, is_16bits: bool) -> void:
	pass;

#desc Sets the filter [param quality] for directional light shadows in 3D. See also [member ProjectSettings.rendering/lights_and_shadows/directional_shadow/soft_shadow_filter_quality]. This parameter is global and cannot be set on a per-viewport basis.
func directional_soft_shadow_filter_set_quality(quality: int) -> void:
	pass;

#desc Generates and returns an [Image] containing the radiance map for the specified [param environment] RID's sky. This supports built-in sky material and custom sky shaders. If [param bake_irradiance] is [code]true[/code], the irradiance map is saved instead of the radiance map. The radiance map is used to render reflected light, while the irradiance map is used to render ambient light. See also [method sky_bake_panorama].
#desc [b]Note:[/b] The image is saved in linear color space without any tonemapping performed, which means it will look too dark if viewed directly in an image editor.
#desc [b]Note:[/b] [param size] should be a 2:1 aspect ratio for the generated panorama to have square pixels. For radiance maps, there is no point in using a height greater than [member Sky.radiance_size], as it won't increase detail. Irradiance maps only contain low-frequency data, so there is usually no point in going past a size of 128×64 pixels when saving an irradiance map.
func environment_bake_panorama(environment: RID, bake_irradiance: bool, size: Vector2i) -> Image:
	pass;

#desc Creates an environment and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all [code]environment_*[/code] RenderingServer functions.
#desc Once finished with your RID, you will want to free the RID using the RenderingServer's [method free_rid] method.
#desc [b]Note:[/b] The equivalent resource is [Environment].
func environment_create() -> RID:
	pass;

#desc If [param enable] is [code]true[/code], enables bicubic upscaling for glow which improves quality at the cost of performance. Equivalent to [member ProjectSettings.rendering/environment/glow/upscale_mode].
func environment_glow_set_use_bicubic_upscale(enable: bool) -> void:
	pass;

#desc Sets the values to be used with the "adjustments" post-process effect. See [Environment] for more details.
func environment_set_adjustment(env: RID, enable: bool, brightness: float, contrast: float, saturation: float, use_1d_color_correction: bool, color_correction: RID) -> void:
	pass;

#desc Sets the values to be used for ambient light rendering. See [Environment] for more details.
func environment_set_ambient_light(env: RID, color: Color, ambient: int = 0, energy: float = 1.0, sky_contibution: float = 0.0, reflection_source: int = 0) -> void:
	pass;

#desc Sets the environment's background mode. Equivalent to [member Environment.background_mode].
func environment_set_background(env: RID, bg: int) -> void:
	pass;

#desc Color displayed for clear areas of the scene. Only effective if using the [constant ENV_BG_COLOR] background mode.
func environment_set_bg_color(env: RID, color: Color) -> void:
	pass;

#desc Sets the intensity of the background color.
func environment_set_bg_energy(env: RID, multiplier: float, exposure_value: float) -> void:
	pass;

#desc Sets the maximum layer to use if using Canvas background mode.
func environment_set_canvas_max_layer(env: RID, max_layer: int) -> void:
	pass;

#desc Configures fog for the specified environment RID. See [code]fog_*[/code] properties in [Environment] for more information.
func environment_set_fog(env: RID, enable: bool, light_color: Color, light_energy: float, sun_scatter: float, density: float, height: float, height_density: float, aerial_perspective: float, sky_affect: float) -> void:
	pass;

#desc Configures glow for the specified environment RID. See [code]glow_*[/code] properties in [Environment] for more information.
func environment_set_glow(env: RID, enable: bool, levels: PackedFloat32Array, intensity: float, strength: float, mix: float, bloom_threshold: float, blend_mode: int, hdr_bleed_threshold: float, hdr_bleed_scale: float, hdr_luminance_cap: float, glow_map_strength: float, glow_map: RID) -> void:
	pass;

#desc Configures signed distance field global illumination for the specified environment RID. See [code]sdfgi_*[/code] properties in [Environment] for more information.
func environment_set_sdfgi(env: RID, enable: bool, cascades: int, min_cell_size: float, y_scale: int, use_occlusion: bool, bounce_feedback: float, read_sky: bool, energy: float, normal_bias: float, probe_bias: float) -> void:
	pass;

#desc Sets the number of frames to use for converging signed distance field global illumination. Equivalent to [member ProjectSettings.rendering/global_illumination/sdfgi/frames_to_converge].
func environment_set_sdfgi_frames_to_converge(frames: int) -> void:
	pass;

#desc Sets the update speed for dynamic lights' indirect lighting when computing signed distance field global illumination. Equivalent to [member ProjectSettings.rendering/global_illumination/sdfgi/frames_to_update_lights].
func environment_set_sdfgi_frames_to_update_light(frames: int) -> void:
	pass;

#desc Sets the number of rays to throw per frame when computing signed distance field global illumination. Equivalent to [member ProjectSettings.rendering/global_illumination/sdfgi/probe_ray_count].
func environment_set_sdfgi_ray_count(ray_count: int) -> void:
	pass;

#desc Sets the [Sky] to be used as the environment's background when using [i]BGMode[/i] sky. Equivalent to [member Environment.sky].
func environment_set_sky(env: RID, sky: RID) -> void:
	pass;

#desc Sets a custom field of view for the background [Sky]. Equivalent to [member Environment.sky_custom_fov].
func environment_set_sky_custom_fov(env: RID, scale: float) -> void:
	pass;

#desc Sets the rotation of the background [Sky] expressed as a [Basis]. Equivalent to [member Environment.sky_rotation], where the rotation vector is used to construct the [Basis].
func environment_set_sky_orientation(env: RID, orientation: Basis) -> void:
	pass;

#desc Sets the variables to be used with the screen-space ambient occlusion (SSAO) post-process effect. See [Environment] for more details.
func environment_set_ssao(env: RID, enable: bool, radius: float, intensity: float, power: float, detail: float, horizon: float, sharpness: float, light_affect: float, ao_channel_affect: float) -> void:
	pass;

#desc Sets the quality level of the screen-space ambient occlusion (SSAO) post-process effect. See [Environment] for more details.
func environment_set_ssao_quality(quality: int, half_size: bool, adaptive_target: float, blur_passes: int, fadeout_from: float, fadeout_to: float) -> void:
	pass;

#desc Sets the quality level of the screen-space indirect lighting (SSIL) post-process effect. See [Environment] for more details.
func environment_set_ssil_quality(quality: int, half_size: bool, adaptive_target: float, blur_passes: int, fadeout_from: float, fadeout_to: float) -> void:
	pass;

#desc Sets the variables to be used with the screen-space reflections (SSR) post-process effect. See [Environment] for more details.
func environment_set_ssr(env: RID, enable: bool, max_steps: int, fade_in: float, fade_out: float, depth_tolerance: float) -> void:
	pass;

func environment_set_ssr_roughness_quality(quality: int) -> void:
	pass;

#desc Sets the variables to be used with the "tonemap" post-process effect. See [Environment] for more details.
func environment_set_tonemap(env: RID, tone_mapper: int, exposure: float, white: float) -> void:
	pass;

#desc Sets the variables to be used with the volumetric fog post-process effect. See [Environment] for more details.
func environment_set_volumetric_fog(env: RID, enable: bool, density: float, albedo: Color, emission: Color, emission_energy: float, anisotropy: float, length: float, p_detail_spread: float, gi_inject: float, temporal_reprojection: bool, temporal_reprojection_amount: float, ambient_inject: float, sky_affect: float) -> void:
	pass;

#desc Enables filtering of the volumetric fog scattering buffer. This results in much smoother volumes with very few under-sampling artifacts.
func environment_set_volumetric_fog_filter_active(active: bool) -> void:
	pass;

#desc Sets the resolution of the volumetric fog's froxel buffer. [param size] is modified by the screen's aspect ratio and then used to set the width and height of the buffer. While [param depth] is directly used to set the depth of the buffer.
func environment_set_volumetric_fog_volume_size(size: int, depth: int) -> void:
	pass;

#desc Creates a new fog volume and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all [code]fog_volume_*[/code] RenderingServer functions.
#desc Once finished with your RID, you will want to free the RID using the RenderingServer's [method free_rid] method.
#desc [b]Note:[/b] The equivalent node is [FogVolume].
func fog_volume_create() -> RID:
	pass;

#desc Sets the [Material] of the fog volume. Can be either a [FogMaterial] or a custom [ShaderMaterial].
func fog_volume_set_material(fog_volume: RID, material: RID) -> void:
	pass;

#desc Sets the shape of the fog volume to either [constant RenderingServer.FOG_VOLUME_SHAPE_ELLIPSOID], [constant RenderingServer.FOG_VOLUME_SHAPE_CONE], [constant RenderingServer.FOG_VOLUME_SHAPE_CYLINDER], [constant RenderingServer.FOG_VOLUME_SHAPE_BOX] or [constant RenderingServer.FOG_VOLUME_SHAPE_WORLD].
func fog_volume_set_shape(fog_volume: RID, shape: int) -> void:
	pass;

#desc Sets the size of the fog volume when shape is [constant RenderingServer.FOG_VOLUME_SHAPE_ELLIPSOID], [constant RenderingServer.FOG_VOLUME_SHAPE_CONE], [constant RenderingServer.FOG_VOLUME_SHAPE_CYLINDER] or [constant RenderingServer.FOG_VOLUME_SHAPE_BOX].
func fog_volume_set_size(fog_volume: RID, size: Vector3) -> void:
	pass;

#desc Forces redrawing of all viewports at once.
func force_draw(swap_buffers: bool = true, frame_step: float = 0.0) -> void:
	pass;

#desc Forces a synchronization between the CPU and GPU, which may be required in certain cases. Only call this when needed, as CPU-GPU synchronization has a performance cost.
func force_sync() -> void:
	pass;

#desc Tries to free an object in the RenderingServer. To avoid memory leaks, this should be called after using an object as memory management does not occur automatically when using RendeeringServer directly.
func free_rid(rid: RID) -> void:
	pass;

#desc Returns the default clear color which is used when a specific clear color has not been selected. See also [method set_default_clear_color].
func get_default_clear_color() -> Color:
	pass;

#desc Returns the time taken to setup rendering on the CPU in milliseconds. This value is shared across all viewports and does [i]not[/i] require [method viewport_set_measure_render_time] to be enabled on a viewport to be queried. See also [method viewport_get_measured_render_time_cpu].
func get_frame_setup_time_cpu() -> float:
	pass;

#desc Returns the global RenderingDevice.
#desc [b]Note:[/b] When using the OpenGL backend or when running in headless mode, this function always returns [code]null[/code].
func get_rendering_device() -> RenderingDevice:
	pass;

#desc Returns a statistic about the rendering engine which can be used for performance profiling. See [enum RenderingServer.RenderingInfo] for a list of values that can be queried. See also [method viewport_get_render_info], which returns information specific to a viewport.
#desc [b]Note:[/b] Only 3D rendering is currently taken into account by some of these values, such as the number of draw calls.
#desc [b]Note:[/b] Rendering information is not available until at least 2 frames have been rendered by the engine. If rendering information is not available, [method get_rendering_info] returns [code]0[/code]. To print rendering information in [code]_ready()[/code] successfully, use the following:
#desc [codeblock]
#desc func _ready():
#desc for _i in 2:
#desc await get_tree().process_frame
#desc 
#desc print(RenderingServer.get_rendering_info(RENDERING_INFO_TOTAL_DRAW_CALLS_IN_FRAME))
#desc [/codeblock]
func get_rendering_info(info: int) -> int:
	pass;

#desc Returns the parameters of a shader.
func get_shader_parameter_list(shader: RID) -> Array[Dictionary]:
	pass;

#desc Returns the RID of the test cube. This mesh will be created and returned on the first call to [method get_test_cube], then it will be cached for subsequent calls. See also [method make_sphere_mesh].
func get_test_cube() -> RID:
	pass;

#desc Returns the RID of a 256×256 texture with a testing pattern on it (in [constant Image.FORMAT_RGB8] format). This texture will be created and returned on the first call to [method get_test_texture], then it will be cached for subsequent calls. See also [method get_white_texture].
#desc Example of getting the test texture and applying it to a [Sprite2D] node:
#desc [codeblock]
#desc var texture_rid = RenderingServer.get_test_texture()
#desc var texture = ImageTexture.create_from_image(RenderingServer.texture_2d_get(texture_rid))
#desc $Sprite2D.texture = texture
#desc [/codeblock]
func get_test_texture() -> RID:
	pass;

#desc Returns the version of the graphics video adapter [i]currently in use[/i] (e.g. "1.2.189" for Vulkan, "3.3.0 NVIDIA 510.60.02" for OpenGL). This version may be different from the actual latest version supported by the hardware, as Godot may not always request the latest version. See also [method OS.get_video_adapter_driver_info].
#desc [b]Note:[/b] When running a headless or server binary, this function returns an empty string.
func get_video_adapter_api_version() -> String:
	pass;

#desc Returns the name of the video adapter (e.g. "GeForce GTX 1080/PCIe/SSE2").
#desc [b]Note:[/b] When running a headless or server binary, this function returns an empty string.
func get_video_adapter_name() -> String:
	pass;

#desc Returns the type of the video adapter. Since dedicated graphics cards from a given generation will [i]usually[/i] be significantly faster than integrated graphics made in the same generation, the device type can be used as a basis for automatic graphics settings adjustment. However, this is not always true, so make sure to provide users with a way to manually override graphics settings.
#desc [b]Note:[/b] When using the OpenGL backend or when running in headless mode, this function always returns [constant RenderingDevice.DEVICE_TYPE_OTHER].
func get_video_adapter_type() -> int:
	pass;

#desc Returns the vendor of the video adapter (e.g. "NVIDIA Corporation").
#desc [b]Note:[/b] When running a headless or server binary, this function returns an empty string.
func get_video_adapter_vendor() -> String:
	pass;

#desc Returns the ID of a 4×4 white texture (in [constant Image.FORMAT_RGB8] format). This texture will be created and returned on the first call to [method get_white_texture], then it will be cached for subsequent calls. See also [method get_test_texture].
#desc Example of getting the white texture and applying it to a [Sprite2D] node:
#desc [codeblock]
#desc var texture_rid = RenderingServer.get_white_texture()
#desc var texture = ImageTexture.create_from_image(RenderingServer.texture_2d_get(texture_rid))
#desc $Sprite2D.texture = texture
#desc [/codeblock]
func get_white_texture() -> RID:
	pass;

#desc If [param half_resolution] is [code]true[/code], renders [VoxelGI] and SDFGI ([member Environment.sdfgi_enabled]) buffers at halved resolution on each axis (e.g. 960×540 when the viewport size is 1920×1080). This improves performance significantly when VoxelGI or SDFGI is enabled, at the cost of artifacts that may be visible on polygon edges. The loss in quality becomes less noticeable as the viewport resolution increases. [LightmapGI] rendering is not affected by this setting. Equivalent to [member ProjectSettings.rendering/global_illumination/gi/use_half_resolution].
func gi_set_use_half_resolution(half_resolution: bool) -> void:
	pass;

#desc Creates a new global shader uniform.
#desc [b]Note:[/b] Global shader parameter names are case-sensitive.
func global_shader_parameter_add(name: StringName, type: int, default_value: Variant) -> void:
	pass;

#desc Returns the value of the global shader uniform specified by [param name].
#desc [b]Note:[/b] [method global_shader_parameter_get] has a large performance penalty as the rendering thread needs to synchronize with the calling thread, which is slow. Do not use this method during gameplay to avoid stuttering. If you need to read values in a script after setting them, consider creating an autoload where you store the values you need to query at the same time you're setting them as global parameters.
func global_shader_parameter_get(name: StringName) -> Variant:
	pass;

#desc Returns the list of global shader uniform names.
#desc [b]Note:[/b] [method global_shader_parameter_get] has a large performance penalty as the rendering thread needs to synchronize with the calling thread, which is slow. Do not use this method during gameplay to avoid stuttering. If you need to read values in a script after setting them, consider creating an autoload where you store the values you need to query at the same time you're setting them as global parameters.
func global_shader_parameter_get_list() -> PackedStringArray:
	pass;

#desc Returns the type associated to the global shader uniform specified by [param name].
#desc [b]Note:[/b] [method global_shader_parameter_get] has a large performance penalty as the rendering thread needs to synchronize with the calling thread, which is slow. Do not use this method during gameplay to avoid stuttering. If you need to read values in a script after setting them, consider creating an autoload where you store the values you need to query at the same time you're setting them as global parameters.
func global_shader_parameter_get_type(name: StringName) -> int:
	pass;

#desc Removes the global shader uniform specified by [param name].
func global_shader_parameter_remove(name: StringName) -> void:
	pass;

#desc Sets the global shader uniform [param name] to [param value].
func global_shader_parameter_set(name: StringName, value: Variant) -> void:
	pass;

#desc Overrides the global shader uniform [param name] with [param value]. Equivalent to the [ShaderGlobalsOverride] node.
func global_shader_parameter_set_override(name: StringName, value: Variant) -> void:
	pass;

#desc Returns [code]true[/code] if changes have been made to the RenderingServer's data. [method force_draw] is usually called if this happens.
func has_changed() -> bool:
	pass;

#desc Not yet implemented. Always returns [code]false[/code].
func has_feature(feature: int) -> bool:
	pass;

#desc Returns [code]true[/code] if the OS supports a certain [param feature]. Features might be [code]s3tc[/code], [code]etc[/code], and [code]etc2[/code].
func has_os_feature(feature: String) -> bool:
	pass;

#desc Attaches a unique Object ID to instance. Object ID must be attached to instance for proper culling with [method instances_cull_aabb], [method instances_cull_convex], and [method instances_cull_ray].
func instance_attach_object_instance_id(instance: RID, id: int) -> void:
	pass;

#desc Attaches a skeleton to an instance. Removes the previous skeleton from the instance.
func instance_attach_skeleton(instance: RID, skeleton: RID) -> void:
	pass;

#desc Creates a visual instance and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all [code]instance_*[/code] RenderingServer functions.
#desc Once finished with your RID, you will want to free the RID using the RenderingServer's [method free_rid] method.
#desc An instance is a way of placing a 3D object in the scenario. Objects like particles, meshes, reflection probes and decals need to be associated with an instance to be visible in the scenario using [method instance_set_base].
#desc [b]Note:[/b] The equivalent node is [VisualInstance3D].
func instance_create() -> RID:
	pass;

#desc Creates a visual instance, adds it to the RenderingServer, and sets both base and scenario. It can be accessed with the RID that is returned. This RID will be used in all [code]instance_*[/code] RenderingServer functions.
#desc Once finished with your RID, you will want to free the RID using the RenderingServer's [method free_rid] method. This is a shorthand for using [method instance_create] and setting the base and scenario manually.
func instance_create2(base: RID, scenario: RID) -> RID:
	pass;

#desc Returns the value of the per-instance shader uniform from the specified 3D geometry instance. Equivalent to [method GeometryInstance3D.get_instance_shader_parameter].
#desc [b]Note:[/b] Per-instance shader parameter names are case-sensitive.
func instance_geometry_get_shader_parameter(instance: RID, parameter: StringName) -> Variant:
	pass;

#desc Returns the default value of the per-instance shader uniform from the specified 3D geometry instance. Equivalent to [method GeometryInstance3D.get_instance_shader_parameter].
func instance_geometry_get_shader_parameter_default_value(instance: RID, parameter: StringName) -> Variant:
	pass;

#desc Returns a dictionary of per-instance shader uniform names of the per-instance shader uniform from the specified 3D geometry instance. The returned dictionary is in PropertyInfo format, with the keys [code]name[/code], [code]class_name[/code], [code]type[/code], [code]hint[/code], [code]hint_string[/code] and [code]usage[/code]. Equivalent to [method GeometryInstance3D.get_instance_shader_parameter].
func instance_geometry_get_shader_parameter_list(instance: RID) -> Array[Dictionary]:
	pass;

#desc Sets the shadow casting setting to one of [enum ShadowCastingSetting]. Equivalent to [member GeometryInstance3D.cast_shadow].
func instance_geometry_set_cast_shadows_setting(instance: RID, shadow_casting_setting: int) -> void:
	pass;

#desc Sets the flag for a given [enum InstanceFlags]. See [enum InstanceFlags] for more details.
func instance_geometry_set_flag(instance: RID, flag: int, enabled: bool) -> void:
	pass;

#desc Sets the lightmap GI instance to use for the specified 3D geometry instance. The lightmap UV scale for the specified instance (equivalent to [member GeometryInstance3D.gi_lightmap_scale]) and lightmap atlas slice must also be specified.
func instance_geometry_set_lightmap(instance: RID, lightmap: RID, lightmap_uv_scale: Rect2, lightmap_slice: int) -> void:
	pass;

#desc Sets the level of detail bias to use when rendering the specified 3D geometry instance. Higher values result in higher detail from further away. Equivalent to [member GeometryInstance3D.lod_bias].
func instance_geometry_set_lod_bias(instance: RID, lod_bias: float) -> void:
	pass;

#desc Sets a material that will be rendered for all surfaces on top of active materials for the mesh associated with this instance. Equivalent to [member GeometryInstance3D.material_overlay].
func instance_geometry_set_material_overlay(instance: RID, material: RID) -> void:
	pass;

#desc Sets a material that will override the material for all surfaces on the mesh associated with this instance. Equivalent to [member GeometryInstance3D.material_override].
func instance_geometry_set_material_override(instance: RID, material: RID) -> void:
	pass;

#desc Sets the per-instance shader uniform on the specified 3D geometry instance. Equivalent to [method GeometryInstance3D.set_instance_shader_parameter].
func instance_geometry_set_shader_parameter(instance: RID, parameter: StringName, value: Variant) -> void:
	pass;

#desc Sets the transparency for the given geometry instance. Equivalent to [member GeometryInstance3D.transparency].
#desc A transparency of [code]0.0[/code] is fully opaque, while [code]1.0[/code] is fully transparent. Values greater than [code]0.0[/code] (exclusive) will force the geometry's materials to go through the transparent pipeline, which is slower to render and can exhibit rendering issues due to incorrect transparency sorting. However, unlike using a transparent material, setting [param transparency] to a value greater than [code]0.0[/code] (exclusive) will [i]not[/i] disable shadow rendering.
#desc In spatial shaders, [code]1.0 - transparency[/code] is set as the default value of the [code]ALPHA[/code] built-in.
#desc [b]Note:[/b] [param transparency] is clamped between [code]0.0[/code] and [code]1.0[/code], so this property cannot be used to make transparent materials more opaque than they originally are.
func instance_geometry_set_transparency(instance: RID, transparency: float) -> void:
	pass;

#desc Sets the visibility range values for the given geometry instance. Equivalent to [member GeometryInstance3D.visibility_range_begin] and related properties.
func instance_geometry_set_visibility_range(instance: RID, min: float, max: float, min_margin: float, max_margin: float, fade_mode: int) -> void:
	pass;

#desc Sets the base of the instance. A base can be any of the 3D objects that are created in the RenderingServer that can be displayed. For example, any of the light types, mesh, multimesh, particle system, reflection probe, decal, lightmap, voxel GI and visibility notifiers are all types that can be set as the base of an instance in order to be displayed in the scenario.
func instance_set_base(instance: RID, base: RID) -> void:
	pass;

#desc Sets the weight for a given blend shape associated with this instance.
func instance_set_blend_shape_weight(instance: RID, shape: int, weight: float) -> void:
	pass;

#desc Sets a custom AABB to use when culling objects from the view frustum. Equivalent to setting [member GeometryInstance3D.custom_aabb].
func instance_set_custom_aabb(instance: RID, aabb: AABB) -> void:
	pass;

#desc Sets a margin to increase the size of the AABB when culling objects from the view frustum. This allows you to avoid culling objects that fall outside the view frustum. Equivalent to [member GeometryInstance3D.extra_cull_margin].
func instance_set_extra_visibility_margin(instance: RID, margin: float) -> void:
	pass;

#desc If [code]true[/code], ignores both frustum and occlusion culling on the specified 3D geometry instance. This is not the same as [member GeometryInstance3D.ignore_occlusion_culling], which only ignores occlusion culling and leaves frustum culling intact.
func instance_set_ignore_culling(instance: RID, enabled: bool) -> void:
	pass;

#desc Sets the render layers that this instance will be drawn to. Equivalent to [member VisualInstance3D.layers].
func instance_set_layer_mask(instance: RID, mask: int) -> void:
	pass;

#desc Sets the sorting offset and switches between using the bounding box or instance origin for depth sorting.
func instance_set_pivot_data(instance: RID, sorting_offset: float, use_aabb_center: bool) -> void:
	pass;

#desc Sets the scenario that the instance is in. The scenario is the 3D world that the objects will be displayed in.
func instance_set_scenario(instance: RID, scenario: RID) -> void:
	pass;

#desc Sets the override material of a specific surface. Equivalent to [method MeshInstance3D.set_surface_override_material].
func instance_set_surface_override_material(instance: RID, surface: int, material: RID) -> void:
	pass;

#desc Sets the world space transform of the instance. Equivalent to [member Node3D.transform].
func instance_set_transform(instance: RID, transform: Transform3D) -> void:
	pass;

#desc Sets the visibility parent for the given instance. Equivalent to [member Node3D.visibility_parent].
func instance_set_visibility_parent(instance: RID, parent: RID) -> void:
	pass;

#desc Sets whether an instance is drawn or not. Equivalent to [member Node3D.visible].
func instance_set_visible(instance: RID, visible: bool) -> void:
	pass;

#desc Returns an array of object IDs intersecting with the provided AABB. Only 3D nodes that inherit from [VisualInstance3D] are considered, such as [MeshInstance3D] or [DirectionalLight3D]. Use [method @GlobalScope.instance_from_id] to obtain the actual nodes. A scenario RID must be provided, which is available in the [World3D] you want to query. This forces an update for all resources queued to update.
#desc [b]Warning:[/b] This function is primarily intended for editor usage. For in-game use cases, prefer physics collision.
func instances_cull_aabb(aabb: AABB, scenario: RID) -> PackedInt64Array:
	pass;

#desc Returns an array of object IDs intersecting with the provided convex shape. Only 3D nodes that inherit from [VisualInstance3D] are considered, such as [MeshInstance3D] or [DirectionalLight3D]. Use [method @GlobalScope.instance_from_id] to obtain the actual nodes. A scenario RID must be provided, which is available in the [World3D] you want to query. This forces an update for all resources queued to update.
#desc [b]Warning:[/b] This function is primarily intended for editor usage. For in-game use cases, prefer physics collision.
func instances_cull_convex(convex: Plane[], scenario: RID) -> PackedInt64Array:
	pass;

#desc Returns an array of object IDs intersecting with the provided 3D ray. Only 3D nodes that inherit from [VisualInstance3D] are considered, such as [MeshInstance3D] or [DirectionalLight3D]. Use [method @GlobalScope.instance_from_id] to obtain the actual nodes. A scenario RID must be provided, which is available in the [World3D] you want to query. This forces an update for all resources queued to update.
#desc [b]Warning:[/b] This function is primarily intended for editor usage. For in-game use cases, prefer physics collision.
func instances_cull_ray(from: Vector3, to: Vector3, scenario: RID) -> PackedInt64Array:
	pass;

#desc If [code]true[/code], this directional light will blend between shadow map splits resulting in a smoother transition between them. Equivalent to [member DirectionalLight3D.directional_shadow_blend_splits].
func light_directional_set_blend_splits(light: RID, enable: bool) -> void:
	pass;

#desc Sets the shadow mode for this directional light. Equivalent to [member DirectionalLight3D.directional_shadow_mode]. See [enum LightDirectionalShadowMode] for options.
func light_directional_set_shadow_mode(light: RID, mode: int) -> void:
	pass;

#desc If [code]true[/code], this light will not be used for anything except sky shaders. Use this for lights that impact your sky shader that you may want to hide from affecting the rest of the scene. For example, you may want to enable this when the sun in your sky shader falls below the horizon.
func light_directional_set_sky_mode(light: RID, mode: int) -> void:
	pass;

#desc Sets whether to use a dual paraboloid or a cubemap for the shadow map. Dual paraboloid is faster but may suffer from artifacts. Equivalent to [member OmniLight3D.omni_shadow_mode].
func light_omni_set_shadow_mode(light: RID, mode: int) -> void:
	pass;

#desc Sets the texture filter mode to use when rendering light projectors. This parameter is global and cannot be set on a per-light basis.
func light_projectors_set_filter(filter: int) -> void:
	pass;

#desc Sets the bake mode to use for the specified 3D light. Equivalent to [member Light3D.light_bake_mode].
func light_set_bake_mode(light: RID, bake_mode: int) -> void:
	pass;

#desc Sets the color of the light. Equivalent to [member Light3D.light_color].
func light_set_color(light: RID, color: Color) -> void:
	pass;

#desc Sets the cull mask for this 3D light. Lights only affect objects in the selected layers. Equivalent to [member Light3D.light_cull_mask].
func light_set_cull_mask(light: RID, mask: int) -> void:
	pass;

#desc Sets the distance fade for this 3D light. This acts as a form of level of detail (LOD) and can be used to improve performance. Equivalent to [member Light3D.distance_fade_enabled], [member Light3D.distance_fade_begin], [member Light3D.distance_fade_shadow], and [member Light3D.distance_fade_length].
func light_set_distance_fade(decal: RID, enabled: bool, begin: float, shadow: float, length: float) -> void:
	pass;

#desc Sets the maximum SDFGI cascade in which the 3D light's indirect lighting is rendered. Higher values allow the light to be rendered in SDFGI further away from the camera.
func light_set_max_sdfgi_cascade(light: RID, cascade: int) -> void:
	pass;

#desc If [code]true[/code], the 3D light will subtract light instead of adding light. Equivalent to [member Light3D.light_negative].
func light_set_negative(light: RID, enable: bool) -> void:
	pass;

#desc Sets the specified 3D light parameter. See [enum LightParam] for options. Equivalent to [method Light3D.set_param].
func light_set_param(light: RID, param: int, value: float) -> void:
	pass;

#desc Sets the projector texture to use for the specified 3D light. Equivalent to [member Light3D.light_projector].
func light_set_projector(light: RID, texture: RID) -> void:
	pass;

#desc If [code]true[/code], reverses the backface culling of the mesh. This can be useful when you have a flat mesh that has a light behind it. If you need to cast a shadow on both sides of the mesh, set the mesh to use double-sided shadows with [method instance_geometry_set_cast_shadows_setting]. Equivalent to [member Light3D.shadow_reverse_cull_face].
func light_set_reverse_cull_face_mode(light: RID, enabled: bool) -> void:
	pass;

#desc If [code]true[/code], light will cast shadows. Equivalent to [member Light3D.shadow_enabled].
func light_set_shadow(light: RID, enabled: bool) -> void:
	pass;

#desc Creates a new lightmap global illumination instance and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all [code]lightmap_*[/code] RenderingServer functions.
#desc Once finished with your RID, you will want to free the RID using the RenderingServer's [method free_rid] method.
#desc [b]Note:[/b] The equivalent node is [LightmapGI].
func lightmap_create() -> RID:
	pass;

func lightmap_get_probe_capture_bsp_tree(lightmap: RID) -> PackedInt32Array:
	pass;

func lightmap_get_probe_capture_points(lightmap: RID) -> PackedVector3Array:
	pass;

func lightmap_get_probe_capture_sh(lightmap: RID) -> PackedColorArray:
	pass;

func lightmap_get_probe_capture_tetrahedra(lightmap: RID) -> PackedInt32Array:
	pass;

#desc Used to inform the renderer what exposure normalization value was used while baking the lightmap. This value will be used and modulated at run time to ensure that the lightmap maintains a consistent level of exposure even if the scene-wide exposure normalization is changed at run time. For more information see [method camera_attributes_set_exposure].
func lightmap_set_baked_exposure_normalization(lightmap: RID, baked_exposure: float) -> void:
	pass;

func lightmap_set_probe_bounds(lightmap: RID, bounds: AABB) -> void:
	pass;

func lightmap_set_probe_capture_data(lightmap: RID, points: PackedVector3Array, point_sh: PackedColorArray, tetrahedra: PackedInt32Array, bsp_tree: PackedInt32Array) -> void:
	pass;

func lightmap_set_probe_capture_update_speed(speed: float) -> void:
	pass;

func lightmap_set_probe_interior(lightmap: RID, interior: bool) -> void:
	pass;

#desc Set the textures on the given [param lightmap] GI instance to the texture array pointed to by the [param light] RID. If the lightmap texture was baked with [member LightmapGI.directional] set to [code]true[/code], then [param uses_sh] must also be [code]true[/code].
func lightmap_set_textures(lightmap: RID, light: RID, uses_sh: bool) -> void:
	pass;

#desc Returns a mesh of a sphere with the given number of horizontal subdivisions, vertical subdivisions and radius. See also [method get_test_cube].
func make_sphere_mesh(latitudes: int, longitudes: int, radius: float) -> RID:
	pass;

#desc Creates an empty material and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all [code]material_*[/code] RenderingServer functions.
#desc Once finished with your RID, you will want to free the RID using the RenderingServer's [method free_rid] method.
#desc [b]Note:[/b] The equivalent resource is [Material].
func material_create() -> RID:
	pass;

#desc Returns the value of a certain material's parameter.
func material_get_param(material: RID, parameter: StringName) -> Variant:
	pass;

#desc Sets an object's next material.
func material_set_next_pass(material: RID, next_material: RID) -> void:
	pass;

#desc Sets a material's parameter.
func material_set_param(material: RID, parameter: StringName, value: Variant) -> void:
	pass;

#desc Sets a material's render priority.
func material_set_render_priority(material: RID, priority: int) -> void:
	pass;

#desc Sets a shader material's shader.
func material_set_shader(shader_material: RID, shader: RID) -> void:
	pass;

func mesh_add_surface(mesh: RID, surface: Dictionary) -> void:
	pass;

func mesh_add_surface_from_arrays(mesh: RID, primitive: int, arrays: Array, blend_shapes: Array = [], lods: Dictionary = {}, compress_format: int = 0) -> void:
	pass;

#desc Removes all surfaces from a mesh.
func mesh_clear(mesh: RID) -> void:
	pass;

#desc Creates a new mesh and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all [code]mesh_*[/code] RenderingServer functions.
#desc Once finished with your RID, you will want to free the RID using the RenderingServer's [method free_rid] method.
#desc To place in a scene, attach this mesh to an instance using [method instance_set_base] using the returned RID.
#desc [b]Note:[/b] The equivalent resource is [Mesh].
func mesh_create() -> RID:
	pass;

func mesh_create_from_surfaces(surfaces: Dictionary[], blend_shape_count: int = 0) -> RID:
	pass;

#desc Returns a mesh's blend shape count.
func mesh_get_blend_shape_count(mesh: RID) -> int:
	pass;

#desc Returns a mesh's blend shape mode.
func mesh_get_blend_shape_mode(mesh: RID) -> int:
	pass;

#desc Returns a mesh's custom aabb.
func mesh_get_custom_aabb(mesh: RID) -> AABB:
	pass;

func mesh_get_surface(mesh: RID, surface: int) -> Dictionary:
	pass;

#desc Returns a mesh's number of surfaces.
func mesh_get_surface_count(mesh: RID) -> int:
	pass;

#desc Sets a mesh's blend shape mode.
func mesh_set_blend_shape_mode(mesh: RID, mode: int) -> void:
	pass;

#desc Sets a mesh's custom aabb.
func mesh_set_custom_aabb(mesh: RID, aabb: AABB) -> void:
	pass;

func mesh_set_shadow_mesh(mesh: RID, shadow_mesh: RID) -> void:
	pass;

#desc Returns a mesh's surface's buffer arrays.
func mesh_surface_get_arrays(mesh: RID, surface: int) -> Array:
	pass;

#desc Returns a mesh's surface's arrays for blend shapes.
func mesh_surface_get_blend_shape_arrays(mesh: RID, surface: int) -> Array[Array]:
	pass;

func mesh_surface_get_format_attribute_stride(format: int, vertex_count: int) -> int:
	pass;

func mesh_surface_get_format_offset(format: int, vertex_count: int, array_index: int) -> int:
	pass;

func mesh_surface_get_format_skin_stride(format: int, vertex_count: int) -> int:
	pass;

func mesh_surface_get_format_vertex_stride(format: int, vertex_count: int) -> int:
	pass;

#desc Returns a mesh's surface's material.
func mesh_surface_get_material(mesh: RID, surface: int) -> RID:
	pass;

#desc Sets a mesh's surface's material.
func mesh_surface_set_material(mesh: RID, surface: int, material: RID) -> void:
	pass;

func mesh_surface_update_attribute_region(mesh: RID, surface: int, offset: int, data: PackedByteArray) -> void:
	pass;

func mesh_surface_update_skin_region(mesh: RID, surface: int, offset: int, data: PackedByteArray) -> void:
	pass;

func mesh_surface_update_vertex_region(mesh: RID, surface: int, offset: int, data: PackedByteArray) -> void:
	pass;

func multimesh_allocate_data(multimesh: RID, instances: int, transform_format: int, color_format: bool = false, custom_data_format: bool = false) -> void:
	pass;

#desc Creates a new multimesh on the RenderingServer and returns an [RID] handle. This RID will be used in all [code]multimesh_*[/code] RenderingServer functions.
#desc Once finished with your RID, you will want to free the RID using the RenderingServer's [method free_rid] method.
#desc To place in a scene, attach this multimesh to an instance using [method instance_set_base] using the returned RID.
#desc [b]Note:[/b] The equivalent resource is [MultiMesh].
func multimesh_create() -> RID:
	pass;

#desc Calculates and returns the axis-aligned bounding box that encloses all instances within the multimesh.
func multimesh_get_aabb(multimesh: RID) -> AABB:
	pass;

#desc Returns the MultiMesh data (such as instance transforms, colors, etc). See [method multimesh_set_buffer] for a description of the returned data.
#desc [b]Note:[/b] If the buffer is in the engine's internal cache, it will have to be fetched from GPU memory and possibly decompressed. This means [method multimesh_get_buffer] is potentially a slow operation and should be avoided whenever possible.
func multimesh_get_buffer(multimesh: RID) -> PackedFloat32Array:
	pass;

#desc Returns the number of instances allocated for this multimesh.
func multimesh_get_instance_count(multimesh: RID) -> int:
	pass;

#desc Returns the RID of the mesh that will be used in drawing this multimesh.
func multimesh_get_mesh(multimesh: RID) -> RID:
	pass;

#desc Returns the number of visible instances for this multimesh.
func multimesh_get_visible_instances(multimesh: RID) -> int:
	pass;

#desc Returns the color by which the specified instance will be modulated.
func multimesh_instance_get_color(multimesh: RID, index: int) -> Color:
	pass;

#desc Returns the custom data associated with the specified instance.
func multimesh_instance_get_custom_data(multimesh: RID, index: int) -> Color:
	pass;

#desc Returns the [Transform3D] of the specified instance.
func multimesh_instance_get_transform(multimesh: RID, index: int) -> Transform3D:
	pass;

#desc Returns the [Transform2D] of the specified instance. For use when the multimesh is set to use 2D transforms.
func multimesh_instance_get_transform_2d(multimesh: RID, index: int) -> Transform2D:
	pass;

#desc Sets the color by which this instance will be modulated. Equivalent to [method MultiMesh.set_instance_color].
func multimesh_instance_set_color(multimesh: RID, index: int, color: Color) -> void:
	pass;

#desc Sets the custom data for this instance. Custom data is passed as a [Color], but is interpreted as a [code]vec4[/code] in the shader. Equivalent to [method MultiMesh.set_instance_custom_data].
func multimesh_instance_set_custom_data(multimesh: RID, index: int, custom_data: Color) -> void:
	pass;

#desc Sets the [Transform3D] for this instance. Equivalent to [method MultiMesh.set_instance_transform].
func multimesh_instance_set_transform(multimesh: RID, index: int, transform: Transform3D) -> void:
	pass;

#desc Sets the [Transform2D] for this instance. For use when multimesh is used in 2D. Equivalent to [method MultiMesh.set_instance_transform_2d].
func multimesh_instance_set_transform_2d(multimesh: RID, index: int, transform: Transform2D) -> void:
	pass;

#desc Set the entire data to use for drawing the [param multimesh] at once to [param buffer] (such as instance transforms and colors). [param buffer]'s size must match the number of instances multiplied by the per-instance data size (which depends on the enabled MultiMesh fields). Otherwise, an error message is printed and nothing is rendered. See also [method multimesh_get_buffer].
#desc The per-instance data size and expected data order is:
#desc [codeblock]
#desc 2D:
#desc - Position: 8 floats (8 floats for Transform2D)
#desc - Position + Vertex color: 12 floats (8 floats for Transform2D, 4 floats for Color)
#desc - Position + Custom data: 12 floats (8 floats for Transform2D, 4 floats of custom data)
#desc - Position + Vertex color + Custom data: 16 floats (8 floats for Transform2D, 4 floats for Color, 4 floats of custom data)
#desc 3D:
#desc - Position: 12 floats (12 floats for Transform3D)
#desc - Position + Vertex color: 16 floats (12 floats for Transform3D, 4 floats for Color)
#desc - Position + Custom data: 16 floats (12 floats for Transform3D, 4 floats of custom data)
#desc - Position + Vertex color + Custom data: 20 floats (12 floats for Transform3D, 4 floats for Color, 4 floats of custom data)
#desc [/codeblock]
func multimesh_set_buffer(multimesh: RID, buffer: PackedFloat32Array) -> void:
	pass;

#desc Sets the mesh to be drawn by the multimesh. Equivalent to [member MultiMesh.mesh].
func multimesh_set_mesh(multimesh: RID, mesh: RID) -> void:
	pass;

#desc Sets the number of instances visible at a given time. If -1, all instances that have been allocated are drawn. Equivalent to [member MultiMesh.visible_instance_count].
func multimesh_set_visible_instances(multimesh: RID, visible: int) -> void:
	pass;

#desc Creates an occluder instance and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all [code]occluder_*[/code] RenderingServer functions.
#desc Once finished with your RID, you will want to free the RID using the RenderingServer's [method free_rid] method.
#desc [b]Note:[/b] The equivalent resource is [Occluder3D] (not to be confused with the [OccluderInstance3D] node).
func occluder_create() -> RID:
	pass;

#desc Sets the mesh data for the given occluder RID, which controls the shape of the occlusion culling that will be performed.
func occluder_set_mesh(occluder: RID, vertices: PackedVector3Array, indices: PackedInt32Array) -> void:
	pass;

#desc Creates a new omni light and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID can be used in most [code]light_*[/code] RenderingServer functions.
#desc Once finished with your RID, you will want to free the RID using the RenderingServer's [method free_rid] method.
#desc To place in a scene, attach this omni light to an instance using [method instance_set_base] using the returned RID.
#desc [b]Note:[/b] The equivalent node is [OmniLight3D].
func omni_light_create() -> RID:
	pass;

#desc Creates a new 3D GPU particle collision or attractor and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID can be used in most [code]particles_collision_*[/code] RenderingServer functions.
#desc [b]Note:[/b] The equivalent nodes are [GPUParticlesCollision3D] and [GPUParticlesAttractor3D].
func particles_collision_create() -> RID:
	pass;

#desc Requests an update for the 3D GPU particle collision heightfield. This may be automatically called by the 3D GPU particle collision heightfield depending on its [member GPUParticlesCollisionHeightField3D.update_mode].
func particles_collision_height_field_update(particles_collision: RID) -> void:
	pass;

#desc Sets the attenuation [param curve] for the 3D GPU particles attractor specified by the [param particles_collision] RID. Only used for attractors, not colliders. Equivalent to [member GPUParticlesAttractor3D.attenuation].
func particles_collision_set_attractor_attenuation(particles_collision: RID, curve: float) -> void:
	pass;

#desc Sets the directionality [param amount] for the 3D GPU particles attractor specified by the [param particles_collision] RID. Only used for attractors, not colliders. Equivalent to [member GPUParticlesAttractor3D.directionality].
func particles_collision_set_attractor_directionality(particles_collision: RID, amount: float) -> void:
	pass;

#desc Sets the [param setrngth] for the 3D GPU particles attractor specified by the [param particles_collision] RID. Only used for attractors, not colliders. Equivalent to [member GPUParticlesAttractor3D.strength].
#desc [b]Note:[/b] The [param setrngth] parameter should be named "strength", but this typo was kept in the 4.0.x branch to preserve compatibility for C# and GDExtension.
func particles_collision_set_attractor_strength(particles_collision: RID, setrngth: float) -> void:
	pass;

#desc Sets the [param extents] for the 3D GPU particles collision by the [param particles_collision] RID. Equivalent to [member GPUParticlesCollisionBox3D.size], [member GPUParticlesCollisionSDF3D.size], [member GPUParticlesCollisionHeightField3D.size], [member GPUParticlesAttractorBox3D.size] or [member GPUParticlesAttractorVectorField3D.size] depending on the [param particles_collision] type.
func particles_collision_set_box_extents(particles_collision: RID, extents: Vector3) -> void:
	pass;

#desc Sets the collision or attractor shape [param type] for the 3D GPU particles collision or attractor specified by the [param particles_collision] RID.
func particles_collision_set_collision_type(particles_collision: RID, type: int) -> void:
	pass;

#desc Sets the cull [param mask] for the 3D GPU particles collision or attractor specified by the [param particles_collision] RID. Equivalent to [member GPUParticlesCollision3D.cull_mask] or [member GPUParticlesAttractor3D.cull_mask] depending on the [param particles_collision] type.
func particles_collision_set_cull_mask(particles_collision: RID, mask: int) -> void:
	pass;

#desc Sets the signed distance field [param texture] for the 3D GPU particles collision specified by the [param particles_collision] RID. Equivalent to [member GPUParticlesCollisionSDF3D.texture] or [member GPUParticlesAttractorVectorField3D.texture] depending on the [param particles_collision] type.
func particles_collision_set_field_texture(particles_collision: RID, texture: RID) -> void:
	pass;

#desc Sets the heightmap [param resolution] for the 3D GPU particles heightfield collision specified by the [param particles_collision] RID. Equivalent to [member GPUParticlesCollisionHeightField3D.resolution].
func particles_collision_set_height_field_resolution(particles_collision: RID, resolution: int) -> void:
	pass;

#desc Sets the [param radius] for the 3D GPU particles sphere collision or attractor specified by the [param particles_collision] RID. Equivalent to [member GPUParticlesCollisionSphere3D.radius] or [member GPUParticlesAttractorSphere3D.radius] depending on the [param particles_collision] type.
func particles_collision_set_sphere_radius(particles_collision: RID, radius: float) -> void:
	pass;

#desc Creates a GPU-based particle system and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all [code]particles_*[/code] RenderingServer functions.
#desc Once finished with your RID, you will want to free the RID using the RenderingServer's [method free_rid] method.
#desc To place in a scene, attach these particles to an instance using [method instance_set_base] using the returned RID.
#desc [b]Note:[/b] The equivalent nodes are [GPUParticles2D] and [GPUParticles3D].
#desc [b]Note:[/b] All [code]particles_*[/code] methods only apply to GPU-based particles, not CPU-based particles. [CPUParticles2D] and [CPUParticles3D] do not have equivalent RenderingServer functions available, as these use [MultiMeshInstance2D] and [MultiMeshInstance3D] under the hood (see [code]multimesh_*[/code] methods).
func particles_create() -> RID:
	pass;

#desc Manually emits particles from the [param particles] instance.
func particles_emit(particles: RID, transform: Transform3D, velocity: Vector3, color: Color, custom: Color, emit_flags: int) -> void:
	pass;

#desc Calculates and returns the axis-aligned bounding box that contains all the particles. Equivalent to [method GPUParticles3D.capture_aabb].
func particles_get_current_aabb(particles: RID) -> AABB:
	pass;

#desc Returns [code]true[/code] if particles are currently set to emitting.
func particles_get_emitting(particles: RID) -> bool:
	pass;

#desc Returns [code]true[/code] if particles are not emitting and particles are set to inactive.
func particles_is_inactive(particles: RID) -> bool:
	pass;

#desc Add particle system to list of particle systems that need to be updated. Update will take place on the next frame, or on the next call to [method instances_cull_aabb], [method instances_cull_convex], or [method instances_cull_ray].
func particles_request_process(particles: RID) -> void:
	pass;

#desc Reset the particles on the next update. Equivalent to [method GPUParticles3D.restart].
func particles_restart(particles: RID) -> void:
	pass;

#desc Sets the number of particles to be drawn and allocates the memory for them. Equivalent to [member GPUParticles3D.amount].
func particles_set_amount(particles: RID, amount: int) -> void:
	pass;

func particles_set_collision_base_size(particles: RID, size: float) -> void:
	pass;

#desc Sets a custom axis-aligned bounding box for the particle system. Equivalent to [member GPUParticles3D.visibility_aabb].
func particles_set_custom_aabb(particles: RID, aabb: AABB) -> void:
	pass;

#desc Sets the draw order of the particles to one of the named enums from [enum ParticlesDrawOrder]. See [enum ParticlesDrawOrder] for options. Equivalent to [member GPUParticles3D.draw_order].
func particles_set_draw_order(particles: RID, order: int) -> void:
	pass;

#desc Sets the mesh to be used for the specified draw pass. Equivalent to [member GPUParticles3D.draw_pass_1], [member GPUParticles3D.draw_pass_2], [member GPUParticles3D.draw_pass_3], and [member GPUParticles3D.draw_pass_4].
func particles_set_draw_pass_mesh(particles: RID, pass: int, mesh: RID) -> void:
	pass;

#desc Sets the number of draw passes to use. Equivalent to [member GPUParticles3D.draw_passes].
func particles_set_draw_passes(particles: RID, count: int) -> void:
	pass;

#desc Sets the [Transform3D] that will be used by the particles when they first emit.
func particles_set_emission_transform(particles: RID, transform: Transform3D) -> void:
	pass;

#desc If [code]true[/code], particles will emit over time. Setting to false does not reset the particles, but only stops their emission. Equivalent to [member GPUParticles3D.emitting].
func particles_set_emitting(particles: RID, emitting: bool) -> void:
	pass;

#desc Sets the explosiveness ratio. Equivalent to [member GPUParticles3D.explosiveness].
func particles_set_explosiveness_ratio(particles: RID, ratio: float) -> void:
	pass;

#desc Sets the frame rate that the particle system rendering will be fixed to. Equivalent to [member GPUParticles3D.fixed_fps].
func particles_set_fixed_fps(particles: RID, fps: int) -> void:
	pass;

#desc If [code]true[/code], uses fractional delta which smooths the movement of the particles. Equivalent to [member GPUParticles3D.fract_delta].
func particles_set_fractional_delta(particles: RID, enable: bool) -> void:
	pass;

func particles_set_interpolate(particles: RID, enable: bool) -> void:
	pass;

#desc Sets the lifetime of each particle in the system. Equivalent to [member GPUParticles3D.lifetime].
func particles_set_lifetime(particles: RID, lifetime: float) -> void:
	pass;

#desc Sets whether the GPU particles specified by the [param particles] RID should be rendered in 2D or 3D according to [param mode].
func particles_set_mode(particles: RID, mode: int) -> void:
	pass;

#desc If [code]true[/code], particles will emit once and then stop. Equivalent to [member GPUParticles3D.one_shot].
func particles_set_one_shot(particles: RID, one_shot: bool) -> void:
	pass;

#desc Sets the preprocess time for the particles' animation. This lets you delay starting an animation until after the particles have begun emitting. Equivalent to [member GPUParticles3D.preprocess].
func particles_set_pre_process_time(particles: RID, time: float) -> void:
	pass;

#desc Sets the material for processing the particles.
#desc [b]Note:[/b] This is not the material used to draw the materials. Equivalent to [member GPUParticles3D.process_material].
func particles_set_process_material(particles: RID, material: RID) -> void:
	pass;

#desc Sets the emission randomness ratio. This randomizes the emission of particles within their phase. Equivalent to [member GPUParticles3D.randomness].
func particles_set_randomness_ratio(particles: RID, ratio: float) -> void:
	pass;

#desc Sets the speed scale of the particle system. Equivalent to [member GPUParticles3D.speed_scale].
func particles_set_speed_scale(particles: RID, scale: float) -> void:
	pass;

func particles_set_subemitter(particles: RID, subemitter_particles: RID) -> void:
	pass;

func particles_set_trail_bind_poses(particles: RID, bind_poses: Transform3D[]) -> void:
	pass;

#desc If [param enable] is [code]true[/code], enables trails for the [param particles] with the specified [param length_sec] in seconds. Equivalent to [member GPUParticles3D.trail_enabled] and [member GPUParticles3D.trail_lifetime].
func particles_set_trails(particles: RID, enable: bool, length_sec: float) -> void:
	pass;

func particles_set_transform_align(particles: RID, align: int) -> void:
	pass;

#desc If [code]true[/code], particles use local coordinates. If [code]false[/code] they use global coordinates. Equivalent to [member GPUParticles3D.local_coords].
func particles_set_use_local_coordinates(particles: RID, enable: bool) -> void:
	pass;

#desc Sets the filter quality for omni and spot light shadows in 3D. See also [member ProjectSettings.rendering/lights_and_shadows/positional_shadow/soft_shadow_filter_quality]. This parameter is global and cannot be set on a per-viewport basis.
func positional_soft_shadow_filter_set_quality(quality: int) -> void:
	pass;

#desc Creates a reflection probe and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all [code]reflection_probe_*[/code] RenderingServer functions.
#desc Once finished with your RID, you will want to free the RID using the RenderingServer's [method free_rid] method.
#desc To place in a scene, attach this reflection probe to an instance using [method instance_set_base] using the returned RID.
#desc [b]Note:[/b] The equivalent node is [ReflectionProbe].
func reflection_probe_create() -> RID:
	pass;

#desc Sets the reflection probe's custom ambient light color. Equivalent to [member ReflectionProbe.ambient_color].
func reflection_probe_set_ambient_color(probe: RID, color: Color) -> void:
	pass;

#desc Sets the reflection probe's custom ambient light energy. Equivalent to [member ReflectionProbe.ambient_color_energy].
func reflection_probe_set_ambient_energy(probe: RID, energy: float) -> void:
	pass;

#desc Sets the reflection probe's ambient light mode. Equivalent to [member ReflectionProbe.ambient_mode].
func reflection_probe_set_ambient_mode(probe: RID, mode: int) -> void:
	pass;

#desc If [code]true[/code], reflections will ignore sky contribution. Equivalent to [member ReflectionProbe.interior].
func reflection_probe_set_as_interior(probe: RID, enable: bool) -> void:
	pass;

#desc Sets the render cull mask for this reflection probe. Only instances with a matching cull mask will be rendered by this probe. Equivalent to [member ReflectionProbe.cull_mask].
func reflection_probe_set_cull_mask(probe: RID, layers: int) -> void:
	pass;

#desc If [code]true[/code], uses box projection. This can make reflections look more correct in certain situations. Equivalent to [member ReflectionProbe.box_projection].
func reflection_probe_set_enable_box_projection(probe: RID, enable: bool) -> void:
	pass;

#desc If [code]true[/code], computes shadows in the reflection probe. This makes the reflection much slower to compute. Equivalent to [member ReflectionProbe.enable_shadows].
func reflection_probe_set_enable_shadows(probe: RID, enable: bool) -> void:
	pass;

#desc Sets the intensity of the reflection probe. Intensity modulates the strength of the reflection. Equivalent to [member ReflectionProbe.intensity].
func reflection_probe_set_intensity(probe: RID, intensity: float) -> void:
	pass;

#desc Sets the max distance away from the probe an object can be before it is culled. Equivalent to [member ReflectionProbe.max_distance].
func reflection_probe_set_max_distance(probe: RID, distance: float) -> void:
	pass;

#desc Sets the mesh level of detail to use in the reflection probe rendering. Higher values will use less detailed versions of meshes that have LOD variations generated, which can improve performance. Equivalent to [member ReflectionProbe.mesh_lod_threshold].
func reflection_probe_set_mesh_lod_threshold(probe: RID, pixels: float) -> void:
	pass;

#desc Sets the origin offset to be used when this reflection probe is in box project mode. Equivalent to [member ReflectionProbe.origin_offset].
func reflection_probe_set_origin_offset(probe: RID, offset: Vector3) -> void:
	pass;

#desc Sets the resolution to use when rendering the specified reflection probe. The [param resolution] is specified for each cubemap face: for instance, specifying [code]512[/code] will allocate 6 faces of 512×512 each (plus mipmaps for roughness levels).
func reflection_probe_set_resolution(probe: RID, resolution: int) -> void:
	pass;

#desc Sets the size of the area that the reflection probe will capture. Equivalent to [member ReflectionProbe.size].
func reflection_probe_set_size(probe: RID, size: Vector3) -> void:
	pass;

#desc Sets how often the reflection probe updates. Can either be once or every frame. See [enum ReflectionProbeUpdateMode] for options.
func reflection_probe_set_update_mode(probe: RID, mode: int) -> void:
	pass;

#desc Schedules a callback to the given callable after a frame has been drawn.
func request_frame_drawn_callback(callable: Callable) -> void:
	pass;

#desc Creates a scenario and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all [code]scenario_*[/code] RenderingServer functions.
#desc Once finished with your RID, you will want to free the RID using the RenderingServer's [method free_rid] method.
#desc The scenario is the 3D world that all the visual instances exist in.
func scenario_create() -> RID:
	pass;

#desc Sets the camera attributes ([param effects]) that will be used with this scenario. See also [CameraAttributes].
func scenario_set_camera_attributes(scenario: RID, effects: RID) -> void:
	pass;

#desc Sets the environment that will be used with this scenario. See also [Environment].
func scenario_set_environment(scenario: RID, environment: RID) -> void:
	pass;

#desc Sets the fallback environment to be used by this scenario. The fallback environment is used if no environment is set. Internally, this is used by the editor to provide a default environment.
func scenario_set_fallback_environment(scenario: RID, environment: RID) -> void:
	pass;

#desc Sets the screen-space roughness limiter parameters, such as whether it should be enabled and its thresholds. Equivalent to [member ProjectSettings.rendering/anti_aliasing/screen_space_roughness_limiter/enabled], [member ProjectSettings.rendering/anti_aliasing/screen_space_roughness_limiter/amount] and [member ProjectSettings.rendering/anti_aliasing/screen_space_roughness_limiter/limit].
func screen_space_roughness_limiter_set_active(enable: bool, amount: float, limit: float) -> void:
	pass;

#desc Sets a boot image. The color defines the background color. If [param scale] is [code]true[/code], the image will be scaled to fit the screen size. If [param use_filter] is [code]true[/code], the image will be scaled with linear interpolation. If [param use_filter] is [code]false[/code], the image will be scaled with nearest-neighbor interpolation.
func set_boot_image(image: Image, color: Color, scale: bool, use_filter: bool = true) -> void:
	pass;

#desc This method is currently unimplemented and does nothing if called with [param generate] set to [code]true[/code].
func set_debug_generate_wireframes(generate: bool) -> void:
	pass;

#desc Sets the default clear color which is used when a specific clear color has not been selected. See also [method get_default_clear_color].
func set_default_clear_color(color: Color) -> void:
	pass;

#desc Creates an empty shader and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all [code]shader_*[/code] RenderingServer functions.
#desc Once finished with your RID, you will want to free the RID using the RenderingServer's [method free_rid] method.
#desc [b]Note:[/b] The equivalent resource is [Shader].
func shader_create() -> RID:
	pass;

#desc Returns a shader's source code as a string.
func shader_get_code(shader: RID) -> String:
	pass;

#desc Returns a default texture from a shader searched by name.
#desc [b]Note:[/b] If the sampler array is used use [param index] to access the specified texture.
func shader_get_default_texture_parameter(shader: RID, name: StringName, index: int = 0) -> RID:
	pass;

#desc Returns the default value for the specified shader uniform. This is usually the value written in the shader source code.
func shader_get_parameter_default(shader: RID, name: StringName) -> Variant:
	pass;

#desc Sets the shader's source code (which triggers recompilation after being changed).
func shader_set_code(shader: RID, code: String) -> void:
	pass;

#desc Sets a shader's default texture. Overwrites the texture given by name.
#desc [b]Note:[/b] If the sampler array is used use [param index] to access the specified texture.
func shader_set_default_texture_parameter(shader: RID, name: StringName, texture: RID, index: int = 0) -> void:
	pass;

#desc Sets the path hint for the specified shader. This should generally match the [Shader] resource's [member Resource.resource_path].
func shader_set_path_hint(shader: RID, path: String) -> void:
	pass;

func skeleton_allocate_data(skeleton: RID, bones: int, is_2d_skeleton: bool = false) -> void:
	pass;

#desc Returns the [Transform3D] set for a specific bone of this skeleton.
func skeleton_bone_get_transform(skeleton: RID, bone: int) -> Transform3D:
	pass;

#desc Returns the [Transform2D] set for a specific bone of this skeleton.
func skeleton_bone_get_transform_2d(skeleton: RID, bone: int) -> Transform2D:
	pass;

#desc Sets the [Transform3D] for a specific bone of this skeleton.
func skeleton_bone_set_transform(skeleton: RID, bone: int, transform: Transform3D) -> void:
	pass;

#desc Sets the [Transform2D] for a specific bone of this skeleton.
func skeleton_bone_set_transform_2d(skeleton: RID, bone: int, transform: Transform2D) -> void:
	pass;

#desc Creates a skeleton and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all [code]skeleton_*[/code] RenderingServer functions.
#desc Once finished with your RID, you will want to free the RID using the RenderingServer's [method free_rid] method.
func skeleton_create() -> RID:
	pass;

#desc Returns the number of bones allocated for this skeleton.
func skeleton_get_bone_count(skeleton: RID) -> int:
	pass;

func skeleton_set_base_transform_2d(skeleton: RID, base_transform: Transform2D) -> void:
	pass;

#desc Generates and returns an [Image] containing the radiance map for the specified [param sky] RID. This supports built-in sky material and custom sky shaders. If [param bake_irradiance] is [code]true[/code], the irradiance map is saved instead of the radiance map. The radiance map is used to render reflected light, while the irradiance map is used to render ambient light. See also [method environment_bake_panorama].
#desc [b]Note:[/b] The image is saved in linear color space without any tonemapping performed, which means it will look too dark if viewed directly in an image editor. [param energy] values above [code]1.0[/code] can be used to brighten the resulting image.
#desc [b]Note:[/b] [param size] should be a 2:1 aspect ratio for the generated panorama to have square pixels. For radiance maps, there is no point in using a height greater than [member Sky.radiance_size], as it won't increase detail. Irradiance maps only contain low-frequency data, so there is usually no point in going past a size of 128×64 pixels when saving an irradiance map.
func sky_bake_panorama(sky: RID, energy: float, bake_irradiance: bool, size: Vector2i) -> Image:
	pass;

#desc Creates an empty sky and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all [code]sky_*[/code] RenderingServer functions.
#desc Once finished with your RID, you will want to free the RID using the RenderingServer's [method free_rid] method.
func sky_create() -> RID:
	pass;

#desc Sets the material that the sky uses to render the background, ambient and reflection maps.
func sky_set_material(sky: RID, material: RID) -> void:
	pass;

#desc Sets the process [param mode] of the sky specified by the [param sky] RID. Equivalent to [member Sky.process_mode].
func sky_set_mode(sky: RID, mode: int) -> void:
	pass;

#desc Sets the [param radiance_size] of the sky specified by the [param sky] RID (in pixels). Equivalent to [member Sky.radiance_size].
func sky_set_radiance_size(sky: RID, radiance_size: int) -> void:
	pass;

#desc Creates a spot light and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID can be used in most [code]light_*[/code] RenderingServer functions.
#desc Once finished with your RID, you will want to free the RID using the RenderingServer's [method free_rid] method.
#desc To place in a scene, attach this spot light to an instance using [method instance_set_base] using the returned RID.
func spot_light_create() -> RID:
	pass;

#desc Sets [member ProjectSettings.rendering/environment/subsurface_scattering/subsurface_scattering_quality] to use when rendering materials that have subsurface scattering enabled.
func sub_surface_scattering_set_quality(quality: int) -> void:
	pass;

#desc Sets the [member ProjectSettings.rendering/environment/subsurface_scattering/subsurface_scattering_scale] and [member ProjectSettings.rendering/environment/subsurface_scattering/subsurface_scattering_depth_scale] to use when rendering materials that have subsurface scattering enabled.
func sub_surface_scattering_set_scale(scale: float, depth_scale: float) -> void:
	pass;

#desc Creates a 2-dimensional texture and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all [code]texture_2d_*[/code] RenderingServer functions.
#desc Once finished with your RID, you will want to free the RID using the RenderingServer's [method free_rid] method.
#desc [b]Note:[/b] The equivalent resource is [Texture2D].
#desc [b]Note:[/b] Not to be confused with [method RenderingDevice.texture_create], which creates the graphics API's own texture type as opposed to the Godot-specific [Texture2D] resource.
func texture_2d_create(image: Image) -> RID:
	pass;

#desc Returns an [Image] instance from the given [param texture] [RID].
#desc Example of getting the test texture from [method get_test_texture] and applying it to a [Sprite2D] node:
#desc [codeblock]
#desc var texture_rid = RenderingServer.get_test_texture()
#desc var texture = ImageTexture.create_from_image(RenderingServer.texture_2d_get(texture_rid))
#desc $Sprite2D.texture = texture
#desc [/codeblock]
func texture_2d_get(texture: RID) -> Image:
	pass;

#desc Returns an [Image] instance from the given [param texture] [RID] and [param layer].
func texture_2d_layer_get(texture: RID, layer: int) -> Image:
	pass;

#desc Creates a 2-dimensional layered texture and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all [code]texture_2d_layered_*[/code] RenderingServer functions.
#desc Once finished with your RID, you will want to free the RID using the RenderingServer's [method free_rid] method.
#desc [b]Note:[/b] The equivalent resource is [TextureLayered].
func texture_2d_layered_create(layers: Image[], layered_type: int) -> RID:
	pass;

#desc Creates a placeholder for a 2-dimensional layered texture and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all [code]texture_2d_layered_*[/code] RenderingServer functions, although it does nothing when used. See also [method texture_2d_placeholder_create].
#desc [b]Note:[/b] The equivalent resource is [PlaceholderTextureLayered].
func texture_2d_layered_placeholder_create(layered_type: int) -> RID:
	pass;

#desc Creates a placeholder for a 2-dimensional layered texture and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all [code]texture_2d_layered_*[/code] RenderingServer functions, although it does nothing when used. See also [method texture_2d_layered_placeholder_create]
#desc Once finished with your RID, you will want to free the RID using the RenderingServer's [method free_rid] method.
#desc [b]Note:[/b] The equivalent resource is [PlaceholderTexture2D].
func texture_2d_placeholder_create() -> RID:
	pass;

#desc Updates the texture specified by the [param texture] [RID] with the data in [param image]. A [param layer] must also be specified, which should be [code]0[/code] when updating a single-layer texture ([Texture2D]).
#desc [b]Note:[/b] The [param image] must have the same width, height and format as the current [param texture] data. Otherwise, an error will be printed and the original texture won't be modified. If you need to use different width, height or format, use [method texture_replace] instead.
func texture_2d_update(texture: RID, image: Image, layer: int) -> void:
	pass;

#desc [b]Note:[/b] The equivalent resource is [Texture3D].
func texture_3d_create(format: int, width: int, height: int, depth: int, mipmaps: bool, data: Image[]) -> RID:
	pass;

#desc Returns 3D texture data as an array of [Image]s for the specified texture [RID].
func texture_3d_get(texture: RID) -> Array[Image]:
	pass;

#desc Creates a placeholder for a 3-dimensional texture and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all [code]texture_3d_*[/code] RenderingServer functions, although it does nothing when used.
#desc Once finished with your RID, you will want to free the RID using the RenderingServer's [method free_rid] method.
#desc [b]Note:[/b] The equivalent resource is [PlaceholderTexture3D].
func texture_3d_placeholder_create() -> RID:
	pass;

#desc Updates the texture specified by the [param texture] [RID]'s data with the data in [param data]. All the texture's layers must be replaced at once.
#desc [b]Note:[/b] The [param texture] must have the same width, height, depth and format as the current texture data. Otherwise, an error will be printed and the original texture won't be modified. If you need to use different width, height, depth or format, use [method texture_replace] instead.
func texture_3d_update(texture: RID, data: Image[]) -> void:
	pass;

func texture_get_path(texture: RID) -> String:
	pass;

#desc Returns a texture [RID] that can be used with [RenderingDevice].
func texture_get_rd_texture(texture: RID, srgb: bool = false) -> RID:
	pass;

#desc [i]Deprecated.[/i] As ProxyTexture was removed in Godot 4, this method does nothing when called and always returns a null [RID].
func texture_proxy_create(base: RID) -> RID:
	pass;

#desc [i]Deprecated.[/i] ProxyTexture was removed in Godot 4, so this method cannot be used anymore.
func texture_proxy_update(texture: RID, proxy_to: RID) -> void:
	pass;

#desc Replaces [param texture]'s texture data by the texture specified by the [param by_texture] RID, without changing [param texture]'s RID.
func texture_replace(texture: RID, by_texture: RID) -> void:
	pass;

func texture_set_force_redraw_if_visible(texture: RID, enable: bool) -> void:
	pass;

func texture_set_path(texture: RID, path: String) -> void:
	pass;

func texture_set_size_override(texture: RID, width: int, height: int) -> void:
	pass;

#desc Sets a viewport's camera.
func viewport_attach_camera(viewport: RID, camera: RID) -> void:
	pass;

#desc Sets a viewport's canvas.
func viewport_attach_canvas(viewport: RID, canvas: RID) -> void:
	pass;

#desc Copies the viewport to a region of the screen specified by [param rect]. If [method viewport_set_render_direct_to_screen] is [code]true[/code], then the viewport does not use a framebuffer and the contents of the viewport are rendered directly to screen. However, note that the root viewport is drawn last, therefore it will draw over the screen. Accordingly, you must set the root viewport to an area that does not cover the area that you have attached this viewport to.
#desc For example, you can set the root viewport to not render at all with the following code:
#desc FIXME: The method seems to be non-existent.
#desc [codeblocks]
#desc [gdscript]
#desc func _ready():
#desc get_viewport().set_attach_to_screen_rect(Rect2())
#desc $Viewport.set_attach_to_screen_rect(Rect2(0, 0, 600, 600))
#desc [/gdscript]
#desc [/codeblocks]
#desc Using this can result in significant optimization, especially on lower-end devices. However, it comes at the cost of having to manage your viewports manually. For further optimization, see [method viewport_set_render_direct_to_screen].
func viewport_attach_to_screen(viewport: RID, rect: Rect2 = Rect2(0, 0, 0, 0), screen: int = 0) -> void:
	pass;

#desc Creates an empty viewport and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all [code]viewport_*[/code] RenderingServer functions.
#desc Once finished with your RID, you will want to free the RID using the RenderingServer's [method free_rid] method.
#desc [b]Note:[/b] The equivalent node is [Viewport].
func viewport_create() -> RID:
	pass;

#desc Returns the CPU time taken to render the last frame in milliseconds. This [i]only[/i] includes time spent in rendering-related operations; scripts' [code]_process[/code] functions and other engine subsystems are not included in this readout. To get a complete readout of CPU time spent to render the scene, sum the render times of all viewports that are drawn every frame plus [method get_frame_setup_time_cpu]. Unlike [method Engine.get_frames_per_second], this method will accurately reflect CPU utilization even if framerate is capped via V-Sync or [member Engine.max_fps]. See also [method viewport_get_measured_render_time_gpu].
#desc [b]Note:[/b] Requires measurements to be enabled on the specified [param viewport] using [method viewport_set_measure_render_time]. Otherwise, this method returns [code]0.0[/code].
func viewport_get_measured_render_time_cpu(viewport: RID) -> float:
	pass;

#desc Returns the GPU time taken to render the last frame in milliseconds. To get a complete readout of GPU time spent to render the scene, sum the render times of all viewports that are drawn every frame. Unlike [method Engine.get_frames_per_second], this method accurately reflects GPU utilization even if framerate is capped via V-Sync or [member Engine.max_fps]. See also [method viewport_get_measured_render_time_gpu].
#desc [b]Note:[/b] Requires measurements to be enabled on the specified [param viewport] using [method viewport_set_measure_render_time]. Otherwise, this method returns [code]0.0[/code].
#desc [b]Note:[/b] When GPU utilization is low enough during a certain period of time, GPUs will decrease their power state (which in turn decreases core and memory clock speeds). This can cause the reported GPU time to increase if GPU utilization is kept low enough by a framerate cap (compared to what it would be at the GPU's highest power state). Keep this in mind when benchmarking using [method viewport_get_measured_render_time_gpu]. This behavior can be overridden in the graphics driver settings at the cost of higher power usage.
func viewport_get_measured_render_time_gpu(viewport: RID) -> float:
	pass;

#desc Returns a statistic about the rendering engine which can be used for performance profiling. This is separated into render pass [param type]s, each of them having the same [param info]s you can query (different passes will return different values). See [enum RenderingServer.ViewportRenderInfoType] for a list of render pass types and [enum RenderingServer.ViewportRenderInfo] for a list of information that can be queried.
#desc See also [method get_rendering_info], which returns global information across all viewports.
#desc [b]Note:[/b] Viewport rendering information is not available until at least 2 frames have been rendered by the engine. If rendering information is not available, [method viewport_get_render_info] returns [code]0[/code]. To print rendering information in [code]_ready()[/code] successfully, use the following:
#desc [codeblock]
#desc func _ready():
#desc for _i in 2:
#desc await get_tree().process_frame
#desc 
#desc print(
#desc RenderingServer.viewport_get_render_info(get_viewport().get_viewport_rid(),
#desc RenderingServer.VIEWPORT_RENDER_INFO_TYPE_VISIBLE,
#desc RenderingServer.VIEWPORT_RENDER_INFO_DRAW_CALLS_IN_FRAME)
#desc )
#desc [/codeblock]
func viewport_get_render_info(viewport: RID, type: int, info: int) -> int:
	pass;

#desc Returns the render target for the viewport.
func viewport_get_render_target(viewport: RID) -> RID:
	pass;

#desc Returns the viewport's last rendered frame.
func viewport_get_texture(viewport: RID) -> RID:
	pass;

#desc Detaches a viewport from a canvas and vice versa.
func viewport_remove_canvas(viewport: RID, canvas: RID) -> void:
	pass;

#desc If [code]true[/code], sets the viewport active, else sets it inactive.
func viewport_set_active(viewport: RID, active: bool) -> void:
	pass;

#desc Sets the rendering mask associated with this [Viewport]. Only [CanvasItem] nodes with a matching rendering visibility layer will be rendered by this [Viewport].
func viewport_set_canvas_cull_mask(viewport: RID, canvas_cull_mask: int) -> void:
	pass;

#desc Sets the stacking order for a viewport's canvas.
#desc [param layer] is the actual canvas layer, while [param sublayer] specifies the stacking order of the canvas among those in the same layer.
func viewport_set_canvas_stacking(viewport: RID, canvas: RID, layer: int, sublayer: int) -> void:
	pass;

#desc Sets the transformation of a viewport's canvas.
func viewport_set_canvas_transform(viewport: RID, canvas: RID, offset: Transform2D) -> void:
	pass;

#desc Sets the clear mode of a viewport. See [enum ViewportClearMode] for options.
func viewport_set_clear_mode(viewport: RID, clear_mode: int) -> void:
	pass;

#desc Sets the debug draw mode of a viewport. See [enum ViewportDebugDraw] for options.
func viewport_set_debug_draw(viewport: RID, draw: int) -> void:
	pass;

#desc Sets the default texture filtering mode for the specified [param viewport] RID. See [enum CanvasItemTextureFilter] for options.
func viewport_set_default_canvas_item_texture_filter(viewport: RID, filter: int) -> void:
	pass;

#desc Sets the default texture repeat mode for the specified [param viewport] RID. See [enum CanvasItemTextureRepeat] for options.
func viewport_set_default_canvas_item_texture_repeat(viewport: RID, repeat: int) -> void:
	pass;

#desc If [code]true[/code], the viewport's canvas (i.e. 2D and GUI elements) is not rendered.
func viewport_set_disable_2d(viewport: RID, disable: bool) -> void:
	pass;

#desc If [code]true[/code], the viewport's 3D elements are not rendered.
func viewport_set_disable_3d(viewport: RID, disable: bool) -> void:
	pass;

#desc Sets the viewport's environment mode which allows enabling or disabling rendering of 3D environment over 2D canvas. When disabled, 2D will not be affected by the environment. When enabled, 2D will be affected by the environment if the environment background mode is [constant ENV_BG_CANVAS]. The default behavior is to inherit the setting from the viewport's parent. If the topmost parent is also set to [constant VIEWPORT_ENVIRONMENT_INHERIT], then the behavior will be the same as if it was set to [constant VIEWPORT_ENVIRONMENT_ENABLED].
func viewport_set_environment_mode(viewport: RID, mode: int) -> void:
	pass;

#desc Determines how sharp the upscaled image will be when using the FSR upscaling mode. Sharpness halves with every whole number. Values go from 0.0 (sharpest) to 2.0. Values above 2.0 won't make a visible difference.
func viewport_set_fsr_sharpness(viewport: RID, sharpness: float) -> void:
	pass;

#desc Sets the viewport's global transformation matrix.
func viewport_set_global_canvas_transform(viewport: RID, transform: Transform2D) -> void:
	pass;

#desc Sets the measurement for the given [param viewport] RID (obtained using [method Viewport.get_viewport_rid]). Once enabled, [method viewport_get_measured_render_time_cpu] and [method viewport_get_measured_render_time_gpu] will return values greater than [code]0.0[/code] when queried with the given [param viewport].
func viewport_set_measure_render_time(viewport: RID, enable: bool) -> void:
	pass;

#desc Sets the multisample anti-aliasing mode for 2D/Canvas on the specified [param viewport] RID. See [enum ViewportMSAA] for options.
func viewport_set_msaa_2d(viewport: RID, msaa: int) -> void:
	pass;

#desc Sets the multisample anti-aliasing mode for 3D on the specified [param viewport] RID. See [enum ViewportMSAA] for options.
func viewport_set_msaa_3d(viewport: RID, msaa: int) -> void:
	pass;

#desc Sets the [member ProjectSettings.rendering/occlusion_culling/bvh_build_quality] to use for occlusion culling. This parameter is global and cannot be set on a per-viewport basis.
func viewport_set_occlusion_culling_build_quality(quality: int) -> void:
	pass;

#desc Sets the [member ProjectSettings.rendering/occlusion_culling/occlusion_rays_per_thread] to use for occlusion culling. This parameter is global and cannot be set on a per-viewport basis.
func viewport_set_occlusion_rays_per_thread(rays_per_thread: int) -> void:
	pass;

#desc Sets the viewport's parent to the viewport specified by the [param parent_viewport] RID.
func viewport_set_parent_viewport(viewport: RID, parent_viewport: RID) -> void:
	pass;

#desc Sets the number of subdivisions to use in the specified shadow atlas [param quadrant] for omni and spot shadows. See also [method Viewport.set_positional_shadow_atlas_quadrant_subdiv].
func viewport_set_positional_shadow_atlas_quadrant_subdivision(viewport: RID, quadrant: int, subdivision: int) -> void:
	pass;

#desc Sets the [param size] of the shadow atlas's images (used for omni and spot lights) on the viewport specified by the [param viewport] RID. The value is rounded up to the nearest power of 2. If [code]use_16_bits[/code] is [code]true[/code], use 16 bits for the omni/spot shadow depth map. Enabling this results in shadows having less precision and may result in shadow acne, but can lead to performance improvements on some devices.
#desc [b]Note:[/b] If this is set to [code]0[/code], no positional shadows will be visible at all. This can improve performance significantly on low-end systems by reducing both the CPU and GPU load (as fewer draw calls are needed to draw the scene without shadows).
func viewport_set_positional_shadow_atlas_size(viewport: RID, size: int, use_16_bits: bool = false) -> void:
	pass;

#desc If [code]true[/code], render the contents of the viewport directly to screen. This allows a low-level optimization where you can skip drawing a viewport to the root viewport. While this optimization can result in a significant increase in speed (especially on older devices), it comes at a cost of usability. When this is enabled, you cannot read from the viewport or from the screen_texture. You also lose the benefit of certain window settings, such as the various stretch modes. Another consequence to be aware of is that in 2D the rendering happens in window coordinates, so if you have a viewport that is double the size of the window, and you set this, then only the portion that fits within the window will be drawn, no automatic scaling is possible, even if your game scene is significantly larger than the window size.
func viewport_set_render_direct_to_screen(viewport: RID, enabled: bool) -> void:
	pass;

#desc Sets the 3D resolution scaling mode. Bilinear scaling renders at different resolution to either undersample or supersample the viewport. FidelityFX Super Resolution 1.0, abbreviated to FSR, is an upscaling technology that produces high quality images at fast framerates by using a spatially aware upscaling algorithm. FSR is slightly more expensive than bilinear, but it produces significantly higher image quality. FSR should be used where possible.
func viewport_set_scaling_3d_mode(viewport: RID, scaling_3d_mode: int) -> void:
	pass;

#desc Scales the 3D render buffer based on the viewport size uses an image filter specified in [enum ViewportScaling3DMode] to scale the output image to the full viewport size. Values lower than [code]1.0[/code] can be used to speed up 3D rendering at the cost of quality (undersampling). Values greater than [code]1.0[/code] are only valid for bilinear mode and can be used to improve 3D rendering quality at a high performance cost (supersampling). See also [enum ViewportMSAA] for multi-sample antialiasing, which is significantly cheaper but only smoothens the edges of polygons.
#desc When using FSR upscaling, AMD recommends exposing the following values as preset options to users "Ultra Quality: 0.77", "Quality: 0.67", "Balanced: 0.59", "Performance: 0.5" instead of exposing the entire scale.
func viewport_set_scaling_3d_scale(viewport: RID, scale: float) -> void:
	pass;

#desc Sets a viewport's scenario. The scenario contains information about environment information, reflection atlas, etc.
func viewport_set_scenario(viewport: RID, scenario: RID) -> void:
	pass;

#desc Sets the viewport's screen-space antialiasing mode.
func viewport_set_screen_space_aa(viewport: RID, mode: int) -> void:
	pass;

#desc Sets the viewport's 2D signed distance field [member ProjectSettings.rendering/2d/sdf/oversize] and [member ProjectSettings.rendering/2d/sdf/scale]. This is used when sampling the signed distance field in [CanvasItem] shaders as well as [GPUParticles2D] collision. This is [i]not[/i] used by SDFGI in 3D rendering.
func viewport_set_sdf_oversize_and_scale(viewport: RID, oversize: int, scale: int) -> void:
	pass;

#desc Sets the viewport's width and height in pixels.
func viewport_set_size(viewport: RID, width: int, height: int) -> void:
	pass;

#desc If [code]true[/code], canvas item transforms (i.e. origin position) are snapped to the nearest pixel when rendering. This can lead to a crisper appearance at the cost of less smooth movement, especially when [Camera2D] smoothing is enabled. Equivalent to [member ProjectSettings.rendering/2d/snap/snap_2d_transforms_to_pixel].
func viewport_set_snap_2d_transforms_to_pixel(viewport: RID, enabled: bool) -> void:
	pass;

#desc If [code]true[/code], canvas item vertices (i.e. polygon points) are snapped to the nearest pixel when rendering. This can lead to a crisper appearance at the cost of less smooth movement, especially when [Camera2D] smoothing is enabled. Equivalent to [member ProjectSettings.rendering/2d/snap/snap_2d_vertices_to_pixel].
func viewport_set_snap_2d_vertices_to_pixel(viewport: RID, enabled: bool) -> void:
	pass;

#desc Affects the final texture sharpness by reading from a lower or higher mipmap (also called "texture LOD bias"). Negative values make mipmapped textures sharper but grainier when viewed at a distance, while positive values make mipmapped textures blurrier (even when up close). To get sharper textures at a distance without introducing too much graininess, set this between [code]-0.75[/code] and [code]0.0[/code]. Enabling temporal antialiasing ([member ProjectSettings.rendering/anti_aliasing/quality/use_taa]) can help reduce the graininess visible when using negative mipmap bias.
#desc [b]Note:[/b] When the 3D scaling mode is set to FSR 1.0, this value is used to adjust the automatic mipmap bias which is calculated internally based on the scale factor. The formula for this is [code]-log2(1.0 / scale) + mipmap_bias[/code].
func viewport_set_texture_mipmap_bias(viewport: RID, mipmap_bias: float) -> void:
	pass;

#desc If [code]true[/code], the viewport renders its background as transparent.
func viewport_set_transparent_background(viewport: RID, enabled: bool) -> void:
	pass;

#desc Sets when the viewport should be updated. See [enum ViewportUpdateMode] constants for options.
func viewport_set_update_mode(viewport: RID, update_mode: int) -> void:
	pass;

#desc If [code]true[/code], enables debanding on the specified viewport. Equivalent to [member ProjectSettings.rendering/anti_aliasing/quality/use_debanding].
func viewport_set_use_debanding(viewport: RID, enable: bool) -> void:
	pass;

#desc If [code]true[/code], enables occlusion culling on the specified viewport. Equivalent to [member ProjectSettings.rendering/occlusion_culling/use_occlusion_culling].
func viewport_set_use_occlusion_culling(viewport: RID, enable: bool) -> void:
	pass;

#desc If [code]true[/code], use Temporal Anti-Aliasing. Equivalent to [member ProjectSettings.rendering/anti_aliasing/quality/use_taa].
func viewport_set_use_taa(viewport: RID, enable: bool) -> void:
	pass;

#desc If [code]true[/code], the viewport uses augmented or virtual reality technologies. See [XRInterface].
func viewport_set_use_xr(viewport: RID, use_xr: bool) -> void:
	pass;

#desc Sets the Variable Rate Shading (VRS) mode for the viewport. If the GPU does not support VRS, this property is ignored. Equivalent to [member ProjectSettings.rendering/vrs/mode].
func viewport_set_vrs_mode(viewport: RID, mode: int) -> void:
	pass;

#desc The texture to use when the VRS mode is set to [constant RenderingServer.VIEWPORT_VRS_TEXTURE]. Equivalent to [member ProjectSettings.rendering/vrs/texture].
func viewport_set_vrs_texture(viewport: RID, texture: RID) -> void:
	pass;

#desc Creates a new 3D visibility notifier object and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all [code]visibility_notifier_*[/code] RenderingServer functions.
#desc Once finished with your RID, you will want to free the RID using the RenderingServer's [method free_rid] method.
#desc To place in a scene, attach this mesh to an instance using [method instance_set_base] using the returned RID.
#desc [b]Note:[/b] The equivalent node is [VisibleOnScreenNotifier3D].
func visibility_notifier_create() -> RID:
	pass;

func visibility_notifier_set_aabb(notifier: RID, aabb: AABB) -> void:
	pass;

func visibility_notifier_set_callbacks(notifier: RID, enter_callable: Callable, exit_callable: Callable) -> void:
	pass;

func voxel_gi_allocate_data(voxel_gi: RID, to_cell_xform: Transform3D, aabb: AABB, octree_size: Vector3i, octree_cells: PackedByteArray, data_cells: PackedByteArray, distance_field: PackedByteArray, level_counts: PackedInt32Array) -> void:
	pass;

#desc Creates a new voxel-based global illumination object and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all [code]voxel_gi_*[/code] RenderingServer functions.
#desc Once finished with your RID, you will want to free the RID using the RenderingServer's [method free_rid] method.
#desc [b]Note:[/b] The equivalent node is [VoxelGI].
func voxel_gi_create() -> RID:
	pass;

func voxel_gi_get_data_cells(voxel_gi: RID) -> PackedByteArray:
	pass;

func voxel_gi_get_distance_field(voxel_gi: RID) -> PackedByteArray:
	pass;

func voxel_gi_get_level_counts(voxel_gi: RID) -> PackedInt32Array:
	pass;

func voxel_gi_get_octree_cells(voxel_gi: RID) -> PackedByteArray:
	pass;

func voxel_gi_get_octree_size(voxel_gi: RID) -> Vector3i:
	pass;

func voxel_gi_get_to_cell_xform(voxel_gi: RID) -> Transform3D:
	pass;

#desc Used to inform the renderer what exposure normalization value was used while baking the voxel gi. This value will be used and modulated at run time to ensure that the voxel gi maintains a consistent level of exposure even if the scene-wide exposure normalization is changed at run time. For more information see [method camera_attributes_set_exposure].
func voxel_gi_set_baked_exposure_normalization(voxel_gi: RID, baked_exposure: float) -> void:
	pass;

#desc Sets the [member VoxelGIData.bias] value to use on the specified [param voxel_gi]'s [RID].
func voxel_gi_set_bias(voxel_gi: RID, bias: float) -> void:
	pass;

#desc Sets the [member VoxelGIData.dynamic_range] value to use on the specified [param voxel_gi]'s [RID].
func voxel_gi_set_dynamic_range(voxel_gi: RID, range: float) -> void:
	pass;

#desc Sets the [member VoxelGIData.energy] value to use on the specified [param voxel_gi]'s [RID].
func voxel_gi_set_energy(voxel_gi: RID, energy: float) -> void:
	pass;

#desc Sets the [member VoxelGIData.interior] value to use on the specified [param voxel_gi]'s [RID].
func voxel_gi_set_interior(voxel_gi: RID, enable: bool) -> void:
	pass;

#desc Sets the [member VoxelGIData.normal_bias] value to use on the specified [param voxel_gi]'s [RID].
func voxel_gi_set_normal_bias(voxel_gi: RID, bias: float) -> void:
	pass;

#desc Sets the [member VoxelGIData.propagation] value to use on the specified [param voxel_gi]'s [RID].
func voxel_gi_set_propagation(voxel_gi: RID, amount: float) -> void:
	pass;

#desc Sets the [member ProjectSettings.rendering/global_illumination/voxel_gi/quality] value to use when rendering. This parameter is global and cannot be set on a per-VoxelGI basis.
func voxel_gi_set_quality(quality: int) -> void:
	pass;

#desc Sets the [member VoxelGIData.use_two_bounces] value to use on the specified [param voxel_gi]'s [RID].
func voxel_gi_set_use_two_bounces(voxel_gi: RID, enable: bool) -> void:
	pass;


func is_render_loop_enabled() -> bool:
	return render_loop_enabled

func set_render_loop_enabled(value: bool) -> void:
	render_loop_enabled = value

