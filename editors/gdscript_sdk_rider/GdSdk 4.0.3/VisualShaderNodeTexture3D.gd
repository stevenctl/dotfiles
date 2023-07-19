extends VisualShaderNodeSample3D
#brief Performs a 3D texture lookup within the visual shader graph.
#desc Performs a lookup operation on the provided texture, with support for multiple texture sources to choose from.
class_name VisualShaderNodeTexture3D


#desc A source texture. Used if [member VisualShaderNodeSample3D.source] is set to [constant VisualShaderNodeSample3D.SOURCE_TEXTURE].
var texture: Texture3D:
	get = get_texture, set = set_texture




func get_texture() -> Texture3D:
	return texture

func set_texture(value: Texture3D) -> void:
	texture = value

