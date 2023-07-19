extends Control
#brief GraphEdit is a control responsible for displaying and manipulating graph-like data using [GraphNode]s. It provides access to creation, removal, connection, and disconnection of nodes.
#desc [b]Note:[/b] Please be aware that this node will undergo extensive refactoring in a future 4.x version involving compatibility-breaking API changes.
#desc GraphEdit provides tools for creation, manipulation, and display of various graphs. Its main purpose in the engine is to power the visual programming systems, such as visual shaders, but it is also available for use in user projects.
#desc GraphEdit by itself is only an empty container, representing an infinite grid where [GraphNode]s can be placed. Each [GraphNode] represent a node in the graph, a single unit of data in the connected scheme. GraphEdit, in turn, helps to control various interactions with nodes and between nodes. When the user attempts to connect, disconnect, or close a [GraphNode], a signal is emitted in the GraphEdit, but no action is taken by default. It is the responsibility of the programmer utilizing this control to implement the necessary logic to determine how each request should be handled.
#desc [b]Performance:[/b] It is greatly advised to enable low-processor usage mode (see [member OS.low_processor_usage_mode]) when using GraphEdits.
class_name GraphEdit

#desc Emitted at the beginning of a GraphNode movement.
signal begin_node_move
#desc Emitted at the end of a connection drag.
signal connection_drag_ended
#desc Emitted at the beginning of a connection drag.
signal connection_drag_started(from_node: StringName, from_port: int, is_output: bool)
#desc Emitted when user drags a connection from an input port into the empty space of the graph.
signal connection_from_empty(to_node: StringName, to_port: int, release_position: Vector2)
#desc Emitted to the GraphEdit when the connection between the [param from_port] of the [param from_node] [GraphNode] and the [param to_port] of the [param to_node] [GraphNode] is attempted to be created.
signal connection_request(from_node: StringName, from_port: int, to_node: StringName, to_port: int)
#desc Emitted when user drags a connection from an output port into the empty space of the graph.
signal connection_to_empty(from_node: StringName, from_port: int, release_position: Vector2)
#desc Emitted when the user presses [kbd]Ctrl + C[/kbd].
signal copy_nodes_request
#desc Emitted when a GraphNode is attempted to be removed from the GraphEdit. Provides a list of node names to be removed (all selected nodes, excluding nodes without closing button).
signal delete_nodes_request(nodes: StringName[])
#desc Emitted to the GraphEdit when the connection between [param from_port] of [param from_node] [GraphNode] and [param to_port] of [param to_node] [GraphNode] is attempted to be removed.
signal disconnection_request(from_node: StringName, from_port: int, to_node: StringName, to_port: int)
#desc Emitted when a GraphNode is attempted to be duplicated in the GraphEdit.
signal duplicate_nodes_request
#desc Emitted at the end of a GraphNode movement.
signal end_node_move
signal node_deselected(node: Node)
#desc Emitted when a GraphNode is selected.
signal node_selected(node: Node)
#desc Emitted when the user presses [kbd]Ctrl + V[/kbd].
signal paste_nodes_request
#desc Emitted when a popup is requested. Happens on right-clicking in the GraphEdit. [param position] is the position of the mouse pointer when the signal is sent.
signal popup_request(position: Vector2)
#desc Emitted when the scroll offset is changed by the user. It will not be emitted when changed in code.
signal scroll_offset_changed(offset: Vector2)
#desc [kbd]Mouse Wheel[/kbd] will zoom, [kbd]Ctrl + Mouse Wheel[/kbd] will move the view.
#desc [kbd]Mouse Wheel[/kbd] will move the view, [kbd]Ctrl + Mouse Wheel[/kbd] will zoom.

#enum PanningScheme
enum {
    SCROLL_ZOOMS = 0,
    SCROLL_PANS = 1,
}
#desc If [code]true[/code], the Arrange Nodes button is hidden.
var arrange_nodes_button_hidden: bool:
	get = is_arrange_nodes_button_hidden, set = set_arrange_nodes_button_hidden

var clip_contents: bool:
	get = is_clipping_contents, set = set_clip_contents

#desc If [code]true[/code], the lines between nodes will use antialiasing.
var connection_lines_antialiased: bool:
	get = is_connection_lines_antialiased, set = set_connection_lines_antialiased

