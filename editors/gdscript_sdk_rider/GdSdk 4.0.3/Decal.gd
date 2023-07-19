extends VisualInstance3D
#brief Node that projects a texture onto a [MeshInstance3D].
#desc [Decal]s are used to project a texture onto a [Mesh] in the scene. Use Decals to add detail to a scene without affecting the underlying [Mesh]. They are often used to add weathering to building, add dirt or mud to the ground, or add variety to props. Decals can be moved at any time, making them suitable for things like blob shadows or laser sight dots.
#desc They are made of an [AABB] and a group of [Texture2D]s specifying [Color], normal, ORM (ambient occlusion, roughness, metallic), and emission. Decals are projected within their [AABB] so altering the orientation of the Decal affects the direction in which they are projected. By default, Decals are projected down (i.e. from positive Y to negative Y).
#desc The [Texture2D]s associated with the Decal are automatically stored in a texture atlas which is used for drawing the decals so all decals can be drawn at once. Godot uses clustered decals, meaning they are stored in cluster data and drawn when the mesh is drawn, they are not drawn as a post-processing effect after.
#desc [b]Note:[/b] Decals cannot affect an underlying material's transparency, regardless of its transparency mode (alpha blend, alpha scissor, alpha hash, opaque pre-pass). This means translucent or transparent areas of a material will remain translucent or transparent even if an opaque decal is applied on them.
#desc [b]Note:[/b] Decals are only supported in the Forward+ and Mobile rendering methods, not Compatibility. When using the Mobile rendering method, only 8 decals can be displayed on each mesh resource. Attempting to display more than 8 decals on a single mesh resource will result in decals flickering in and out as the camera moves.
#desc [b]Note:[/b] When using the Mobile rendering method, decals will only correctly affect meshes whose visibility AABB intersects with the decal's AABB. If using a shader to deform the mesh in a way that makes it go outside its AABB, [member GeometryInstance3D.extra_cull_margin] must be increased on the mesh. Otherwise, the decal may not be visible on the mesh.
class_name Decal

#desc [Texture2D] corresponding to [member texture_albedo].
#desc [Texture2D] corresponding to [member texture_normal].
#desc [Texture2D] corresponding to [member texture_orm].
#desc [Texture2D] corresponding to [member texture_emission].
#desc Max size of [enum DecalTexture] enum.

#enum DecalTexture
enum {
    TEXTURE_ALBEDO = 0,
    TEXTURE_NORMAL = 1,
    TEXTURE_ORM = 2,
    TEXTURE_EMISSION = 3,
    TEXTURE_MAX = 4,
}
#desc Blends the albedo [Color] of the decal with albedo [Color] of the underlying mesh. This can be set to [code]0.0[/code] to create a decal that only affects normal or ORM. In this case, an albedo texture is still required as its alpha channel will determine where the normal and ORM will be overridden. See also [member modulate].
var albedo_mix: float:
	get = get_albedo_mix, set = set_albedo_mix

#desc Specifies which [member VisualInstance3D.layers] this decal will project on. By default, Decals affect all layers. This is used so you can specify which types of objects receive the Decal and which do not. This is especially useful so you can ensure that dynamic objects don't accidentally receive a Decal intended for the terrain under them.
var cull_mask: int:
	get = get_cull_mask, set = set_cull_mask

#desc The distance from the camera at which the Decal begins to fade away (in 3D units).
var distance_fade_begin: float:
	get = get_distance_fade_begin, set = set_distance_fade_begin

#desc If [code]true[/code], decals will smoothly fade away when far from the active [Camera3D] starting at [member distance_fade_begin]. The Decal will fade out over [member distance_fade_begin] + [member distance_fade_length], after which it will be culled and not sent to the shader at all. Use this to reduce the number of active Decals in a scene and thus improve performance.
var distance_fade_enabled: bool:
	get = is_distance_fade_enabled, set = set_enable_distance_fade

#desc The distance over which the Decal fades (in 3D units). The Decal becomes slowly more transparent over this distance and is completely invisible at the end. Higher values result in a smoother fade-out transition, which is more suited when the camera moves fast.
var distance_fade_length: float:
	get = get_distance_fade_length, set = set_distance_fade_length

