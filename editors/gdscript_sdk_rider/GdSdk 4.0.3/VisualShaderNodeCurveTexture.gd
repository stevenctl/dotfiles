extends VisualShaderNodeResizableBase
#brief Performs a [CurveTexture] lookup within the visual shader graph.
#desc Comes with a built-in editor for texture's curves.
class_name VisualShaderNodeCurveTexture


#desc The source texture.
var texture: CurveTexture:
	get = get_texture, set = set_texture




func get_texture() -> CurveTexture:
	return texture

func set_texture(value: CurveTexture) -> void:
	texture = value

