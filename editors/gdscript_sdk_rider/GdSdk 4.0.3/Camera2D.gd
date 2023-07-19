extends Node2D
#brief Camera node for 2D scenes.
#desc Camera node for 2D scenes. It forces the screen (current layer) to scroll following this node. This makes it easier (and faster) to program scrollable scenes than manually changing the position of [CanvasItem]-based nodes.
#desc Cameras register themselves in the nearest [Viewport] node (when ascending the tree). Only one camera can be active per viewport. If no viewport is available ascending the tree, the camera will register in the global viewport.
#desc This node is intended to be a simple helper to get things going quickly, but more functionality may be desired to change how the camera works. To make your own custom camera node, inherit it from [Node2D] and change the transform of the canvas by setting [member Viewport.canvas_transform] in [Viewport] (you can obtain the current [Viewport] by using [method Node.get_viewport]).
#desc Note that the [Camera2D] node's [code]position[/code] doesn't represent the actual position of the screen, which may differ due to applied smoothing or limits. You can use [method get_screen_center_position] to get the real position.
#tutorial [2D Platformer Demo] https://godotengine.org/asset-library/asset/120
#tutorial [2D Isometric Demo] https://godotengine.org/asset-library/asset/112
#tutorial [2D HDR Demo] https://godotengine.org/asset-library/asset/110
class_name Camera2D

#desc The camera's position is fixed so that the top-left corner is always at the origin.
#desc The camera's position takes into account vertical/horizontal offsets and the screen size.
#desc The camera updates with the [code]_physics_process[/code] callback.
#desc The camera updates with the [code]_process[/code] callback.

#enum AnchorMode
enum {
    ANCHOR_MODE_FIXED_TOP_LEFT = 0,
    ANCHOR_MODE_DRAG_CENTER = 1,
}
#enum Camera2DProcessCallback
enum {
    CAMERA2D_PROCESS_PHYSICS = 0,
    CAMERA2D_PROCESS_IDLE = 1,
}
#desc The Camera2D's anchor point. See [enum AnchorMode] constants.
var anchor_mode: int:
	get = get_anchor_mode, set = set_anchor_mode

#desc The custom [Viewport] node attached to the [Camera2D]. If [code]null[/code] or not a [Viewport], uses the default viewport instead.
var custom_viewport: Node:
	get = get_custom_viewport, set = set_custom_viewport

#desc Bottom margin needed to drag the camera. A value of [code]1[/code] makes the camera move only when reaching the bottom edge of the screen.
var drag_bottom_margin: float:
	get = get_drag_margin, set = set_drag_margin

#desc If [code]true[/code], the camera only moves when reaching the horizontal (left and right) drag margins. If [code]false[/code], the camera moves horizontally regardless of margins.
var drag_horizontal_enabled: bool:
	get = is_drag_horizontal_enabled, set = set_drag_horizontal_enabled

#desc The relative horizontal drag offset of the camera between the right ([code]-1[/code]) and left ([code]1[/code]) drag margins.
#desc [b]Note:[/b] Used to set the initial horizontal drag offset; determine the current offset; or force the current offset. It's not automatically updated when [member drag_horizontal_enabled] is [code]true[/code] or the drag margins are changed.
var drag_horizontal_offset: float:
	get = get_drag_horizontal_offset, set = set_drag_horizontal_offset

#desc Left margin needed to drag the camera. A value of [code]1[/code] makes the camera move only when reaching the left edge of the screen.
var drag_left_margin: float:
	get = get_drag_margin, set = set_drag_margin

#desc Right margin needed to drag the camera. A value of [code]1[/code] makes the camera move only when reaching the right edge of the screen.
var drag_right_margin: float:
	get = get_drag_margin, set = set_drag_margin

#desc Top margin needed to drag the camera. A value of [code]1[/code] makes the camera move only when reaching the top edge of the screen.
var drag_top_margin: float:
	get = get_drag_margin, set = set_drag_margin

