extends Material
#brief Default 3D rendering material.
#desc This provides a default material with a wide variety of rendering features and properties without the need to write shader code. See the tutorial below for details.
#tutorial [Standard Material 3D] https://docs.godotengine.org/en/stable/tutorials/3d/standard_material_3d.html
class_name BaseMaterial3D

#desc Texture specifying per-pixel color.
#desc Texture specifying per-pixel metallic value.
#desc Texture specifying per-pixel roughness value.
#desc Texture specifying per-pixel emission color.
#desc Texture specifying per-pixel normal vector.
#desc Texture specifying per-pixel rim value.
#desc Texture specifying per-pixel clearcoat value.
#desc Texture specifying per-pixel flowmap direction for use with [member anisotropy].
#desc Texture specifying per-pixel ambient occlusion value.
#desc Texture specifying per-pixel height.
#desc Texture specifying per-pixel subsurface scattering.
#desc Texture specifying per-pixel transmittance for subsurface scattering.
#desc Texture specifying per-pixel backlight color.
#desc Texture specifying per-pixel refraction strength.
#desc Texture specifying per-pixel detail mask blending value.
#desc Texture specifying per-pixel detail color.
#desc Texture specifying per-pixel detail normal.
#desc Texture holding ambient occlusion, roughness, and metallic.
#desc Represents the size of the [enum TextureParam] enum.
#desc The texture filter reads from the nearest pixel only. The simplest and fastest method of filtering, but the texture will look pixelized.
#desc The texture filter blends between the nearest 4 pixels. Use this when you want to avoid a pixelated style, but do not want mipmaps.
#desc The texture filter reads from the nearest pixel in the nearest mipmap. The fastest way to read from textures with mipmaps.
#desc The texture filter blends between the nearest 4 pixels and between the nearest 2 mipmaps. Use this for most cases as mipmaps are important to smooth out pixels that are far from the camera.
#desc The texture filter reads from the nearest pixel, but selects a mipmap based on the angle between the surface and the camera view. This reduces artifacts on surfaces that are almost in line with the camera. The anisotropic filtering level can be changed by adjusting [member ProjectSettings.rendering/textures/default_filters/anisotropic_filtering_level].
#desc The texture filter blends between the nearest 4 pixels and selects a mipmap based on the angle between the surface and the camera view. This reduces artifacts on surfaces that are almost in line with the camera. This is the slowest of the filtering options, but results in the highest quality texturing. The anisotropic filtering level can be changed by adjusting [member ProjectSettings.rendering/textures/default_filters/anisotropic_filtering_level].
#desc Represents the size of the [enum TextureFilter] enum.
#desc Use [code]UV[/code] with the detail texture.
#desc Use [code]UV2[/code] with the detail texture.
#desc The material will not use transparency. This is the fastest to render.
#desc The material will use the texture's alpha values for transparency. This is the slowest to render, and disables shadow casting.
#desc The material will cut off all values below a threshold, the rest will remain opaque. The opaque portions will be rendered in the depth prepass. This is faster to render than alpha blending, but slower than opaque rendering. This also supports casting shadows.
#desc The material will cut off all values below a spatially-deterministic threshold, the rest will remain opaque. This is faster to render than alpha blending, but slower than opaque rendering. This also supports casting shadows. Alpha hashing is suited for hair rendering.
#desc The material will use the texture's alpha value for transparency, but will discard fragments with an alpha of less than 0.99 during the depth prepass and fragments with an alpha less than 0.1 during the shadow pass. This also supports casting shadows.
#desc Represents the size of the [enum Transparency] enum.
#desc The object will not receive shadows. This is the fastest to render, but it disables all interactions with lights.
#desc The object will be shaded per pixel. Useful for realistic shading effects.
#desc The object will be shaded per vertex. Useful when you want cheaper shaders and do not care about visual quality. Not implemented yet (this mode will act like [constant SHADING_MODE_PER_PIXEL]).
#desc Represents the size of the [enum ShadingMode] enum.
#desc Constant for setting [member emission_enabled].
#desc Constant for setting [member normal_enabled].
#desc Constant for setting [member rim_enabled].
#desc Constant for setting [member clearcoat_enabled].
#desc Constant for setting [member anisotropy_enabled].
#desc Constant for setting [member ao_enabled].
#desc Constant for setting [member heightmap_enabled].
#desc Constant for setting [member subsurf_scatter_enabled].
#desc Constant for setting [member subsurf_scatter_transmittance_enabled].
#desc Constant for setting [member backlight_enabled].
#desc Constant for setting [member refraction_enabled].
#desc Constant for setting [member detail_enabled].
#desc Represents the size of the [enum Feature] enum.
#desc Default blend mode. The color of the object is blended over the background based on the object's alpha value.
#desc The color of the object is added to the background.
#desc The color of the object is subtracted from the background.
#desc The color of the object is multiplied by the background.
#desc Disables Alpha AntiAliasing for the material.
#desc Enables AlphaToCoverage. Alpha values in the material are passed to the AntiAliasing sample mask.
#desc Enables AlphaToCoverage and forces all non-zero alpha values to [code]1[/code]. Alpha values in the material are passed to the AntiAliasing sample mask.
#desc Default depth draw mode. Depth is drawn only for opaque objects during the opaque prepass (if any) and during the opaque pass.
#desc Objects will write to depth during the opaque and the transparent passes. Transparent objects that are close to the camera may obscure other transparent objects behind them.
#desc [b]Note:[/b] This does not influence whether transparent objects are included in the depth prepass or not. For that, see [enum Transparency].
#desc Objects will not write their depth to the depth buffer, even during the depth prepass (if enabled).
#desc Default cull mode. The back of the object is culled when not visible. Back face triangles will be culled when facing the camera. This results in only the front side of triangles being drawn. For closed-surface meshes, this means that only the exterior of the mesh will be visible.
#desc Front face triangles will be culled when facing the camera. This results in only the back side of triangles being drawn. For closed-surface meshes, this means that the interior of the mesh will be drawn instead of the exterior.
#desc No face culling is performed; both the front face and back face will be visible.
#desc Disables the depth test, so this object is drawn on top of all others drawn before it. This puts the object in the transparent draw pass where it is sorted based on distance to camera. Objects drawn after it in the draw order may cover it. This also disables writing to depth.
#desc Set [code]ALBEDO[/code] to the per-vertex color specified in the mesh.
#desc Vertex colors are considered to be stored in sRGB color space and are converted to linear color space during rendering. See also [member vertex_color_is_srgb].
#desc [b]Note:[/b] Only effective when using the Forward+ and Mobile rendering methods.
#desc Uses point size to alter the size of primitive points. Also changes the albedo texture lookup to use [code]POINT_COORD[/code] instead of [code]UV[/code].
#desc Object is scaled by depth so that it always appears the same size on screen.
#desc Shader will keep the scale set for the mesh. Otherwise the scale is lost when billboarding. Only applies when [member billboard_mode] is [constant BILLBOARD_ENABLED].
#desc Use triplanar texture lookup for all texture lookups that would normally use [code]UV[/code].
#desc Use triplanar texture lookup for all texture lookups that would normally use [code]UV2[/code].
#desc Use triplanar texture lookup for all texture lookups that would normally use [code]UV[/code].
#desc Use triplanar texture lookup for all texture lookups that would normally use [code]UV2[/code].
#desc Use [code]UV2[/code] coordinates to look up from the [member ao_texture].
#desc Use [code]UV2[/code] coordinates to look up from the [member emission_texture].
#desc Forces the shader to convert albedo from sRGB space to linear space. See also [member albedo_texture_force_srgb].
#desc Disables receiving shadows from other objects.
#desc Disables receiving ambient light.
#desc Enables the shadow to opacity feature.
#desc Enables the texture to repeat when UV coordinates are outside the 0-1 range. If using one of the linear filtering modes, this can result in artifacts at the edges of a texture when the sampler filters across the edges of the texture.
#desc Invert values read from a depth texture to convert them to height values (heightmap).
#desc Enables the skin mode for subsurface scattering which is used to improve the look of subsurface scattering when used for human skin.
#desc Enables parts of the shader required for [GPUParticles3D] trails to function. This also requires using a mesh with appropriate skinning, such as [RibbonTrailMesh] or [TubeTrailMesh]. Enabling this feature outside of materials used in [GPUParticles3D] meshes will break material rendering.
#desc Enables multichannel signed distance field rendering shader.
#desc Represents the size of the [enum Flags] enum.
#desc Default diffuse scattering algorithm.
#desc Diffuse scattering ignores roughness.
#desc Extends Lambert to cover more than 90 degrees when roughness increases.
#desc Uses a hard cut for lighting, with smoothing affected by roughness.
#desc Default specular blob.
#desc Toon blob which changes size based on roughness.
#desc No specular blob. This is slightly faster to render than other specular modes.
#desc Billboard mode is disabled.
#desc The object's Z axis will always face the camera.
#desc The object's X axis will always face the camera.
#desc Used for particle systems when assigned to [GPUParticles3D] and [CPUParticles3D] nodes. Enables [code]particles_anim_*[/code] properties.
#desc The [member ParticleProcessMaterial.anim_speed_min] or [member CPUParticles3D.anim_speed_min] should also be set to a value bigger than zero for the animation to play.
#desc Used to read from the red channel of a texture.
#desc Used to read from the green channel of a texture.
#desc Used to read from the blue channel of a texture.
#desc Used to read from the alpha channel of a texture.
#desc Used to read from the linear (non-perceptual) average of the red, green and blue channels of a texture.
#desc Adds the emission color to the color from the emission texture.
#desc Multiplies the emission color by the color from the emission texture.
#desc Do not use distance fade.
#desc Smoothly fades the object out based on each pixel's distance from the camera using the alpha channel.
#desc Smoothly fades the object out based on each pixel's distance from the camera using a dithering approach. Dithering discards pixels based on a set pattern to smoothly fade without enabling transparency. On certain hardware, this can be faster than [constant DISTANCE_FADE_PIXEL_ALPHA].
#desc Smoothly fades the object out based on the object's distance from the camera using a dithering approach. Dithering discards pixels based on a set pattern to smoothly fade without enabling transparency. On certain hardware, this can be faster than [constant DISTANCE_FADE_PIXEL_ALPHA] and [constant DISTANCE_FADE_PIXEL_DITHER].

