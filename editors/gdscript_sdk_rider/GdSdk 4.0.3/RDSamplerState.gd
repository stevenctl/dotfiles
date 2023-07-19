extends RefCounted
#brief Sampler state (used by [RenderingDevice]).
#desc This object is used by [RenderingDevice].
class_name RDSamplerState


#desc Maximum anisotropy that can be used when sampling. Only effective if [member use_anisotropy] is [code]true[/code]. Higher values result in a sharper sampler at oblique angles, at the cost of performance (due to memory bandwidth). This value may be limited by the graphics hardware in use. Most graphics hardware only supports values up to [code]16.0[/code].
#desc If [member anisotropy_max] is [code]1.0[/code], forcibly disables anisotropy even if [member use_anisotropy] is [code]true[/code].
var anisotropy_max: float:
	get = get_anisotropy_max, set = set_anisotropy_max

#desc The border color that will be returned when sampling outside the sampler's bounds and the [member repeat_u], [member repeat_v] or [member repeat_w] modes have repeating disabled.
var border_color: int:
	get = get_border_color, set = set_border_color

#desc The compare operation to use. Only effective if [member enable_compare] is [code]true[/code].
var compare_op: int:
	get = get_compare_op, set = set_compare_op

#desc If [code]true[/code], returned values will be based on the comparison operation defined in [member compare_op]. This is a hardware-based approach and is therefore faster than performing this manually in a shader. For example, compare operations are used for shadow map rendering by comparing depth values from a shadow sampler.
var enable_compare: bool:
	get = get_enable_compare, set = set_enable_compare

#desc The mipmap LOD bias to use. Positive values will make the sampler blurrier at a given distance, while negative values will make the sampler sharper at a given distance (at the risk of looking grainy). Recommended values are between [code]-0.5[/code] and [code]0.0[/code]. Only effective if the sampler has mipmaps available.
var lod_bias: float:
	get = get_lod_bias, set = set_lod_bias

#desc The sampler's magnification filter.
var mag_filter: int:
	get = get_mag_filter, set = set_mag_filter

#desc The maximum mipmap LOD bias to display (lowest resolution). Only effective if the sampler has mipmaps available.
var max_lod: float:
	get = get_max_lod, set = set_max_lod

var min_filter: int:
	get = get_min_filter, set = set_min_filter

#desc The minimum mipmap LOD bias to display (highest resolution). Only effective if the sampler has mipmaps available.
var min_lod: float:
	get = get_min_lod, set = set_min_lod

#desc The filtering method to use for mipmaps.
var mip_filter: int:
	get = get_mip_filter, set = set_mip_filter

#desc The repeat mode to use along the U axis of UV coordinates. This affects the returned values if sampling outside the UV bounds.
var repeat_u: int:
	get = get_repeat_u, set = set_repeat_u

#desc The repeat mode to use along the V axis of UV coordinates. This affects the returned values if sampling outside the UV bounds.
var repeat_v: int:
	get = get_repeat_v, set = set_repeat_v

#desc The repeat mode to use along the W axis of UV coordinates. This affects the returned values if sampling outside the UV bounds. Only effective for 3D samplers.
var repeat_w: int:
	get = get_repeat_w, set = set_repeat_w

var unnormalized_uvw: bool:
	get = get_unnormalized_uvw, set = set_unnormalized_uvw

#desc If [code]true[/code], perform anisotropic sampling. See [member anisotropy_max].
var use_anisotropy: bool:
	get = get_use_anisotropy, set = set_use_anisotropy




func get_anisotropy_max() -> float:
	return anisotropy_max

func set_anisotropy_max(value: float) -> void:
	anisotropy_max = value

func get_border_color() -> int:
	return border_color

func set_border_color(value: int) -> void:
	border_color = value

func get_compare_op() -> int:
	return compare_op

func set_compare_op(value: int) -> void:
	compare_op = value

func get_enable_compare() -> bool:
	return enable_compare

func set_enable_compare(value: bool) -> void:
	enable_compare = value

func get_lod_bias() -> float:
	return lod_bias

func set_lod_bias(value: float) -> void:
	lod_bias = value

func get_mag_filter() -> int:
	return mag_filter

func set_mag_filter(value: int) -> void:
	mag_filter = value

func get_max_lod() -> float:
	return max_lod

func set_max_lod(value: float) -> void:
	max_lod = value

func get_min_filter() -> int:
	return min_filter

func set_min_filter(value: int) -> void:
	min_filter = value

func get_min_lod() -> float:
	return min_lod

func set_min_lod(value: float) -> void:
	min_lod = value

func get_mip_filter() -> int:
	return mip_filter

func set_mip_filter(value: int) -> void:
	mip_filter = value

func get_repeat_u() -> int:
	return repeat_u

func set_repeat_u(value: int) -> void:
	repeat_u = value

func get_repeat_v() -> int:
	return repeat_v

func set_repeat_v(value: int) -> void:
	repeat_v = value

func get_repeat_w() -> int:
	return repeat_w

func set_repeat_w(value: int) -> void:
	repeat_w = value

func get_unnormalized_uvw() -> bool:
	return unnormalized_uvw

func set_unnormalized_uvw(value: bool) -> void:
	unnormalized_uvw = value

func get_use_anisotropy() -> bool:
	return use_anisotropy

func set_use_anisotropy(value: bool) -> void:
	use_anisotropy = value

