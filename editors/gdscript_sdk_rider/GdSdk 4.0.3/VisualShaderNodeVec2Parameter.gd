extends VisualShaderNodeParameter
#brief A [Vector2] parameter to be used within the visual shader graph.
#desc Translated to [code]uniform vec2[/code] in the shader language.
class_name VisualShaderNodeVec2Parameter


#desc A default value to be assigned within the shader.
var default_value: Vector2:
	get = get_default_value, set = set_default_value

#desc Enables usage of the [member default_value].
var default_value_enabled: bool:
	get = is_default_value_enabled, set = set_default_value_enabled




func get_default_value() -> Vector2:
	return default_value

func set_default_value(value: Vector2) -> void:
	default_value = value

func is_default_value_enabled() -> bool:
	return default_value_enabled

func set_default_value_enabled(value: bool) -> void:
	default_value_enabled = value

