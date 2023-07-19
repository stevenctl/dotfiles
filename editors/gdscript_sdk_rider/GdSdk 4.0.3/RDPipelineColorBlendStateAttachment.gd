extends RefCounted
#brief Pipeline color blend state attachment (used by [RenderingDevice]).
#desc Controls how blending between source and destination fragments is performed when using [RenderingDevice].
#desc For reference, this is how common user-facing blend modes are implemented in Godot's 2D renderer:
#desc [b]Mix:[/b]
#desc [codeblock]
#desc var attachment = RDPipelineColorBlendStateAttachment.new()
#desc attachment.enable_blend = true
#desc attachment.color_blend_op = RenderingDevice.BLEND_OP_ADD
#desc attachment.src_color_blend_factor = RenderingDevice.BLEND_FACTOR_SRC_ALPHA
#desc attachment.dst_color_blend_factor = RenderingDevice.BLEND_FACTOR_ONE_MINUS_SRC_ALPHA
#desc attachment.alpha_blend_op = RenderingDevice.BLEND_OP_ADD
#desc attachment.src_alpha_blend_factor = RenderingDevice.BLEND_FACTOR_ONE
#desc attachment.dst_alpha_blend_factor = RenderingDevice.BLEND_FACTOR_ONE_MINUS_SRC_ALPHA
#desc [/codeblock]
#desc [b]Add:[/b]
#desc [codeblock]
#desc var attachment = RDPipelineColorBlendStateAttachment.new()
#desc attachment.enable_blend = true
#desc attachment.alpha_blend_op = RenderingDevice.BLEND_OP_ADD
#desc attachment.color_blend_op = RenderingDevice.BLEND_OP_ADD
#desc attachment.src_color_blend_factor = RenderingDevice.BLEND_FACTOR_SRC_ALPHA
#desc attachment.dst_color_blend_factor = RenderingDevice.BLEND_FACTOR_ONE
#desc attachment.src_alpha_blend_factor = RenderingDevice.BLEND_FACTOR_SRC_ALPHA
#desc attachment.dst_alpha_blend_factor = RenderingDevice.BLEND_FACTOR_ONE
#desc [/codeblock]
#desc [b]Subtract:[/b]
#desc [codeblock]
#desc var attachment = RDPipelineColorBlendStateAttachment.new()
#desc attachment.enable_blend = true
#desc attachment.alpha_blend_op = RenderingDevice.BLEND_OP_SUBTRACT
#desc attachment.color_blend_op = RenderingDevice.BLEND_OP_SUBTRACT
#desc attachment.src_color_blend_factor = RenderingDevice.BLEND_FACTOR_SRC_ALPHA
#desc attachment.dst_color_blend_factor = RenderingDevice.BLEND_FACTOR_ONE
#desc attachment.src_alpha_blend_factor = RenderingDevice.BLEND_FACTOR_SRC_ALPHA
#desc attachment.dst_alpha_blend_factor = RenderingDevice.BLEND_FACTOR_ONE
#desc [/codeblock]
#desc [b]Multiply:[/b]
#desc [codeblock]
#desc var attachment = RDPipelineColorBlendStateAttachment.new()
#desc attachment.enable_blend = true
#desc attachment.alpha_blend_op = RenderingDevice.BLEND_OP_ADD
#desc attachment.color_blend_op = RenderingDevice.BLEND_OP_ADD
#desc attachment.src_color_blend_factor = RenderingDevice.BLEND_FACTOR_DST_COLOR
#desc attachment.dst_color_blend_factor = RenderingDevice.BLEND_FACTOR_ZERO
#desc attachment.src_alpha_blend_factor = RenderingDevice.BLEND_FACTOR_DST_ALPHA
#desc attachment.dst_alpha_blend_factor = RenderingDevice.BLEND_FACTOR_ZERO
#desc [/codeblock]
#desc [b]Pre-multiplied alpha:[/b]
#desc [codeblock]
#desc var attachment = RDPipelineColorBlendStateAttachment.new()
#desc attachment.enable_blend = true
#desc attachment.alpha_blend_op = RenderingDevice.BLEND_OP_ADD
#desc attachment.color_blend_op = RenderingDevice.BLEND_OP_ADD
#desc attachment.src_color_blend_factor = RenderingDevice.BLEND_FACTOR_ONE
#desc attachment.dst_color_blend_factor = RenderingDevice.BLEND_FACTOR_ONE_MINUS_SRC_ALPHA
#desc attachment.src_alpha_blend_factor = RenderingDevice.BLEND_FACTOR_ONE
#desc attachment.dst_alpha_blend_factor = RenderingDevice.BLEND_FACTOR_ONE_MINUS_SRC_ALPHA
#desc [/codeblock]
class_name RDPipelineColorBlendStateAttachment


