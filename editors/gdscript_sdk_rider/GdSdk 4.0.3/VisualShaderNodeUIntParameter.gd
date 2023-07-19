extends VisualShaderNodeParameter
#brief A visual shader node for shader parameter (uniform) of type unsigned [int].
#desc A [VisualShaderNodeParameter] of type unsigned [int]. Offers additional customization for range of accepted values.
class_name VisualShaderNodeUIntParameter


#desc Default value of this parameter, which will be used if not set externally. [member default_value_enabled] must be enabled; defaults to [code]0[/code] otherwise.
var default_value: int:
	get = get_default_value, set = set_default_value

#desc If [code]true[/code], the node will have a custom default value.
var default_value_enabled: bool:
	get = is_default_value_enabled, set = set_default_value_enabled




func get_default_value() -> int:
	return default_value

func set_default_value(value: int) -> void:
	default_value = value

func is_default_value_enabled() -> bool:
	return default_value_enabled

func set_default_value_enabled(value: bool) -> void:
	default_value_enabled = value