#desc The curvature of the lines between the nodes. 0 results in straight lines.
var connection_lines_curvature: float:
	get = get_connection_lines_curvature, set = set_connection_lines_curvature

#desc The thickness of the lines between the nodes.
var connection_lines_thickness: float:
	get = get_connection_lines_thickness, set = set_connection_lines_thickness

var focus_mode: int:
	get = get_focus_mode, set = set_focus_mode

#desc If [code]true[/code], the minimap is visible.
var minimap_enabled: bool:
	get = is_minimap_enabled, set = set_minimap_enabled

#desc The opacity of the minimap rectangle.
var minimap_opacity: float:
	get = get_minimap_opacity, set = set_minimap_opacity

#desc The size of the minimap rectangle. The map itself is based on the size of the grid area and is scaled to fit this rectangle.
var minimap_size: Vector2:
	get = get_minimap_size, set = set_minimap_size

#desc Defines the control scheme for panning with mouse wheel.
var panning_scheme: int:
	get = get_panning_scheme, set = set_panning_scheme

#desc If [code]true[/code], enables disconnection of existing connections in the GraphEdit by dragging the right end.
var right_disconnects: bool:
	get = is_right_disconnects_enabled, set = set_right_disconnects

#desc The scroll offset.
var scroll_offset: Vector2:
	get = get_scroll_ofs, set = set_scroll_ofs

#desc If [code]true[/code], makes a label with the current zoom level visible. The zoom value is displayed in percents.
var show_zoom_label: bool:
	get = is_showing_zoom_label, set = set_show_zoom_label

#desc The snapping distance in pixels.
var snap_distance: int:
	get = get_snap, set = set_snap

#desc If [code]true[/code], enables snapping.
var use_snap: bool:
	get = is_using_snap, set = set_use_snap

#desc The current zoom value.
var zoom: float:
	get = get_zoom, set = set_zoom

#desc The upper zoom limit.
var zoom_max: float:
	get = get_zoom_max, set = set_zoom_max

#desc The lower zoom limit.
var zoom_min: float:
	get = get_zoom_min, set = set_zoom_min

#desc The step of each zoom level.
var zoom_step: float:
	get = get_zoom_step, set = set_zoom_step



#desc Virtual method which can be overridden to customize how connections are drawn.
func _get_connection_line(from_position: Vector2, to_position: Vector2) -> PackedVector2Array:
	pass;

#desc Returns whether the [param mouse_position] is in the input hot zone.
#desc By default, a hot zone is a [Rect2] positioned such that its center is at [param in_node].[method GraphNode.get_connection_input_position]([param in_port]) (For output's case, call [method GraphNode.get_connection_output_position] instead). The hot zone's width is twice the Theme Property [code]port_grab_distance_horizontal[/code], and its height is twice the [code]port_grab_distance_vertical[/code].
#desc Below is a sample code to help get started:
#desc [codeblock]
#desc func _is_in_input_hotzone(in_node, in_port, mouse_position):
#desc var port_size: Vector2 = Vector2(get_theme_constant("port_grab_distance_horizontal"), get_theme_constant("port_grab_distance_vertical"))
#desc var port_pos: Vector2 = in_node.get_position() + in_node.get_connection_input_position(in_port) - port_size / 2
#desc var rect = Rect2(port_pos, port_size)
#desc 
#desc return rect.has_point(mouse_position)
#desc [/codeblock]
func _is_in_input_hotzone(in_node: Object, in_port: int, mouse_position: Vector2) -> bool:
	pass;

#desc Returns whether the [param mouse_position] is in the output hot zone. For more information on hot zones, see [method _is_in_input_hotzone].
#desc Below is a sample code to help get started:
#desc [codeblock]
#desc func _is_in_output_hotzone(in_node, in_port, mouse_position):
#desc var port_size: Vector2 = Vector2(get_theme_constant("port_grab_distance_horizontal"), get_theme_constant("port_grab_distance_vertical"))
#desc var port_pos: Vector2 = in_node.get_position() + in_node.get_connection_output_position(in_port) - port_size / 2
#desc var rect = Rect2(port_pos, port_size)
#desc 
#desc return rect.has_point(mouse_position)
#desc [/codeblock]
func _is_in_output_hotzone(in_node: Object, in_port: int, mouse_position: Vector2) -> bool:
	pass;