#enum TextureParam
enum {
    TEXTURE_ALBEDO = 0,
    TEXTURE_METALLIC = 1,
    TEXTURE_ROUGHNESS = 2,
    TEXTURE_EMISSION = 3,
    TEXTURE_NORMAL = 4,
    TEXTURE_RIM = 5,
    TEXTURE_CLEARCOAT = 6,
    TEXTURE_FLOWMAP = 7,
    TEXTURE_AMBIENT_OCCLUSION = 8,
    TEXTURE_HEIGHTMAP = 9,
    TEXTURE_SUBSURFACE_SCATTERING = 10,
    TEXTURE_SUBSURFACE_TRANSMITTANCE = 11,
    TEXTURE_BACKLIGHT = 12,
    TEXTURE_REFRACTION = 13,
    TEXTURE_DETAIL_MASK = 14,
    TEXTURE_DETAIL_ALBEDO = 15,
    TEXTURE_DETAIL_NORMAL = 16,
    TEXTURE_ORM = 17,
    TEXTURE_MAX = 18,
}
#enum TextureFilter
enum {
    TEXTURE_FILTER_NEAREST = 0,
    TEXTURE_FILTER_LINEAR = 1,
    TEXTURE_FILTER_NEAREST_WITH_MIPMAPS = 2,
    TEXTURE_FILTER_LINEAR_WITH_MIPMAPS = 3,
    TEXTURE_FILTER_NEAREST_WITH_MIPMAPS_ANISOTROPIC = 4,
    TEXTURE_FILTER_LINEAR_WITH_MIPMAPS_ANISOTROPIC = 5,
    TEXTURE_FILTER_MAX = 6,
}
#enum DetailUV
enum {
    DETAIL_UV_1 = 0,
    DETAIL_UV_2 = 1,
}
#enum Transparency
enum {
    TRANSPARENCY_DISABLED = 0,
    TRANSPARENCY_ALPHA = 1,
    TRANSPARENCY_ALPHA_SCISSOR = 2,
    TRANSPARENCY_ALPHA_HASH = 3,
    TRANSPARENCY_ALPHA_DEPTH_PRE_PASS = 4,
    TRANSPARENCY_MAX = 5,
}
#enum ShadingMode
enum {
    SHADING_MODE_UNSHADED = 0,
    SHADING_MODE_PER_PIXEL = 1,
    SHADING_MODE_PER_VERTEX = 2,
    SHADING_MODE_MAX = 3,
}
#enum Feature
enum {
    FEATURE_EMISSION = 0,
    FEATURE_NORMAL_MAPPING = 1,
    FEATURE_RIM = 2,
    FEATURE_CLEARCOAT = 3,
    FEATURE_ANISOTROPY = 4,
    FEATURE_AMBIENT_OCCLUSION = 5,
    FEATURE_HEIGHT_MAPPING = 6,
    FEATURE_SUBSURFACE_SCATTERING = 7,
    FEATURE_SUBSURFACE_TRANSMITTANCE = 8,
    FEATURE_BACKLIGHT = 9,
    FEATURE_REFRACTION = 10,
    FEATURE_DETAIL = 11,
    FEATURE_MAX = 12,
}
#enum BlendMode
enum {
    BLEND_MODE_MIX = 0,
    BLEND_MODE_ADD = 1,
    BLEND_MODE_SUB = 2,
    BLEND_MODE_MUL = 3,
}
#enum AlphaAntiAliasing
enum {
    ALPHA_ANTIALIASING_OFF = 0,
    ALPHA_ANTIALIASING_ALPHA_TO_COVERAGE = 1,
    ALPHA_ANTIALIASING_ALPHA_TO_COVERAGE_AND_TO_ONE = 2,
}
#enum DepthDrawMode
enum {
    DEPTH_DRAW_OPAQUE_ONLY = 0,
    DEPTH_DRAW_ALWAYS = 1,
    DEPTH_DRAW_DISABLED = 2,
}
#enum CullMode
enum {
    CULL_BACK = 0,
    CULL_FRONT = 1,
    CULL_DISABLED = 2,
}
#enum Flags
enum {
    FLAG_DISABLE_DEPTH_TEST = 0,
    FLAG_ALBEDO_FROM_VERTEX_COLOR = 1,
    FLAG_SRGB_VERTEX_COLOR = 2,
    FLAG_USE_POINT_SIZE = 3,
    FLAG_FIXED_SIZE = 4,
    FLAG_BILLBOARD_KEEP_SCALE = 5,
    FLAG_UV1_USE_TRIPLANAR = 6,
    FLAG_UV2_USE_TRIPLANAR = 7,
    FLAG_UV1_USE_WORLD_TRIPLANAR = 8,
    FLAG_UV2_USE_WORLD_TRIPLANAR = 9,
    FLAG_AO_ON_UV2 = 10,
    FLAG_EMISSION_ON_UV2 = 11,
    FLAG_ALBEDO_TEXTURE_FORCE_SRGB = 12,
    FLAG_DONT_RECEIVE_SHADOWS = 13,
    FLAG_DISABLE_AMBIENT_LIGHT = 14,
    FLAG_USE_SHADOW_TO_OPACITY = 15,
    FLAG_USE_TEXTURE_REPEAT = 16,
    FLAG_INVERT_HEIGHTMAP = 17,
    FLAG_SUBSURFACE_MODE_SKIN = 18,
    FLAG_PARTICLE_TRAILS_MODE = 19,
    FLAG_ALBEDO_TEXTURE_MSDF = 20,
    FLAG_MAX = 21,
}
#enum DiffuseMode
enum {
    DIFFUSE_BURLEY = 0,
    DIFFUSE_LAMBERT = 1,
    DIFFUSE_LAMBERT_WRAP = 2,
    DIFFUSE_TOON = 3,
}
#enum SpecularMode
enum {
    SPECULAR_SCHLICK_GGX = 0,
    SPECULAR_TOON = 1,
    SPECULAR_DISABLED = 2,
}
#enum BillboardMode
enum {
    BILLBOARD_DISABLED = 0,
    BILLBOARD_ENABLED = 1,
    BILLBOARD_FIXED_Y = 2,
    BILLBOARD_PARTICLES = 3,
}
#enum TextureChannel
enum {
    TEXTURE_CHANNEL_RED = 0,
    TEXTURE_CHANNEL_GREEN = 1,
    TEXTURE_CHANNEL_BLUE = 2,
    TEXTURE_CHANNEL_ALPHA = 3,
    TEXTURE_CHANNEL_GRAYSCALE = 4,
}
#enum EmissionOperator
enum {
    EMISSION_OP_ADD = 0,
    EMISSION_OP_MULTIPLY = 1,
}
#enum DistanceFadeMode
enum {
    DISTANCE_FADE_DISABLED = 0,
    DISTANCE_FADE_PIXEL_ALPHA = 1,
    DISTANCE_FADE_PIXEL_DITHER = 2,
    DISTANCE_FADE_OBJECT_DITHER = 3,
}
#desc The material's base color.
#desc [b]Note:[/b] If [member detail_enabled] is [code]true[/code] and a [member detail_albedo] texture is specified, [member albedo_color] will [i]not[/i] modulate the detail texture. This can be used to color partial areas of a material by not specifying an albedo texture and using a transparent [member detail_albedo] texture instead.
var albedo_color: Color:
	get = get_albedo, set = set_albedo

