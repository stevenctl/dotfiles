extends Container
#brief Base class for box containers.
#desc Arranges child [Control] nodes vertically or horizontally, and rearranges them automatically when their minimum size changes.
#tutorial [GUI containers] https://docs.godotengine.org/en/stable/tutorials/ui/gui_containers.html
class_name BoxContainer

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

#desc If [code]true[/code], the [BoxContainer] will arrange its children vertically, rather than horizontally.
#desc Can't be changed when using [HBoxContainer] and [VBoxContainer].
var vertical: bool:
	get = is_vertical, set = set_vertical



#desc Adds a [Control] node to the box as a spacer. If [param begin] is [code]true[/code], it will insert the [Control] node in front of all other children.
func add_spacer(begin: bool) -> Control:
	pass;


func get_alignment() -> int:
	return alignment

func set_alignment(value: int) -> void:
	alignment = value

func is_vertical() -> bool:
	return vertical

func set_vertical(value: bool) -> void:
	vertical = value