#desc This virtual method can be used to insert additional error detection while the user is dragging a connection over a valid port.
#desc Return [code]true[/code] if the connection is indeed valid or return [code]false[/code] if the connection is impossible. If the connection is impossible, no snapping to the port and thus no connection request to that port will happen.
#desc In this example a connection to same node is suppressed:
#desc [codeblocks]
#desc [gdscript]
#desc func _is_node_hover_valid(from, from_port, to, to_port):
#desc return from != to
#desc [/gdscript]
#desc [csharp]
#desc public override bool _IsNodeHoverValid(StringName fromNode, int fromPort, StringName toNode, int toPort)
#desc {
#desc return fromNode != toNode;
#desc }
#desc [/csharp]
#desc [/codeblocks]
func _is_node_hover_valid(from_node: StringName, from_port: int, to_node: StringName, to_port: int) -> bool:
	pass;

#desc Allows the connection between two different port types. The port type is defined individually for the left and the right port of each slot with the [method GraphNode.set_slot] method.
#desc See also [method is_valid_connection_type] and [method remove_valid_connection_type].
func add_valid_connection_type(from_type: int, to_type: int) -> void:
	pass;

#desc Allows to disconnect nodes when dragging from the left port of the [GraphNode]'s slot if it has the specified type. See also [method remove_valid_left_disconnect_type].
func add_valid_left_disconnect_type(type: int) -> void:
	pass;

#desc Allows to disconnect nodes when dragging from the right port of the [GraphNode]'s slot if it has the specified type. See also [method remove_valid_right_disconnect_type].
func add_valid_right_disconnect_type(type: int) -> void:
	pass;

#desc Rearranges selected nodes in a layout with minimum crossings between connections and uniform horizontal and vertical gap between nodes.
func arrange_nodes() -> void:
	pass;

#desc Removes all connections between nodes.
func clear_connections() -> void:
	pass;

#desc Create a connection between the [param from_port] of the [param from_node] [GraphNode] and the [param to_port] of the [param to_node] [GraphNode]. If the connection already exists, no connection is created.
func connect_node(from_node: StringName, from_port: int, to_node: StringName, to_port: int) -> int:
	pass;

#desc Removes the connection between the [param from_port] of the [param from_node] [GraphNode] and the [param to_port] of the [param to_node] [GraphNode]. If the connection does not exist, no connection is removed.
func disconnect_node(from_node: StringName, from_port: int, to_node: StringName, to_port: int) -> void:
	pass;

#desc Ends the creation of the current connection. In other words, if you are dragging a connection you can use this method to abort the process and remove the line that followed your cursor.
#desc This is best used together with [signal connection_drag_started] and [signal connection_drag_ended] to add custom behavior like node addition through shortcuts.
#desc [b]Note:[/b] This method suppresses any other connection request signals apart from [signal connection_drag_ended].
func force_connection_drag_end() -> void:
	pass;

#desc Returns the points which would make up a connection between [param from_node] and [param to_node].
func get_connection_line(from_node: Vector2, to_node: Vector2) -> PackedVector2Array:
	pass;

#desc Returns an Array containing the list of connections. A connection consists in a structure of the form [code]{ from_port: 0, from: "GraphNode name 0", to_port: 1, to: "GraphNode name 1" }[/code].
func get_connection_list() -> Array[Dictionary]:
	pass;

#desc Gets the [HBoxContainer] that contains the zooming and grid snap controls in the top left of the graph. You can use this method to reposition the toolbar or to add your own custom controls to it.
#desc [b]Warning:[/b] This is a required internal node, removing and freeing it may cause a crash. If you wish to hide it or any of its children, use their [member CanvasItem.visible] property.
func get_zoom_hbox() -> HBoxContainer:
	pass;

#desc Returns [code]true[/code] if the [param from_port] of the [param from_node] [GraphNode] is connected to the [param to_port] of the [param to_node] [GraphNode].
func is_node_connected(from_node: StringName, from_port: int, to_node: StringName, to_port: int) -> bool:
	pass;