#desc Texture to multiply by [member albedo_color]. Used for basic texturing of objects.
#desc If the texture appears unexpectedly too dark or too bright, check [member albedo_texture_force_srgb].
var albedo_texture: Texture2D:
	get = get_texture, set = set_texture

#desc If [code]true[/code], forces a conversion of the [member albedo_texture] from sRGB color space to linear color space. See also [member vertex_color_is_srgb].
#desc This should only be enabled when needed (typically when using a [ViewportTexture] as [member albedo_texture]). If [member albedo_texture_force_srgb] is [code]true[/code] when it shouldn't be, the texture will appear to be too dark. If [member albedo_texture_force_srgb] is [code]false[/code] when it shouldn't be, the texture will appear to be too bright.
var albedo_texture_force_srgb: bool:
	get = get_flag, set = set_flag

#desc Enables multichannel signed distance field rendering shader. Use [member msdf_pixel_range] and [member msdf_outline_size] to configure MSDF parameters.
var albedo_texture_msdf: bool:
	get = get_flag, set = set_flag

#desc Threshold at which antialiasing will be applied on the alpha channel.
var alpha_antialiasing_edge: float:
	get = get_alpha_antialiasing_edge, set = set_alpha_antialiasing_edge

#desc The type of alpha antialiasing to apply. See [enum AlphaAntiAliasing].
var alpha_antialiasing_mode: int:
	get = get_alpha_antialiasing, set = set_alpha_antialiasing

#desc The hashing scale for Alpha Hash. Recommended values between [code]0[/code] and [code]2[/code].
var alpha_hash_scale: float:
	get = get_alpha_hash_scale, set = set_alpha_hash_scale

#desc Threshold at which the alpha scissor will discard values. Higher values will result in more pixels being discarded. If the material becomes too opaque at a distance, try increasing [member alpha_scissor_threshold]. If the material disappears at a distance, try decreasing [member alpha_scissor_threshold].
var alpha_scissor_threshold: float:
	get = get_alpha_scissor_threshold, set = set_alpha_scissor_threshold

#desc The strength of the anisotropy effect. This is multiplied by [member anisotropy_flowmap]'s alpha channel if a texture is defined there and the texture contains an alpha channel.
var anisotropy: float:
	get = get_anisotropy, set = set_anisotropy

#desc If [code]true[/code], anisotropy is enabled. Anisotropy changes the shape of the specular blob and aligns it to tangent space. This is useful for brushed aluminium and hair reflections.
#desc [b]Note:[/b] Mesh tangents are needed for anisotropy to work. If the mesh does not contain tangents, the anisotropy effect will appear broken.
#desc [b]Note:[/b] Material anisotropy should not to be confused with anisotropic texture filtering, which can be enabled by setting [member texture_filter] to [constant TEXTURE_FILTER_LINEAR_WITH_MIPMAPS_ANISOTROPIC].
var anisotropy_enabled: bool:
	get = get_feature, set = set_feature

#desc Texture that offsets the tangent map for anisotropy calculations and optionally controls the anisotropy effect (if an alpha channel is present). The flowmap texture is expected to be a derivative map, with the red channel representing distortion on the X axis and green channel representing distortion on the Y axis. Values below 0.5 will result in negative distortion, whereas values above 0.5 will result in positive distortion.
#desc If present, the texture's alpha channel will be used to multiply the strength of the [member anisotropy] effect. Fully opaque pixels will keep the anisotropy effect's original strength while fully transparent pixels will disable the anisotropy effect entirely. The flowmap texture's blue channel is ignored.
var anisotropy_flowmap: Texture2D:
	get = get_texture, set = set_texture

#desc If [code]true[/code], ambient occlusion is enabled. Ambient occlusion darkens areas based on the [member ao_texture].
var ao_enabled: bool:
	get = get_feature, set = set_feature

#desc Amount that ambient occlusion affects lighting from lights. If [code]0[/code], ambient occlusion only affects ambient light. If [code]1[/code], ambient occlusion affects lights just as much as it affects ambient light. This can be used to impact the strength of the ambient occlusion effect, but typically looks unrealistic.
var ao_light_affect: float:
	get = get_ao_light_affect, set = set_ao_light_affect

#desc If [code]true[/code], use [code]UV2[/code] coordinates to look up from the [member ao_texture].
var ao_on_uv2: bool:
	get = get_flag, set = set_flag

#desc Texture that defines the amount of ambient occlusion for a given point on the object.
var ao_texture: Texture2D:
	get = get_texture, set = set_texture

#desc Specifies the channel of the [member ao_texture] in which the ambient occlusion information is stored. This is useful when you store the information for multiple effects in a single texture. For example if you stored metallic in the red channel, roughness in the blue, and ambient occlusion in the green you could reduce the number of textures you use.
var ao_texture_channel: int:
	get = get_ao_texture_channel, set = set_ao_texture_channel

#desc The color used by the backlight effect. Represents the light passing through an object.
var backlight: Color:
	get = get_backlight, set = set_backlight

#desc If [code]true[/code], the backlight effect is enabled. See also [member subsurf_scatter_transmittance_enabled].
var backlight_enabled: bool:
	get = get_feature, set = set_feature

#desc Texture used to control the backlight effect per-pixel. Added to [member backlight].
var backlight_texture: Texture2D:
	get = get_texture, set = set_texture

#desc If [code]true[/code], the shader will keep the scale set for the mesh. Otherwise, the scale is lost when billboarding. Only applies when [member billboard_mode] is not [constant BILLBOARD_DISABLED].
var billboard_keep_scale: bool:
	get = get_flag, set = set_flag

#desc Controls how the object faces the camera. See [enum BillboardMode].
#desc [b]Note:[/b] Billboard mode is not suitable for VR because the left-right vector of the camera is not horizontal when the screen is attached to your head instead of on the table. See [url=https://github.com/godotengine/godot/issues/41567]GitHub issue #41567[/url] for details.
var billboard_mode: int:
	get = get_billboard_mode, set = set_billboard_mode

#desc The material's blend mode.
#desc [b]Note:[/b] Values other than [code]Mix[/code] force the object into the transparent pipeline. See [enum BlendMode].
var blend_mode: int:
	get = get_blend_mode, set = set_blend_mode

#desc Sets the strength of the clearcoat effect. Setting to [code]0[/code] looks the same as disabling the clearcoat effect.
var clearcoat: float:
	get = get_clearcoat, set = set_clearcoat

#desc If [code]true[/code], clearcoat rendering is enabled. Adds a secondary transparent pass to the lighting calculation resulting in an added specular blob. This makes materials appear as if they have a clear layer on them that can be either glossy or rough.
#desc [b]Note:[/b] Clearcoat rendering is not visible if the material's [member shading_mode] is [constant SHADING_MODE_UNSHADED].
var clearcoat_enabled: bool:
	get = get_feature, set = set_feature

#desc Sets the roughness of the clearcoat pass. A higher value results in a rougher clearcoat while a lower value results in a smoother clearcoat.
var clearcoat_roughness: float:
	get = get_clearcoat_roughness, set = set_clearcoat_roughness

#desc Texture that defines the strength of the clearcoat effect and the glossiness of the clearcoat. Strength is specified in the red channel while glossiness is specified in the green channel.
var clearcoat_texture: Texture2D:
	get = get_texture, set = set_texture

#desc Determines which side of the triangle to cull depending on whether the triangle faces towards or away from the camera. See [enum CullMode].
var cull_mode: int:
	get = get_cull_mode, set = set_cull_mode

#desc Determines when depth rendering takes place. See [enum DepthDrawMode]. See also [member transparency].
var depth_draw_mode: int:
	get = get_depth_draw_mode, set = set_depth_draw_mode

#desc Texture that specifies the color of the detail overlay. [member detail_albedo]'s alpha channel is used as a mask, even when the material is opaque. To use a dedicated texture as a mask, see [member detail_mask].
#desc [b]Note:[/b] [member detail_albedo] is [i]not[/i] modulated by [member albedo_color].
var detail_albedo: Texture2D:
	get = get_texture, set = set_texture

#desc Specifies how the [member detail_albedo] should blend with the current [code]ALBEDO[/code]. See [enum BlendMode] for options.
var detail_blend_mode: int:
	get = get_detail_blend_mode, set = set_detail_blend_mode

#desc If [code]true[/code], enables the detail overlay. Detail is a second texture that gets mixed over the surface of the object based on [member detail_mask] and [member detail_albedo]'s alpha channel. This can be used to add variation to objects, or to blend between two different albedo/normal textures.
var detail_enabled: bool:
	get = get_feature, set = set_feature

