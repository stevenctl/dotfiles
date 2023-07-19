extends VisualShaderNode
#brief A base node for nodes which samples 3D textures in the visual shader graph.
#desc A virtual class, use the descendants instead.
class_name VisualShaderNodeSample3D

#desc Creates internal uniform and provides a way to assign it within node.
#desc Use the uniform texture from sampler port.
#desc Represents the size of the [enum Source] enum.

#enum Source
enum {
    SOURCE_TEXTURE = 0,
    SOURCE_PORT = 1,
    SOURCE_MAX = 2,
}
#desc An input source type.
var source: int:
	get = get_source, set = set_source




func get_source() -> int:
	return source

func set_source(value: int) -> void:
	source = value

