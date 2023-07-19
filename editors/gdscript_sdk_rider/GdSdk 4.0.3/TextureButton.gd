extends BaseButton
#brief Texture-based button. Supports Pressed, Hover, Disabled and Focused states.
#desc [TextureButton] has the same functionality as [Button], except it uses sprites instead of Godot's [Theme] resource. It is faster to create, but it doesn't support localization like more complex [Control]s.
#desc The "normal" state must contain a texture ([member texture_normal]); other textures are optional.
#desc See also [BaseButton] which contains common properties and methods associated with this node.
#tutorial [3D Voxel Demo] https://godotengine.org/asset-library/asset/676
class_name TextureButton

#desc Scale to fit the node's bounding rectangle.
#desc Tile inside the node's bounding rectangle.
#desc The texture keeps its original size and stays in the bounding rectangle's top-left corner.
#desc The texture keeps its original size and stays centered in the node's bounding rectangle.
#desc Scale the texture to fit the node's bounding rectangle, but maintain the texture's aspect ratio.
#desc Scale the texture to fit the node's bounding rectangle, center it, and maintain its aspect ratio.
#desc Scale the texture so that the shorter side fits the bounding rectangle. The other side clips to the node's limits.

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
#desc If [code]true[/code], texture is flipped horizontally.
var flip_h: bool:
	get = is_flipped_h, set = set_flip_h

#desc If [code]true[/code], texture is flipped vertically.
var flip_v: bool:
	get = is_flipped_v, set = set_flip_v

#desc If [code]true[/code], the size of the texture won't be considered for minimum size calculation, so the [TextureButton] can be shrunk down past the texture size.
var ignore_texture_size: bool:
	get = get_ignore_texture_size, set = set_ignore_texture_size

#desc Controls the texture's behavior when you resize the node's bounding rectangle. See the [enum StretchMode] constants for available options.
var stretch_mode: int:
	get = get_stretch_mode, set = set_stretch_mode

#desc Pure black and white [BitMap] image to use for click detection. On the mask, white pixels represent the button's clickable area. Use it to create buttons with curved shapes.
var texture_click_mask: BitMap:
	get = get_click_mask, set = set_click_mask

#desc Texture to display when the node is disabled. See [member BaseButton.disabled].
var texture_disabled: Texture2D:
	get = get_texture_disabled, set = set_texture_disabled

#desc Texture to display when the node has mouse or keyboard focus. [member texture_focused] is displayed [i]over[/i] the base texture, so a partially transparent texture should be used to ensure the base texture remains visible. A texture that represents an outline or an underline works well for this purpose. To disable the focus visual effect, assign a fully transparent texture of any size. Note that disabling the focus visual effect will harm keyboard/controller navigation usability, so this is not recommended for accessibility reasons.
var texture_focused: Texture2D:
	get = get_texture_focused, set = set_texture_focused

#desc Texture to display when the mouse hovers the node.
var texture_hover: Texture2D:
	get = get_texture_hover, set = set_texture_hover

#desc Texture to display by default, when the node is [b]not[/b] in the disabled, focused, hover or pressed state.
var texture_normal: Texture2D:
	get = get_texture_normal, set = set_texture_normal

#desc Texture to display on mouse down over the node, if the node has keyboard focus and the player presses the Enter key or if the player presses the [member BaseButton.shortcut] key.
var texture_pressed: Texture2D:
	get = get_texture_pressed, set = set_texture_pressed




func is_flipped_h() -> bool:
	return flip_h

func set_flip_h(value: bool) -> void:
	flip_h = value

func is_flipped_v() -> bool:
	return flip_v

func set_flip_v(value: bool) -> void:
	flip_v = value

func get_ignore_texture_size() -> bool:
	return ignore_texture_size

func set_ignore_texture_size(value: bool) -> void:
	ignore_texture_size = value

func get_stretch_mode() -> int:
	return stretch_mode

func set_stretch_mode(value: int) -> void:
	stretch_mode = value

func get_click_mask() -> BitMap:
	return texture_click_mask

func set_click_mask(value: BitMap) -> void:
	texture_click_mask = value

func get_texture_disabled() -> Texture2D:
	return texture_disabled

func set_texture_disabled(value: Texture2D) -> void:
	texture_disabled = value

func get_texture_focused() -> Texture2D:
	return texture_focused

func set_texture_focused(value: Texture2D) -> void:
	texture_focused = value

func get_texture_hover() -> Texture2D:
	return texture_hover

func set_texture_hover(value: Texture2D) -> void:
	texture_hover = value

func get_texture_normal() -> Texture2D:
	return texture_normal

func set_texture_normal(value: Texture2D) -> void:
	texture_normal = value

func get_texture_pressed() -> Texture2D:
	return texture_pressed

func set_texture_pressed(value: Texture2D) -> void:
	texture_pressed = value

