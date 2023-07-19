extends CanvasLayer
#brief A node used to create a parallax scrolling background.
#desc A ParallaxBackground uses one or more [ParallaxLayer] child nodes to create a parallax effect. Each [ParallaxLayer] can move at a different speed using [member ParallaxLayer.motion_offset]. This creates an illusion of depth in a 2D game. If not used with a [Camera2D], you must manually calculate the [member scroll_offset].
class_name ParallaxBackground


var layer: int:
	get = get_layer, set = set_layer

#desc The base position offset for all [ParallaxLayer] children.
var scroll_base_offset: Vector2:
	get = get_scroll_base_offset, set = set_scroll_base_offset

#desc The base motion scale for all [ParallaxLayer] children.
var scroll_base_scale: Vector2:
	get = get_scroll_base_scale, set = set_scroll_base_scale

#desc If [code]true[/code], elements in [ParallaxLayer] child aren't affected by the zoom level of the camera.
var scroll_ignore_camera_zoom: bool:
	get = is_ignore_camera_zoom, set = set_ignore_camera_zoom

#desc Top-left limits for scrolling to begin. If the camera is outside of this limit, the background will stop scrolling. Must be lower than [member scroll_limit_end] to work.
var scroll_limit_begin: Vector2:
	get = get_limit_begin, set = set_limit_begin

#desc Bottom-right limits for scrolling to end. If the camera is outside of this limit, the background will stop scrolling. Must be higher than [member scroll_limit_begin] to work.
var scroll_limit_end: Vector2:
	get = get_limit_end, set = set_limit_end

#desc The ParallaxBackground's scroll value. Calculated automatically when using a [Camera2D], but can be used to manually manage scrolling when no camera is present.
var scroll_offset: Vector2:
	get = get_scroll_offset, set = set_scroll_offset




func get_layer() -> int:
	return layer

func set_layer(value: int) -> void:
	layer = value

func get_scroll_base_offset() -> Vector2:
	return scroll_base_offset

func set_scroll_base_offset(value: Vector2) -> void:
	scroll_base_offset = value

func get_scroll_base_scale() -> Vector2:
	return scroll_base_scale

func set_scroll_base_scale(value: Vector2) -> void:
	scroll_base_scale = value

func is_ignore_camera_zoom() -> bool:
	return scroll_ignore_camera_zoom

func set_ignore_camera_zoom(value: bool) -> void:
	scroll_ignore_camera_zoom = value

func get_limit_begin() -> Vector2:
	return scroll_limit_begin

func set_limit_begin(value: Vector2) -> void:
	scroll_limit_begin = value

func get_limit_end() -> Vector2:
	return scroll_limit_end

func set_limit_end(value: Vector2) -> void:
	scroll_limit_end = value

func get_scroll_offset() -> Vector2:
	return scroll_offset

func set_scroll_offset(value: Vector2) -> void:
	scroll_offset = value

