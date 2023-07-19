extends RefCounted
#brief Pipeline color blend state (used by [RenderingDevice]).
#desc This object is used by [RenderingDevice].
class_name RDPipelineColorBlendState


#desc The attachments that are blended together.
var attachments: Array[RDPipelineColorBlendStateAttachment]:
	get = get_attachments, set = set_attachments

#desc The constant color to blend with. See also [method RenderingDevice.draw_list_set_blend_constants].
var blend_constant: Color:
	get = get_blend_constant, set = set_blend_constant

#desc If [code]true[/code], performs the logic operation defined in [member logic_op].
var enable_logic_op: bool:
	get = get_enable_logic_op, set = set_enable_logic_op

#desc The logic operation to perform for blending. Only effective if [member enable_logic_op] is [code]true[/code].
var logic_op: int:
	get = get_logic_op, set = set_logic_op




func get_attachments() -> Array[RDPipelineColorBlendStateAttachment]:
	return attachments

func set_attachments(value: Array[RDPipelineColorBlendStateAttachment]) -> void:
	attachments = value

func get_blend_constant() -> Color:
	return blend_constant

func set_blend_constant(value: Color) -> void:
	blend_constant = value

func get_enable_logic_op() -> bool:
	return enable_logic_op

func set_enable_logic_op(value: bool) -> void:
	enable_logic_op = value

func get_logic_op() -> int:
	return logic_op

func set_logic_op(value: int) -> void:
	logic_op = value