#desc If [code]true[/code], the camera only moves when reaching the vertical (top and bottom) drag margins. If [code]false[/code], the camera moves vertically regardless of the drag margins.
var drag_vertical_enabled: bool:
	get = is_drag_vertical_enabled, set = set_drag_vertical_enabled

#desc The relative vertical drag offset of the camera between the bottom ([code]-1[/code]) and top ([code]1[/code]) drag margins.
#desc [b]Note:[/b] Used to set the initial vertical drag offset; determine the current offset; or force the current offset. It's not automatically updated when [member drag_vertical_enabled] is [code]true[/code] or the drag margins are changed.
var drag_vertical_offset: float:
	get = get_drag_vertical_offset, set = set_drag_vertical_offset

#desc If [code]true[/code], draws the camera's drag margin rectangle in the editor.
var editor_draw_drag_margin: bool:
	get = is_margin_drawing_enabled, set = set_margin_drawing_enabled

#desc If [code]true[/code], draws the camera's limits rectangle in the editor.
var editor_draw_limits: bool:
	get = is_limit_drawing_enabled, set = set_limit_drawing_enabled

#desc If [code]true[/code], draws the camera's screen rectangle in the editor.
var editor_draw_screen: bool:
	get = is_screen_drawing_enabled, set = set_screen_drawing_enabled

#desc Controls whether the camera can be active or not. If [code]true[/code], the [Camera2D] will become the main camera when it enters the scene tree and there is no active camera currently (see [method Viewport.get_camera_2d]).
#desc When the camera is currently active and [member enabled] is set to [code]false[/code], the next enabled [Camera2D] in the scene tree will become active.
var enabled: bool:
	get = is_enabled, set = set_enabled

#desc If [code]true[/code], the camera's rendered view is not affected by its [member Node2D.rotation] and [member Node2D.global_rotation].
var ignore_rotation: bool:
	get = is_ignoring_rotation, set = set_ignore_rotation

#desc Bottom scroll limit in pixels. The camera stops moving when reaching this value, but [member offset] can push the view past the limit.
var limit_bottom: int:
	get = get_limit, set = set_limit

#desc Left scroll limit in pixels. The camera stops moving when reaching this value, but [member offset] can push the view past the limit.
var limit_left: int:
	get = get_limit, set = set_limit

#desc Right scroll limit in pixels. The camera stops moving when reaching this value, but [member offset] can push the view past the limit.
var limit_right: int:
	get = get_limit, set = set_limit

#desc If [code]true[/code], the camera smoothly stops when reaches its limits.
#desc This property has no effect if [member position_smoothing_enabled] is [code]false[/code].
#desc [b]Note:[/b] To immediately update the camera's position to be within limits without smoothing, even with this setting enabled, invoke [method reset_smoothing].
var limit_smoothed: bool:
	get = is_limit_smoothing_enabled, set = set_limit_smoothing_enabled

#desc Top scroll limit in pixels. The camera stops moving when reaching this value, but [member offset] can push the view past the limit.
var limit_top: int:
	get = get_limit, set = set_limit

#desc The camera's relative offset. Useful for looking around or camera shake animations. The offsetted camera can go past the limits defined in [member limit_top], [member limit_bottom], [member limit_left] and [member limit_right].
var offset: Vector2:
	get = get_offset, set = set_offset

#desc If [code]true[/code], the camera's view smoothly moves towards its target position at [member position_smoothing_speed].
var position_smoothing_enabled: bool:
	get = is_position_smoothing_enabled, set = set_position_smoothing_enabled

#desc Speed in pixels per second of the camera's smoothing effect when [member position_smoothing_enabled] is [code]true[/code].
var position_smoothing_speed: float:
	get = get_position_smoothing_speed, set = set_position_smoothing_speed

#desc The camera's process callback. See [enum Camera2DProcessCallback].
var process_callback: int:
	get = get_process_callback, set = set_process_callback

