extends Shader
#brief A custom shader program with a visual editor.
#desc This class allows you to define a custom shader program that can be used for various materials to render objects.
#desc The visual shader editor creates the shader.
class_name VisualShader

#desc A vertex shader, operating on vertices.
#desc A fragment shader, operating on fragments (pixels).
#desc A shader for light calculations.
#desc A function for the "start" stage of particle shader.
#desc A function for the "process" stage of particle shader.
#desc A function for the "collide" stage (particle collision handler) of particle shader.
#desc A function for the "start" stage of particle shader, with customized output.
#desc A function for the "process" stage of particle shader, with customized output.
#desc A shader for 3D environment's sky.
#desc A compute shader that runs for each froxel of the volumetric fog map.
#desc Represents the size of the [enum Type] enum.
#desc Varying is passed from [code]Vertex[/code] function to [code]Fragment[/code] and [code]Light[/code] functions.
#desc Varying is passed from [code]Fragment[/code] function to [code]Light[/code] function.
#desc Represents the size of the [enum VaryingMode] enum.
#desc Varying is of type [float].
#desc Varying is of type [int].
#desc Varying is of type unsigned [int].
#desc Varying is of type [Vector2].
#desc Varying is of type [Vector3].
#desc Varying is of type [Vector4].
#desc Varying is of type [bool].
#desc Varying is of type [Transform3D].
#desc Represents the size of the [enum VaryingType] enum.
#desc Denotes invalid [VisualShader] node.
const NODE_ID_INVALID = -1;

#desc Denotes output node of [VisualShader].
const NODE_ID_OUTPUT = 0;


#enum Type
enum {
    TYPE_VERTEX = 0,
    TYPE_FRAGMENT = 1,
    TYPE_LIGHT = 2,
    TYPE_START = 3,
    TYPE_PROCESS = 4,
    TYPE_COLLIDE = 5,
    TYPE_START_CUSTOM = 6,
    TYPE_PROCESS_CUSTOM = 7,
    TYPE_SKY = 8,
    TYPE_FOG = 9,
    TYPE_MAX = 10,
}
#enum VaryingMode
enum {
    VARYING_MODE_VERTEX_TO_FRAG_LIGHT = 0,
    VARYING_MODE_FRAG_TO_LIGHT = 1,
    VARYING_MODE_MAX = 2,
}
#enum VaryingType
enum {
    VARYING_TYPE_FLOAT = 0,
    VARYING_TYPE_INT = 1,
    VARYING_TYPE_UINT = 2,
    VARYING_TYPE_VECTOR_2D = 3,
    VARYING_TYPE_VECTOR_3D = 4,
    VARYING_TYPE_VECTOR_4D = 5,
    VARYING_TYPE_BOOLEAN = 6,
    VARYING_TYPE_TRANSFORM = 7,
    VARYING_TYPE_MAX = 8,
}
#desc The offset vector of the whole graph.
var graph_offset: Vector2:
	get = get_graph_offset, set = set_graph_offset



#desc Adds the specified [param node] to the shader.
func add_node(type: int, node: VisualShaderNode, position: Vector2, id: int) -> void:
	pass;

#desc Adds a new varying value node to the shader.
func add_varying(name: String, mode: int, type: int) -> void:
	pass;

#desc Returns [code]true[/code] if the specified nodes and ports can be connected together.
func can_connect_nodes(type: int, from_node: int, from_port: int, to_node: int, to_port: int) -> bool:
	pass;

#desc Connects the specified nodes and ports.
func connect_nodes(type: int, from_node: int, from_port: int, to_node: int, to_port: int) -> int:
	pass;

#desc Connects the specified nodes and ports, even if they can't be connected. Such connection is invalid and will not function properly.
func connect_nodes_forced(type: int, from_node: int, from_port: int, to_node: int, to_port: int) -> void:
	pass;

#desc Connects the specified nodes and ports.
func disconnect_nodes(type: int, from_node: int, from_port: int, to_node: int, to_port: int) -> void:
	pass;

#desc Returns the shader node instance with specified [param type] and [param id].
func get_node(type: int, id: int) -> VisualShaderNode:
	pass;

#desc Returns the list of connected nodes with the specified type.
func get_node_connections(type: int) -> Array[Dictionary]:
	pass;

#desc Returns the list of all nodes in the shader with the specified type.
func get_node_list(type: int) -> PackedInt32Array:
	pass;

#desc Returns the position of the specified node within the shader graph.
func get_node_position(type: int, id: int) -> Vector2:
	pass;

#desc Returns next valid node ID that can be added to the shader graph.
func get_valid_node_id(type: int) -> int:
	pass;

#desc Returns [code]true[/code] if the shader has a varying with the given [param name].
func has_varying(name: String) -> bool:
	pass;

#desc Returns [code]true[/code] if the specified node and port connection exist.
func is_node_connection(type: int, from_node: int, from_port: int, to_node: int, to_port: int) -> bool:
	pass;

#desc Removes the specified node from the shader.
func remove_node(type: int, id: int) -> void:
	pass;

#desc Removes a varying value node with the given [param name]. Prints an error if a node with this name is not found.
func remove_varying(name: String) -> void:
	pass;

#desc Replaces the specified node with a node of new class type.
func replace_node(type: int, id: int, new_class: StringName) -> void:
	pass;

#desc Sets the mode of this shader.
func set_mode(mode: int) -> void:
	pass;

#desc Sets the position of the specified node.
func set_node_position(type: int, id: int, position: Vector2) -> void:
	pass;


func get_graph_offset() -> Vector2:
	return graph_offset

func set_graph_offset(value: Vector2) -> void:
	graph_offset = value

