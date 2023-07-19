extends Container
#brief Container that preserves its child controls' aspect ratio.
#desc Arranges child controls in a way to preserve their aspect ratio automatically whenever the container is resized. Solves the problem where the container size is dynamic and the contents' size needs to adjust accordingly without losing proportions.
#tutorial [GUI containers] https://docs.godotengine.org/en/stable/tutorials/ui/gui_containers.html
class_name AspectRatioContainer

#desc The height of child controls is automatically adjusted based on the width of the container.
#desc The width of child controls is automatically adjusted based on the height of the container.
#desc The bounding rectangle of child controls is automatically adjusted to fit inside the container while keeping the aspect ratio.
#desc The width and height of child controls is automatically adjusted to make their bounding rectangle cover the entire area of the container while keeping the aspect ratio.
#desc When the bounding rectangle of child controls exceed the container's size and [member Control.clip_contents] is enabled, this allows to show only the container's area restricted by its own bounding rectangle.
#desc Aligns child controls with the beginning (left or top) of the container.
#desc Aligns child controls with the center of the container.
#desc Aligns child controls with the end (right or bottom) of the container.

#enum StretchMode
enum {
    STRETCH_WIDTH_CONTROLS_HEIGHT = 0,
    STRETCH_HEIGHT_CONTROLS_WIDTH = 1,
    STRETCH_FIT = 2,
    STRETCH_COVER = 3,
}
#enum AlignmentMode
enum {
    ALIGNMENT_BEGIN = 0,
    ALIGNMENT_CENTER = 1,
    ALIGNMENT_END = 2,
}
#desc Specifies the horizontal relative position of child controls.
var alignment_horizontal: int:
	get = get_alignment_horizontal, set = set_alignment_horizontal

#desc Specifies the vertical relative position of child controls.
var alignment_vertical: int:
	get = get_alignment_vertical, set = set_alignment_vertical

#desc The aspect ratio to enforce on child controls. This is the width divided by the height. The ratio depends on the [member stretch_mode].
var ratio: float:
	get = get_ratio, set = set_ratio

#desc The stretch mode used to align child controls.
var stretch_mode: int:
	get = get_stretch_mode, set = set_stretch_mode




func get_alignment_horizontal() -> int:
	return alignment_horizontal

func set_alignment_horizontal(value: int) -> void:
	alignment_horizontal = value

func get_alignment_vertical() -> int:
	return alignment_vertical

func set_alignment_vertical(value: int) -> void:
	alignment_vertical = value

func get_ratio() -> float:
	return ratio

func set_ratio(value: float) -> void:
	ratio = value

func get_stretch_mode() -> int:
	return stretch_mode

func set_stretch_mode(value: int) -> void:
	stretch_mode = value

