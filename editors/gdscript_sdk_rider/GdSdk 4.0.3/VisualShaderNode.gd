extends Resource
#brief Base class for nodes in a visual shader graph.
#desc Visual shader graphs consist of various nodes. Each node in the graph is a separate object and they are represented as a rectangular boxes with title and a set of properties. Each node has also connection ports that allow to connect it to another nodes and control the flow of the shader.
#tutorial [VisualShaders] https://docs.godotengine.org/en/stable/tutorials/shaders/visual_shaders.html
class_name VisualShaderNode

#desc Floating-point scalar. Translated to [code]float[/code] type in shader code.
#desc Integer scalar. Translated to [code]int[/code] type in shader code.
#desc Unsigned integer scalar. Translated to [code]uint[/code] type in shader code.
#desc 2D vector of floating-point values. Translated to [code]vec2[/code] type in shader code.
#desc 3D vector of floating-point values. Translated to [code]vec3[/code] type in shader code.
#desc 4D vector of floating-point values. Translated to [code]vec4[/code] type in shader code.
#desc Boolean type. Translated to [code]bool[/code] type in shader code.
#desc Transform type. Translated to [code]mat4[/code] type in shader code.
#desc Sampler type. Translated to reference of sampler uniform in shader code. Can only be used for input ports in non-uniform nodes.
#desc Represents the size of the [enum PortType] enum.

#enum PortType
enum {
    PORT_TYPE_SCALAR = 0,
    PORT_TYPE_SCALAR_INT = 1,
    PORT_TYPE_SCALAR_UINT = 2,
    PORT_TYPE_VECTOR_2D = 3,
    PORT_TYPE_VECTOR_3D = 4,
    PORT_TYPE_VECTOR_4D = 5,
    PORT_TYPE_BOOLEAN = 6,
    PORT_TYPE_TRANSFORM = 7,
    PORT_TYPE_SAMPLER = 8,
    PORT_TYPE_MAX = 9,
}
#desc Sets the output port index which will be showed for preview. If set to [code]-1[/code] no port will be open for preview.
var output_port_for_preview: int:
	get = get_output_port_for_preview, set = set_output_port_for_preview



#desc Clears the default input ports value.
func clear_default_input_values() -> void:
	pass;

#desc Returns an [Array] containing default values for all of the input ports of the node in the form [code][index0, value0, index1, value1, ...][/code].
func get_default_input_values() -> Array:
	pass;

#desc Returns the default value of the input [param port].
func get_input_port_default_value(port: int) -> Variant:
	pass;

#desc Removes the default value of the input [param port].
func remove_input_port_default_value(port: int) -> void:
	pass;

#desc Sets the default input ports values using an [Array] of the form [code][index0, value0, index1, value1, ...][/code]. For example: [code][0, Vector3(0, 0, 0), 1, Vector3(0, 0, 0)][/code].
func set_default_input_values(values: Array) -> void:
	pass;

#desc Sets the default [param value] for the selected input [param port].
func set_input_port_default_value(port: int, value: Variant, prev_value: Variant = null) -> void:
	pass;


func get_output_port_for_preview() -> int:
	return output_port_for_preview

func set_output_port_for_preview(value: int) -> void:
	output_port_for_preview = value

