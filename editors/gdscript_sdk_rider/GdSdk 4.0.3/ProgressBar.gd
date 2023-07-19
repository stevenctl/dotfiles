extends Range
#brief General-purpose progress bar.
#desc General-purpose progress bar. Shows fill percentage from right to left.
class_name ProgressBar

#desc The progress bar fills from begin to end horizontally, according to the language direction. If [method Control.is_layout_rtl] returns [code]false[/code], it fills from left to right, and if it returns [code]true[/code], it fills from right to left.
#desc The progress bar fills from end to begin horizontally, according to the language direction. If [method Control.is_layout_rtl] returns [code]false[/code], it fills from right to left, and if it returns [code]true[/code], it fills from left to right.
#desc The progress fills from top to bottom.
#desc The progress fills from bottom to top.

#enum FillMode
enum {
    FILL_BEGIN_TO_END = 0,
    FILL_END_TO_BEGIN = 1,
    FILL_TOP_TO_BOTTOM = 2,
    FILL_BOTTOM_TO_TOP = 3,
}
#desc The fill direction. See [enum FillMode] for possible values.
var fill_mode: int:
	get = get_fill_mode, set = set_fill_mode

#desc If [code]true[/code], the fill percentage is displayed on the bar.
var show_percentage: bool:
	get = is_percentage_shown, set = set_show_percentage




func get_fill_mode() -> int:
	return fill_mode

func set_fill_mode(value: int) -> void:
	fill_mode = value

func is_percentage_shown() -> bool:
	return show_percentage

func set_show_percentage(value: bool) -> void:
	show_percentage = value