#desc Energy multiplier for the emission texture. This will make the decal emit light at a higher or lower intensity, independently of the albedo color. See also [member modulate].
var emission_energy: float:
	get = get_emission_energy, set = set_emission_energy

#desc Sets the curve over which the decal will fade as the surface gets further from the center of the [AABB]. Only positive values are valid (negative values will be clamped to [code]0.0[/code]). See also [member upper_fade].
var lower_fade: float:
	get = get_lower_fade, set = set_lower_fade

#desc Changes the [Color] of the Decal by multiplying the albedo and emission colors with this value. The alpha component is only taken into account when multiplying the albedo color, not the emission color. See also [member emission_energy] and [member albedo_mix] to change the emission and albedo intensity independently of each other.
var modulate: Color:
	get = get_modulate, set = set_modulate

#desc Fades the Decal if the angle between the Decal's [AABB] and the target surface becomes too large. A value of [code]0[/code] projects the Decal regardless of angle, a value of [code]1[/code] limits the Decal to surfaces that are nearly perpendicular.
#desc [b]Note:[/b] Setting [member normal_fade] to a value greater than [code]0.0[/code] has a small performance cost due to the added normal angle computations.
var normal_fade: float:
	get = get_normal_fade, set = set_normal_fade

#desc Sets the size of the [AABB] used by the decal. All dimensions must be set to a value greater than zero (they will be clamped to [code]0.001[/code] if this is not the case). The AABB goes from [code]-size/2[/code] to [code]size/2[/code].
#desc [b]Note:[/b] To improve culling efficiency of "hard surface" decals, set their [member upper_fade] and [member lower_fade] to [code]0.0[/code] and set the Y component of the [member size] as low as possible. This will reduce the decals' AABB size without affecting their appearance.
var size: Vector3:
	get = get_size, set = set_size

#desc [Texture2D] with the base [Color] of the Decal. Either this or the [member texture_emission] must be set for the Decal to be visible. Use the alpha channel like a mask to smoothly blend the edges of the decal with the underlying object.
#desc [b]Note:[/b] Unlike [BaseMaterial3D] whose filter mode can be adjusted on a per-material basis, the filter mode for [Decal] textures is set globally with [member ProjectSettings.rendering/textures/decals/filter].
var texture_albedo: Texture2D:
	get = get_texture, set = set_texture

#desc [Texture2D] with the emission [Color] of the Decal. Either this or the [member texture_albedo] must be set for the Decal to be visible. Use the alpha channel like a mask to smoothly blend the edges of the decal with the underlying object.
#desc [b]Note:[/b] Unlike [BaseMaterial3D] whose filter mode can be adjusted on a per-material basis, the filter mode for [Decal] textures is set globally with [member ProjectSettings.rendering/textures/decals/filter].
var texture_emission: Texture2D:
	get = get_texture, set = set_texture

#desc [Texture2D] with the per-pixel normal map for the decal. Use this to add extra detail to decals.
#desc [b]Note:[/b] Unlike [BaseMaterial3D] whose filter mode can be adjusted on a per-material basis, the filter mode for [Decal] textures is set globally with [member ProjectSettings.rendering/textures/decals/filter].
#desc [b]Note:[/b] Setting this texture alone will not result in a visible decal, as [member texture_albedo] must also be set. To create a normal-only decal, load an albedo texture into [member texture_albedo] and set [member albedo_mix] to [code]0.0[/code]. The albedo texture's alpha channel will be used to determine where the underlying surface's normal map should be overridden (and its intensity).
var texture_normal: Texture2D:
	get = get_texture, set = set_texture

#desc [Texture2D] storing ambient occlusion, roughness, and metallic for the decal. Use this to add extra detail to decals.
#desc [b]Note:[/b] Unlike [BaseMaterial3D] whose filter mode can be adjusted on a per-material basis, the filter mode for [Decal] textures is set globally with [member ProjectSettings.rendering/textures/decals/filter].
#desc [b]Note:[/b] Setting this texture alone will not result in a visible decal, as [member texture_albedo] must also be set. To create an ORM-only decal, load an albedo texture into [member texture_albedo] and set [member albedo_mix] to [code]0.0[/code]. The albedo texture's alpha channel will be used to determine where the underlying surface's ORM map should be overridden (and its intensity).
var texture_orm: Texture2D:
	get = get_texture, set = set_texture

