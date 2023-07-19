extends VisualShaderNodeResizableBase
#brief Performs a [CurveXYZTexture] lookup within the visual shader graph.
#desc Comes with a built-in editor for texture's curves.
class_name VisualShaderNodeCurveXYZTexture


#desc The source texture.
var texture: CurveXYZTexture:
	get = get_texture, set = set_texture




func get_texture() -> CurveXYZTexture:
	return texture

func set_texture(value: CurveXYZTexture) -> void:
	texture = value