#desc The blend mode to use for the alpha channel.
var alpha_blend_op: int:
	get = get_alpha_blend_op, set = set_alpha_blend_op

#desc The blend mode to use for the red/green/blue color channels.
var color_blend_op: int:
	get = get_color_blend_op, set = set_color_blend_op

#desc Controls how the blend factor for the alpha channel is determined based on the destination's fragments.
var dst_alpha_blend_factor: int:
	get = get_dst_alpha_blend_factor, set = set_dst_alpha_blend_factor

#desc Controls how the blend factor for the color channels is determined based on the destination's fragments.
var dst_color_blend_factor: int:
	get = get_dst_color_blend_factor, set = set_dst_color_blend_factor

#desc If [code]true[/code], performs blending between the source and destination according to the factors defined in [member src_color_blend_factor], [member dst_color_blend_factor], [member src_alpha_blend_factor] and [member dst_alpha_blend_factor]. The blend modes [member color_blend_op] and [member alpha_blend_op] are also taken into account, with [member write_r], [member write_g], [member write_b] and [member write_a] controlling the output.
var enable_blend: bool:
	get = get_enable_blend, set = set_enable_blend

#desc Controls how the blend factor for the alpha channel is determined based on the source's fragments.
var src_alpha_blend_factor: int:
	get = get_src_alpha_blend_factor, set = set_src_alpha_blend_factor

#desc Controls how the blend factor for the color channels is determined based on the source's fragments.
var src_color_blend_factor: int:
	get = get_src_color_blend_factor, set = set_src_color_blend_factor

#desc If [code]true[/code], writes the new alpha channel to the final result.
var write_a: bool:
	get = get_write_a, set = set_write_a

#desc If [code]true[/code], writes the new blue color channel to the final result.
var write_b: bool:
	get = get_write_b, set = set_write_b

#desc If [code]true[/code], writes the new green color channel to the final result.
var write_g: bool:
	get = get_write_g, set = set_write_g

#desc If [code]true[/code], writes the new red color channel to the final result.
var write_r: bool:
	get = get_write_r, set = set_write_r



#desc Convenience method to perform standard mix blending with straight (non-premultiplied) alpha. This sets [member enable_blend] to [code]true[/code], [member src_color_blend_factor] to [constant RenderingDevice.BLEND_FACTOR_SRC_ALPHA], [member dst_color_blend_factor] to [constant RenderingDevice.BLEND_FACTOR_ONE_MINUS_SRC_ALPHA], [member src_alpha_blend_factor] to [constant RenderingDevice.BLEND_FACTOR_SRC_ALPHA] and [member dst_alpha_blend_factor] to [constant RenderingDevice.BLEND_FACTOR_ONE_MINUS_SRC_ALPHA].
func set_as_mix() -> void:
	pass;


func get_alpha_blend_op() -> int:
	return alpha_blend_op

func set_alpha_blend_op(value: int) -> void:
	alpha_blend_op = value

func get_color_blend_op() -> int:
	return color_blend_op

func set_color_blend_op(value: int) -> void:
	color_blend_op = value

func get_dst_alpha_blend_factor() -> int:
	return dst_alpha_blend_factor

func set_dst_alpha_blend_factor(value: int) -> void:
	dst_alpha_blend_factor = value

func get_dst_color_blend_factor() -> int:
	return dst_color_blend_factor

func set_dst_color_blend_factor(value: int) -> void:
	dst_color_blend_factor = value

func get_enable_blend() -> bool:
	return enable_blend

func set_enable_blend(value: bool) -> void:
	enable_blend = value

func get_src_alpha_blend_factor() -> int:
	return src_alpha_blend_factor

func set_src_alpha_blend_factor(value: int) -> void:
	src_alpha_blend_factor = value

func get_src_color_blend_factor() -> int:
	return src_color_blend_factor

func set_src_color_blend_factor(value: int) -> void:
	src_color_blend_factor = value

func get_write_a() -> bool:
	return write_a

func set_write_a(value: bool) -> void:
	write_a = value

func get_write_b() -> bool:
	return write_b

func set_write_b(value: bool) -> void:
	write_b = value

func get_write_g() -> bool:
	return write_g

func set_write_g(value: bool) -> void:
	write_g = value

func get_write_r() -> bool:
	return write_r

func set_write_r(value: bool) -> void:
	write_r = value