#desc Sets the curve over which the decal will fade as the surface gets further from the center of the [AABB]. Only positive values are valid (negative values will be clamped to [code]0.0[/code]). See also [member lower_fade].
var upper_fade: float:
	get = get_upper_fade, set = set_upper_fade



#desc Returns the [Texture2D] associated with the specified [enum DecalTexture]. This is a convenience method, in most cases you should access the texture directly.
#desc For example, instead of [code]albedo_tex = $Decal.get_texture(Decal.TEXTURE_ALBEDO)[/code], use [code]albedo_tex = $Decal.texture_albedo[/code].
#desc One case where this is better than accessing the texture directly is when you want to copy one Decal's textures to another. For example:
#desc [codeblocks]
#desc [gdscript]
#desc for i in Decal.TEXTURE_MAX:
#desc $NewDecal.set_texture(i, $OldDecal.get_texture(i))
#desc [/gdscript]
#desc [csharp]
#desc for (int i = 0; i < (int)Decal.DecalTexture.Max; i++)
#desc {
#desc GetNode<Decal>("NewDecal").SetTexture(i, GetNode<Decal>("OldDecal").GetTexture(i));
#desc }
#desc [/csharp]
#desc [/codeblocks]
func get_texture(type: int) -> Texture2D:
	pass;

#desc Sets the [Texture2D] associated with the specified [enum DecalTexture]. This is a convenience method, in most cases you should access the texture directly.
#desc For example, instead of [code]$Decal.set_texture(Decal.TEXTURE_ALBEDO, albedo_tex)[/code], use [code]$Decal.texture_albedo = albedo_tex[/code].
#desc One case where this is better than accessing the texture directly is when you want to copy one Decal's textures to another. For example:
#desc [codeblocks]
#desc [gdscript]
#desc for i in Decal.TEXTURE_MAX:
#desc $NewDecal.set_texture(i, $OldDecal.get_texture(i))
#desc [/gdscript]
#desc [csharp]
#desc for (int i = 0; i < (int)Decal.DecalTexture.Max; i++)
#desc {
#desc GetNode<Decal>("NewDecal").SetTexture(i, GetNode<Decal>("OldDecal").GetTexture(i));
#desc }
#desc [/csharp]
#desc [/codeblocks]
func set_texture(type: int, texture: Texture2D) -> void:
	pass;


func get_albedo_mix() -> float:
	return albedo_mix

func set_albedo_mix(value: float) -> void:
	albedo_mix = value

func get_cull_mask() -> int:
	return cull_mask

func set_cull_mask(value: int) -> void:
	cull_mask = value

func get_distance_fade_begin() -> float:
	return distance_fade_begin

func set_distance_fade_begin(value: float) -> void:
	distance_fade_begin = value

func is_distance_fade_enabled() -> bool:
	return distance_fade_enabled

func set_enable_distance_fade(value: bool) -> void:
	distance_fade_enabled = value

func get_distance_fade_length() -> float:
	return distance_fade_length

func set_distance_fade_length(value: float) -> void:
	distance_fade_length = value

func get_emission_energy() -> float:
	return emission_energy

func set_emission_energy(value: float) -> void:
	emission_energy = value

func get_lower_fade() -> float:
	return lower_fade

func set_lower_fade(value: float) -> void:
	lower_fade = value

func get_modulate() -> Color:
	return modulate

func set_modulate(value: Color) -> void:
	modulate = value

func get_normal_fade() -> float:
	return normal_fade

func set_normal_fade(value: float) -> void:
	normal_fade = value

func get_size() -> Vector3:
	return size

func set_size(value: Vector3) -> void:
	size = value

func get_texture() -> Texture2D:
	return texture_albedo

func set_texture(value: Texture2D) -> void:
	texture_albedo = value

func get_texture() -> Texture2D:
	return texture_emission

func set_texture(value: Texture2D) -> void:
	texture_emission = value

func get_texture() -> Texture2D:
	return texture_normal

func set_texture(value: Texture2D) -> void:
	texture_normal = value

func get_texture() -> Texture2D:
	return texture_orm

func set_texture(value: Texture2D) -> void:
	texture_orm = value

func get_upper_fade() -> float:
	return upper_fade

func set_upper_fade(value: float) -> void:
	upper_fade = value