#desc Texture used to specify how the detail textures get blended with the base textures. [member detail_mask] can be used together with [member detail_albedo]'s alpha channel (if any).
var detail_mask: Texture2D:
	get = get_texture, set = set_texture

#desc Texture that specifies the per-pixel normal of the detail overlay. The [member detail_normal] texture only uses the red and green channels; the blue and alpha channels are ignored. The normal read from [member detail_normal] is oriented around the surface normal provided by the [Mesh].
#desc [b]Note:[/b] Godot expects the normal map to use X+, Y+, and Z+ coordinates. See [url=http://wiki.polycount.com/wiki/Normal_Map_Technical_Details#Common_Swizzle_Coordinates]this page[/url] for a comparison of normal map coordinates expected by popular engines.
var detail_normal: Texture2D:
	get = get_texture, set = set_texture

#desc Specifies whether to use [code]UV[/code] or [code]UV2[/code] for the detail layer. See [enum DetailUV] for options.
var detail_uv_layer: int:
	get = get_detail_uv, set = set_detail_uv

#desc The algorithm used for diffuse light scattering. See [enum DiffuseMode].
var diffuse_mode: int:
	get = get_diffuse_mode, set = set_diffuse_mode

#desc If [code]true[/code], the object receives no ambient light.
var disable_ambient_light: bool:
	get = get_flag, set = set_flag

#desc If [code]true[/code], the object receives no shadow that would otherwise be cast onto it.
var disable_receive_shadows: bool:
	get = get_flag, set = set_flag

#desc Distance at which the object appears fully opaque.
#desc [b]Note:[/b] If [code]distance_fade_max_distance[/code] is less than [code]distance_fade_min_distance[/code], the behavior will be reversed. The object will start to fade away at [code]distance_fade_max_distance[/code] and will fully disappear once it reaches [code]distance_fade_min_distance[/code].
var distance_fade_max_distance: float:
	get = get_distance_fade_max_distance, set = set_distance_fade_max_distance

#desc Distance at which the object starts to become visible. If the object is less than this distance away, it will be invisible.
#desc [b]Note:[/b] If [code]distance_fade_min_distance[/code] is greater than [code]distance_fade_max_distance[/code], the behavior will be reversed. The object will start to fade away at [code]distance_fade_max_distance[/code] and will fully disappear once it reaches [code]distance_fade_min_distance[/code].
var distance_fade_min_distance: float:
	get = get_distance_fade_min_distance, set = set_distance_fade_min_distance

#desc Specifies which type of fade to use. Can be any of the [enum DistanceFadeMode]s.
var distance_fade_mode: int:
	get = get_distance_fade, set = set_distance_fade

#desc The emitted light's color. See [member emission_enabled].
var emission: Color:
	get = get_emission, set = set_emission

#desc If [code]true[/code], the body emits light. Emitting light makes the object appear brighter. The object can also cast light on other objects if a [VoxelGI], SDFGI, or [LightmapGI] is used and this object is used in baked lighting.
var emission_enabled: bool:
	get = get_feature, set = set_feature

#desc Multiplier for emitted light. See [member emission_enabled].
var emission_energy_multiplier: float:
	get = get_emission_energy_multiplier, set = set_emission_energy_multiplier

#desc Luminance of emitted light, measured in nits (candela per square meter). Only available when [member ProjectSettings.rendering/lights_and_shadows/use_physical_light_units] is enabled. The default is roughly equivalent to an indoor lightbulb.
var emission_intensity: float:
	get = get_emission_intensity, set = set_emission_intensity

#desc Use [code]UV2[/code] to read from the [member emission_texture].
var emission_on_uv2: bool:
	get = get_flag, set = set_flag

#desc Sets how [member emission] interacts with [member emission_texture]. Can either add or multiply. See [enum EmissionOperator] for options.
var emission_operator: int:
	get = get_emission_operator, set = set_emission_operator

#desc Texture that specifies how much surface emits light at a given point.
var emission_texture: Texture2D:
	get = get_texture, set = set_texture

#desc If [code]true[/code], the object is rendered at the same size regardless of distance.
var fixed_size: bool:
	get = get_flag, set = set_flag

#desc If [code]true[/code], enables the vertex grow setting. This can be used to create mesh-based outlines using a second material pass and its [member cull_mode] set to [constant CULL_FRONT]. See also [member grow_amount].
#desc [b]Note:[/b] Vertex growth cannot create new vertices, which means that visible gaps may occur in sharp corners. This can be alleviated by designing the mesh to use smooth normals exclusively using [url=https://wiki.polycount.com/wiki/Face_weighted_normals]face weighted normals[/url] in the 3D authoring software. In this case, grow will be able to join every outline together, just like in the original mesh.
var grow: bool:
	get = is_grow_enabled, set = set_grow_enabled

#desc Grows object vertices in the direction of their normals. Only effective if [member grow] is [code]true[/code].
var grow_amount: float:
	get = get_grow, set = set_grow

#desc If [code]true[/code], uses parallax occlusion mapping to represent depth in the material instead of simple offset mapping (see [member heightmap_enabled]). This results in a more convincing depth effect, but is much more expensive on the GPU. Only enable this on materials where it makes a significant visual difference.
var heightmap_deep_parallax: bool:
	get = is_heightmap_deep_parallax_enabled, set = set_heightmap_deep_parallax

#desc If [code]true[/code], height mapping is enabled (also called "parallax mapping" or "depth mapping"). See also [member normal_enabled]. Height mapping is a demanding feature on the GPU, so it should only be used on materials where it makes a significant visual difference.
#desc [b]Note:[/b] Height mapping is not supported if triplanar mapping is used on the same material. The value of [member heightmap_enabled] will be ignored if [member uv1_triplanar] is enabled.
var heightmap_enabled: bool:
	get = get_feature, set = set_feature

#desc If [code]true[/code], flips the mesh's binormal vectors when interpreting the height map. If the heightmap effect looks strange when the camera moves (even with a reasonable [member heightmap_scale]), try setting this to [code]true[/code].
var heightmap_flip_binormal: bool:
	get = get_heightmap_deep_parallax_flip_binormal, set = set_heightmap_deep_parallax_flip_binormal

#desc If [code]true[/code], flips the mesh's tangent vectors when interpreting the height map. If the heightmap effect looks strange when the camera moves (even with a reasonable [member heightmap_scale]), try setting this to [code]true[/code].
var heightmap_flip_tangent: bool:
	get = get_heightmap_deep_parallax_flip_tangent, set = set_heightmap_deep_parallax_flip_tangent

#desc If [code]true[/code], interprets the height map texture as a depth map, with brighter values appearing to be "lower" in altitude compared to darker values.
#desc This can be enabled for compatibility with some materials authored for Godot 3.x. This is not necessary if the Invert import option was used to invert the depth map in Godot 3.x, in which case [member heightmap_flip_texture] should remain [code]false[/code].
var heightmap_flip_texture: bool:
	get = get_flag, set = set_flag

#desc The number of layers to use for parallax occlusion mapping when the camera is up close to the material. Higher values result in a more convincing depth effect, especially in materials that have steep height changes. Higher values have a significant cost on the GPU, so it should only be increased on materials where it makes a significant visual difference.
#desc [b]Note:[/b] Only effective if [member heightmap_deep_parallax] is [code]true[/code].
var heightmap_max_layers: int:
	get = get_heightmap_deep_parallax_max_layers, set = set_heightmap_deep_parallax_max_layers

#desc The number of layers to use for parallax occlusion mapping when the camera is far away from the material. Higher values result in a more convincing depth effect, especially in materials that have steep height changes. Higher values have a significant cost on the GPU, so it should only be increased on materials where it makes a significant visual difference.
#desc [b]Note:[/b] Only effective if [member heightmap_deep_parallax] is [code]true[/code].
var heightmap_min_layers: int:
	get = get_heightmap_deep_parallax_min_layers, set = set_heightmap_deep_parallax_min_layers

#desc The heightmap scale to use for the parallax effect (see [member heightmap_enabled]). The default value is tuned so that the highest point (value = 255) appears to be 5 cm higher than the lowest point (value = 0). Higher values result in a deeper appearance, but may result in artifacts appearing when looking at the material from oblique angles, especially when the camera moves. Negative values can be used to invert the parallax effect, but this is different from inverting the texture using [member heightmap_flip_texture] as the material will also appear to be "closer" to the camera. In most cases, [member heightmap_scale] should be kept to a positive value.
#desc [b]Note:[/b] If the height map effect looks strange regardless of this value, try adjusting [member heightmap_flip_binormal] and [member heightmap_flip_tangent]. See also [member heightmap_texture] for recommendations on authoring heightmap textures, as the way the heightmap texture is authored affects how [member heightmap_scale] behaves.
var heightmap_scale: float:
	get = get_heightmap_scale, set = set_heightmap_scale

