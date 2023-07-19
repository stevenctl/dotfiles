extends Container
#brief Base class for flow containers.
#desc Arranges child [Control] nodes vertically or horizontally in a left-to-right or top-to-bottom flow.
#desc A line is filled with [Control] nodes until no more fit on the same line, similar to text in an autowrapped label.
class_name FlowContainer

#desc The child controls will be arranged at the beginning of the container, i.e. top if orientation is vertical, left if orientation is horizontal (right for RTL layout).
#desc The child controls will be centered in the container.
#desc The child controls will be arranged at the end of the container, i.e. bottom if orientation is vertical, right if orientation is horizontal (left for RTL layout).

#enum AlignmentMode
enum {
    ALIGNMENT_BEGIN = 0,
    ALIGNMENT_CENTER = 1,
    ALIGNMENT_END = 2,
}
#desc The alignment of the container's children (must be one of [constant ALIGNMENT_BEGIN], [constant ALIGNMENT_CENTER], or [constant ALIGNMENT_END]).
var alignment: int:
	get = get_alignment, set = set_alignment

#desc If [code]true[/code], the [FlowContainer] will arrange its children vertically, rather than horizontally.
#desc Can't be changed when using [HFlowContainer] and [VFlowContainer].
var vertical: bool:
	get = is_vertical, set = set_vertical



#desc Returns the current line count.
func get_line_count() -> int:
	pass;


func get_alignment() -> int:
	return alignment

func set_alignment(value: int) -> void:
	alignment = value

func is_vertical() -> bool:
	return vertical

func set_vertical(value: bool) -> void:
	vertical = value

