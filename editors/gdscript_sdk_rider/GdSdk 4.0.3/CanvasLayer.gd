extends Node
#brief Canvas drawing layer.
#desc Canvas drawing layer. [CanvasItem] nodes that are direct or indirect children of a [CanvasLayer] will be drawn in that layer. The layer is a numeric index that defines the draw order. The default 2D scene renders with index 0, so a [CanvasLayer] with index -1 will be drawn below, and one with index 1 will be drawn above. This is very useful for HUDs (in layer 1+ or above), or backgrounds (in layer -1 or below).
#desc Embedded [Window]s are placed in layer 1024. CanvasItems in layer 1025 or above appear in front of embedded windows, CanvasItems in layer 1023 or below appear behind embedded windows.
#tutorial [Viewport and canvas transforms] https://docs.godotengine.org/en/stable/tutorials/2d/2d_transforms.html
#tutorial [Canvas layers] https://docs.godotengine.org/en/stable/tutorials/2d/canvas_layers.html
#tutorial [2D Dodge The Creeps Demo] https://godotengine.org/asset-library/asset/515
class_name CanvasLayer

#desc Emitted when visibility of the layer is changed. See [member visible].
signal visibility_changed

#desc The custom [Viewport] node assigned to the [CanvasLayer]. If [code]null[/code], uses the default viewport instead.
var custom_viewport: Node:
	get = get_custom_viewport, set = set_custom_viewport

#desc If enabled, the [CanvasLayer] will use the viewport's transform, so it will move when camera moves instead of being anchored in a fixed position on the screen.
#desc Together with [member follow_viewport_scale] it can be used for a pseudo 3D effect.
var follow_viewport_enabled: bool:
	get = is_following_viewport, set = set_follow_viewport

#desc Scales the layer when using [member follow_viewport_enabled]. Layers moving into the foreground should have increasing scales, while layers moving into the background should have decreasing scales.
var follow_viewport_scale: float:
	get = get_follow_viewport_scale, set = set_follow_viewport_scale

#desc Layer index for draw order. Lower values are drawn behind higher values.
var layer: int:
	get = get_layer, set = set_layer

#desc The layer's base offset.
var offset: Vector2:
	get = get_offset, set = set_offset

#desc The layer's rotation in radians.
var rotation: float:
	get = get_rotation, set = set_rotation

#desc The layer's scale.
var scale: Vector2:
	get = get_scale, set = set_scale

#desc The layer's transform.
var transform: Transform2D:
	get = get_transform, set = set_transform

#desc If [code]false[/code], any [CanvasItem] under this [CanvasLayer] will be hidden.
#desc Unlike [member CanvasItem.visible], visibility of a [CanvasLayer] isn't propagated to underlying layers.
var visible: bool:
	get = is_visible, set = set_visible



#desc Returns the RID of the canvas used by this layer.
func get_canvas() -> RID:
	pass;

#desc Returns the transform from the [CanvasLayer]s coordinate system to the [Viewport]s coordinate system.
func get_final_transform() -> Transform2D:
	pass;

#desc Hides any [CanvasItem] under this [CanvasLayer]. This is equivalent to setting [member visible] to [code]false[/code].
func hide() -> void:
	pass;

#desc Shows any [CanvasItem] under this [CanvasLayer]. This is equivalent to setting [member visible] to [code]true[/code].
func show() -> void:
	pass;


func get_custom_viewport() -> Node:
	return custom_viewport

func set_custom_viewport(value: Node) -> void:
	custom_viewport = value

func is_following_viewport() -> bool:
	return follow_viewport_enabled

func set_follow_viewport(value: bool) -> void:
	follow_viewport_enabled = value

func get_follow_viewport_scale() -> float:
	return follow_viewport_scale

func set_follow_viewport_scale(value: float) -> void:
	follow_viewport_scale = value

func get_layer() -> int:
	return layer

func set_layer(value: int) -> void:
	layer = value

func get_offset() -> Vector2:
	return offset

func set_offset(value: Vector2) -> void:
	offset = value

func get_rotation() -> float:
	return rotation

func set_rotation(value: float) -> void:
	rotation = value

func get_scale() -> Vector2:
	return scale

func set_scale(value: Vector2) -> void:
	scale = value

func get_transform() -> Transform2D:
	return transform

func set_transform(value: Transform2D) -> void:
	transform = value

func is_visible() -> bool:
	return visible

func set_visible(value: bool) -> void:
	visible = value

