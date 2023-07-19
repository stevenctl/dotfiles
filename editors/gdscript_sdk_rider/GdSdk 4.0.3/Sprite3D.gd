extends SpriteBase3D
#brief 2D sprite node in a 3D world.
#desc A node that displays a 2D texture in a 3D environment. The texture displayed can be a region from a larger atlas texture, or a frame from a sprite sheet animation. See also [SpriteBase3D] where properties such as the billboard mode are defined.
class_name Sprite3D

#desc Emitted when the [member frame] changes.
signal frame_changed
#desc Emitted when the [member texture] changes.
signal texture_changed

#desc Current frame to display from sprite sheet. [member hframes] or [member vframes] must be greater than 1.
var frame: int:
	get = get_frame, set = set_frame

#desc Coordinates of the frame to display from sprite sheet. This is as an alias for the [member frame] property. [member hframes] or [member vframes] must be greater than 1.
var frame_coords: Vector2i:
	get = get_frame_coords, set = set_frame_coords

#desc The number of columns in the sprite sheet.
var hframes: int:
	get = get_hframes, set = set_hframes

#desc If [code]true[/code], the sprite will use [member region_rect] and display only the specified part of its texture.
var region_enabled: bool:
	get = is_region_enabled, set = set_region_enabled

#desc The region of the atlas texture to display. [member region_enabled] must be [code]true[/code].
var region_rect: Rect2:
	get = get_region_rect, set = set_region_rect

#desc [Texture2D] object to draw. If [member GeometryInstance3D.material_override] is used, this will be overridden. The size information is still used.
var texture: Texture2D:
	get = get_texture, set = set_texture

#desc The number of rows in the sprite sheet.
var vframes: int:
	get = get_vframes, set = set_vframes




func get_frame() -> int:
	return frame

func set_frame(value: int) -> void:
	frame = value

func get_frame_coords() -> Vector2i:
	return frame_coords

func set_frame_coords(value: Vector2i) -> void:
	frame_coords = value

func get_hframes() -> int:
	return hframes

func set_hframes(value: int) -> void:
	hframes = value

func is_region_enabled() -> bool:
	return region_enabled

func set_region_enabled(value: bool) -> void:
	region_enabled = value

func get_region_rect() -> Rect2:
	return region_rect

func set_region_rect(value: Rect2) -> void:
	region_rect = value

func get_texture() -> Texture2D:
	return texture

func set_texture(value: Texture2D) -> void:
	texture = value

func get_vframes() -> int:
	return vframes

func set_vframes(value: int) -> void:
	vframes = value