#desc The texture to use as a height map. See also [member heightmap_enabled].
#desc For best results, the texture should be normalized (with [member heightmap_scale] reduced to compensate). In [url=https://gimp.org]GIMP[/url], this can be done using [b]Colors > Auto > Equalize[/b]. If the texture only uses a small part of its available range, the parallax effect may look strange, especially when the camera moves.
#desc [b]Note:[/b] To reduce memory usage and improve loading times, you may be able to use a lower-resolution heightmap texture as most heightmaps are only comprised of low-frequency data.
var heightmap_texture: Texture2D:
	get = get_texture, set = set_texture

#desc A high value makes the material appear more like a metal. Non-metals use their albedo as the diffuse color and add diffuse to the specular reflection. With non-metals, the reflection appears on top of the albedo color. Metals use their albedo as a multiplier to the specular reflection and set the diffuse color to black resulting in a tinted reflection. Materials work better when fully metal or fully non-metal, values between [code]0[/code] and [code]1[/code] should only be used for blending between metal and non-metal sections. To alter the amount of reflection use [member roughness].
var metallic: float:
	get = get_metallic, set = set_metallic

#desc Adjusts the strength of specular reflections. Specular reflections are composed of scene reflections and the specular lobe which is the bright spot that is reflected from light sources. When set to [code]0.0[/code], no specular reflections will be visible. This differs from the [constant SPECULAR_DISABLED] [enum SpecularMode] as [constant SPECULAR_DISABLED] only applies to the specular lobe from the light source.
#desc [b]Note:[/b] Unlike [member metallic], this is not energy-conserving, so it should be left at [code]0.5[/code] in most cases. See also [member roughness].
var metallic_specular: float:
	get = get_specular, set = set_specular

#desc Texture used to specify metallic for an object. This is multiplied by [member metallic].
var metallic_texture: Texture2D:
	get = get_texture, set = set_texture

#desc Specifies the channel of the [member metallic_texture] in which the metallic information is stored. This is useful when you store the information for multiple effects in a single texture. For example if you stored metallic in the red channel, roughness in the blue, and ambient occlusion in the green you could reduce the number of textures you use.
var metallic_texture_channel: int:
	get = get_metallic_texture_channel, set = set_metallic_texture_channel

#desc The width of the shape outine.
var msdf_outline_size: float:
	get = get_msdf_outline_size, set = set_msdf_outline_size

#desc The width of the range around the shape between the minimum and maximum representable signed distance.
var msdf_pixel_range: float:
	get = get_msdf_pixel_range, set = set_msdf_pixel_range

#desc If [code]true[/code], depth testing is disabled and the object will be drawn in render order.
var no_depth_test: bool:
	get = get_flag, set = set_flag

#desc If [code]true[/code], normal mapping is enabled. This has a slight performance cost, especially on mobile GPUs.
var normal_enabled: bool:
	get = get_feature, set = set_feature

#desc The strength of the normal map's effect.
var normal_scale: float:
	get = get_normal_scale, set = set_normal_scale

#desc Texture used to specify the normal at a given pixel. The [member normal_texture] only uses the red and green channels; the blue and alpha channels are ignored. The normal read from [member normal_texture] is oriented around the surface normal provided by the [Mesh].
#desc [b]Note:[/b] The mesh must have both normals and tangents defined in its vertex data. Otherwise, the normal map won't render correctly and will only appear to darken the whole surface. If creating geometry with [SurfaceTool], you can use [method SurfaceTool.generate_normals] and [method SurfaceTool.generate_tangents] to automatically generate normals and tangents respectively.
#desc [b]Note:[/b] Godot expects the normal map to use X+, Y+, and Z+ coordinates. See [url=http://wiki.polycount.com/wiki/Normal_Map_Technical_Details#Common_Swizzle_Coordinates]this page[/url] for a comparison of normal map coordinates expected by popular engines.
#desc [b]Note:[/b] If [member detail_enabled] is [code]true[/code], the [member detail_albedo] texture is drawn [i]below[/i] the [member normal_texture]. To display a normal map [i]above[/i] the [member detail_albedo] texture, use [member detail_normal] instead.
var normal_texture: Texture2D:
	get = get_texture, set = set_texture

#desc The Occlusion/Roughness/Metallic texture to use. This is a more efficient replacement of [member ao_texture], [member roughness_texture] and [member metallic_texture] in [ORMMaterial3D]. Ambient occlusion is stored in the red channel. Roughness map is stored in the green channel. Metallic map is stored in the blue channel. The alpha channel is ignored.
var orm_texture: Texture2D:
	get = get_texture, set = set_texture

#desc The number of horizontal frames in the particle sprite sheet. Only enabled when using [constant BILLBOARD_PARTICLES]. See [member billboard_mode].
var particles_anim_h_frames: int:
	get = get_particles_anim_h_frames, set = set_particles_anim_h_frames

#desc If [code]true[/code], particle animations are looped. Only enabled when using [constant BILLBOARD_PARTICLES]. See [member billboard_mode].
var particles_anim_loop: bool:
	get = get_particles_anim_loop, set = set_particles_anim_loop

#desc The number of vertical frames in the particle sprite sheet. Only enabled when using [constant BILLBOARD_PARTICLES]. See [member billboard_mode].
var particles_anim_v_frames: int:
	get = get_particles_anim_v_frames, set = set_particles_anim_v_frames

#desc The point size in pixels. See [member use_point_size].
var point_size: float:
	get = get_point_size, set = set_point_size

#desc Distance over which the fade effect takes place. The larger the distance the longer it takes for an object to fade.
var proximity_fade_distance: float:
	get = get_proximity_fade_distance, set = set_proximity_fade_distance

#desc If [code]true[/code], the proximity fade effect is enabled. The proximity fade effect fades out each pixel based on its distance to another object.
var proximity_fade_enabled: bool:
	get = is_proximity_fade_enabled, set = set_proximity_fade_enabled

#desc If [code]true[/code], the refraction effect is enabled. Distorts transparency based on light from behind the object.
var refraction_enabled: bool:
	get = get_feature, set = set_feature

#desc The strength of the refraction effect.
var refraction_scale: float:
	get = get_refraction, set = set_refraction

#desc Texture that controls the strength of the refraction per-pixel. Multiplied by [member refraction_scale].
var refraction_texture: Texture2D:
	get = get_texture, set = set_texture

#desc Specifies the channel of the [member refraction_texture] in which the refraction information is stored. This is useful when you store the information for multiple effects in a single texture. For example if you stored refraction in the red channel, roughness in the blue, and ambient occlusion in the green you could reduce the number of textures you use.
var refraction_texture_channel: int:
	get = get_refraction_texture_channel, set = set_refraction_texture_channel

#desc Sets the strength of the rim lighting effect.
var rim: float:
	get = get_rim, set = set_rim

#desc If [code]true[/code], rim effect is enabled. Rim lighting increases the brightness at glancing angles on an object.
#desc [b]Note:[/b] Rim lighting is not visible if the material's [member shading_mode] is [constant SHADING_MODE_UNSHADED].
var rim_enabled: bool:
	get = get_feature, set = set_feature

#desc Texture used to set the strength of the rim lighting effect per-pixel. Multiplied by [member rim].
var rim_texture: Texture2D:
	get = get_texture, set = set_texture

#desc The amount of to blend light and albedo color when rendering rim effect. If [code]0[/code] the light color is used, while [code]1[/code] means albedo color is used. An intermediate value generally works best.
var rim_tint: float:
	get = get_rim_tint, set = set_rim_tint

#desc Surface reflection. A value of [code]0[/code] represents a perfect mirror while a value of [code]1[/code] completely blurs the reflection. See also [member metallic].
var roughness: float:
	get = get_roughness, set = set_roughness

#desc Texture used to control the roughness per-pixel. Multiplied by [member roughness].
var roughness_texture: Texture2D:
	get = get_texture, set = set_texture

#desc Specifies the channel of the [member roughness_texture] in which the roughness information is stored. This is useful when you store the information for multiple effects in a single texture. For example if you stored metallic in the red channel, roughness in the blue, and ambient occlusion in the green you could reduce the number of textures you use.
var roughness_texture_channel: int:
	get = get_roughness_texture_channel, set = set_roughness_texture_channel

#desc Sets whether the shading takes place, per-pixel, per-vertex or unshaded. Per-vertex lighting is faster, making it the best choice for mobile applications, however it looks considerably worse than per-pixel. Unshaded rendering is the fastest, but disables all interactions with lights.
#desc [b]Note:[/b] Setting the shading mode vertex shading currently has no effect, as vertex shading is not implemented yet.
var shading_mode: int:
	get = get_shading_mode, set = set_shading_mode

