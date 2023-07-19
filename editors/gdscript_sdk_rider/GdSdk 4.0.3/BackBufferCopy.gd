extends Node2D
#brief Copies a region of the screen (or the whole screen) to a buffer so it can be accessed in your shader scripts using the screen texture (i.e. a uniform sampler with ``hint_screen_texture``).
#desc Node for back-buffering the currently-displayed screen. The region defined in the [BackBufferCopy] node is buffered with the content of the screen it covers, or the entire screen according to the copy mode set. Use the screen texture in your shader scripts to access the buffer.
#desc [b]Note:[/b] Since this node inherits from [Node2D] (and not [Control]), anchors and margins won't apply to child [Control]-derived nodes. This can be problematic when resizing the window. To avoid this, add [Control]-derived nodes as [i]siblings[/i] to the [BackBufferCopy] node instead of adding them as children.
class_name BackBufferCopy

#desc Disables the buffering mode. This means the [BackBufferCopy] node will directly use the portion of screen it covers.
#desc [BackBufferCopy] buffers a rectangular region.
#desc [BackBufferCopy] buffers the entire screen.

#enum CopyMode
enum {
    COPY_MODE_DISABLED = 0,
    COPY_MODE_RECT = 1,
    COPY_MODE_VIEWPORT = 2,
}
#desc Buffer mode. See [enum CopyMode] constants.
var copy_mode: int:
	get = get_copy_mode, set = set_copy_mode

#desc The area covered by the [BackBufferCopy]. Only used if [member copy_mode] is [constant COPY_MODE_RECT].
var rect: Rect2:
	get = get_rect, set = set_rect




func get_copy_mode() -> int:
	return copy_mode

func set_copy_mode(value: int) -> void:
	copy_mode = value

func get_rect() -> Rect2:
	return rect

func set_rect(value: Rect2) -> void:
	rect = value

