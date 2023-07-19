extends Node2D
#brief General-purpose sprite node.
#desc A node that displays a 2D texture. The texture displayed can be a region from a larger atlas texture, or a frame from a sprite sheet animation.
#tutorial [Instancing Demo] https://godotengine.org/asset-library/asset/148
class_name Sprite2D

#desc Emitted when the [member frame] changes.
signal frame_changed
#desc Emitted when the [member texture] changes.
signal texture_changed

#desc If [code]true[/code], texture is centered.
var centered: bool:
	get = is_centered, set = set_centered

#desc If [code]true[/code], texture is flipped horizontally.
var flip_h: bool:
	get = is_flipped_h, set = set_flip_h

#desc If [code]true[/code], texture is flipped vertically.
var flip_v: bool:
	get = is_flipped_v, set = set_flip_v

#desc Current frame to display from sprite sheet. [member hframes] or [member vframes] must be greater than 1.
var frame: int:
	get = get_frame, set = set_frame

#desc Coordinates of the frame to display from sprite sheet. This is as an alias for the [member frame] property. [member hframes] or [member vframes] must be greater than 1.
var frame_coords: Vector2i:
	get = get_frame_coords, set = set_frame_coords

#desc The number of columns in the sprite sheet.
var hframes: int:
	get = get_hframes, set = set_hframes

#desc The texture's drawing offset.
var offset: Vector2:
	get = get_offset, set = set_offset

#desc If [code]true[/code], texture is cut from a larger atlas texture. See [member region_rect].
var region_enabled: bool:
	get = is_region_enabled, set = set_region_enabled

#desc If [code]true[/code], the outermost pixels get blurred out. [member region_enabled] must be [code]true[/code].
var region_filter_clip_enabled: bool:
	get = is_region_filter_clip_enabled, set = set_region_filter_clip_enabled

#desc The region of the atlas texture to display. [member region_enabled] must be [code]true[/code].
var region_rect: Rect2:
	get = get_region_rect, set = set_region_rect

#desc [Texture2D] object to draw.
var texture: Texture2D:
	get = get_texture, set = set_texture

#desc The number of rows in the sprite sheet.
var vframes: int:
	get = get_vframes, set = set_vframes



#desc Returns a [Rect2] representing the Sprite2D's boundary in local coordinates. Can be used to detect if the Sprite2D was clicked.
#desc [b]Example:[/b]
#desc [codeblocks]
#desc [gdscript]
#desc func _input(event):
#desc if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
#desc if get_rect().has_point(to_local(event.position)):
#desc print("A click!")
#desc [/gdscript]
#desc [csharp]
#desc public override void _Input(InputEvent @event)
#desc {
#desc if (@event is InputEventMouseButton inputEventMouse)
#desc {
#desc if (inputEventMouse.Pressed && inputEventMouse.ButtonIndex == MouseButton.Left)
#desc {
#desc if (GetRect().HasPoint(ToLocal(inputEventMouse.Position)))
#desc {
#desc GD.Print("A click!");
#desc }
#desc }
#desc }
#desc }
#desc [/csharp]
#desc [/codeblocks]
func get_rect() -> Rect2:
	pass;

#desc Returns [code]true[/code], if the pixel at the given position is opaque and [code]false[/code] in other case.
#desc [b]Note:[/b] It also returns [code]false[/code], if the sprite's texture is [code]null[/code] or if the given position is invalid.
func is_pixel_opaque(pos: Vector2) -> bool:
	pass;


func is_centered() -> bool:
	return centered

func set_centered(value: bool) -> void:
	centered = value

func is_flipped_h() -> bool:
	return flip_h

func set_flip_h(value: bool) -> void:
	flip_h = value

func is_flipped_v() -> bool:
	return flip_v

func set_flip_v(value: bool) -> void:
	flip_v = value

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

func get_offset() -> Vector2:
	return offset

func set_offset(value: Vector2) -> void:
	offset = value

func is_region_enabled() -> bool:
	return region_enabled

func set_region_enabled(value: bool) -> void:
	region_enabled = value

func is_region_filter_clip_enabled() -> bool:
	return region_filter_clip_enabled

func set_region_filter_clip_enabled(value: bool) -> void:
	region_filter_clip_enabled = value

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

