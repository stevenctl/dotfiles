extends Texture2D
#brief A texture that crops out part of another Texture2D.
#desc [Texture2D] resource that draws only part of its [member atlas] texture, as defined by the [member region]. An additional [member margin] can also be set, which is useful for small adjustments.
#desc Multiple [AtlasTexture] resources can be cropped from the same [member atlas]. Packing many smaller textures into a singular large texture helps to optimize video memory costs and render calls.
#desc [b]Note:[/b] [AtlasTexture] cannot be used in an [AnimatedTexture], and may not tile properly in nodes such as [TextureRect], when inside other [AtlasTexture] resources.
class_name AtlasTexture


#desc The texture that contains the atlas. Can be any type inheriting from [Texture2D], including another [AtlasTexture].
var atlas: Texture2D:
	get = get_atlas, set = set_atlas

#desc If [code]true[/code], the area outside of the [member region] is clipped to avoid bleeding of the surrounding texture pixels.
var filter_clip: bool:
	get = has_filter_clip, set = set_filter_clip

#desc The margin around the [member region]. Useful for small adjustments. If the [member Rect2.size] of this property ("w" and "h" in the editor) is set, the drawn texture is resized to fit within the margin.
var margin: Rect2:
	get = get_margin, set = set_margin

#desc The region used to draw the [member atlas].
var region: Rect2:
	get = get_region, set = set_region

var resource_local_to_scene: bool:
	get = is_local_to_scene, set = set_local_to_scene




func get_atlas() -> Texture2D:
	return atlas

func set_atlas(value: Texture2D) -> void:
	atlas = value

func has_filter_clip() -> bool:
	return filter_clip

func set_filter_clip(value: bool) -> void:
	filter_clip = value

func get_margin() -> Rect2:
	return margin

func set_margin(value: Rect2) -> void:
	margin = value

func get_region() -> Rect2:
	return region

func set_region(value: Rect2) -> void:
	region = value

func is_local_to_scene() -> bool:
	return resource_local_to_scene

func set_local_to_scene(value: bool) -> void:
	resource_local_to_scene = value