#desc If [code]true[/code], enables the "shadow to opacity" render mode where lighting modifies the alpha so shadowed areas are opaque and non-shadowed areas are transparent. Useful for overlaying shadows onto a camera feed in AR.
var shadow_to_opacity: bool:
	get = get_flag, set = set_flag

#desc The method for rendering the specular blob. See [enum SpecularMode].
#desc [b]Note:[/b] [member specular_mode] only applies to the specular blob. It does not affect specular reflections from the sky, screen-space reflections, [VoxelGI], SDFGI or [ReflectionProbe]s. To disable reflections from these sources as well, set [member metallic_specular] to [code]0.0[/code] instead.
var specular_mode: int:
	get = get_specular_mode, set = set_specular_mode

#desc If [code]true[/code], subsurface scattering is enabled. Emulates light that penetrates an object's surface, is scattered, and then emerges. Subsurface scattering quality is controlled by [member ProjectSettings.rendering/environment/subsurface_scattering/subsurface_scattering_quality].
var subsurf_scatter_enabled: bool:
	get = get_feature, set = set_feature

#desc If [code]true[/code], subsurface scattering will use a special mode optimized for the color and density of human skin, such as boosting the intensity of the red channel in subsurface scattering.
var subsurf_scatter_skin_mode: bool:
	get = get_flag, set = set_flag

#desc The strength of the subsurface scattering effect. The depth of the effect is also controlled by [member ProjectSettings.rendering/environment/subsurface_scattering/subsurface_scattering_scale], which is set globally.
var subsurf_scatter_strength: float:
	get = get_subsurface_scattering_strength, set = set_subsurface_scattering_strength

#desc Texture used to control the subsurface scattering strength. Stored in the red texture channel. Multiplied by [member subsurf_scatter_strength].
var subsurf_scatter_texture: Texture2D:
	get = get_texture, set = set_texture

#desc The intensity of the subsurface scattering transmittance effect.
var subsurf_scatter_transmittance_boost: float:
	get = get_transmittance_boost, set = set_transmittance_boost

#desc The color to multiply the subsurface scattering transmittance effect with. Ignored if [member subsurf_scatter_skin_mode] is [code]true[/code].
var subsurf_scatter_transmittance_color: Color:
	get = get_transmittance_color, set = set_transmittance_color

#desc The depth of the subsurface scattering transmittance effect.
var subsurf_scatter_transmittance_depth: float:
	get = get_transmittance_depth, set = set_transmittance_depth

#desc If [code]true[/code], enables subsurface scattering transmittance. Only effective if [member subsurf_scatter_enabled] is [code]true[/code]. See also [member backlight_enabled].
var subsurf_scatter_transmittance_enabled: bool:
	get = get_feature, set = set_feature

#desc The texture to use for multiplying the intensity of the subsurface scattering transmitteance intensity. See also [member subsurf_scatter_texture]. Ignored if [member subsurf_scatter_skin_mode] is [code]true[/code].
var subsurf_scatter_transmittance_texture: Texture2D:
	get = get_texture, set = set_texture

#desc Filter flags for the texture. See [enum TextureFilter] for options.
#desc [b]Note:[/b] [member heightmap_texture] is always sampled with linear filtering, even if nearest-neighbor filtering is selected here. This is to ensure the heightmap effect looks as intended. If you need sharper height transitions between pixels, resize the heightmap texture in an image editor with nearest-neighbor filtering.
var texture_filter: int:
	get = get_texture_filter, set = set_texture_filter

#desc Repeat flags for the texture. See [enum TextureFilter] for options.
var texture_repeat: bool:
	get = get_flag, set = set_flag

#desc The material's transparency mode. Some transparency modes will disable shadow casting. Any transparency mode other than [constant TRANSPARENCY_DISABLED] has a greater performance impact compared to opaque rendering. See also [member blend_mode].
var transparency: int:
	get = get_transparency, set = set_transparency

#desc If [code]true[/code], enables parts of the shader required for [GPUParticles3D] trails to function. This also requires using a mesh with appropriate skinning, such as [RibbonTrailMesh] or [TubeTrailMesh]. Enabling this feature outside of materials used in [GPUParticles3D] meshes will break material rendering.
var use_particle_trails: bool:
	get = get_flag, set = set_flag

#desc If [code]true[/code], render point size can be changed.
#desc [b]Note:[/b] This is only effective for objects whose geometry is point-based rather than triangle-based. See also [member point_size].
var use_point_size: bool:
	get = get_flag, set = set_flag

#desc How much to offset the [code]UV[/code] coordinates. This amount will be added to [code]UV[/code] in the vertex function. This can be used to offset a texture. The Z component is used when [member uv1_triplanar] is enabled, but it is not used anywhere else.
var uv1_offset: Vector3:
	get = get_uv1_offset, set = set_uv1_offset

#desc How much to scale the [code]UV[/code] coordinates. This is multiplied by [code]UV[/code] in the vertex function. The Z component is used when [member uv1_triplanar] is enabled, but it is not used anywhere else.
var uv1_scale: Vector3:
	get = get_uv1_scale, set = set_uv1_scale

#desc If [code]true[/code], instead of using [code]UV[/code] textures will use a triplanar texture lookup to determine how to apply textures. Triplanar uses the orientation of the object's surface to blend between texture coordinates. It reads from the source texture 3 times, once for each axis and then blends between the results based on how closely the pixel aligns with each axis. This is often used for natural features to get a realistic blend of materials. Because triplanar texturing requires many more texture reads per-pixel it is much slower than normal UV texturing. Additionally, because it is blending the texture between the three axes, it is unsuitable when you are trying to achieve crisp texturing.
var uv1_triplanar: bool:
	get = get_flag, set = set_flag

#desc A lower number blends the texture more softly while a higher number blends the texture more sharply.
#desc [b]Note:[/b] [member uv1_triplanar_sharpness] is clamped between [code]0.0[/code] and [code]150.0[/code] (inclusive) as values outside that range can look broken depending on the mesh.
var uv1_triplanar_sharpness: float:
	get = get_uv1_triplanar_blend_sharpness, set = set_uv1_triplanar_blend_sharpness

#desc If [code]true[/code], triplanar mapping for [code]UV[/code] is calculated in world space rather than object local space. See also [member uv1_triplanar].
var uv1_world_triplanar: bool:
	get = get_flag, set = set_flag

#desc How much to offset the [code]UV2[/code] coordinates. This amount will be added to [code]UV2[/code] in the vertex function. This can be used to offset a texture. The Z component is used when [member uv2_triplanar] is enabled, but it is not used anywhere else.
var uv2_offset: Vector3:
	get = get_uv2_offset, set = set_uv2_offset

#desc How much to scale the [code]UV2[/code] coordinates. This is multiplied by [code]UV2[/code] in the vertex function. The Z component is used when [member uv2_triplanar] is enabled, but it is not used anywhere else.
var uv2_scale: Vector3:
	get = get_uv2_scale, set = set_uv2_scale

#desc If [code]true[/code], instead of using [code]UV2[/code] textures will use a triplanar texture lookup to determine how to apply textures. Triplanar uses the orientation of the object's surface to blend between texture coordinates. It reads from the source texture 3 times, once for each axis and then blends between the results based on how closely the pixel aligns with each axis. This is often used for natural features to get a realistic blend of materials. Because triplanar texturing requires many more texture reads per-pixel it is much slower than normal UV texturing. Additionally, because it is blending the texture between the three axes, it is unsuitable when you are trying to achieve crisp texturing.
var uv2_triplanar: bool:
	get = get_flag, set = set_flag

#desc A lower number blends the texture more softly while a higher number blends the texture more sharply.
#desc [b]Note:[/b] [member uv2_triplanar_sharpness] is clamped between [code]0.0[/code] and [code]150.0[/code] (inclusive) as values outside that range can look broken depending on the mesh.
var uv2_triplanar_sharpness: float:
	get = get_uv2_triplanar_blend_sharpness, set = set_uv2_triplanar_blend_sharpness

#desc If [code]true[/code], triplanar mapping for [code]UV2[/code] is calculated in world space rather than object local space. See also [member uv2_triplanar].
var uv2_world_triplanar: bool:
	get = get_flag, set = set_flag

#desc If [code]true[/code], vertex colors are considered to be stored in sRGB color space and are converted to linear color space during rendering. If [code]false[/code], vertex colors are considered to be stored in linear color space and are rendered as-is. See also [member albedo_texture_force_srgb].
#desc [b]Note:[/b] Only effective when using the Forward+ and Mobile rendering methods, not Compatibility.
var vertex_color_is_srgb: bool:
	get = get_flag, set = set_flag

#desc If [code]true[/code], the vertex color is used as albedo color.
var vertex_color_use_as_albedo: bool:
	get = get_flag, set = set_flag



#desc Returns [code]true[/code], if the specified [enum Feature] is enabled.
func get_feature(feature: int) -> bool:
	pass;