#desc Returns whether it's possible to make a connection between two different port types. The port type is defined individually for the left and the right port of each slot with the [method GraphNode.set_slot] method.
#desc See also [method add_valid_connection_type] and [method remove_valid_connection_type].
func is_valid_connection_type(from_type: int, to_type: int) -> bool:
	pass;

#desc Disallows the connection between two different port types previously allowed by [method add_valid_connection_type]. The port type is defined individually for the left and the right port of each slot with the [method GraphNode.set_slot] method.
#desc See also [method is_valid_connection_type].
func remove_valid_connection_type(from_type: int, to_type: int) -> void:
	pass;

#desc Disallows to disconnect nodes when dragging from the left port of the [GraphNode]'s slot if it has the specified type. Use this to disable disconnection previously allowed with [method add_valid_left_disconnect_type].
func remove_valid_left_disconnect_type(type: int) -> void:
	pass;

#desc Disallows to disconnect nodes when dragging from the right port of the [GraphNode]'s slot if it has the specified type. Use this to disable disconnection previously allowed with [method add_valid_right_disconnect_type].
func remove_valid_right_disconnect_type(type: int) -> void:
	pass;

#desc Sets the coloration of the connection between [param from_node]'s [param from_port] and [param to_node]'s [param to_port] with the color provided in the [theme_item activity] theme property.
func set_connection_activity(from_node: StringName, from_port: int, to_node: StringName, to_port: int, amount: float) -> void:
	pass;

#desc Sets the specified [param node] as the one selected.
func set_selected(node: Node) -> void:
	pass;


func is_arrange_nodes_button_hidden() -> bool:
	return arrange_nodes_button_hidden

func set_arrange_nodes_button_hidden(value: bool) -> void:
	arrange_nodes_button_hidden = value

func is_clipping_contents() -> bool:
	return clip_contents

func set_clip_contents(value: bool) -> void:
	clip_contents = value

func is_connection_lines_antialiased() -> bool:
	return connection_lines_antialiased

func set_connection_lines_antialiased(value: bool) -> void:
	connection_lines_antialiased = value

func get_connection_lines_curvature() -> float:
	return connection_lines_curvature

func set_connection_lines_curvature(value: float) -> void:
	connection_lines_curvature = value

func get_connection_lines_thickness() -> float:
	return connection_lines_thickness

func set_connection_lines_thickness(value: float) -> void:
	connection_lines_thickness = value

func get_focus_mode() -> int:
	return focus_mode

func set_focus_mode(value: int) -> void:
	focus_mode = value

func is_minimap_enabled() -> bool:
	return minimap_enabled

func set_minimap_enabled(value: bool) -> void:
	minimap_enabled = value

func get_minimap_opacity() -> float:
	return minimap_opacity

func set_minimap_opacity(value: float) -> void:
	minimap_opacity = value

func get_minimap_size() -> Vector2:
	return minimap_size

func set_minimap_size(value: Vector2) -> void:
	minimap_size = value

func get_panning_scheme() -> int:
	return panning_scheme

func set_panning_scheme(value: int) -> void:
	panning_scheme = value

func is_right_disconnects_enabled() -> bool:
	return right_disconnects

func set_right_disconnects(value: bool) -> void:
	right_disconnects = value

func get_scroll_ofs() -> Vector2:
	return scroll_offset

func set_scroll_ofs(value: Vector2) -> void:
	scroll_offset = value

func is_showing_zoom_label() -> bool:
	return show_zoom_label

func set_show_zoom_label(value: bool) -> void:
	show_zoom_label = value

func get_snap() -> int:
	return snap_distance

func set_snap(value: int) -> void:
	snap_distance = value

func is_using_snap() -> bool:
	return use_snap

func set_use_snap(value: bool) -> void:
	use_snap = value

func get_zoom() -> float:
	return zoom

func set_zoom(value: float) -> void:
	zoom = value

func get_zoom_max() -> float:
	return zoom_max

func set_zoom_max(value: float) -> void:
	zoom_max = value

func get_zoom_min() -> float:
	return zoom_min

func set_zoom_min(value: float) -> void:
	zoom_min = value

func get_zoom_step() -> float:
	return zoom_step

func set_zoom_step(value: float) -> void:
	zoom_step = value