#desc If [code]true[/code], the camera's view smoothly rotates, via asymptotic smoothing, to align with its target rotation at [member rotation_smoothing_speed].
#desc [b]Note:[/b] This property has no effect if [member ignore_rotation] is [code]true[/code].
var rotation_smoothing_enabled: bool:
	get = is_rotation_smoothing_enabled, set = set_rotation_smoothing_enabled

#desc The angular, asymptotic speed of the camera's rotation smoothing effect when [member rotation_smoothing_enabled] is [code]true[/code].
var rotation_smoothing_speed: float:
	get = get_rotation_smoothing_speed, set = set_rotation_smoothing_speed

#desc The camera's zoom. A zoom of [code]Vector(2, 2)[/code] doubles the size seen in the viewport. A zoom of [code]Vector(0.5, 0.5)[/code] halves the size seen in the viewport.
#desc [b]Note:[/b] [member FontFile.oversampling] does [i]not[/i] take [Camera2D] zoom into account. This means that zooming in/out will cause bitmap fonts and rasterized (non-MSDF) dynamic fonts to appear blurry or pixelated unless the font is part of a [CanvasLayer] that makes it ignore camera zoom. To ensure text remains crisp regardless of zoom, you can enable MSDF font rendering by enabling [member ProjectSettings.gui/theme/default_font_multichannel_signed_distance_field] (applies to the default project font only), or enabling [b]Multichannel Signed Distance Field[/b] in the import options of a DynamicFont for custom fonts. On system fonts, [member SystemFont.multichannel_signed_distance_field] can be enabled in the inspector.
var zoom: Vector2:
	get = get_zoom, set = set_zoom



#desc Aligns the camera to the tracked node.
func align() -> void:
	pass;

#desc Forces the camera to update scroll immediately.
func force_update_scroll() -> void:
	pass;

#desc Returns the specified [enum Side]'s margin. See also [member drag_bottom_margin], [member drag_top_margin], [member drag_left_margin], and [member drag_right_margin].
func get_drag_margin(margin: int) -> float:
	pass;

#desc Returns the camera limit for the specified [enum Side]. See also [member limit_bottom], [member limit_top], [member limit_left], and [member limit_right].
func get_limit(margin: int) -> int:
	pass;

#desc Returns the center of the screen from this camera's point of view, in global coordinates.
#desc [b]Note:[/b] The exact targeted position of the camera may be different. See [method get_target_position].
func get_screen_center_position() -> Vector2:
	pass;

#desc Returns this camera's target position, in global coordinates.
#desc [b]Note:[/b] The returned value is not the same as [member Node2D.global_position], as it is affected by the drag properties. It is also not the same as the current position if [member position_smoothing_enabled] is [code]true[/code] (see [method get_screen_center_position]).
func get_target_position() -> Vector2:
	pass;

#desc Returns [code]true[/code] if this [Camera2D] is the active camera (see [method Viewport.get_camera_2d]).
func is_current() -> bool:
	pass;

#desc Forces this [Camera2D] to become the current active one. [member enabled] must be [code]true[/code].
func make_current() -> void:
	pass;

#desc Sets the camera's position immediately to its current smoothing destination.
#desc This method has no effect if [member position_smoothing_enabled] is [code]false[/code].
func reset_smoothing() -> void:
	pass;

#desc Sets the specified [enum Side]'s margin. See also [member drag_bottom_margin], [member drag_top_margin], [member drag_left_margin], and [member drag_right_margin].
func set_drag_margin(margin: int, drag_margin: float) -> void:
	pass;

#desc Sets the camera limit for the specified [enum Side]. See also [member limit_bottom], [member limit_top], [member limit_left], and [member limit_right].
func set_limit(margin: int, limit: int) -> void:
	pass;


func get_anchor_mode() -> int:
	return anchor_mode