#desc Returns [code]true[/code], if the specified flag is enabled. See [enum Flags] enumerator for options.
func get_flag(flag: int) -> bool:
	pass;

#desc Returns the [Texture2D] associated with the specified [enum TextureParam].
func get_texture(param: int) -> Texture2D:
	pass;

#desc If [code]true[/code], enables the specified [enum Feature]. Many features that are available in [BaseMaterial3D]s need to be enabled before use. This way the cost for using the feature is only incurred when specified. Features can also be enabled by setting the corresponding member to [code]true[/code].
func set_feature(feature: int, enable: bool) -> void:
	pass;

#desc If [code]true[/code], enables the specified flag. Flags are optional behavior that can be turned on and off. Only one flag can be enabled at a time with this function, the flag enumerators cannot be bit-masked together to enable or disable multiple flags at once. Flags can also be enabled by setting the corresponding member to [code]true[/code]. See [enum Flags] enumerator for options.
func set_flag(flag: int, enable: bool) -> void:
	pass;

#desc Sets the texture for the slot specified by [param param]. See [enum TextureParam] for available slots.
func set_texture(param: int, texture: Texture2D) -> void:
	pass;


func get_albedo() -> Color:
	return albedo_color

func set_albedo(value: Color) -> void:
	albedo_color = value

func get_texture() -> Texture2D:
	return albedo_texture

func set_texture(value: Texture2D) -> void:
	albedo_texture = value

func get_flag() -> bool:
	return albedo_texture_force_srgb

func set_flag(value: bool) -> void:
	albedo_texture_force_srgb = value

func get_flag() -> bool:
	return albedo_texture_msdf

func set_flag(value: bool) -> void:
	albedo_texture_msdf = value

func get_alpha_antialiasing_edge() -> float:
	return alpha_antialiasing_edge

func set_alpha_antialiasing_edge(value: float) -> void:
	alpha_antialiasing_edge = value

func get_alpha_antialiasing() -> int:
	return alpha_antialiasing_mode

func set_alpha_antialiasing(value: int) -> void:
	alpha_antialiasing_mode = value

func get_alpha_hash_scale() -> float:
	return alpha_hash_scale

func set_alpha_hash_scale(value: float) -> void:
	alpha_hash_scale = value

func get_alpha_scissor_threshold() -> float:
	return alpha_scissor_threshold

func set_alpha_scissor_threshold(value: float) -> void:
	alpha_scissor_threshold = value

func get_anisotropy() -> float:
	return anisotropy

func set_anisotropy(value: float) -> void:
	anisotropy = value

func get_feature() -> bool:
	return anisotropy_enabled

func set_feature(value: bool) -> void:
	anisotropy_enabled = value

func get_texture() -> Texture2D:
	return anisotropy_flowmap

func set_texture(value: Texture2D) -> void:
	anisotropy_flowmap = value

func get_feature() -> bool:
	return ao_enabled

func set_feature(value: bool) -> void:
	ao_enabled = value

func get_ao_light_affect() -> float:
	return ao_light_affect

func set_ao_light_affect(value: float) -> void:
	ao_light_affect = value

func get_flag() -> bool:
	return ao_on_uv2

func set_flag(value: bool) -> void:
	ao_on_uv2 = value

func get_texture() -> Texture2D:
	return ao_texture

func set_texture(value: Texture2D) -> void:
	ao_texture = value

func get_ao_texture_channel() -> int:
	return ao_texture_channel

func set_ao_texture_channel(value: int) -> void:
	ao_texture_channel = value

func get_backlight() -> Color:
	return backlight

func set_backlight(value: Color) -> void:
	backlight = value

func get_feature() -> bool:
	return backlight_enabled

func set_feature(value: bool) -> void:
	backlight_enabled = value

func get_texture() -> Texture2D:
	return backlight_texture

func set_texture(value: Texture2D) -> void:
	backlight_texture = value

func get_flag() -> bool:
	return billboard_keep_scale

func set_flag(value: bool) -> void:
	billboard_keep_scale = value

func get_billboard_mode() -> int:
	return billboard_mode

func set_billboard_mode(value: int) -> void:
	billboard_mode = value

func get_blend_mode() -> int:
	return blend_mode

func set_blend_mode(value: int) -> void:
	blend_mode = value

func get_clearcoat() -> float:
	return clearcoat

func set_clearcoat(value: float) -> void:
	clearcoat = value

func get_feature() -> bool:
	return clearcoat_enabled

func set_feature(value: bool) -> void:
	clearcoat_enabled = value

func get_clearcoat_roughness() -> float:
	return clearcoat_roughness

func set_clearcoat_roughness(value: float) -> void:
	clearcoat_roughness = value

func get_texture() -> Texture2D:
	return clearcoat_texture

func set_texture(value: Texture2D) -> void:
	clearcoat_texture = value

func get_cull_mode() -> int:
	return cull_mode

func set_cull_mode(value: int) -> void:
	cull_mode = value

func get_depth_draw_mode() -> int:
	return depth_draw_mode

func set_depth_draw_mode(value: int) -> void:
	depth_draw_mode = value

func get_texture() -> Texture2D:
	return detail_albedo

func set_texture(value: Texture2D) -> void:
	detail_albedo = value

func get_detail_blend_mode() -> int:
	return detail_blend_mode

func set_detail_blend_mode(value: int) -> void:
	detail_blend_mode = value

func get_feature() -> bool:
	return detail_enabled

func set_feature(value: bool) -> void:
	detail_enabled = value

func get_texture() -> Texture2D:
	return detail_mask

func set_texture(value: Texture2D) -> void:
	detail_mask = value

func get_texture() -> Texture2D:
	return detail_normal

func set_texture(value: Texture2D) -> void:
	detail_normal = value

func get_detail_uv() -> int:
	return detail_uv_layer

func set_detail_uv(value: int) -> void:
	detail_uv_layer = value

func get_diffuse_mode() -> int:
	return diffuse_mode

func set_diffuse_mode(value: int) -> void:
	diffuse_mode = value

func get_flag() -> bool:
	return disable_ambient_light

func set_flag(value: bool) -> void:
	disable_ambient_light = value

func get_flag() -> bool:
	return disable_receive_shadows

func set_flag(value: bool) -> void:
	disable_receive_shadows = value

func get_distance_fade_max_distance() -> float:
	return distance_fade_max_distance

func set_distance_fade_max_distance(value: float) -> void:
	distance_fade_max_distance = value

func get_distance_fade_min_distance() -> float:
	return distance_fade_min_distance

func set_distance_fade_min_distance(value: float) -> void:
	distance_fade_min_distance = value

func get_distance_fade() -> int:
	return distance_fade_mode

func set_distance_fade(value: int) -> void:
	distance_fade_mode = value

func get_emission() -> Color:
	return emission

func set_emission(value: Color) -> void:
	emission = value

func get_feature() -> bool:
	return emission_enabled

func set_feature(value: bool) -> void:
	emission_enabled = value

func get_emission_energy_multiplier() -> float:
	return emission_energy_multiplier

func set_emission_energy_multiplier(value: float) -> void:
	emission_energy_multiplier = value

func get_emission_intensity() -> float:
	return emission_intensity

func set_emission_intensity(value: float) -> void:
	emission_intensity = value

func get_flag() -> bool:
	return emission_on_uv2

func set_flag(value: bool) -> void:
	emission_on_uv2 = value

func get_emission_operator() -> int:
	return emission_operator

func set_emission_operator(value: int) -> void:
	emission_operator = value

func get_texture() -> Texture2D:
	return emission_texture

func set_texture(value: Texture2D) -> void:
	emission_texture = value

func get_flag() -> bool:
	return fixed_size

func set_flag(value: bool) -> void:
	fixed_size = value

func is_grow_enabled() -> bool:
	return grow

func set_grow_enabled(value: bool) -> void:
	grow = value

func get_grow() -> float:
	return grow_amount

func set_grow(value: float) -> void:
	grow_amount = value

func is_heightmap_deep_parallax_enabled() -> bool:
	return heightmap_deep_parallax

func set_heightmap_deep_parallax(value: bool) -> void:
	heightmap_deep_parallax = value

func get_feature() -> bool:
	return heightmap_enabled

func set_feature(value: bool) -> void:
	heightmap_enabled = value

func get_heightmap_deep_parallax_flip_binormal() -> bool:
	return heightmap_flip_binormal

func set_heightmap_deep_parallax_flip_binormal(value: bool) -> void:
	heightmap_flip_binormal = value

func get_heightmap_deep_parallax_flip_tangent() -> bool:
	return heightmap_flip_tangent

func set_heightmap_deep_parallax_flip_tangent(value: bool) -> void:
	heightmap_flip_tangent = value

func get_flag() -> bool:
	return heightmap_flip_texture

