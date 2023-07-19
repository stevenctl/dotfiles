extends RefCounted
#brief Attachment format (used by [RenderingDevice]).
#desc This object is used by [RenderingDevice].
class_name RDAttachmentFormat


#desc The attachment's data format.
var format: int:
	get = get_format, set = set_format

#desc The number of samples used when sampling the attachment.
var samples: int:
	get = get_samples, set = set_samples

#desc The attachment's usage flags, which determine what can be done with it.
var usage_flags: int:
	get = get_usage_flags, set = set_usage_flags




func get_format() -> int:
	return format

func set_format(value: int) -> void:
	format = value

func get_samples() -> int:
	return samples

func set_samples(value: int) -> void:
	samples = value

func get_usage_flags() -> int:
	return usage_flags

func set_usage_flags(value: int) -> void:
	usage_flags = value