func set_anchor_mode(value: int) -> void:
	anchor_mode = value

func get_custom_viewport() -> Node:
	return custom_viewport

func set_custom_viewport(value: Node) -> void:
	custom_viewport = value

func get_drag_margin() -> float:
	return drag_bottom_margin

func set_drag_margin(value: float) -> void:
	drag_bottom_margin = value

func is_drag_horizontal_enabled() -> bool:
	return drag_horizontal_enabled

func set_drag_horizontal_enabled(value: bool) -> void:
	drag_horizontal_enabled = value

func get_drag_horizontal_offset() -> float:
	return drag_horizontal_offset

func set_drag_horizontal_offset(value: float) -> void:
	drag_horizontal_offset = value

func get_drag_margin() -> float:
	return drag_left_margin

func set_drag_margin(value: float) -> void:
	drag_left_margin = value

func get_drag_margin() -> float:
	return drag_right_margin

func set_drag_margin(value: float) -> void:
	drag_right_margin = value

func get_drag_margin() -> float:
	return drag_top_margin

func set_drag_margin(value: float) -> void:
	drag_top_margin = value

func is_drag_vertical_enabled() -> bool:
	return drag_vertical_enabled

func set_drag_vertical_enabled(value: bool) -> void:
	drag_vertical_enabled = value

func get_drag_vertical_offset() -> float:
	return drag_vertical_offset

func set_drag_vertical_offset(value: float) -> void:
	drag_vertical_offset = value

func is_margin_drawing_enabled() -> bool:
	return editor_draw_drag_margin

func set_margin_drawing_enabled(value: bool) -> void:
	editor_draw_drag_margin = value

func is_limit_drawing_enabled() -> bool:
	return editor_draw_limits

func set_limit_drawing_enabled(value: bool) -> void:
	editor_draw_limits = value

func is_screen_drawing_enabled() -> bool:
	return editor_draw_screen

func set_screen_drawing_enabled(value: bool) -> void:
	editor_draw_screen = value

func is_enabled() -> bool:
	return enabled

func set_enabled(value: bool) -> void:
	enabled = value

func is_ignoring_rotation() -> bool:
	return ignore_rotation

func set_ignore_rotation(value: bool) -> void:
	ignore_rotation = value

func get_limit() -> int:
	return limit_bottom

func set_limit(value: int) -> void:
	limit_bottom = value

func get_limit() -> int:
	return limit_left

func set_limit(value: int) -> void:
	limit_left = value

func get_limit() -> int:
	return limit_right

func set_limit(value: int) -> void:
	limit_right = value

func is_limit_smoothing_enabled() -> bool:
	return limit_smoothed

func set_limit_smoothing_enabled(value: bool) -> void:
	limit_smoothed = value

func get_limit() -> int:
	return limit_top

func set_limit(value: int) -> void:
	limit_top = value

func get_offset() -> Vector2:
	return offset

func set_offset(value: Vector2) -> void:
	offset = value

func is_position_smoothing_enabled() -> bool:
	return position_smoothing_enabled

func set_position_smoothing_enabled(value: bool) -> void:
	position_smoothing_enabled = value

func get_position_smoothing_speed() -> float:
	return position_smoothing_speed

func set_position_smoothing_speed(value: float) -> void:
	position_smoothing_speed = value

func get_process_callback() -> int:
	return process_callback

func set_process_callback(value: int) -> void:
	process_callback = value

func is_rotation_smoothing_enabled() -> bool:
	return rotation_smoothing_enabled

func set_rotation_smoothing_enabled(value: bool) -> void:
	rotation_smoothing_enabled = value

func get_rotation_smoothing_speed() -> float:
	return rotation_smoothing_speed

func set_rotation_smoothing_speed(value: float) -> void:
	rotation_smoothing_speed = value

func get_zoom() -> Vector2:
	return zoom

func set_zoom(value: Vector2) -> void:
	zoom = value

