extends RefCounted
#brief Pipeline depth/stencil state (used by [RenderingDevice]).
#desc [RDPipelineDepthStencilState] controls the way depth and stencil comparisons are performed when sampling those values using [RenderingDevice].
class_name RDPipelineDepthStencilState


var back_op_compare: int:
	get = get_back_op_compare, set = set_back_op_compare

var back_op_compare_mask: int:
	get = get_back_op_compare_mask, set = set_back_op_compare_mask

var back_op_depth_fail: int:
	get = get_back_op_depth_fail, set = set_back_op_depth_fail

var back_op_fail: int:
	get = get_back_op_fail, set = set_back_op_fail

var back_op_pass: int:
	get = get_back_op_pass, set = set_back_op_pass

var back_op_reference: int:
	get = get_back_op_reference, set = set_back_op_reference

var back_op_write_mask: int:
	get = get_back_op_write_mask, set = set_back_op_write_mask

var depth_compare_operator: int:
	get = get_depth_compare_operator, set = set_depth_compare_operator

var depth_range_max: float:
	get = get_depth_range_max, set = set_depth_range_max

var depth_range_min: float:
	get = get_depth_range_min, set = set_depth_range_min

var enable_depth_range: bool:
	get = get_enable_depth_range, set = set_enable_depth_range

#desc If [code]true[/code], enables depth testing which allows objects to be automatically occluded by other objects based on their depth. This also allows objects to be partially occluded by other objects. If [code]false[/code], objects will appear in the order they were drawn (like in Godot's 2D renderer).
var enable_depth_test: bool:
	get = get_enable_depth_test, set = set_enable_depth_test

var enable_depth_write: bool:
	get = get_enable_depth_write, set = set_enable_depth_write

var enable_stencil: bool:
	get = get_enable_stencil, set = set_enable_stencil

var front_op_compare: int:
	get = get_front_op_compare, set = set_front_op_compare

var front_op_compare_mask: int:
	get = get_front_op_compare_mask, set = set_front_op_compare_mask

var front_op_depth_fail: int:
	get = get_front_op_depth_fail, set = set_front_op_depth_fail

var front_op_fail: int:
	get = get_front_op_fail, set = set_front_op_fail

var front_op_pass: int:
	get = get_front_op_pass, set = set_front_op_pass

var front_op_reference: int:
	get = get_front_op_reference, set = set_front_op_reference

var front_op_write_mask: int:
	get = get_front_op_write_mask, set = set_front_op_write_mask




func get_back_op_compare() -> int:
	return back_op_compare

func set_back_op_compare(value: int) -> void:
	back_op_compare = value

func get_back_op_compare_mask() -> int:
	return back_op_compare_mask

func set_back_op_compare_mask(value: int) -> void:
	back_op_compare_mask = value

func get_back_op_depth_fail() -> int:
	return back_op_depth_fail

func set_back_op_depth_fail(value: int) -> void:
	back_op_depth_fail = value

func get_back_op_fail() -> int:
	return back_op_fail

func set_back_op_fail(value: int) -> void:
	back_op_fail = value

func get_back_op_pass() -> int:
	return back_op_pass

func set_back_op_pass(value: int) -> void:
	back_op_pass = value

func get_back_op_reference() -> int:
	return back_op_reference

func set_back_op_reference(value: int) -> void:
	back_op_reference = value

func get_back_op_write_mask() -> int:
	return back_op_write_mask

func set_back_op_write_mask(value: int) -> void:
	back_op_write_mask = value

func get_depth_compare_operator() -> int:
	return depth_compare_operator

func set_depth_compare_operator(value: int) -> void:
	depth_compare_operator = value

func get_depth_range_max() -> float:
	return depth_range_max

func set_depth_range_max(value: float) -> void:
	depth_range_max = value

func get_depth_range_min() -> float:
	return depth_range_min

func set_depth_range_min(value: float) -> void:
	depth_range_min = value

func get_enable_depth_range() -> bool:
	return enable_depth_range

func set_enable_depth_range(value: bool) -> void:
	enable_depth_range = value

func get_enable_depth_test() -> bool:
	return enable_depth_test

func set_enable_depth_test(value: bool) -> void:
	enable_depth_test = value

func get_enable_depth_write() -> bool:
	return enable_depth_write

func set_enable_depth_write(value: bool) -> void:
	enable_depth_write = value

func get_enable_stencil() -> bool:
	return enable_stencil

func set_enable_stencil(value: bool) -> void:
	enable_stencil = value

func get_front_op_compare() -> int:
	return front_op_compare

func set_front_op_compare(value: int) -> void:
	front_op_compare = value

func get_front_op_compare_mask() -> int:
	return front_op_compare_mask

func set_front_op_compare_mask(value: int) -> void:
	front_op_compare_mask = value

func get_front_op_depth_fail() -> int:
	return front_op_depth_fail

func set_front_op_depth_fail(value: int) -> void:
	front_op_depth_fail = value

func get_front_op_fail() -> int:
	return front_op_fail

func set_front_op_fail(value: int) -> void:
	front_op_fail = value

func get_front_op_pass() -> int:
	return front_op_pass

func set_front_op_pass(value: int) -> void:
	front_op_pass = value

func get_front_op_reference() -> int:
	return front_op_reference

func set_front_op_reference(value: int) -> void:
	front_op_reference = value

func get_front_op_write_mask() -> int:
	return front_op_write_mask

func set_front_op_write_mask(value: int) -> void:
	front_op_write_mask = value