func set_flag(value: bool) -> void:
	heightmap_flip_texture = value

func get_heightmap_deep_parallax_max_layers() -> int:
	return heightmap_max_layers

func set_heightmap_deep_parallax_max_layers(value: int) -> void:
	heightmap_max_layers = value

func get_heightmap_deep_parallax_min_layers() -> int:
	return heightmap_min_layers

func set_heightmap_deep_parallax_min_layers(value: int) -> void:
	heightmap_min_layers = value

func get_heightmap_scale() -> float:
	return heightmap_scale

func set_heightmap_scale(value: float) -> void:
	heightmap_scale = value

func get_texture() -> Texture2D:
	return heightmap_texture

func set_texture(value: Texture2D) -> void:
	heightmap_texture = value

func get_metallic() -> float:
	return metallic

func set_metallic(value: float) -> void:
	metallic = value

func get_specular() -> float:
	return metallic_specular

func set_specular(value: float) -> void:
	metallic_specular = value

func get_texture() -> Texture2D:
	return metallic_texture

func set_texture(value: Texture2D) -> void:
	metallic_texture = value

func get_metallic_texture_channel() -> int:
	return metallic_texture_channel

func set_metallic_texture_channel(value: int) -> void:
	metallic_texture_channel = value

func get_msdf_outline_size() -> float:
	return msdf_outline_size

func set_msdf_outline_size(value: float) -> void:
	msdf_outline_size = value

func get_msdf_pixel_range() -> float:
	return msdf_pixel_range

func set_msdf_pixel_range(value: float) -> void:
	msdf_pixel_range = value

func get_flag() -> bool:
	return no_depth_test

func set_flag(value: bool) -> void:
	no_depth_test = value

func get_feature() -> bool:
	return normal_enabled

func set_feature(value: bool) -> void:
	normal_enabled = value

func get_normal_scale() -> float:
	return normal_scale

func set_normal_scale(value: float) -> void:
	normal_scale = value

func get_texture() -> Texture2D:
	return normal_texture

func set_texture(value: Texture2D) -> void:
	normal_texture = value

func get_texture() -> Texture2D:
	return orm_texture

func set_texture(value: Texture2D) -> void:
	orm_texture = value

func get_particles_anim_h_frames() -> int:
	return particles_anim_h_frames

func set_particles_anim_h_frames(value: int) -> void:
	particles_anim_h_frames = value

func get_particles_anim_loop() -> bool:
	return particles_anim_loop

func set_particles_anim_loop(value: bool) -> void:
	particles_anim_loop = value

func get_particles_anim_v_frames() -> int:
	return particles_anim_v_frames

func set_particles_anim_v_frames(value: int) -> void:
	particles_anim_v_frames = value

func get_point_size() -> float:
	return point_size

func set_point_size(value: float) -> void:
	point_size = value

func get_proximity_fade_distance() -> float:
	return proximity_fade_distance

func set_proximity_fade_distance(value: float) -> void:
	proximity_fade_distance = value

func is_proximity_fade_enabled() -> bool:
	return proximity_fade_enabled

func set_proximity_fade_enabled(value: bool) -> void:
	proximity_fade_enabled = value

func get_feature() -> bool:
	return refraction_enabled

func set_feature(value: bool) -> void:
	refraction_enabled = value

func get_refraction() -> float:
	return refraction_scale

func set_refraction(value: float) -> void:
	refraction_scale = value

func get_texture() -> Texture2D:
	return refraction_texture

func set_texture(value: Texture2D) -> void:
	refraction_texture = value

func get_refraction_texture_channel() -> int:
	return refraction_texture_channel

func set_refraction_texture_channel(value: int) -> void:
	refraction_texture_channel = value

func get_rim() -> float:
	return rim

func set_rim(value: float) -> void:
	rim = value

func get_feature() -> bool:
	return rim_enabled

func set_feature(value: bool) -> void:
	rim_enabled = value

func get_texture() -> Texture2D:
	return rim_texture

func set_texture(value: Texture2D) -> void:
	rim_texture = value

func get_rim_tint() -> float:
	return rim_tint

func set_rim_tint(value: float) -> void:
	rim_tint = value

func get_roughness() -> float:
	return roughness

func set_roughness(value: float) -> void:
	roughness = value

func get_texture() -> Texture2D:
	return roughness_texture

func set_texture(value: Texture2D) -> void:
	roughness_texture = value

func get_roughness_texture_channel() -> int:
	return roughness_texture_channel

func set_roughness_texture_channel(value: int) -> void:
	roughness_texture_channel = value

func get_shading_mode() -> int:
	return shading_mode

func set_shading_mode(value: int) -> void:
	shading_mode = value

func get_flag() -> bool:
	return shadow_to_opacity

func set_flag(value: bool) -> void:
	shadow_to_opacity = value

func get_specular_mode() -> int:
	return specular_mode

func set_specular_mode(value: int) -> void:
	specular_mode = value

func get_feature() -> bool:
	return subsurf_scatter_enabled

func set_feature(value: bool) -> void:
	subsurf_scatter_enabled = value

func get_flag() -> bool:
	return subsurf_scatter_skin_mode

func set_flag(value: bool) -> void:
	subsurf_scatter_skin_mode = value

func get_subsurface_scattering_strength() -> float:
	return subsurf_scatter_strength

func set_subsurface_scattering_strength(value: float) -> void:
	subsurf_scatter_strength = value

func get_texture() -> Texture2D:
	return subsurf_scatter_texture

func set_texture(value: Texture2D) -> void:
	subsurf_scatter_texture = value

func get_transmittance_boost() -> float:
	return subsurf_scatter_transmittance_boost

func set_transmittance_boost(value: float) -> void:
	subsurf_scatter_transmittance_boost = value

func get_transmittance_color() -> Color:
	return subsurf_scatter_transmittance_color

func set_transmittance_color(value: Color) -> void:
	subsurf_scatter_transmittance_color = value

func get_transmittance_depth() -> float:
	return subsurf_scatter_transmittance_depth

func set_transmittance_depth(value: float) -> void:
	subsurf_scatter_transmittance_depth = value

func get_feature() -> bool:
	return subsurf_scatter_transmittance_enabled

func set_feature(value: bool) -> void:
	subsurf_scatter_transmittance_enabled = value

func get_texture() -> Texture2D:
	return subsurf_scatter_transmittance_texture

func set_texture(value: Texture2D) -> void:
	subsurf_scatter_transmittance_texture = value

func get_texture_filter() -> int:
	return texture_filter

func set_texture_filter(value: int) -> void:
	texture_filter = value

func get_flag() -> bool:
	return texture_repeat

func set_flag(value: bool) -> void:
	texture_repeat = value

func get_transparency() -> int:
	return transparency

func set_transparency(value: int) -> void:
	transparency = value

func get_flag() -> bool:
	return use_particle_trails

func set_flag(value: bool) -> void:
	use_particle_trails = value

func get_flag() -> bool:
	return use_point_size

func set_flag(value: bool) -> void:
	use_point_size = value

func get_uv1_offset() -> Vector3:
	return uv1_offset

func set_uv1_offset(value: Vector3) -> void:
	uv1_offset = value

func get_uv1_scale() -> Vector3:
	return uv1_scale

func set_uv1_scale(value: Vector3) -> void:
	uv1_scale = value

func get_flag() -> bool:
	return uv1_triplanar

func set_flag(value: bool) -> void:
	uv1_triplanar = value

func get_uv1_triplanar_blend_sharpness() -> float:
	return uv1_triplanar_sharpness

func set_uv1_triplanar_blend_sharpness(value: float) -> void:
	uv1_triplanar_sharpness = value

func get_flag() -> bool:
	return uv1_world_triplanar

func set_flag(value: bool) -> void:
	uv1_world_triplanar = value

func get_uv2_offset() -> Vector3:
	return uv2_offset

func set_uv2_offset(value: Vector3) -> void:
	uv2_offset = value

func get_uv2_scale() -> Vector3:
	return uv2_scale

func set_uv2_scale(value: Vector3) -> void:
	uv2_scale = value

func get_flag() -> bool:
	return uv2_triplanar

func set_flag(value: bool) -> void:
	uv2_triplanar = value

func get_uv2_triplanar_blend_sharpness() -> float:
	return uv2_triplanar_sharpness

func set_uv2_triplanar_blend_sharpness(value: float) -> void:
	uv2_triplanar_sharpness = value

func get_flag() -> bool:
	return uv2_world_triplanar

func set_flag(value: bool) -> void:
	uv2_world_triplanar = value

func get_flag() -> bool:
	return vertex_color_is_srgb

func set_flag(value: bool) -> void:
	vertex_color_is_srgb = value

func get_flag() -> bool:
	return vertex_color_use_as_albedo

func set_flag(value: bool) -> void:
	vertex_color_use_as_albedo = value

