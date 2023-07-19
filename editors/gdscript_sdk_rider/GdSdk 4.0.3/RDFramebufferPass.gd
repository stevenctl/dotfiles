extends RefCounted
#brief Framebuffer pass attachment description (used by [RenderingDevice]).
#desc This class contains the list of attachment descriptions for a framebuffer pass. Each points with an index to a previously supplied list of texture attachments.
#desc Multipass framebuffers can optimize some configurations in mobile. On desktop, they provide little to no advantage.
#desc This object is used by [RenderingDevice].
class_name RDFramebufferPass

#desc Attachment is unused.
const ATTACHMENT_UNUSED = -1;


#desc Color attachments in order starting from 0. If this attachment is not used by the shader, pass ATTACHMENT_UNUSED to skip.
var color_attachments: PackedInt32Array:
	get = get_color_attachments, set = set_color_attachments

#desc Depth attachment. ATTACHMENT_UNUSED should be used if no depth buffer is required for this pass.
var depth_attachment: int:
	get = get_depth_attachment, set = set_depth_attachment

#desc Used for multipass framebuffers (more than one render pass). Converts an attachment to an input. Make sure to also supply it properly in the [RDUniform] for the uniform set.
var input_attachments: PackedInt32Array:
	get = get_input_attachments, set = set_input_attachments

#desc Attachments to preserve in this pass (otherwise they are erased).
var preserve_attachments: PackedInt32Array:
	get = get_preserve_attachments, set = set_preserve_attachments

#desc If the color attachments are multisampled, non-multisampled resolve attachments can be provided.
var resolve_attachments: PackedInt32Array:
	get = get_resolve_attachments, set = set_resolve_attachments




func get_color_attachments() -> PackedInt32Array:
	return color_attachments

func set_color_attachments(value: PackedInt32Array) -> void:
	color_attachments = value

func get_depth_attachment() -> int:
	return depth_attachment

func set_depth_attachment(value: int) -> void:
	depth_attachment = value

func get_input_attachments() -> PackedInt32Array:
	return input_attachments

func set_input_attachments(value: PackedInt32Array) -> void:
	input_attachments = value

func get_preserve_attachments() -> PackedInt32Array:
	return preserve_attachments

func set_preserve_attachments(value: PackedInt32Array) -> void:
	preserve_attachments = value

func get_resolve_attachments() -> PackedInt32Array:
	return resolve_attachments

func set_resolve_attachments(value: PackedInt32Array) -> void:
	resolve_attachments = value

