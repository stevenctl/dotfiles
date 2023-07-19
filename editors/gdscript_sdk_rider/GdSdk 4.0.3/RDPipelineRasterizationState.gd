extends RefCounted
#brief Pipeline rasterization state (used by [RenderingDevice]).
#desc This object is used by [RenderingDevice].
class_name RDPipelineRasterizationState


#desc The cull mode to use when drawing polygons, which determines whether front faces or backfaces are hidden.
var cull_mode: int:
	get = get_cull_mode, set = set_cull_mode

var depth_bias_clamp: float:
	get = get_depth_bias_clamp, set = set_depth_bias_clamp

var depth_bias_constant_factor: float:
	get = get_depth_bias_constant_factor, set = set_depth_bias_constant_factor

var depth_bias_enabled: bool:
	get = get_depth_bias_enabled, set = set_depth_bias_enabled

var depth_bias_slope_factor: float:
	get = get_depth_bias_slope_factor, set = set_depth_bias_slope_factor

#desc If [code]true[/code], primitives are discarded immediately before the rasterization stage.
var discard_primitives: bool:
	get = get_discard_primitives, set = set_discard_primitives

var enable_depth_clamp: bool:
	get = get_enable_depth_clamp, set = set_enable_depth_clamp

#desc The winding order to use to determine which face of a triangle is considered its front face.
var front_face: int:
	get = get_front_face, set = set_front_face

#desc THe line width to use when drawing lines (in pixels). Thick lines may not be supported on all hardware.
var line_width: float:
	get = get_line_width, set = set_line_width

#desc The number of control points to use when drawing a patch with tessellation enabled. Higher values result in higher quality at the cost of performance.
var patch_control_points: int:
	get = get_patch_control_points, set = set_patch_control_points

#desc If [code]true[/code], performs wireframe rendering for triangles instead of flat or textured rendering.
var wireframe: bool:
	get = get_wireframe, set = set_wireframe




func get_cull_mode() -> int:
	return cull_mode

func set_cull_mode(value: int) -> void:
	cull_mode = value

func get_depth_bias_clamp() -> float:
	return depth_bias_clamp

func set_depth_bias_clamp(value: float) -> void:
	depth_bias_clamp = value

func get_depth_bias_constant_factor() -> float:
	return depth_bias_constant_factor

func set_depth_bias_constant_factor(value: float) -> void:
	depth_bias_constant_factor = value

func get_depth_bias_enabled() -> bool:
	return depth_bias_enabled

func set_depth_bias_enabled(value: bool) -> void:
	depth_bias_enabled = value

func get_depth_bias_slope_factor() -> float:
	return depth_bias_slope_factor

func set_depth_bias_slope_factor(value: float) -> void:
	depth_bias_slope_factor = value

func get_discard_primitives() -> bool:
	return discard_primitives

func set_discard_primitives(value: bool) -> void:
	discard_primitives = value

func get_enable_depth_clamp() -> bool:
	return enable_depth_clamp

func set_enable_depth_clamp(value: bool) -> void:
	enable_depth_clamp = value

func get_front_face() -> int:
	return front_face

func set_front_face(value: int) -> void:
	front_face = value

func get_line_width() -> float:
	return line_width

func set_line_width(value: float) -> void:
	line_width = value

func get_patch_control_points() -> int:
	return patch_control_points

func set_patch_control_points(value: int) -> void:
	patch_control_points = value

func get_wireframe() -> bool:
	return wireframe

func set_wireframe(value: bool) -> void:
	wireframe = value

