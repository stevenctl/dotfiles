extends VisualShaderNodeSample3D
#brief A 2D texture uniform array to be used within the visual shader graph.
#desc Translated to [code]uniform sampler2DArray[/code] in the shader language.
class_name VisualShaderNodeTexture2DArray


#desc A source texture array. Used if [member VisualShaderNodeSample3D.source] is set to [constant VisualShaderNodeSample3D.SOURCE_TEXTURE].
var texture_array: Texture2DArray:
	get = get_texture_array, set = set_texture_array




func get_texture_array() -> Texture2DArray:
	return texture_array

func set_texture_array(value: Texture2DArray) -> void:
	texture_array = value

