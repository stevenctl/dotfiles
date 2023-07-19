extends Control
#brief Control for drawing textures.
#desc Used to draw icons and sprites in a user interface. The texture's placement can be controlled with the [member stretch_mode] property. It can scale, tile, or stay centered inside its bounding rectangle.
#tutorial [3D Voxel Demo] https://godotengine.org/asset-library/asset/676
class_name TextureRect

#desc The minimum size will be equal to texture size, i.e. [TextureRect] can't be smaller than the texture.
#desc The size of the texture won't be considered for minimum size calculation, so the [TextureRect] can be shrunk down past the texture size.
#desc The height of the texture will be ignored. Minimum width will be equal to the current height. Useful for horizontal layouts, e.g. inside [HBoxContainer].
#desc Same as [constant EXPAND_FIT_WIDTH], but keeps texture's aspect ratio.
#desc The width of the texture will be ignored. Minimum height will be equal to the current width. Useful for vertical layouts, e.g. inside [VBoxContainer].
#desc Same as [constant EXPAND_FIT_HEIGHT], but keeps texture's aspect ratio.
#desc Scale to fit the node's bounding rectangle.
#desc Tile inside the node's bounding rectangle.
#desc The texture keeps its original size and stays in the bounding rectangle's top-left corner.
#desc The texture keeps its original size and stays centered in the node's bounding rectangle.
#desc Scale the texture to fit the node's bounding rectangle, but maintain the texture's aspect ratio.
#desc Scale the texture to fit the node's bounding rectangle, center it and maintain its aspect ratio.
#desc Scale the texture so that the shorter side fits the bounding rectangle. The other side clips to the node's limits.

#enum ExpandMode
enum {
    EXPAND_KEEP_SIZE = 0,
    EXPAND_IGNORE_SIZE = 1,
    EXPAND_FIT_WIDTH = 2,
    EXPAND_FIT_WIDTH_PROPORTIONAL = 3,
    EXPAND_FIT_HEIGHT = 4,
    EXPAND_FIT_HEIGHT_PROPORTIONAL = 5,
}
#enum StretchMode
enum {
    STRETCH_SCALE = 0,
    STRETCH_TILE = 1,
    STRETCH_KEEP = 2,
    STRETCH_KEEP_CENTERED = 3,
    STRETCH_KEEP_ASPECT = 4,
    STRETCH_KEEP_ASPECT_CENTERED = 5,
    STRETCH_KEEP_ASPECT_COVERED = 6,
}
#desc Defines how minimum size is determined based on the texture's size. See [enum ExpandMode] for options.
#desc [b]Note:[/b] Using [constant EXPAND_FIT_WIDTH], [constant EXPAND_FIT_WIDTH_PROPORTIONAL], [constant EXPAND_FIT_HEIGHT] or [constant EXPAND_FIT_HEIGHT_PROPORTIONAL] may result in unstable behavior in some containers. This functionality is being re-evaluated and will change in the future.
var expand_mode: int:
	get = get_expand_mode, set = set_expand_mode

#desc If [code]true[/code], texture is flipped horizontally.
var flip_h: bool:
	get = is_flipped_h, set = set_flip_h

#desc If [code]true[/code], texture is flipped vertically.
var flip_v: bool:
	get = is_flipped_v, set = set_flip_v

var mouse_filter: int:
	get = get_mouse_filter, set = set_mouse_filter

#desc Controls the texture's behavior when resizing the node's bounding rectangle. See [enum StretchMode].
var stretch_mode: int:
	get = get_stretch_mode, set = set_stretch_mode

#desc The node's [Texture2D] resource.
var texture: Texture2D:
	get = get_texture, set = set_texture




func get_expand_mode() -> int:
	return expand_mode

func set_expand_mode(value: int) -> void:
	expand_mode = value

func is_flipped_h() -> bool:
	return flip_h

func set_flip_h(value: bool) -> void:
	flip_h = value

func is_flipped_v() -> bool:
	return flip_v

func set_flip_v(value: bool) -> void:
	flip_v = value

func get_mouse_filter() -> int:
	return mouse_filter

func set_mouse_filter(value: int) -> void:
	mouse_filter = value

func get_stretch_mode() -> int:
	return stretch_mode

func set_stretch_mode(value: int) -> void:
	stretch_mode = value

func get_texture() -> Texture2D:
	return texture

func set_texture(value: Texture2D) -> void:
	texture = value

