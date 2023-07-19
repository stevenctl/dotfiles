extends RefCounted
#brief Pipeline multisample state (used by [RenderingDevice]).
#desc [RDPipelineMultisampleState] is used to control how multisample or supersample antialiasing is being performed when rendering using [RenderingDevice].
class_name RDPipelineMultisampleState


#desc If [code]true[/code], alpha to coverage is enabled. This generates a temporary coverage value based on the alpha component of the fragment's first color output. This allows alpha transparency to make use of multisample antialiasing.
var enable_alpha_to_coverage: bool:
	get = get_enable_alpha_to_coverage, set = set_enable_alpha_to_coverage

#desc If [code]true[/code], alpha is forced to either [code]0.0[/code] or [code]1.0[/code]. This allows hardening the edges of antialiased alpha transparencies. Only relevant if [member enable_alpha_to_coverage] is [code]true[/code].
var enable_alpha_to_one: bool:
	get = get_enable_alpha_to_one, set = set_enable_alpha_to_one

#desc If [code]true[/code], enables per-sample shading which replaces MSAA by SSAA. This provides higher quality antialiasing that works with transparent (alpha scissor) edges. This has a very high performance cost. See also [member min_sample_shading]. See the [url=https://registry.khronos.org/vulkan/specs/1.3-extensions/html/vkspec.html#primsrast-sampleshading]per-sample shading Vulkan documentation[/url] for more details.
var enable_sample_shading: bool:
	get = get_enable_sample_shading, set = set_enable_sample_shading

#desc The multiplier of [member sample_count] that determines how many samples are performed for each fragment. Must be between [code]0.0[/code] and [code]1.0[/code] (inclusive). Only effective if [member enable_sample_shading] is [code]true[/code]. If [member min_sample_shading] is [code]1.0[/code], fragment invocation must only read from the coverage index sample. Tile image access must not be used if [member enable_sample_shading] is [i]not[/i] [code]1.0[/code].
var min_sample_shading: float:
	get = get_min_sample_shading, set = set_min_sample_shading

#desc The number of MSAA samples (or SSAA samples if [member enable_sample_shading] is [code]true[/code]) to perform. Higher values result in better antialiasing, at the cost of performance.
var sample_count: int:
	get = get_sample_count, set = set_sample_count

#desc The sampleSee the [url=https://registry.khronos.org/vulkan/specs/1.3-extensions/html/vkspec.html#fragops-samplemask]sample mask Vulkan documentation[/url] for more details.
var sample_masks: Array[int]:
	get = get_sample_masks, set = set_sample_masks




func get_enable_alpha_to_coverage() -> bool:
	return enable_alpha_to_coverage

func set_enable_alpha_to_coverage(value: bool) -> void:
	enable_alpha_to_coverage = value

func get_enable_alpha_to_one() -> bool:
	return enable_alpha_to_one

func set_enable_alpha_to_one(value: bool) -> void:
	enable_alpha_to_one = value

func get_enable_sample_shading() -> bool:
	return enable_sample_shading

func set_enable_sample_shading(value: bool) -> void:
	enable_sample_shading = value

func get_min_sample_shading() -> float:
	return min_sample_shading

func set_min_sample_shading(value: float) -> void:
	min_sample_shading = value

func get_sample_count() -> int:
	return sample_count

func set_sample_count(value: int) -> void:
	sample_count = value

func get_sample_masks() -> Array[int]:
	return sample_masks

func set_sample_masks(value: Array[int]) -> void:
	sample_masks = value

