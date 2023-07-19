extends Texture2D
#brief Texture with optional normal and specular maps for use in 2D rendering.
#desc [CanvasTexture] is an alternative to [ImageTexture] for 2D rendering. It allows using normal maps and specular maps in any node that inherits from [CanvasItem]. [CanvasTexture] also allows overriding the texture's filter and repeat mode independently of the node's properties (or the project settings).
#desc [b]Note:[/b] [CanvasTexture] cannot be used in 3D rendering. For physically-based materials in 3D, use [BaseMaterial3D] instead.
class_name CanvasTexture


#desc The diffuse (color) texture to use. This is the main texture you want to set in most cases.
var diffuse_texture: Texture2D:
	get = get_diffuse_texture, set = set_diffuse_texture

#desc The normal map texture to use. Only has a visible effect if [Light2D]s are affecting this [CanvasTexture].
#desc [b]Note:[/b] Godot expects the normal map to use X+, Y+, and Z+ coordinates. See [url=http://wiki.polycount.com/wiki/Normal_Map_Technical_Details#Common_Swizzle_Coordinates]this page[/url] for a comparison of normal map coordinates expected by popular engines.
var normal_texture: Texture2D:
	get = get_normal_texture, set = set_normal_texture

var resource_local_to_scene: bool:
	get = is_local_to_scene, set = set_local_to_scene

#desc The multiplier for specular reflection colors. The [Light2D]'s color is also taken into account when determining the reflection color. Only has a visible effect if [Light2D]s are affecting this [CanvasTexture].
var specular_color: Color:
	get = get_specular_color, set = set_specular_color

#desc The specular exponent for [Light2D] specular reflections. Higher values result in a more glossy/"wet" look, with reflections becoming more localized and less visible overall. The default value of [code]1.0[/code] disables specular reflections entirely. Only has a visible effect if [Light2D]s are affecting this [CanvasTexture].
var specular_shininess: float:
	get = get_specular_shininess, set = set_specular_shininess

#desc The specular map to use for [Light2D] specular reflections. This should be a grayscale or colored texture, with brighter areas resulting in a higher [member specular_shininess] value. Using a colored [member specular_texture] allows controlling specular shininess on a per-channel basis. Only has a visible effect if [Light2D]s are affecting this [CanvasTexture].
var specular_texture: Texture2D:
	get = get_specular_texture, set = set_specular_texture

#desc The texture filtering mode to use when drawing this [CanvasTexture].
var texture_filter: int:
	get = get_texture_filter, set = set_texture_filter

#desc The texture repeat mode to use when drawing this [CanvasTexture].
var texture_repeat: int:
	get = get_texture_repeat, set = set_texture_repeat




func get_diffuse_texture() -> Texture2D:
	return diffuse_texture

func set_diffuse_texture(value: Texture2D) -> void:
	diffuse_texture = value

func get_normal_texture() -> Texture2D:
	return normal_texture

func set_normal_texture(value: Texture2D) -> void:
	normal_texture = value

func is_local_to_scene() -> bool:
	return resource_local_to_scene

func set_local_to_scene(value: bool) -> void:
	resource_local_to_scene = value

func get_specular_color() -> Color:
	return specular_color

func set_specular_color(value: Color) -> void:
	specular_color = value

func get_specular_shininess() -> float:
	return specular_shininess

func set_specular_shininess(value: float) -> void:
	specular_shininess = value

func get_specular_texture() -> Texture2D:
	return specular_texture

func set_specular_texture(value: Texture2D) -> void:
	specular_texture = value

func get_texture_filter() -> int:
	return texture_filter

func set_texture_filter(value: int) -> void:
	texture_filter = value

func get_texture_repeat() -> int:
	return texture_repeat

func set_texture_repeat(value: int) -> void:
	texture_repeat = value

