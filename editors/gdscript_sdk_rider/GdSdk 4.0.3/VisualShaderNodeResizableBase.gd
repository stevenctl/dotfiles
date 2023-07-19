extends VisualShaderNode
#brief Base class for resizable nodes in a visual shader graph.
#desc Resizable nodes have a handle that allows the user to adjust their size as needed.
class_name VisualShaderNodeResizableBase


#desc The size of the node in the visual shader graph.
var size: Vector2:
	get = get_size, set = set_size




func get_size() -> Vector2:
	return size

func set_size(value: Vector2) -> void:
	size = value

